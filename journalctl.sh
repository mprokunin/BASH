journalctl --list-boots |     awk '{ print $1 }' |     xargs -I{} journalctl --utc --no-pager -b {} -kqg 'killed process' -o verbose --output-fields=MESSAGE
