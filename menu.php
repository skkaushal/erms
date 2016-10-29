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
				<table width="100%">

					<tr>
						<td >
                            <div class="title_name">ERMS</div>

						</td>
                        <td >
                            <div class="title_name">Main Menu</div>


                        </td>

                        <td >
                            <div class="title_name"><?php print $row['Name']; ?></div>


                        </td>



                    <tr>

                        <td colspan="2" >
                            <div class="title_name"></div>


                        </td>
                        <td >
                             <?php


                                switch ($row['UserType']) {
                                    case "G":
                                        $query = "select ERMSMenu('{$_SESSION['username']}') AS DD from Dual";

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

                                        print "Juridiction = ". $row['DD'];
                                        break;
                                    case "M":
                                        $query = "select ERMSMenu('{$_SESSION['username']}') AS DD from Dual";

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

                                        print "Population = ". $row['DD'];
                                        break;
                                    case "I":
                                        $query = "select ERMSMenu('{$_SESSION['username']}') AS DD from Dual";

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

                                        #print "Job Title = ". $row['DD'];
                                        break;
                                    case "C":
                                        $query = "select ERMSMenu('{$_SESSION['username']}') AS DD from Dual";

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

                                        print "Headguarters = ". $row['DD'];
                                        break;
                                    default:
                                        echo "Check inputs!";
                                }


                                ?>


                        </td>

                    </tr>
					</table>
                <hr>
                <div class="center_content">
					<table width="100%">


						<tr>
							<td >
								<ul>


								</ul>

							</td>

						</tr>

					</table>

					<div class="features">   
						
						<div class="profile_section">
							
							<table width="100%" align="center">
								<tr>

									<td align="center"><a href="add_resource.php">Add Resource</a></td>
								</tr>
								<tr>

									<td align="center"><a href="newincident.php">Add Emergency Incident</a></td>
								</tr>

								<tr>

									<td align="center"><a href="SearchResources.php">Search Resources</a></td>
								</tr>

								<tr>

									<td  align="center"><a href="SearchResources.php">Resource Status</a></td>
								<tr>

									<td align="center"><a href="ResourceReport.php">Resource Report</a></td>
								</tr>
								<tr>

									<td align="center"><a href="logout.php">Logout</a></td>
								</tr>




							</table>						
							
						</div>


						

						

									
					 </div> 
					
				</div> 
				
				<div class="clear"></div> 
			
			</div>    

			
		 
		</div>

	</body>
</html>