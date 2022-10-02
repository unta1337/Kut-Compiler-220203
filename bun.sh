#!/bin/bash

bison_file_name_arr=`echo $2 | tr "." "\n"`
bison_file_name=${bison_file_name_arr[0]}

flex $1
bison -d $2

echo "${bison_file_name}"

# gcc lex.yy.c "${bison_file_name}.tab.c"
# ./a.out