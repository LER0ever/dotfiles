
__author__ = 'Eduardo Ciciliato'
__email__ = 'eduardo.ciciliato@gmail.com'
__license__ = 'GPL 2.0'
__version__ = '1.0.0'

import urllib2, urllib, json, sys, os
from datetime import datetime, timedelta
from shutil import copyfile
base = os.path.dirname(os.path.realpath(__file__))

#Config defaults
DEFAULT_LOCATION = 'XXXXXX' # Choose a default location
DEFAULT_UNIT_CELSIUS = True
CACHE_TIME = 1800 # In seconds (1800 = 30 minutes)


def extract_data(data, woeid, use_celsius):
	if use_celsius:
		unit = 'C'
	else:
		unit = 'F'
	title = 'Weather for ' + data['location']['city'] + " - " + data['location']['region']
	condition = data['item']['condition']
	cond = ' Temp: ' + condition['temp'] + unit + ' \n ' + condition['text']
	image = 'gif/' + condition['code'] + '.gif'
	# Copy one of the condition gif images to the base path of the script to be used by conky
#	copyfile(os.path.join(base, image), os.path.join(base, 'condition_'+woeid+'.gif'))
	return title, cond, image


def weather(woeid, cache_time, use_celsius):

	celsius = ''
	intcelsius = 0
	if use_celsius:
		intcelsius = 1
		celsius = " and u='c'"
	# Look for a cache file for your location and temperature type
	if os.path.isfile(os.path.join(base ,'cache_'+woeid+'_'+str(intcelsius)+'.txt')):
		with open(os.path.join(base, 'cache_'+woeid+'_'+str(intcelsius)+'.txt'), 'r') as f:
			date, title, cond1, cond2, image = f.read().splitlines()
			now = datetime.utcnow()
			fdate = datetime.strptime(date[:19], '%Y-%m-%d %H:%M:%S')
			tdelta = now - fdate
			if tdelta.seconds < cache_time:
				return title, cond1 + '\n' + cond2, image

	# If there is no cache file or it expired, get from yahoo
	baseurl = "https://query.yahooapis.com/v1/public/yql?"
	# The temperature unit is set to celsius using "u='c'" in the query
	yql_query = "select * from weather.forecast where woeid="+woeid+celsius
	yql_url = baseurl + urllib.urlencode({'q':yql_query}) + "&format=json"
	result = urllib2.urlopen(yql_url).read()
	data = json.loads(result)
	formated = extract_data(data['query']['results']['channel'], woeid, use_celsius)
	
	# Saves a new cache file for your location
	with open(os.path.join(base, 'cache_'+woeid+'_'+str(intcelsius)+'.txt'), 'w+') as f:
		f.write(str(datetime.utcnow())[:19]+'\n')
		f.write(formated[0]+'\n')
		f.write(formated[1]+'\n')
		f.write(formated[2]+'\n')
	return formated


if __name__ == '__main__':
	location = str(DEFAULT_LOCATION)
	cache = int(CACHE_TIME)
	celsius = DEFAULT_UNIT_CELSIUS

	if len(sys.argv) > 1:
		location = sys.argv[1]
	if len(sys.argv) > 2:
		cache = int(sys.argv[2])
	if len(sys.argv) > 3:
		celsius = int(sys.argv[3])
		if celsius == 1:
			celsius = True
		else:
			celsius = False

	title, cond, image = weather(location, cache, celsius)
	print(title)
	conds = cond.split('\n')
	print
	for c in conds:
		print('\t  '+c)
