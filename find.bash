# Find files older then 5 minutes
find /u03/abcd -type f -mmin +5 -exec ls -l {} \;
