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
		table, th, td {
			border: 1px solid black;
			border-collapse: collapse;
		}
		th, td {
			padding: 5px;
			text-align: left;
		}
		caption{
			text-align: left;
		}
		}
		
		</style>
		
			
		<title>Resource Status</title>
		   
		<h1 align="left">Resource Status</a></h1>
	</head>
	<hr>
	<body>  



	<?php
	   include('session.php');
	   
	   $username=$_SESSION['username'];
	   //resource in use
	   $inuse="";
	   $output="";
	   //for temp implementation
	   $stat='available';
	     
	   $sql="SELECT * FROM `resource` WHERE status='$stat'";
	   	   
	   if($result=$con->query($sql)){
		   $output.="<table width='50%'><caption>Resource in use</caption><tr class='inuse'>";
		   $i = 0;
          
		  while ($property = mysqli_fetch_field($result)) {
			$output.= "<th>".$property->name . "</th>";
			}
			$output.="<th>Action</th>";
			$output.= "</tr>";
		   while($row=mysqli_fetch_assoc($result)){
			   
			   $output.= "<tr>";
			   foreach ($row as $data)
				{
					$output.= "<td>". $data . "</td>";
				}	
				$output.="<td>";
				//$output.="<form method='post'><input type='button' value='return' class='select-inuse'/></form>";
				$output.="<button type='button' class='select-inuse'>";
				$output.="Return</button>";
				$output.="</td>";
				$output.="</tr>";
		   }
			
			$output.="</table>";
		   mysqli_free_result($result);
	   }else{
		   echo "No in use resource found for you!";
	   }
	    
				
    
	?>
			
			
			<?php echo $output;?>	
			<script>
			function myFunction() {
				var x = document.getElementsByTagName("tr");
				alert("Row index is: " + x.rowIndex);
			}
			
			
			$(".select-inuse").click(function() {
				$(this).closest('tr').find('td').each(function() {
					var textval = $(this).text(); // this will be the text of each <td>
				});
				//var id = $(this).closest("tr").find(".Status").text();
				alert(textval);
				
			});
			</script>
			
	 
			
	 
	</body>  
</html>
