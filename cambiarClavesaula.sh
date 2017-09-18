#!/bin/bash

uso() {
   echo 'Uso: $0 <ciclo1|ciclo2>'
   exit 1
}

clavesCiclo1() {
RED=172.124.116
echo "${RED}.101	29583	74602
${RED}.102	59394	68201
${RED}.103	73309	62798
${RED}.104	87903	44301
${RED}.105	47689	26073
${RED}.106	39005	61242
${RED}.107	53509	28862
${RED}.108	16101	21573
${RED}.109	14589	37702
${RED}.110	64063	29503
${RED}.111	22410	83997
${RED}.112	27410	95036
${RED}.113	68440	33905
${RED}.114	57033	24795
${RED}.115	65991	39813
${RED}.116	82511	64274
${RED}.117	59003	28101
${RED}.118	63704	50909
${RED}.119	37411	83904
${RED}.120	25441	40309
${RED}.121	54369	84030
${RED}.122	62584	43799
${RED}.123	84030	70499
${RED}.124	70708	94309
${RED}.125	64459	37084
${RED}.126	84905	62848
${RED}.127	52905	38773
${RED}.128	27074	64208
${RED}.129	65670	48709
${RED}.130	69098	57043"
}

clavesCiclo2() {
RED=172.124.117
echo "${RED}.1	2145	8124
${RED}.2	3132	9856
${RED}.3	8714	1901
${RED}.40	3718	7323
${RED}.5	8137	2419
${RED}.6	1816	8412
${RED}.7	2434	1091
${RED}.8	5158	1750
${RED}.9	3978	4621
${RED}.10	2173	3724
${RED}.11	7913	5832
${RED}.12	7129	9427
${RED}.13	3721	2425
${RED}.14	3191	1696
${RED}.15	3115	4820
${RED}.16	8456	7462
${RED}.17	2245	8543
${RED}.18	1287	3578
${RED}.19	4856	1469
${RED}.20	1145	8523
${RED}.21	3687	9731"
}

[ "$1" = "" ] && uso
([ "$1" != "ciclo1" ] && [ "$1" != "ciclo2" ]) && uso
CICLO="$1"

([ "$CICLO" = "ciclo1" ] && clavesCiclo1 || clavesCiclo2) | while read L; do
   PC=$(echo $L | awk '{print $1;}')
   CLAVE1=$(echo $L | awk '{print $2;}')
   CLAVE2=$(echo $L | awk '{print $3;}')
   eCLAVE1=$(openssl passwd $CLAVE1)
   eCLAVE2=$(openssl passwd $CLAVE2)
   ssh $PC "sudo usermod -p $eCLAVE1 ciclomedio" &
   ssh $PC "sudo usermod -p $eCLAVE2 ciclosuperior" &
   ##echo "PC: $PC. CLAVE1: $CLAVE1. CLAVE2: $CLAVE2"
done
