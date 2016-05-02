Init script for various Minecraft servers
=======================================
A init script that, apart form starting and stopping the server correctly, has many extra features
for running a vanilla Minecraft, Spigot, or Bukkit server.

Features
--------

 * Support for automated server management
 * More to come soon

Requirements
------------
git, java, screen

Access server console
=====================

	service minecraft console

Exit the console
	
	Screen:	CTRL+A D
	Byobu:	CTRL+A A D

Setup
=====

1. Symlink the minecraft file to `/etc/init.d/minecraft`, set the required premissions and update rc.d.

		sudo ln -s ~/minecraft-init/minecraft /etc/init.d/minecraft
		chmod 755  ~/minecraft-init/minecraft
		sudo update-rc.d minecraft defaults

2. Edit the variables in `config.example` to your needs and rename it to `config` (leaving it in the same folder as the original minecraft script)

3. Edit crontab

	As the server user:
	
		crontab -e

	Add these lines:

		#m 	h 	dom	mon	dow	command
		02 	05 	*	*	*	/etc/init.d/minecraft backup
		55 	04 	*	*	*	/etc/init.d/minecraft log-roll
		*/30 	* 	*	*	*	/etc/init.d/minecraft to-disk

For more help with the script, run

	/etc/init.d/minecraft help

