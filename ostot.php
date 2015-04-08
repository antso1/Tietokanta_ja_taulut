<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<body>
<a href="http://localhost/hakulomake.php" style="font-size:18px;color:green;">Hakuun</a>
<br/>
<h1>Kaikki ostot</h1>
<?php
$dbname = "astikantsql";
$ses = mysqli_connect("localhost","root","rokkari",$dbname);
if(!$ses){
echo("<p>Ei yhteyttä tietokantaan</p>");
exit();
}
$sql = "SELECT * FROM ostotapahtumat";
$result = $ses->query($sql);
$rows = $result->num_rows;
echo "Ostotapahtumia $rows kpl";
echo "<br/>";
if ($result->num_rows > 0) {
while($row = $result->fetch_assoc()) {
echo "<br> Asiakasnumero: ". $row["asiakasnumero"]. " Tilausnro: ". $row["tilausnumero"]." Myyntipaikan ID: ".$row["toimipisteID"]."<br>";
}
} else {
echo "0 results";
}
?>
</body>
</html>
