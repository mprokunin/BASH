# Find files older then 5 minutes and list
find /u03/abcd -type f -mmin +5 -exec ls -l {} \;

# Find files older then 234 days and move to subdirectory
find /u03/abcd -maxdepth 1 -type f -mtime +234 -exec mv {} /u03/abcd/2021/ \;
