var1=$(aws rds describe-db-instances --filters "Name=db-instance-id,Values=$(DB_name)" | grep Address | awk '{ print $2}'  | tr -d '"' | tr -d ',')
echo $var1
mysql -h $var1 -P 3306 -u $(DB_user) -p$(DB_password) < /opt/MySQL-Audit-DDL.sql
mysql -h $var1 -P 3306 -u $(DB_user) -p$(DB_password) < /opt/MySQL-DDL.sql
mysql -h $var1 -P 3306 -u $(DB_user) -p$(DB_password) < /opt/MySQL-DML.sql
mysql -h $var1 -P 3306 -u $(DB_user) -p$(DB_password) < /opt/DefaultAccountAndRoleCreation_DML.sql
mysql -h $var1 -P 3306 -u $(DB_user) -p$(DB_password) < /opt/MySQL-TEST-DATA-ONLY-DML.sql