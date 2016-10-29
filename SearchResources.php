<?php
ini_set('display_errors', 'On');
error_reporting(E_ALL);
include("dbconfig.php");

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
		<title>Search Resource</title>
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
					<div class="title_name">Search Resource Form</div>
					<table width="100%">

						<tr>
							<td align="CENTER" colspan="2">
								<?php print $row['Name']; ?>

							</td>

						</tr>
						<tr>
							<td >
								<div class="features">

									<div class="profile_section">

										<form name="profileform" action="DspResources.php" method="post">
											<table width="80%">

												<tr>
													<td class="item_label">Keyword</td>
													<td>
														<input type="text" name="Keyword" value="" />
													</td>
												</tr>
												<tr>
													<td class="item_label">ESF</td>
													<td>
                                                        <?php
                                                        /* if (isset($_GET['image_id'])) {
                                                         if (!is_numeric($_GET['image_id'])) {
                                                             $image_id = 1;
                                                         } else {
                                                             $image_id = (int) $_GET['image_id'];
                                                         }*/
                                                        $query = "select ESFNum, ESFName from refESF;";
                                                        $result = mysqli_query($con,$query);
                                                        //$row = $result->fetch_assoc();
                                                        ?>


                                                        <select name="ESF" id="ESF">
                                                            <?php while ($row = mysqli_fetch_array($result,MYSQLI_ASSOC)) { ?>
                                                                <option value="<?php echo $row['ESFNum']; ?>"
                                                                ><?php echo $row['ESFName']; ?></option>
                                                                mysqli_free_result($result);
                                                            <?php } ?>
                                                        </select>

													</td>
												</tr>

												<tr>
													<td class="item_label">Location    Within</td>
													<td>
														<input type="text" name="Location" value="" />
													</td>
												</tr>

												<!-- FIX THIS SECTION -->
												<!-- add user's hometown here -->
                                                <tr>

                                                    <td class="item_label">Incident</td>
                                                    <td>
                                                        <?php
                                                        /* if (isset($_GET['image_id'])) {
                                                         if (!is_numeric($_GET['image_id'])) {
                                                             $image_id = 1;
                                                         } else {
                                                             $image_id = (int) $_GET['image_id'];
                                                         }*/
                                                        $query = "SELECT IncidentID, IncidentDate, Description, LatI, LongI from Incident WHERE  Ownername = '{$_SESSION['username']}'";
                                                        $result = mysqli_query($con,$query);
                                                        //$row = $result->fetch_assoc();
                                                        ?>



                                                        <select name="IncidentID" id="IncidentID">
                                                            <?php while ($row = mysqli_fetch_array($result,MYSQLI_ASSOC)) { ?>
                                                                <option value="<?php echo $row['IncidentID']; ?>"
                                                                ><?php echo $row['Description']; ?></option>
                                                                mysqli_free_result($result);
                                                            <?php } ?>
                                                        </select>

                                                    </td>
                                                </tr>


											</table>

											<a href="javascript:profileform.submit();" class="fancy_button">Submit</a>

										</form>


									</div>

								</div>

							</td>

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