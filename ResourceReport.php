<?php
ini_set('display_errors', 'On');
error_reporting(E_ALL);
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

session_start();
if (!isset($_SESSION['username'])) {
	header('Location: login.php');
	exit();
}

/* FIX this query - add the column 'hometown' to the SELECT clause */
$query = "select UserName, Name, Password, UserType from MasterUser WHERE UserName = '{$_SESSION['username']}'";

$result = mysqli_query($con,$query);
if (!$result) {
	print "<p class='error'>Error: " . mysqli_error($con). "</p>";
	exit();
}

$row = mysqli_fetch_array($result,MYSQLI_ASSOC);

if (!$row) {
	print "<p>Error: No data returned from database.  Administrator login NOT supported.</p>";
	print "<a href='logout.php'>Logout</a>";
	exit();
}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>ERMS Menu</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	
	<body>

		<div id="main_container">
			
			<div id="header">
				<div class="logo"><img src="images/gtonline_logo.gif" border="0" alt="" title="" /></div>       
			</div>
			
			<div class="menu">

			</div>
			
			<div class="center_content">
			
				<div class="center_right">
					<div class="title_name">Resource Report Form</div>
					<table width="100%">

						<tr>
							<td >
								<?php print $row['Name']; ?>

							</td>


						</tr>
						<tr>
							<table width="100%">

								<?php
								
								echo "<div class=features>" ;
								echo "<div class=profile_section>";
								echo "<table border='1'  width='100%' bgcolor='white'>";
								// printing table headers


								// Prepare IN parameter
								$uusername = $_SESSION['username'];


								$con>mysqli_query($con,"SET @un = " . "'" . $con->real_escape_string($uusername) . "'");

								$result = $con->query("CALL getReport(@un)");
								if(!$result) die("CALL failed: (" . $con->errno . ") " . $con->error);

								$finfo = $result->fetch_fields();

								foreach ($finfo as $val) {
									echo "<th>$val->name</th>";


								}

								/* $rowh = mysqli_fetch_assoc($result);
                                 echo "<tr>";
                                 foreach ($rowh as $cellh => $value) {
                                     echo "<th>$cellh </th>";
                                 } */

								echo "</tr>\n";


								//if($result->num_rows > 0)


								{
									while($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
									{
										echo "<tr>";

										// $row is array... foreach( .. ) puts every element
										// of $row to $cell variable
										foreach($row as $cell)
											echo "<td class='item_label'>$cell</td>";

										echo "</tr>\n";
									}
									mysqli_free_result($result);
								}
								// else {
								// No rows returned
								// }




								echo "</tr>\n";


								?>
						</tr>


					</table>

					<div class="features">   
						
						<div class="profile_section">
							
							<table width="100%">
								<tr>

									<td><a href="profile.php">Add Resource</a></td>

									<td><a href="edit_profile.php">Add Emergency Incident</a></td>

									<td><a href="edit_profile.php">Search Resources</a></td>
									<td><a href="SearchResources.php">Resource Status</a></td>


									<td><a href="../erms/ResourceReport.php">Resource Report</a></td>


									<td><a href="../erms/ResourceReport.php">ExitT</a></td>


							</table>						
							
						</div>
						

						

									
					 </div> 
					
				</div> 
				
				<div class="clear"></div> 
			
			</div>    

			
		 
		</div>

	</body>
</html>