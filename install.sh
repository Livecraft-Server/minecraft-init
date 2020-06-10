#!/usr/bin/env bash

_addServer () {
    read -rep $'What is this server\'s name?\n> ' serverName
    read -rep $'How much memory can the server use, in MiB? (default: 1024)\n> ' maxRam
    read -rep $'How many cores will the server be allowed to use? (default: 1)\n> ' maxCores
    while read -rep $'What server software is this server running?\n    1: Paper\n    2: Spigot\n    3: Sponge Vanilla\n    4: Forge Server\n    5: Vanilla Minecraft\n\n    a) Bungeecord\n    b) Waterfall\n\n> ' jarName; do
        case $jarName in
            1)
                echo 1
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
            *)
                echo 'Invalid input' >&2;;
        esac
    done
}
if [[ -e /etc/minecraft-init.conf ]]; then
    read -rep $'Located /etc/minecraft-init.conf. Would you like to add a server? [yN]\n> ' addingServer
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
else
    while true; do
        read -rep $'Could not locate /etc/minecraft-init.conf.\nWould you like to:\n    1: Create new configuration file\n    2: Import configuration from old configuration file\n    3: Exit\n> ' prompt
        case $prompt in
            1)
                read -rep $'Which user will be running the server? (default: minecraft)\n> ' userName
                read -rep $'Where will your server data reside? (default: /opt/minecraft-init/data)\n> ' dataPath
                while read -rep $'Will you be using Bungeecord/Waterfall?\n> ' isMultiServer; do
                    case $isMultiServer in
                        [yY]*)
                            break;;
                        [nN]*)
                            break;;
                        *)
                            echo 'Invalid input' >&2;;
                    esac
                done
                break
                ;;
            2)
                break
                ;;
            3)
                exit 0
                ;;
            *)
                echo "Please enter a valid selection"
                ;;
        esac
    done
fi
