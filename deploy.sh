#!/bin/bash
STYLE=style.css
PANDOCFLAGS="-s "
PANDOCFLAGS+=" $@"

function convert_all_files()
{
    for j in *.$1; do
        if [[ $j != "*.$1" ]]; then 
            echo Converting $j to $2 file...
            pandoc $PANDOCFLAGS -c $3/$STYLE \
                    -f $1 -t $2 -i $j -o $(basename $j .$1).$2
        fi
    done
}

convert_all_files rst html .

for i in week*; do
    cd $i
    convert_all_files rst html ..
    cd ..
done

