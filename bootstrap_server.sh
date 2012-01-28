#!/bin/bash
IDENTITY=$1
SERVER=$2

echo Bootstrapping $SERVER using $IDENTITY
ssh -o "StrictHostKeyChecking no" -i $IDENTITY $SERVER '/bin/bash -s' < bootstrap.sh

