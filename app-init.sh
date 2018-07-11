# Retrive arguments form environment variables
DAM_ARGS=()
if [[ -v DAM_ARGC ]]; then
    INDEX=0
    while [ $INDEX -lt $DAM_ARGC ]; do
        eval DAM_ARGS+=(\$"DAM_ARGV"$INDEX)
        let INDEX=INDEX+1
    done
fi

google-chrome --no-sandbox ${DAM_ARGS[*]}