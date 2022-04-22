<html>
    <head>
        <script src="js.js"></script>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <img class="logo" src="images/home-icon.png">
        <h1>Teramo Immobili Srl</h1>
    </body>
</html>

<?php
include "database.php";
$sql="SELECT * FROM appartamenti WHERE codice='".$_GET['test'] ."' ";
$result= mysqli_query($conn,$sql);

while ($row=mysqli_fetch_array($result, MYSQLI_ASSOC))
{   
    
    echo "<h1>Appartamento Codice: ".htmlspecialchars($row['codice'])." ".htmlspecialchars($row['indirizzo']). "</h1>";
    $sql2="SELECT * FROM quartieri WHERE codice='". htmlspecialchars($row['codicequartiere'])."' ";
    $result2=mysqli_query($conn,$sql2);

    while ($row2=mysqli_fetch_array($result2, MYSQLI_ASSOC))
    {
        echo "<h1>Quartiere: ".htmlspecialchars($row2['nome'])."</h1>";
    }
    
    echo "<p>Numero camere: ".htmlspecialchars($row['numerocamere'])."<br>";
    echo "Posti letto: ". htmlspecialchars($row['postiletto'])."<br>";
    echo "Uso cucina: ". htmlspecialchars($row['usocucina'])."<br>";
    echo "Parcheggio: ".htmlspecialchars($row['parcheggio'])."<br>";
    echo "Note: ".htmlspecialchars($row['note'])."<br>";

    echo '<img class="imgappartamento" src="data:image/jpeg;base64,'.base64_encode( $row['fotoappartamento'] ).' "/>';
}
?>