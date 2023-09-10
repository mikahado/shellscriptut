#!/bin/sh

adduser()
{
  USER=$1
  PASSWORD=$2
  shift ; shift
  COMMENTS=$@
  useradd -c "${COMMENTS}" $USER
  if [ "$?" -ne "0" ]; then
    echo "Useradd failed"
    return 1
  fi
  passwd $USER $PASSWORD | chpasswd -e
  if [ "$?" -ne "0" ]; then
    echo "Setting password failed"
    return 2
  fi
  echo "Added user $USER ($COMMENTS) with pass $PASSWORD"
}

## Main script starts here

echo "Enter username: "
read USERNAME
echo "Enter a password: "
read PASSWRD
echo "Enter bio: "
read BIO

adduser "$USERNAME" "$PASSWRD" "$BIO"
ADDUSER_RETURN_CODE=$?
if [ "$ADDUSER_RETURN_CODE" -eq "1" ]; then
  echo "Something went wrong with useradd"
elif [ "$ADDUSER_RETURN_CODE" -eq "2" ]; then 
   echo "Something went wrong with passwd"
else
  echo "Bob Holness added to the system."
fi