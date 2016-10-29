<!DOCTYPE HTML>  
<html>
	<head>
		<style>
		.error {color: #FF0000;}
		label{
			width: 150px;
			display: inline-block;
			font-weight: bold;
			vertical-align: top;
		}
		.left {
			width: 30%;
			float: left;
			text-align: right;
		}
		.right {
			width: 65%;
			margin-left: 10px;
			float:left;
		}
		table {
			display: inline-table;
		}
		
		</style>
		
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
		$( function() {
			$( "#datepicker" ).datepicker();
		} );
		</script>
		
		<title>New Incident</title>
		   
		<h1 align="left">New Incident Infor </a></h1>
	</head>
	<hr>
	<body>  



	<?php
	   include('session.php');
	   $idate=$ides=$ilat=$ilong="";
	   $idateerr=$ideserr=$ilaterr=$ilongerr="";
	   $username=$_SESSION['username'];
	   if($_SERVER["REQUEST_METHOD"] == "POST") {
	   		
		if (empty($_POST["idate"])) {
			//$idate = "";
			$idateerr="Date is required";
		  } else {
			$idate = test_input($_POST["idate"]);
		}
		if (empty($_POST["ides"])) {
			//$ides = "";
			$ideserr="Description is required";
		  } else {
			$ides = test_input($_POST["ides"]);
		}
		if (empty($_POST["ilat"])) {
			//$ides = "";
			$ilaterr="Lat is required";
		  } else {
			$ilat = test_input($_POST["ilat"]);
			if($ilat>90 ||$ilat<-90){
				$ilaterr="Lat has to be within [-90,90]";				
			}			  
		}
		if (empty($_POST["ilong"])) {
			//$ides = "";
			$ilongerr="Long is required";
		  } else {
			$ilong = test_input($_POST["ilong"]);
			if($ilong>180 ||$ilong<-180){
				$ilongerr="Long has to be within [-180,180]";
			}			  
		}
	   }
	   
	   function test_input($data) {
		  $data = trim($data);
		  $data = stripslashes($data);
		  $data = htmlspecialchars($data);
		  return $data;
		}
		
		//add incident to database
		if($idate&&$ides&&$ilat&&$ilong&&$ilat<=90&&$ilat>=-90&&$ilong>=-180&&$ilong<=180){
			
			$sql="insert into Incident(IncidentDate,Description,LatI,LongI,OwnerName) 
			values (STR_TO_DATE('$idate','%m/%d/%Y'),'$ides','$ilat','$ilong','$username')";
			//$result=$con->query($sql);
			/*
			if($result->num_rows > 0) {
				$msg="Incident added";
				header("location: newincident.php?msg=$msg");
			}else{
				$msg="Could not add incident into database";
				header("location: newincident.php?msg=$msg");
				//mysqli_close($con);
			}
			
			mysqli_close($con);
			*/
			
			if ($con->query($sql) === TRUE) {
                  $msg="Incident added";
				  header("location: newincident.php?msg=$msg");
            } else {
                  $msg="Could not add incident into database";
				  header("location: newincident.php?msg=$msg");
            }
			
            
            $con->close();	
			
		}
		
    
	?>
			<p><span class="error">* required field.</span></p>
			<label>Incident ID </label>(assigned automatically)<br /><br />
			<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
			 <!--<form action = "" method = "post">-->
				<!---<label>Date</label> <input type="text" name="idate" value="<?php date('mm-dd-yyyy');?>">-->
				<label>Date</label><input type="text" id="datepicker" name="idate" value="<?php echo $idate;?>">
				<span class="error">* <?php echo $idateerr;?></span>
				<br /><br />
				<label>Description</label><input type = "text" name = "ides" class = "box" value="<?php echo $ides;?>">
				<span class="error">* <?php echo $ideserr;?></span>
				<br /><br />
				<label>Location</label><table >
					<tr>
					<th>Lat </th>
						<td><input type="text" name="ilat" value="<?php echo $ilat;?>">
						<span class="error">* <?php echo $ilaterr;?></span>
						<!--<input type="reset" value="Reset"> -->
						</td>
					</tr>
					<tr>
					<th>Long</th>				
						
						<td><input type="text" name="ilong" value="<?php echo $ilong;?>">
						<span class="error">* <?php echo $ilongerr;?></span>
						
						</td>				
					</tr>
				</table>
				<br /><br />
			  <!-- <input type = "submit" value = "Cancel"/> -->
			  <!-- <a class="button" href="menu.php">Cancel</a> -->
			  <input type="button" value="Cancel" class="homebutton" id="btnHome" onClick="document.location.href='menu.php'" />
			  <input type = "submit" value = "Save"/><br />
			  
			</form>
			<div style = "font-size:15px; color:#cc0000; margin-top:10px"><?php 
			if(isset($_GET['msg']))
			echo $_GET['msg']; ?></div>
	 
			<?php
			echo "<h2>Current Input for debug:</h2>";
			echo $idate;
			echo "<br>";
			echo $ides;
			echo "<br>";
			echo $ilat;
			echo "<br>";
			echo $ilong;
			echo "<br>";
			echo $username;
			?>
	 
	</body>  
</html>
