<!DOCTYPE html>

<html>
<body>

<?php

$dbConn = require("_dbConnect.php");
$sql = "select version() as mysql_version";
$result = $dbConn->query($sql);

while($row = $result->fetch_assoc()) {
  echo "<p>MySQL " . $row["mysql_version"] . "</p>\n";
}

$dbConn->close();

?>

</body>
</html>
