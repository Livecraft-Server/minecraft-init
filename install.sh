#!/usr/bin/env bash

_addServer () {
    serverName=""
    maxRam=1024
    maxCores=1
    jarName=1
    while read -rep $'What is this server\'s name?\n> ' serverName; do
        [[ -e /etc/minecraft-init.d/servers/$serverName.conf ]] && echo Server already exists, please use another name. || break
    done
    read -rep $'Which user will be running the server? (default: minecraft)\n> ' userName
    read -rep $'How much memory can the server use, in MiB? (default: 1024)\n> ' maxRam
    read -rep $'How many cores will the server be allowed to use? (default: 1)\n> ' maxCores
    while read -rep $'What software will this server run?\n\n  Minecraft Servers:\n    1: Paper (default)\n    2: Spigot\n    3: Sponge Vanilla\n    4: Forge Server\n    5: Vanilla Minecraft\n\n  Server Proxies:\n    a) Bungeecord\n    b) Waterfall\n    c) GeyserMC\n\n> ' jarName; do
        case $jarName in
            1)
                break;;
            2)
                break;;
            3)
                break;;
            4)
                break;;
            5)
                break;;
            6)
                break;;
            a)
                break;;
            b)
                break;;
            c)
                break;;
            *)
                echo 'Invalid input' >&2;;
        esac
    done
    echo -e "  Server name: $serverName\n  Server software: $jarName\n  RAM: $maxRam MiB\n Cores: $maxCores\n "
    read -rep $'Is this correct? [yN]' correct
    case correct in
        [yY]*)
            [[ ! -d /etc/minecraft-init.d ]] && sudo mkdir /etc/minecraft-init.d
            ;;
        [nN]*)
            echo Exiting
            exit 0;;
        *)
            echo "Please enter a valid selection";;
    esac
}

#script start
cmp -s /etc/init.d/minecraft-init $(pwd)/minecraft-init
if [[ $? != 0 ]]; then
    read -rep $'The installed copy of minecraft-init differs from the available copy.\nWould you like to install the available copy? [yN]\n> ' installInit
    case $installInit in
            [yY]*)
            echo "installing minecraft-init"
            sudo cp $(pwd)/minecraft-init /etc/init.d/minecraft-init
            sudo chmod +x /etc/init.d/minecraft-init
            sudo update-rc.d minecraft-init defaults
            sudo update-rc.d minecraft-init enable
            echo "installation process complete"
            ;;
        [nN]*)
            exit 0;
            ;;
        *)
            echo "Please enter a valid selection"
            ;;
    esac
    read -rep $'Located /etc/init.d/minecraft-init. Would you like to add a server? [yN]\n> ' addingServer
    case $addingServer in
        [yY]*)
            _addServer
            ;;
        [nN]*)
            exit 0;
            ;;
        *)
            echo "Please enter a valid selection"
            ;;
    esac
fi
for makeDirs in /etc/minecraft-init.d /etc/minecraft-init.d/servers /opt/minecraft-init /opt/minecraft-init/data
do
    [[ ! -d $makeDirs ]] && sudo mkdir -p $makeDirs && echo "created $makeDirs" || echo "$makeDirs located"
done
echo "generated /etc/minecraft-init.conf"
