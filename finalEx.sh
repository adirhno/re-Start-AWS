#!/bin/bash

function init_arr(){
    arr=($@)  
}

#get array length
function get_length(){
    echo $((${#arr[@]}))
}

#get the series summary
function get_sum(){
    local sum=0
    for num in ${arr[@]}
        do
        let sum=($sum+$num)
    done
    echo $sum
}

#validator function
function validator(){

    if [ $# -eq 0 ]
     then
        echo "Enter a series of at least 3 numbers greater than 0"; read -p "series: " series; main $series
     fi   

    for num in $@
     do
        if [ $num -lt 0 ] || [ ${#arr[@]} -lt 3 ]
        then
        echo "one or more numbers is less than 0"
        echo "Enter a series of at least 3 numbers greater than 0"; read -p "series: " series; main $series
        fi
    done
    
}

#get the average
function get_average(){
    local avg=0
    local sum=`get_sum`
    local length=`get_length`

    let avg=($sum/ $length)
    echo $avg
}

#print arry items from low to high
function low_to_high(){
    sortArr
    for num in ${sortedArr[@]}
        do echo $num 
    done
}

#sort from low to high
function sortArr(){
<<<<<<< HEAD

    sortedArr=($( for num in "${arr[@]}"
     do echo $num
     done | sort -n ))

    for num in ${sortedArr[@]}
     do echo $num 
    done
=======
    sortedArr=($( for num in "${arr[@]}"; do echo $num; done | sort -n ))
>>>>>>> rejects
}

#get the minimum value of the series
function min(){
    sortArr
    echo ${sortedArr[0]}
}

#get the maximum value of the series
function max(){
     sortArr
     echo ${sortedArr[$((${#arr[@]}-1))]}
}


function main(){
    init_arr $@
  
    validator $@

    options=("re-input display-the-series low-to-high max min average length sum exit")

    select opt in ${options[@]}
        do
            case $opt in 

                "re-input")
                    echo "Enter a series of at least 3 numbers greater than 0"; read -p "series: " series; main $series
                    ;;

                "display-the-series")
                    echo $@
                    ;;

                "low-to-high")
                    echo from low to high:
                    low_to_high
                    ;; 

                "max") 
                    echo maximum number is: 
                    max 
                    ;;

                "min")
                    echo minimum number is:
                    min 
                    ;;

                "average")
                    echo the average is:
                    get_average 
                    ;;

                "length") 
                    echo the series length is:
                    get_length 
                    ;;

                "sum")
                    echo the series sum is:
                     get_sum
                    ;;

                "exit")
                     exit 1 
                     ;;
            esac
         echo
         echo
        done
          echo
}


main $@

