#!/bin/bash

ADDRESS_BOOK_FILE="addressbook.txt"

case "$1" in
  "new")
    if [ $# -ne 4 ]; then
      echo "Usage: $0 new <name> <email>"
      exit 1
    fi
    name="$2"
    email="$3"
    echo "$name $email" >> "$ADDRESS_BOOK_FILE"
    echo "Entry added to the address book."
    ;;
  
  "list")
    if [ ! -s "$ADDRESS_BOOK_FILE" ]; then
      echo "Address book is empty."
    else
      cat "$ADDRESS_BOOK_FILE"
    fi
    ;;

  "remove")
    if [ $# -ne 3 ]; then
      echo "Usage: $0 remove <name>"
      exit 1
    fi
    name="$2"
    sed -i "/^$name /d" "$ADDRESS_BOOK_FILE"
    echo "Entries with name '$name' removed from the address book."
    ;;

  "clear")
    > "$ADDRESS_BOOK_FILE"
    echo "Address book cleared."
    ;;

  "lookup")
    if [ $# -ne 3 ]; then
      echo "Usage: $0 lookup <name>"
      exit 1
    fi
    name="$2"
    grep "^$name " "$ADDRESS_BOOK_FILE" | awk '{print $2}' | sed 's/ /\\n/g'
    ;;
  
  *)
    echo "Invalid command. Usage: $0 {new|list|remove|clear|lookup}"
    exit 1
    ;;
esac