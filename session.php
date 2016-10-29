<?php
   include('dbconfig.php');
   session_start();
   
   //$user_check = $_SESSION['login_user'];
   
     $username = $_SESSION['username'];
   //$ses_sql = mysqli_query($db,"select username from admin where username = '$user_check' ");
   $ses_sql = "select UserName from MasterUser where UserName = '$username' ";
   $ses_result=$con->query($ses_sql); 
   $row = $ses_result->fetch_assoc();
   
   //$login_session = $row['UserName'];
   
   if(!isset($_SESSION['username'])){
      header("location:login.php");
   }
?>
