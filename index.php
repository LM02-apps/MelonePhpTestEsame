<?php
include "database.php";
$sql="SELECT indirizzo FROM appartamenti";
$result= mysqli_query($conn,$sql);
//echo "<table border=1px solid black>";
echo "<form action='appartamento.php' method='POST'>";

while ($row=mysqli_fetch_array($result, MYSQLI_ASSOC))
{
    echo htmlspecialchars($row['indirizzo']);
}

//echo "</table>";
?>