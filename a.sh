#!/bin/zsh

cd "$(dirname "$0")"

find "$PWD" -type f | while read line; do
    url=`cat "$line"`
    [ 'http' = "${url:0:4}" ] || continue
    echo "URL: $url"
    echo "FILE: $line"
    cd "$(dirname "$line")"
    curl -o "$line.tmp" -LRk "$url" && mv -fv "$line.tmp" "$line.ok"
done

exit

