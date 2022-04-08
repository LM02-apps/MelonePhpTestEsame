<?php
include "database.php";
$sql="SELECT codice,indirizzo FROM appartamenti";
$result= mysqli_query($conn,$sql);
//echo "<table border=1px solid black>";

echo "<form action='appartamento.php' method='POST'>";

while ($row=mysqli_fetch_array($result, MYSQLI_ASSOC))
{
    $codice=htmlspecialchars($row['codice']);
    echo "<select multiple name='id[]'>"
    echo "<option value='".$codice."'>".htmlspecialchars($row['indirizzo'])."</option>";
    echo "<input type='submit' value='Visualizza'>";
}
echo "</form>";

//echo "</table>";
?>