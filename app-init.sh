#! /usr/bin/bash
# Retrive arguments form environment variables
DAM_ARGS=()
if [[ -v DAM_ARGC ]]; then
    INDEX=0
    while [ $INDEX -lt $DAM_ARGC ]; do
        eval DAM_ARGS+=(\$"DAM_ARGV"$INDEX)
        let INDEX=INDEX+1
    done
fi

./tor-browser_en-US/Browser/start-tor-browser ${DAM_ARGS[*]}