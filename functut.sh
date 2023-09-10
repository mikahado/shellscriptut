#!/bin/sh

myfunc()
{
  echo "I was called as : $@"
  x=2
}

### Main script starts here 

echo "Script was called with $@"
# x is global variable so myfunc() can change it
x=1
echo "x is $x"
myfunc 1 2 3
echo "x is $x"

