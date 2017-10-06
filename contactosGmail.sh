#!/bin/bash

echo "Name,Given Name,Additional Name,Family Name,Yomi Name,Given Name Yomi,Additional Name Yomi,Family Name Yomi,Name Prefix,Name Suffix,Initials,Nickname,Short Name,Maiden Name,Birthday,Gender,Location,Billing Information,Directory Server,Mileage,Occupation,Hobby,Sensitivity,Priority,Subject,Notes,Group Membership"

#ayoubmakran1998@gmail.com,ayoubmakran1998@gmail.com,,,,,,,,,,,,,,,,,,,,,,,,,* My Contacts ::: clase ::: * Starred

#Imprimir en pantalla Introduce ...
echo "Introduce el nombre del grupo al que añadir las direcciones: " > /dev/stderr
#leer y guardar en la variable GRUPO lo que teclee el usuario hasta que le de al INTRO
read GRUPO

#while repite una serie de instrucciones mientras se de una condición
CORREO=""
while [ "$CORREO" != "FIN" ]; do
   echo "Introduce nombre del usuario (ej.: Pepe Pérez):" > /dev/stderr
   read  NOMBRE
   if [ "$NOMBRE" = "FIN" ]; then break; fi
   echo "Introduce dirección de correo: " > /dev/stderr
   read CORREO
   echo "${NOMBRE},${CORREO}@gmail.com,,,,,,,,,,,,,,,,,,,,,,,,,* My Contacts ::: $GRUPO ::: * Starred"
done

