<?php 

@mysql_connect("localhost", "root", "") or die("��� ���������� � ��������");
mysql_query("SET NAMES 'cp1251'") or die("�� ����������� ��������� ����������");
mysql_select_db("sql") or die("�� ������� ��");
/*
$query = "INSERT INTO customers(cname, city, rating, snum, text) VALUES ('���� ������', '������', 150, 1002, '�����-�� �����')";
mysql_query($query);
if(mysql_affected_rows()){
	echo '<p>������ ���������</p>';
}else{
	echo '<p>������</p>';
}

$query = "UPDATE customers SET cname='John Doe', city='LA' WHERE cnum=2013";
mysql_query($query);
if(mysql_affected_rows()){
	echo '<p>������ ���������</p>';
}else{
	echo '<p>������</p>';
}
*/
$query = "DELETE FROM customers WHERE cnum > 2010";
mysql_query($query);
if(mysql_affected_rows()){
	echo '<p>������ �������</p>';
}else{
	echo '<p>������ �� �������</p>';
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