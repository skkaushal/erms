<?php
ini_set('display_errors', 'On');
error_reporting(E_ALL);
include("dbconfig.php");
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
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

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $valid = true;
    if (empty($_POST['ResourceName'])) {

        $errorMsgRN = "Please provide ResourceName ";
        $valid = false;
    }
    if (empty($_POST['Model'])) {
        $valid = false;
        $errorMsgModel = "Please provide Model ";
    }
    if (empty($_POST['Lat'])) {
        $valid = false;
        $errorMsgLat = "Please provide Latitude ";
    }
    if (empty($_POST['Long'])) {
        $valid = false;
        $errorMsgLong = "Please provide Longitude ";
    }
    if (empty($_POST['Cost'])) {
        $valid = false;
        $errorMsgcost = "Please provide Cost amount ";
    }
    if ($_POST['Cost'] < 0) {
        $valid = false;
        $errorMsgcost = "Cost can't be negative  ";
    }
    if (empty($_POST['CostUnit'])) {
        $valid = false;
        $errorMsg = "Please chose CostUnit ";
    }
    if (empty($_POST['PrimaryESF'])) {
        $valid = false;
        $errorMsgPESF = "Please chose ONE primaryESF ";
    }
    if ($_POST['Lat'] > 90 or $_POST['Lat'] < -90) {
        $valid = false;
        $errorMsgLat = "Latitude should between -90 and 90";
    }
    if ($_POST['Long'] > 180 or $_POST['Lat'] < -180) {
        $valid = false;
        $errorMsgLong = "Latitude should between -180 and 180";
    }
    if ($valid == true) {
        $ResourceName = mysqli_real_escape_string($con, $_POST['ResourceName']);
        $Model = mysqli_real_escape_string($con, $_POST['Model']);
        $Lat = mysqli_real_escape_string($con, $_POST['Lat']);
        $Long = mysqli_real_escape_string($con, $_POST['Long']);
        $Cost = mysqli_real_escape_string($con, $_POST['Cost']);
        $CostUnit = mysqli_real_escape_string($con, $_POST['CostUnit']);
        $OwnerName = $_SESSION['username'];


        $query1 = "select insertResource('$ResourceName','$Model', $Lat, $Long, '$OwnerName', $Cost,'$CostUnit') AS Rid from Dual";
        $result1 = mysqli_query($con, $query1);
        if ($result1) {
            $resourceID = mysqli_fetch_array($result1, MYSQLI_ASSOC)['Rid'];
            $PrimaryESF = mysqli_real_escape_string($con, $_POST['PrimaryESF']);
            $strPrimaryESF = substr($PrimaryESF, 1, -1);
            $query2 = "insert into ResourceESF (ResourceID, ESFName, ESFType)
                            Values ($resourceID, '$strPrimaryESF', 'Primary');";
            if (!mysqli_query($con, $query2)) {
                $errorMsg = "fail to add primaryESF" . mysqli_error($con);
            }

            if ($_POST['AdditionalESF']) {
                foreach ($_POST['AdditionalESF'] as &$value) {
                    $strAdditionalESF = substr($value, 1, -1);
                    $query3 = "insert into ResourceESF (ResourceID, ESFName, ESFType)
                                    Values ($resourceID, '$strAdditionalESF', 'Additional');";
                    if (!mysqli_query($con, $query3)) {
                        $errorMsg = "fail to add additionalESF" . mysqli_error($con);
                    }
                }

            }
            if ($_POST['Capabilities']) {
                foreach ($_POST['Capabilities'] as &$valueCap) {
                    $query4 = "insert into Capability(ResourceID,CapabilityName)
         Values ($resourceID, '$valueCap');";
                    if (!mysqli_query($con, $query4)) {
                        $errorMsg = "fail to add capabilities" . mysqli_error($con);
                    } else {
                        echo '<script language="javascript">';
                        echo 'alert("New Resource Has Been Added Successfully!")';
                        echo '</script>';
                    }

                }
            };
        } else {
            $errorMsg = "Add resource failed, Please Check your input" . mysqli_error($con);
        }

    }else{
        $errorMsg = "Add resource failed, Please Check your input";
        }
    }


?>

<!DOCTYPE html >
<html>
<head>
    <h1>New Resource Info</h1>
    <h4>* required field</h4>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <style type = "text/css">
        body {
            font-family:Arial, Helvetica, sans-serif;
            font-size:18px;
        }
        div{
            height: 60pt;
            display: inline-block;
        }
        .left:after{
            content:'';
            height :0;
            line-height: 0;
            display: block;
            overflow: hidden;
            font-size: 0;
            clear:both;
        }

        div.left {
            display: inline-block;
            width: 50%;

            float: left;}

        div.right {
            display: inline-block;
            width:50%;

            float: right;}
        div.top {
            height: 30pt;
            width: 50%;
        }
        div.bottom {
            height: 30pt;
            width: 50%;

        }
        .button {
            font-family:Arial, Helvetica, sans-serif;
            font-size:18px;
            background-color: white;
            border-style: solid;
            border-color: Black;
            border-width:1pt;
            color: Black;
            padding: 2px 2px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            margin: 2pt 1pt;
            cursor: pointer;
        }
    </style>
