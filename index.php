<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="js.js"></script>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div>
            <img class='logo' src='images/home-icon.png'>
        </div>
        <div>
            <h1>Teramo Immobili Srl</h1>
        </div>
        
    </body>
</html>

<?php

include "database.php";
$sql="SELECT codice,indirizzo FROM appartamenti";
$result= mysqli_query($conn,$sql);
//echo "<table border=1px solid black>";

echo "";
echo "<form action='appartamento.php' method='GET'>";

while ($row=mysqli_fetch_array($result, MYSQLI_ASSOC))
{
    
    echo "<a href='appartamento.php?get=Visualizza&test=".$row['codice'] ."&test=".$row['codice'] ."'>".htmlspecialchars($row['indirizzo'])."</a>";
    echo "<br><br>";
    echo "<input type='hidden' name='test' class='send' value=''>";
    
}
echo "</form>";

?>