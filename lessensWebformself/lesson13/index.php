<?php 

@mysql_connect("localhost", "root", "") or die("Нет соединения с сервером");
mysql_query("SET NAMES 'cp1251'") or die("Не установлена кодировка соединения");
mysql_select_db("sql") or die("Не выбрана БД");
/*
$query = "INSERT INTO customers(cname, city, rating, snum, text) VALUES ('Вася Пупкин', 'Васюки', 150, 1002, 'Какой-то текст')";
mysql_query($query);
if(mysql_affected_rows()){
	echo '<p>Данные добавлены</p>';
}else{
	echo '<p>Ошибка</p>';
}

$query = "UPDATE customers SET cname='John Doe', city='LA' WHERE cnum=2013";
mysql_query($query);
if(mysql_affected_rows()){
	echo '<p>Данные обновлены</p>';
}else{
	echo '<p>Ошибка</p>';
}
*/
$query = "DELETE FROM customers WHERE cnum > 2010";
mysql_query($query);
if(mysql_affected_rows()){
	echo '<p>Данные удалены</p>';
}else{
	echo '<p>Ничего не удалено</p>';
}

$query = "SELECT * FROM customers";
$res = mysql_query($query) or die(mysql_error());

$data = array();
while($row = mysql_fetch_assoc($res)){
	$data[] = $row;
}

echo $data[1]['cname']. ' - ' . $data[1]['city'];

?>

<table border="1">
<?php foreach($data as $item) : ?>
<tr>
	<td><?=$item['cnum']?></td>
	<td><?=$item['cname']?></td>
	<td><?=$item['city']?></td>
	<td><?=$item['rating']?></td>
	<td><?=$item['snum']?></td>
	<td><?=$item['text']?></td>
</tr>
<?php endforeach; ?>
</table>