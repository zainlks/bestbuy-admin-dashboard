<html><body><h1>It works!</h1></body></html>
<?php
$host = "localhost";
$dbusername = "root";
$dbpassword = "alza1302";
$dbname = "inventoryDB";
// Create connection
$conn = new mysqli ($host, $dbusername, $dbpassword, $dbname);

if (mysqli_connect_error()){
die('Connect Error ('. mysqli_connect_errno() .') '
. mysqli_connect_error());
}
else{
  $sql = "SELECT * FROM testTable";
  if($results = $conn->query($sql)) {
    $results = mysqli_fetch_array($results);
    print_r($results);
  }
}
?>
