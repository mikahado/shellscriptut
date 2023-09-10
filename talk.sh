#!/bin/sh

echo "Please talk to me . . . "
while : 
do 
    read INPUT_STRING
    case $INPUT_STRING in 
        hello) 
            echo "Yello urself"
            ;;
        bye)
            echo "see you gain later ok"
            break 
            ;;
        *)
            echo "sorry i no understandy"
            ;;
    esac 
done 
echo
echo "dat's all yokes"