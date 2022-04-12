<html>
    <head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="js.js"></script>
    </head>
</html>

<?php

include "database.php";
$sql="SELECT codice,indirizzo FROM appartamenti";
$result= mysqli_query($conn,$sql);
//echo "<table border=1px solid black>";

echo "<form action='appartamento.php' method='POST'>";

while ($row=mysqli_fetch_array($result, MYSQLI_ASSOC))
{
    
    echo htmlspecialchars($row['indirizzo']);
    echo "<input type='submit' name='get' id='".$row['codice'] ."' value='Visualizza'><br><br>";
    echo "<input type='hidden' name='test' class='send' value=''>";
    
}
echo "</form>";

?>