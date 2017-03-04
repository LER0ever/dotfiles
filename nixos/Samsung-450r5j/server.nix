{ config, pkgs, ... }:

{
	imports = [
		./mopidy.nix
	];
	environment.systemPackages = with pkgs; [
		gogs     
	];

#ExecStart = ''${pkgs.gogs}/bin/gogs web --config /home/gogs/conf/app.ini & pwd'';

	services.mysql = {
		enable = true;
		package = pkgs.mariadb;
	};

	services.caddy = {
		enable = true;
		email = "etasry@gmail.com";
		agree = true;
		config = ''
			192.168.0.3:80 {
				proxy / localhost:3000
				log /var/log/caddy/gogs.log
				gzip
			}

			192.168.0.3:7962 {
				proxy / localhost:8080
				log /var/log/caddy/syncthing.log
			}

#192.168.0.3:3453 {
#    filemanager / {
#    show /run/media/everette/LER0ever-Data/
#    allow_new true
#    allow_edit true
#    }
#}

			192.168.0.3:353 {
				root /var/www/webui-aria2
				log /var/log/caddy/aria2.log
			}
		'';
	};

	services.syncthing = {
		enable = true;
		user = "everette";
	};

	systemd.services.gogs = {
		wantedBy = [ "multi-user.target" ];
		after = [ "network.target" ];
		serviceConfig = {
			Type = "simple";
			User = "gogs";
			Group = "gogs";
			ExecStart = ''${pkgs.gogs}/bin/gogs web --config /home/gogs/conf/app.ini'';
			Restart = "always";
			WorkingDirectory = "/home/gogs";
			Environment = "USER=gogs HOME=/home/gogs";
			StandardOutput="syslog+console";
			StandardError="syslog+console";
		};
	};

	systemd.services.aria2rpc = {
		wantedBy = [ "multi-user.target" ];
		after = [ "network.target" ];
		serviceConfig = {
			Type = "simple";
			User = "everette";
			Group = "everette";
			ExecStart = ''${pkgs.aria2}/bin/aria2c --enable-rpc --rpc-listen-all=true --rpc-allow-origin-all -s32 -x16 -k1M -c'';
			Restart = "always";
			WorkingDirectory = "/home/everette/Downloads";
		};
	};

	users.extraUsers.mopidy = {
		extraGroups = [ "audio" "everette" ];
	};
}
