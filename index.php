<?php

$servername='127.0.0.1';
$username='root';
$password='';
$dbname="agenzia";


$conn =mysqli_connect($servername, $username, $password, "agenzia");
$sql="SELECT indirizzo FROM appartamenti";
$result= mysqli_query($conn,$sql);
echo "<table border=1px solid black>";

while ($row=mysqli_fetch_array($result, MYSQLI_ASSOC))
{
    echo "<tr><td>". htmlspecialchars($row['indirizzo'] . "</td>");
}
echo "</table>";
?>