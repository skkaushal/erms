<?php

/* connect to database */
include("dbconfig.php");

/*$host = 'localhost';
$username = 'ermsuser';
$password = 'password';
$database = 'ERMS';
$dbport = 3306;
// Create connection
$con = new mysqli($host, $username, $password, $database, $dbport);
#$con = mysqli("localhost", "gtuser", "gtuser123",3303);
if (!$con) {
	die("Failed to connect to database");
}
#mysqli_select_db("gtonline_complete") or die( "Unable to select database"); */

$errorMsg = "";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

	if (empty($_POST['username']) or empty($_POST['password'])) {
		$errorMsg = "Please provide both username and password.";		
	}
	else {  
		
		$username = mysqli_real_escape_string($con,$_POST['username']);
		$password = mysqli_real_escape_string($con,$_POST['password']);
		$query  = "SELECT UserType FROM MasterUser WHERE UserName='$username' AND Password ='$password'";
		$result = mysqli_query($con,$query);
		
		if (mysqli_num_rows($result) == 0) {
			/* login failed */

			$errorMsg = "Login failed.  Please try again.";
			
		}
		else {
			/* login successful */
			session_start();
			$_SESSION['username'] = $username;
			
			/* redirect to the profile page */
			header('Location: menu.php');
			exit();
		}
		
	}

}
  
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	
	<head>
		<title>GTOnline Login</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
  
	<body>

		<div id="main_container">
			<div id="header">
				<div class="logo"><img src="images/gtonline_logo.gif" border="0" alt="" title="" /></div>       
			</div>
     
			<div class="center_content">
			
				<div class="text_box">
		 
					<form action="login.php" method="post">
				  
						<div class="title">ERMS</div>
							<div class="login_form_row">
							<label class="login_label">username:</label>
							<input type="text" name="username" class="login_input" />
						</div>
										
						<div class="login_form_row">
							<label class="login_label">Password:</label>
							<input type="password" name="password" class="login_input" />
						</div>                                     
						
						<input type="image" src="images/login.gif" class="login" />                              
				  
					<form/>
				  
					<?php
					if (!empty($errorMsg)) {
						print "<div class='login_form_row' style='color:red'>$errorMsg</div>";
					}
					?>                    
						   
				</div>
			
				<div class="clear"><br/></div> 
			   
			</div>    
      

		</div>
	</body>
</html>