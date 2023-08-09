

log_directory="/path/to/log/directory"
log_file="$log_directory/x.log"

if [ -f "$log_file" ]; then
    log_size=$(stat -c %s "$log_file")
    
    if [ "$log_size" -gt 0 ]; then
        tail -n 100 "$log_file" > "$log_file.tmp"
        mv "$log_file.tmp" "$log_file"
        echo "Truncated $log_file to 100 lines."
    else
        echo "$log_file is empty. No truncation needed."
    fi
else
    echo "Log file $log_file not found."
fi
