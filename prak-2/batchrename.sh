#!/bin/bash
list=$(ls -w 1 $1/)
for file in $list;
do
  if [[ "$file" =~ \."$2"$ ]]; then
    first=$1/$file
    second=$1/$(sed 's/'"$2"'$/'$3'/' <<< $file)
    echo "Переіменовую $first на $second"
    mv $first $second
  fi
done
