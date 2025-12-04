# Replace 'with nologin' and put result in logins_disable.sql.enable.sql
sed -ci.enable.sql 's/with login/with nologin/' /home/gpadmin/scripts/logins_disable.sql
