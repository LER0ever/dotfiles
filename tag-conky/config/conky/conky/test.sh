#!/bin/bash
curl -s --connect-timeout 30 https://gplusrss.com/rss/feed/fb2f0b2caacbe51cb9d4fdb5a0ab1f9f58a0865fcedfe |\
	sed -e 's/<\/title>/\n/g' |\
	grep -o '<title>.*' |\
	sed -e 's/<title>//' |\
	sed -e 's/&#8211;/-/' |\
	sed -e 's/<!\[CDATA\[//' |\
	sed -e 's/]]//' |\
	head -n $((2 + 15)) |\
	tail -n $((2))
