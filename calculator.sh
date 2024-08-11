#!/bin/bash

echo "welcome to my calculator"


function exall (){

local ans=$1

is_prime $ans
is_odd_even $ans
divide_by_5 $ans
}


function is_prime(){

local num=$1
local count=1

for((i=1; i<num ; i++)); do
if [ $(($num%$i)) == 1 ];then
let count=($count+1)
fi

if [ $count == 3 ]; then
echo "the number is prime"
exit 1
fi

done
echo "the number is not prime"
}


function add(){

local ar1=$1
local ar2=$2
let result=$(($ar1 + $ar2 | bc))

echo "$ar1 + $ar2 = $result"
 exall $result
}


function divide_by_5(){

local ans=$1
ans=$(($ans%5 | bc))

if [ $ans == 0 ]; then
echo "divide by 5 without remainder"

else
echo "divide by 5 with remainder" 

fi
}


function is_odd_even(){

local ans=$1

ans=$(( $ans%2 | bc ))

if [ $ans == 0 ]; then
echo "the answer is even"

else
echo "the answer is odd"

fi
}


function subtraction (){

local ar1=$1
local ar2=$2
result=$(($ar1 - $ar2 | bc))

echo "$ar1 - $ar2 = $result"
exall $result
}

function divide (){ 

local ar1=$1
local ar2=$2
result=$(($ar1 / $ar2 | bc))

echo "$ar1 / $ar2 = $result"
exall $result
}


function multiplication (){

local ar1=$1
local ar2=$2
result=$(($ar1 * $ar2 | bc))

echo "$ar1 X $ar2 = $result"
exall $result
}



operations=("add" "subtraction" "divide" "multiplication" "exit" )

select action in ${operations[@]}
do

case $action in  

"add") read -p "enter num 1: " ar1; read -p "enter num 2: " ar2;  add $ar1 $ar2;;
"subtraction") read -p "enter num 1: " ar1; read -p "enter num 2: " ar2;  subtraction $ar1 $ar2;;
"divide") read -p "enter num 1: " ar1; read -p "enter num 2: " ar2; divide $ar1 $ar2;;
"multiplication") read -p "enter num 1: " ar1; read -p "enter num 2: " ar2; multiplication $ar1 $ar2;;
"exit") exit 1;;
esac

done



