<?php
ini_set('display_errors', 'On');
error_reporting(E_ALL);
include("dbconfig.php");

$errorMsg = "";

        $IncidentID= mysqli_real_escape_string($con,$_POST['IncidentID']);
		$Location= mysqli_real_escape_string($con,$_POST['Location']);
        $Keyword= mysqli_real_escape_string($con,$_POST['Keyword']);


        #$password = mysqli_real_escape_string($con,$_POST['password']);
        #select  Incident.LatI, Incident.LongI from Incident Where IncidentID=4;
        #$query  = "select  Incident.LatI, Incident.LongI from Incident Where IncidentID ='$IncidentID'";



session_start();
if (!isset($_SESSION['username'])) {
	header('Location: login.php');
	exit();
}

/* FIX this query - add the column 'hometown' to the SELECT clause */
#$query = "SELECT IncidentID, IncidentDate, Description, LatI, LongI from Incident WHERE  Where IncidentID ='$IncidentID'";
$query  = "select  Incident.LatI, Incident.LongI from Incident Where IncidentID ='$IncidentID'";
#$query = "select UserName, Name, Password, UserType from MasterUser WHERE UserName = '{$_SESSION['username']}'";

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


/* FIX this query - add the column 'hometown' to the SELECT clause */
$queryResource  = "select LatR, LongR from Resource WHERE OwnerName = '{$_SESSION['username']}'";
#$query = "select UserName, Name, Password, UserType from MasterUser WHERE UserName = '{$_SESSION['username']}'";

$resultResource = mysqli_query($con,$queryResource);
if (!$resultResource) {
    print "<p class='error'>Error: " . mysqli_error($con). "</p>";
    exit();
}

$rowResource = mysqli_fetch_array($resultResource,MYSQLI_ASSOC);

if (!$rowResource) {
    print "<p>Error: No data returned from database.  Administrator login NOT supported.</p>";
    print "<a href='logout.php'>Logout</a>";
    exit();
}

/* FIX this query - add the column 'hometown' to the SELECT clause */
$queryIncident = "SELECT IncidentID, IncidentDate, Description, LatI, LongI from Incident WHERE IncidentID ='$IncidentID'";
#$query = "select UserName, Name, Password, UserType from MasterUser WHERE UserName = '{$_SESSION['username']}'";

$resultIncident = mysqli_query($con,$queryIncident);
if (!$resultIncident) {
    print "<p class='error'>Error: " . mysqli_error($con). "</p>";
    exit();
}

$rowIncident= mysqli_fetch_array($resultIncident,MYSQLI_ASSOC);

if (!$rowIncident) {
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
					<div class="title_name">Search Results</div>
					<table width="100%">

						<tr>
							<td >
                                Search Results for Incident:
								<?php print $rowIncident['LatI']; ?>
                                <?php print $rowIncident['LongI']; ?>

                                <?php print $rowIncident['Description']; ?>
							</td>

                        <tr>
                            <td >
                                <?php print $rowIncident['LatI']; ?>
                                <?php print $rowIncident['LongI']; ?>


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

								$uusername = $rowIncident['IncidentID'];



								$con>mysqli_query($con,"SET @InputOne = " . "'" . $con->real_escape_string($uusername) . "'");
								$con>mysqli_query($con,"SET @InputTwo = " . "'" . $con->real_escape_string($Location) . "'");

								$result = $con->query("CALL getIncResource(@InputOne,@InputTwo )");
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