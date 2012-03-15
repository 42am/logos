#!/bin/sh

ACCOUNT=42am
REPO=logos

pwd=$(pwd)
for dir in *; do
    if [ -d $pwd/$dir ]; then
        cd $pwd/$dir
        (
            echo  "$dir"
            echo "$dir" | sed "s/./=/g"
            echo
            for image in *; do
                if [ -f $image -a "$image" != "README.md" ]; then
                    echo "<a href=\"/$ACCOUNT/$REPO/raw/master/$dir/$image\"><img src=\"/$ACCOUNT/$REPO/raw/master/$dir/$image\" filetype=\"image/svg+xml\" width=\"400px\" /></a>"
                fi
            done
            echo
            ) > $pwd/$dir/README.md
    fi
done