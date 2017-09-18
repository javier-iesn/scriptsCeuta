#!/bin/bash
uso() {
   echo uso: $0 '<ciclo1|ciclo2>'
   exit 1
}   
macsCiclo1() {
echo "172.124.116.101	f4:6d:04:54:30:8d	ASUSTek COMPUTER INC.
172.124.116.102	f4:6d:04:54:30:95	ASUSTek COMPUTER INC.
172.124.116.103	f4:6d:04:54:30:e3	ASUSTek COMPUTER INC.
172.124.116.104	f4:6d:04:54:31:b7	ASUSTek COMPUTER INC.
172.124.116.105	f4:6d:04:54:30:d6	ASUSTek COMPUTER INC.
172.124.116.106	f4:6d:04:54:30:ec	ASUSTek COMPUTER INC.
172.124.116.107	f4:6d:04:54:30:d2	ASUSTek COMPUTER INC.
172.124.116.108	f4:6d:04:54:30:e0	ASUSTek COMPUTER INC.
172.124.116.109	f4:6d:04:54:30:e5	ASUSTek COMPUTER INC.
172.124.116.110	f4:6d:04:54:30:d3	ASUSTek COMPUTER INC.
172.124.116.111	f4:6d:04:54:31:1c	ASUSTek COMPUTER INC.
172.124.116.112	f4:6d:04:54:30:f0	ASUSTek COMPUTER INC.
172.124.116.113	f4:6d:04:54:30:db	ASUSTek COMPUTER INC.
172.124.116.114	f4:6d:04:54:31:c1	ASUSTek COMPUTER INC.
172.124.116.115	f4:6d:04:54:2d:99	ASUSTek COMPUTER INC.
172.124.116.116	f4:6d:04:54:2d:93	ASUSTek COMPUTER INC.
172.124.116.117	f4:6d:04:52:b3:3e	ASUSTek COMPUTER INC.
172.124.116.118	f4:6d:04:4f:be:79	ASUSTek COMPUTER INC.
172.124.116.119	f4:6d:04:54:31:1a	ASUSTek COMPUTER INC.
172.124.116.120	f4:6d:04:54:30:c4	ASUSTek COMPUTER INC.
172.124.116.121	f4:6d:04:54:30:fc	ASUSTek COMPUTER INC.
172.124.116.122	f4:6d:04:54:30:91	ASUSTek COMPUTER INC.
172.124.116.123	f4:6d:04:54:30:d5	ASUSTek COMPUTER INC.
172.124.116.124	f4:6d:04:54:30:f2	ASUSTek COMPUTER INC.
172.124.116.125	f4:6d:04:54:30:dc	ASUSTek COMPUTER INC.
172.124.116.126	f4:6d:04:54:30:cf	ASUSTek COMPUTER INC.
172.124.116.127	48:5b:39:f7:5f:33	ASUSTek COMPUTER INC.
172.124.116.128	f4:6d:04:52:b5:a5	ASUSTek COMPUTER INC.
172.124.116.129	f4:6d:04:54:31:44	ASUSTek COMPUTER INC.
172.124.116.130	f4:6d:04:54:30:8c	ASUSTek COMPUTER INC."
}
macsCiclo2() {
echo "172.124.117.1	1c:1b:0d:0d:2d:85	(Unknown)
172.124.117.2	1c:1b:0d:64:fc:c7	(Unknown)
172.124.117.3	1c:1b:0d:64:fc:bf	(Unknown)
172.124.117.40	1c:1b:0d:0c:68:d8	(Unknown)
172.124.117.5	1c:1b:0d:0c:68:d9	(Unknown)
172.124.117.6	1c:1b:0d:64:fc:b9	(Unknown)
172.124.117.7	1c:1b:0d:65:88:61	(Unknown)
172.124.117.8	1c:1b:0d:65:88:3b	(Unknown)
172.124.117.9	1c:1b:0d:64:fc:bd	(Unknown)
172.124.117.10	1c:1b:0d:65:88:39	(Unknown)
172.124.117.11	1c:1b:0d:0c:69:24	(Unknown)
172.124.117.12	1c:1b:0d:0d:3f:cc	(Unknown)
172.124.117.13	1c:1b:0d:64:fc:e3	(Unknown)
172.124.117.14	1c:1b:0d:65:88:5b	(Unknown)
172.124.117.15	1c:1b:0d:0d:2d:87	(Unknown)
172.124.117.16	1c:1b:0d:65:88:46	(Unknown)
172.124.117.17	1c:1b:0d:65:88:8e	(Unknown)
172.124.117.18	1c:1b:0d:65:88:a0	(Unknown)
172.124.117.19	1c:1b:0d:65:88:9e	(Unknown)
172.124.117.20	1c:1b:0d:0d:3f:ba	(Unknown)
172.124.117.21	1c:1b:0d:65:88:9b	(Unknown)"
}
[ "$1" = "" ] && uso
[ "$1" != "ciclo1" ] && [ "$1" != "ciclo2" ] && uso
IFACE=$(ip a | grep 172.124 | awk '{print $NF;}')
([ "$1" = "ciclo1" ] && macsCiclo1 || macsCiclo2) | while read L; do 
   echo sudo etherwake -i $IFACE $(echo $L | awk '{print $2;}')
   sudo etherwake -i $IFACE $(echo $L | awk '{print $2;}')
done   