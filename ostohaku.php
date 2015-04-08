<?php
mysql_connect("localhost", "root", "rokkari") or die("Error connecting to database: ".mysql_error());
mysql_select_db("astikantsql") or die(mysql_error());
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ostojen hakutulokset</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<a href="http://localhost/hakulomake.php" style="font-size:18px;color:green;">Hakuun</a>
<br/>
<?php
$query = $_GET['query'];
$minimi = 2;
if(strlen($query) >= $minimi){
$query = htmlspecialchars($query);
$query = mysql_real_escape_string($query);
$tulokset = mysql_query("SELECT * FROM ostotapahtumat
WHERE (`tilausnumero` LIKE '%".$query."%') OR (`asiakasnumero` LIKE '%".$query."%')") or die(mysql_error());
if(mysql_num_rows($tulokset) > 0){
while($results = mysql_fetch_array($tulokset)){
echo "<br>Asiakasnumero: ".$results['asiakasnumero']." Tilausnumero: ".$results['tilausnumero']."</br>";
}
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
