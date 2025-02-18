#!/bin/zsh
# This code generated with the aid of Gemini Advanced

original_dir='original'
private_dir='private'

if [[ $# -eq 1 ]]; then
  option="$1"
else
    echo "Usage: $0 [-private|-original]"
    exit 1
fi

case "$option" in
    -private)
        source_dir=$private_dir
        ;;
    -original)
        source_dir=$original_dir
        ;;
    *)
        echo "Invalid option: $option"
        exit 1
        ;;
esac

cp "$source_dir"/* .