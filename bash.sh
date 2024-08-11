#!/bin/bash

ca=$(cat /etc/shadow)
	

if [ $ca == 0 ]; then
echo "its zero"
fi


