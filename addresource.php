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
    <title>Add New Resource </title>

    <h1 align="left">New Resource Info</a></h1>
</head>
<hr>
<body>



<?php
include("dbconfig.php");
$rnameErr="";
$rname="";
// query primary esf
$sql="SELECT ESFName FROM refESF ORDER BY ESFNum ASC";
$result=$con->query($sql);
$esfs=array();

//echo $result->num_rows;
while ($row = mysqli_fetch_array($result)) {
    $esfs[]=$row[0];
}
//mysqli_close($con);
$sql="SELECT CostUnit FROM CostPerTime";
$result=$con->query($sql);
$cu=array();
while ($row = mysqli_fetch_array($result)) {
    $cu[]=$row[0];
}
//mysqli_close($con);

?>
<label>Resouce ID </label><br /><br />
<label>Owner </label><br /><br />
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    <label>Resource Name</label> <input type="text" name="rname" value="<?php echo $rname;?>">
    <span class="error">* <?php echo $rnameErr;?></span><br /><br />
    <label>Primary ESF </label>
    <?php
    echo '<select name="pesf">';
    foreach($esfs as $esf){
        echo '<option value="'.$esf.'">'.$esf.'</option>';
    }
    echo '</select>'
    ?><br /><br />
    <label>Additional ESFs </label>
    <?php
    echo '<select name="aesf" multiple size="8">';
    foreach($esfs as $esf){
        echo '<option value="'.$esf.'">'.$esf.'</option>';
    }
    echo '</select>'
    ?>
    <br /><br />
    <label>Model</label>  <input type = "text" name = "model" class = "box"/><br /><br />
    <label>Capabilities</label>
    <?php
    echo '<select name="cap" multiple size="5" >';
    echo '<option value="empty"></option>';
    echo '</select>';
    ?>
    <br />
    <label></label>
    <input type="text" name="newcap">
    <input type="submit" value="Add">
    <br /><br />
    <label>Home Location</label>
    <table >
        <tr>
            <th>Lat</th>
            <th>Long</th>
        </tr>
        <tr>
            <td><input type="text" name="lat"></td>
            <td><input type="text" name="long"></td>
        </tr>
    </table>
    <br /><br />
    <label>Cost</label>
    <table style="float:center">

        <tr>
            <td> &#36; </td>
            <td><input type="text" name="price"></td>
            <td>&nbsp;   per </td>
            <td>
                <?php
                echo '<select name="costunit">';
                foreach($cu as $tmpcu){
                    echo '<option value="'.$tmpcu.'">'.$tmpcu.'</option>';
                }
                echo '</select>';
                ?>
            </td>
        </tr>
    </table>
    <br /><br />
    <input type = "submit" value = "Cancel"/>
    <input type = "submit" value = "Save"/><br />

</form>








</body>
</html>