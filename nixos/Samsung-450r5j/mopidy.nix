{ config, pkgs, ... }:

{

	services.mopidy = {
		enable = true;
		extensionPackages = [ pkgs.mopidy-moped ];
		configuration = ''
[core]

[logging]

[audio]

[proxy]

[mpd]

[http]

[stream]

[m3u]

[softwaremixer]

[file]
enabled = true
media_dirs = 
  $XDG_MUSIC_DIR|Music
  ~/|Home
excluded_file_extensions = 
  .jpg
  .jpeg
show_dotfiles = false
follow_symlinks = false
metadata_timeout = 1000

[local]
enabled = true
library = json
media_dir = /home/everette/Music
scan_timeout = 1000
scan_flush_threshold = 100
scan_follow_symlinks = false
excluded_file_extensions = 
  .directory
  .html
  .jpeg
  .jpg
  .log
  .nfo
  .png
  .txt

			'';
	};

}
