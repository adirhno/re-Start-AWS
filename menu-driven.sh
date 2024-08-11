
#!/bin/bash


nums=(1 2 3 4 5)

select chos in ${nums[@]}

do
case $chos in

1)echo "one";;
2)echo "two";;
3)echo "three";;
4)echo "four";;
5)exit 1;;

esac

done
