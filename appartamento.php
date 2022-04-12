<html>
    <head>
        <script src="js.js"></script>
    </head>
    <body>
    </body>
</html>

<?php
include "database.php";
$sql="SELECT * FROM appartamenti WHERE codice='".$_POST['test'] ."' ";
$result= mysqli_query($conn,$sql);

while ($row=mysqli_fetch_array($result, MYSQLI_ASSOC))
{
    echo "<p>Numero camere: ".htmlspecialchars($row['numerocamere'])."<br>";
    echo "Posti letto: ". htmlspecialchars($row['postiletto'])."<br>";
    echo "Uso cucina: ". htmlspecialchars($row['usocucina'])."<br>";
    echo "Parcheggio: ".htmlspecialchars($row['parcheggio'])."<br>";
    echo "Note: ".htmlspecialchars($row['note']);
    echo '<img src="data:image/jpeg;base64,'.base64_encode( $result['fotoappartamento'] ).'"/>';
}
?>