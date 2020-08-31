#!/bin/bash

echo -e "\n###APACHE2 & MYSQL starter###\n"


sudo systemctl start apache2.service mysql.service
if [ $? -eq 0 ]; then
  echo "OK"
  notify-send 'services started' 'apache2 and mysql are now running in background'

  echo "Demoni inizializzati su http://127.0.0.1 - Vuoi terminare apache2 e mysql?"

  read -p "[Y/n]: " input

  if [[ $input == "Y" || $input == "y" || $input == "" ]]; then
  	echo "Fermo tutto!"
  	sudo systemctl stop apache2.service mysql.service
  	notify-send 'services stopped' 'apache2 and mysql stopped'

  else
  	echo "OK continuo..."
  	sleep 2
  	exit 0

  fi

else
  echo -e "\nErrore nell'esecuzione dello script! \n==> Controlla che tutti i servizi siano configurati correttamente.\nModifica questo script se il problema persiste...."
fi

$SHELL
