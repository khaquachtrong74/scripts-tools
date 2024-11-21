#!/bin/bash
read nameComputer
echo -n "ban co muon doi ten may tinh khong?"
read ketQua
if [ "$ketQua" == "yes" ]
then
	sudo hostnamectl set-hostname "$nameComputer"
	echo -n "Ban nen khoi dong lai may tinh de co hieu luc"
	read luaChon
	if [ "$luaChon" == "yes" ]
	then
		reboot
	else
		echo -n "Ten may tinh hien tai la "; hostnamectl
	fi
else
	echo -n "Chuong trinh ket thuc, ten may tinh la"; hostnamectl
fi
