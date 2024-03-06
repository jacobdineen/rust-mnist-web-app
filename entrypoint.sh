#!/bin/bash

echo "Attempting to execute build-for-web.sh..."

# Execute your build-for-web.sh script with added logging
./build-for-web.sh ndarray 

# Check the exit status of build-for-web.sh
if [ $? -eq 0 ]; then
    echo "build-for-web.sh executed successfully."
else
    echo "build-for-web.sh failed with status $?."
fi

# run ./run_server.sh
./run_server.sh --serve

if [ $? -eq 0 ]; then
    echo "run_server.sh executed successfully."
else
    echo "run_server.sh failed with status $?."
fi