for p in $(pgrep -f "rsync --server"); do
  awk -v pid="$p" '
    /^rchar:/ {rc=$2/1024/1024/1024}
    /^read_bytes:/ {rb=$2/1024/1024/1024}
    END {printf "PID %s: rchar=%.2f GB (%.1f%% of 550G) | read_bytes=%.2f GB\n", pid, rc, (rc/550)*100, rb}
  ' /proc/$p/io 2>/dev/null
done
PID 406563: rchar=534.52 GB (97.2% of 550G) | read_bytes=411.13 GB
PID 406585: rchar=537.11 GB (97.7% of 550G) | read_bytes=413.36 GB
PID 406586: rchar=536.31 GB (97.5% of 550G) | read_bytes=411.65 GB
PID 406587: rchar=535.39 GB (97.3% of 550G) | read_bytes=411.14 GB
PID 406591: rchar=533.45 GB (97.0% of 550G) | read_bytes=408.64 GB
PID 406599: rchar=535.12 GB (97.3% of 550G) | read_bytes=411.55 GB
