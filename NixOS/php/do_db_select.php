<!DOCTYPE html>

<html>
<body>
<center>
<h1>Information Schema - Tables</h1>
<style>
table {
  text-align: left;
  position: relative;
}

th {
  background: white;
  position: sticky;
  top: 0;
}
</style>

<table border=0 style="width:80%">
<tr><th valign="bottom">Table Schema</th><th valign="bottom">Table Name</th></tr>
<tr><td></td></tr>

<?php

$dbConn = require("_dbConnect.php");
$sql = "SELECT table_schema AS table_schema, table_name AS table_name FROM tables";
$result = $dbConn->query($sql);
if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
	  echo "<tr>"
	    . "<td>" . $row["table_schema"] . "</td>"
	    . "<td>" . $row["table_name"]   . "</td>"
            . "</tr>";
  }
}

$dbConn->close();

?>


</body>
</html>
