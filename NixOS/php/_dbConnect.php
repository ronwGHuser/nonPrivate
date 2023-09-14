<?php
$dataBase  = 'information_schema';
$userName  = '';
$password  = '';
$host      = 'localhost';

$debugSql = true;
$debugMsg = false;


// Create connection
$conn = new mysqli($host, $userName, $password, $dataBase);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

return $conn;
?>
