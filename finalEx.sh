#!/bin/bash

#validate input
if [ ! $3 ]
then
echo "please enter 3 numbers"; exit 1
fi

#create sum+length
arr=($1 $2 $3)
let length=( ${#arr} + 1 )
let sum=0

#get the series summary
for num in ${arr[@]}
do
let sum=($sum+$num)
done


#validator function
function validator(){

    echo "in validaotr"

    local num1=$1
    local num2=$2
    local num3=$3

    echo $num1 $num2 $num3

    if [ $num1 -lt 0 ] || [ $num2 -lt 0 ] || [ $num3 -lt 0 ]
        then
        echo "one or more numbers is less than 0"
        exit 1 
    fi
}

#get the average
function get_average(){

    local avg=0
    let avg=($sum/ $length)
    echo $avg

}

#sort from low to high
function sortArr(){

    sortedArr=($( for num in "${arr[@]}"; do echo $num; done | sort -n ))

    for num in ${sortedArr[@]}
     do echo $num 
    done
}

#get the min value of the series
function min(){

local min=$(max $1 $2 $3)

for num in ${arr[@]}; do

    if (( $num < $min ))
     then
     min=$num
    fi

done

echo $min
}


#get the maximum value of the series
function max(){

    local max=0
    for num in ${arr[@]}
     do
        if (( $num > $max ))
        then
        max=$num
        fi

    done

    echo $max
}


function prog1(){

    local num1=$1
    local num2=$2
    local num3=$3


    validator $num1 $num2 $num3

    options=("re-input display-the-series low-to-high max min average length sum exit")

    select opt in ${options[@]}

        do
            case $opt in 

                "re-input")
                    echo "enter a series of 3 numbers gt 0"; read -p "num1: " n1; read -p "num2: " n2; read -p "num3: " n3; prog1 $n1 $n2 $n3 
                    ;;

                "display-the-series")
                    echo $num1 $num2 $num3
                    ;;

                "low-to-high")
                    sortArr $num1 $num2 $num3 
                    ;; 

                "max") 
                    max $num1 $num2 $num3 
                    ;;

                "min")
                    min $num1 $num2 $num3 
                    ;;

                "average")
                    get_average $num1 $num2 $num3 
                    ;;

                "length") 
                    echo $length 
                    ;;

                "sum")
                    echo $sum 
                    ;;

                "exit")
                     exit 1 
                     ;;
            esac

        done
}


prog1 $1 $2 $3

