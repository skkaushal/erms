<?php
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'ermsuser');
define('DB_PASSWORD', 'password');
define('DB_DATABASE', 'ERMS');
define('DB_DBPORT', '3306');
// Create connection
//$db = mysqli_connect(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DATABASE);

//$con = new  mysqli($host_name, $db_user, $db_pass,$db_name);
$con = new  mysqli(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DATABASE,DB_DBPORT);
if($con->connect_error){
    die("Connection failed: " . $con->connect_error);
}
?>