#!/bin/bash
IDENTITY=$1
ENVIRONMENT=$2

echo Bootstrapping $2 environment 

cat environments/$2/servers | while read line ; do
  SERVER=$line
  echo Bootstrapping server $SERVER 
  ssh -o "StrictHostKeyChecking no" -i $IDENTITY $SERVER '/bin/bash -s' < bootstrap.sh
done