</head>
<hr>
<div class = 'left'>
    Resource ID
</div>
<div class = 'right'>
    Generated By Database
</div>
<form action="add_resource.php" method="post">
<div class = 'left'>
    Owner
</div>
<div class = 'right'>
    <?php print $row['Name']; ?>
</div>
<div class = 'left'>
    Resource Name *
</div>
<div class = 'right'>
    <input id = 'ResourceName' name = 'ResourceName' class='ResourceName'>
    <?php
    if (!empty($errorMsg)) {
        print "<div class='login_form_row' style='color:red'>$errorMsgRN</div>";
    }
    ?>
</div>
<div class = 'left'>
    Primary ESFs *
</div>
<div class = 'right'>
    <select id="PrimaryESF" name="PrimaryESF">
        <option value="">Please choose ONE PrimaryESF</option>
        <?php
        $s1 = "select ESFName from refESF";
        $result1 = mysqli_query($con,$s1);
        while($rw1=mysqli_fetch_assoc($result1)){
            echo "<option value= '{" .$rw1['ESFName']. "}'> " .$rw1['ESFName']. "</option>";
        }
        ?>
    </select>
    <?php
    if (!empty($errorMsg)) {
        print "<div class='login_form_row' style='color:red'>$errorMsgPESF</div>";
    }
    ?>
</div>
<br>
<div class = 'left'>
    Additional ESFs
</div>
<div class ='right'>
    <select multiple id="AdditionalESF" name="AdditionalESF[]">

        <?php
        $s2 = "select ESFName from refESF";
        $result2 = mysqli_query($con,$s2);
        while($rw2=mysqli_fetch_assoc($result2)){
            echo "<option value='{".$rw2['ESFName']."}'>".$rw2['ESFName']."</option>";
        }
        ?>
    </select>
</div>
<div class = 'left'>
    Model *
</div>
<div class = 'right'>
    <input id = 'Model' name="Model" class='Model'>
    <?php
    if (!empty($errorMsg)) {
        print "<div class='login_form_row' style='color:red'>$errorMsgModel</div>";
    }
    ?>
</div>
<div class = 'left'>
    Capabilities
</div>
<div class = 'right'>
    <div class="top">
        <select style="width: 200pt; height: 30pt;" multiple id="Capabilities" name="Capabilities[]">

        </select>
    </div>
    <div class="bottom">
        <input style="width: 150pt; " type="text" id="addCapabilities">
        <button type="button" id="addButton">Add</button>
    </div>
</div>
<div class = 'left'>
    Home Location *
</div>
<div class = 'right'>
    <div class="top">
    Lat<input id = 'Lat' name="Lat" class='Lat' >
    <?php
    if (!empty($errorMsg)) {
        print "<div class='login_form_row' style='color:red'>$errorMsgLat</div>";
    }
    ?>
    </div>
    <div class="bottom">
    Long<input id = 'Long' name="Long" class='Long'>
    <?php
    if (!empty($errorMsg)) {
        print "<div class='login_form_row' style='color:red'>$errorMsgLong</div>";
    }
    ?>
    </div>
</div>
<div class = 'left'>
    Cost *
</div>
<div class = 'right'>
    $ <input id = 'Cost' name='Cost' class='Cost'>
    per
    <select  id="CostUnit" name="CostUnit">
        <?php
        $s3 = "select CostUnit from CostPerTime";
        $result3 = mysqli_query($con,$s3);
        while($rw3=mysqli_fetch_assoc($result3)){
            echo "<option value=".$rw3['CostUnit'].">".$rw3['CostUnit']."</option>";
        }
        ?>
    </select>
    <?php
    if (!empty($errorMsg)) {
        print "<div class='login_form_row' style='color:red'>$errorMsgcost</div>";
    }
    ?>
</div>
<div class = 'right'>
    <a class="button" href="menu.php">Cancel</a>

    <button type="submit"  class = 'button'>Save</button>
</div>
</form>
<?php
if (!empty($errorMsg)) {
    print "<div class='login_form_row' style='color:red'>$errorMsg</div>";
}
?>

<script type="text/javascript" >
    $(document).ready(function () {
        $('#addButton').click(function () {
            var capability = $('#addCapabilities').val();
            $('#Capabilities').append('<option value="'+ capability +'" selected>'+capability+"</option>");
        });

        $('#PrimaryESF').change(function (e) {
            $('#AdditionalESF option').each(function(){
                if ($(this).prop('disabled') == true){
                    $(this).prop('disabled', false);
                }
                if ($(this).val() == $('#PrimaryESF option:selected').val()){
                    $(this).prop('disabled', true);
                }
            });
        });
    });

</script>

</html>
