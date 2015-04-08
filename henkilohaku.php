<?php
mysql_connect("localhost", "root", "rokkari") or die("Tietokantaan ei yhteyttä: ".mysql_error());
mysql_select_db("astikantsql") or die(mysql_error());
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>henkilöhaun tulokset</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<a href="http://localhost/hakulomake.php" style="font-size:18px;color:green;">Hakuun</a>
<br/>
<?php
$query = $_GET['query'];
$taulu = $_GET['henkilot'];
$minimi = 2;
if(strlen($query) >= $minimi){
$query = htmlspecialchars($query);
$query = mysql_real_escape_string($query);
$tulokset = mysql_query("SELECT * FROM $taulu
WHERE (`etunimi` LIKE '%".$query."%') OR (`sukunimi` LIKE '%".$query."%')") or die(mysql_error());
$num_rows = mysql_num_rows($tulokset);
if(mysql_num_rows($tulokset) > 0){
if($taulu == "asiakkaat"){
while($results = mysql_fetch_array($tulokset)){
echo "<br>Asiakas: <strong>".$results['etunimi']."</strong>"." ".$results['sukunimi']." Asiakasnro: ".$results['asiakasnumero']." Puh: ".$results['puhelinnro']." Email: ".$results['email']."</br>";
}}
if($taulu == "tyontekijat"){
while($results = mysql_fetch_array($tulokset)){
echo "<br>Työntekijä: <strong>".$results['etunimi']."</strong>"." ".$results['sukunimi']." Työntekijä ID: ".$results['tyontekijaID']." Puh: ".$results['puhelinnro']." Email: ".$results['email']." Paikkakunta: ".$results['kotikunta']."</br>";
}}
echo "<br/>";
echo "tuloksia <strong>$num_rows</strong> kpl";
}
else{
echo "Ei tuloksia hakutermillä";
}
}
else{
echo "Anna vähintään ".$minimi." merkkiä";
}
?>
</body>
</html>
