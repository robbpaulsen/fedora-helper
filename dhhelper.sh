#!/usr/bin/env bash

NORMAL='\033[0m'
RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'
LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'
UNDERLINE='\033[04m'

trap ctrl_c INT

ctrl_c() {
	exit
}

if [ "$EUID" -ne 0 ]; then
	echo -e "${YELLOW}\n[+]Se te olvido el sudo ...\n${NORMAL}"
	exit
fi

srbt() {
	systemctl reboot
}

supdater() {

	echo -e "\n${LRED}[(!)]${NORMAL}${LYELLOW} Iniciando Actualizacion del sistema${NORMAL}\n"
	dnf --assumeyes check-update
	sleep 2
	dnf --assumeyes distro-sync
	sleep 2

	pkexec --user heimdal flatpak update --system --assumeyes
	sleep 2

	pkexec --user heimdal /home/heimdal/.cargo/bin/cargo liner ship
	sleep 2
	echo -e "\n${LYELLOW}[(+)]${NORMAL}${LCYAN} Sea finalizado la actualizacion del sistema\favor de reiniciar${NORMAL}\n"
	sleep 2
	clear
}

menu() {
	while true; do
		clear
		echo ""
		echo ""
		echo " ██████╗  ██╗  ██╗ ██╗  ██╗ ███████╗ ██╗      ██████╗  ███████╗ ██████╗"
		echo " ██╔══██╗ ██║  ██║ ██║  ██║ ██╔════╝ ██║      ██╔══██╗ ██╔════╝ ██╔══██╗"
		echo " ██║  ██║ ███████║ ███████║ █████╗   ██║      ██████╔╝ █████╗   ██████╔╝"
		echo " ██║  ██║ ██╔══██║ ██╔══██║ ██╔══╝   ██║      ██╔═══╝  ██╔══╝   ██╔══██╗"
		echo " ██████╔╝ ██║  ██║ ██║  ██║ ███████╗ ███████╗ ██║      ███████╗ ██║  ██║"
		echo " ╚═════╝  ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚══════╝ ╚══════╝ ╚═╝      ╚══════╝ ╚═╝  ╚═╝"
		echo ""
		echo ""
		echo -e "\n1)${LBLUE} [(+)]${NORMAL}${CYAN} Actualizar Sistema${NORMAL}\n"
		echo -e "\n2)${LBLUE} [(+)]${NORMAL}${CYAN} Reinicar el sistema${NORMAL}\n"
		echo -e "\n3)${LYELLOW} [(+)]${NORMAL}${LIGHTGRAY} Salir${NORMAL}\n"
		read -p "Escribe el numero de la seleccion deseada: " numero
		echo ""
		echo ""

		case $numero in

		1)
			supdater
			;;
		2)
			srbt
			;;
		3)
			echo -e "\n${LYELLOW}[!]${NORMAL}${LRED} Saliendo${NORMAL}\n"
			exit 0
			;;
		*)
			echo -e "\n${LYELLOW}[!]${NORMAL}${RED} No es una opcion valida${NORMAL}\n"
			;;
		esac
	done
}
menu
