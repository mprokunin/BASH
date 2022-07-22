# Find files older then 5 minutes
find /u03/abcd -type f -amin +5 -exec ls -l {} \;
