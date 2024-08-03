#!/bin/bash

args=("$@")
declare -A ARGS_MAP

for arg in "${args[@]}"
do
  ARGS_MAP["${arg}"]="skip"
done

for file in $(ls . | xargs)
do
  [[ "${ARGS_MAP[${file}]}" == "" ]] && rm -rf ${file}
done
