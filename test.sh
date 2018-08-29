#!/bin/bash

# Test script for MediaLibraryManager - piping in input and comparing output
# against expected output.

printf "Compiling main.swift...\n"
swiftc MediaLibraryManager/*.swift Scripts/*.swift > .compiletime_errors.txt

if [ -s .compiletime_errors.txt ]
then
    printf "Compile time warnings and/or errors:\n"
    cat .compiletime_errors.txt
else
    printf "No compile time warnings or errors.\n"
fi

cat io_testing/input.txt | ./main 1> io_testing/actual_output.txt 2> \
    .runtime_output.txt

if [ -s .runtime_output.txt ]
then 
    printf "Run time warnings and/or errors:\n"
    cat .runtime_output.txt
else
    printf "No run time warnings or errors.\n"
    printf "---------------------------------\n"
fi

printf "Diff on ACTUAL vs EXPECTED output...\n"

diff io_testing/actual_output.txt io_testing/expected_output.txt
