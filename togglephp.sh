#!/bin/bash




active_php82 () {
    sudo update-alternatives --set php /usr/bin/php8.2
    sudo a2dismod php*  && sudo a2enmod php8.2 && sudo systemctl restart apache2
    exit 1
}

active_php74 () {
    sudo update-alternatives --set php /usr/bin/php7.4
    sudo a2dismod php*  && sudo a2enmod php7.4 && sudo systemctl restart apache2
    echo 'PHP Versao 7.4 ativada'
    exit 1
}

version=''

while getopts 'v:' flag; do
    case "${flag}" in
        v) 
        case "${OPTARG}" in
            74) active_php74
            exit 1;;
            82) active_php82
            exit 1;;
            *) echo "Nao definido"
            exit 1 ;;
        esac
        ;;
        *) echo "Nada a ver"
        exit 1 ;;
    esac
done
exit 1

