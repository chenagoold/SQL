//создание БД 
CREATE DATABASE `sql` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

//просмотр БД
show databases;

//создание таблиц в БД
CREATE TABLE orders (
	onum INT(11) NOT NULL,
	amt DECIMAL(6,2) NOT NULL,
	odate DATE NOT NULL,
	cnum INT(11) NOT NULL,
	snum INT(11) NOT NULL,
	PRIMARY KEY(onum)
) ENGINE=MyISAM;


//++++++++++++++++++++++++++++++++++++++++++LESSON-2++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++LESSON-2++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++LESSON-3++++++++++++++++++++++++++++++++
--1 выбрать из таблицы все `orders`-правильнее будет
SELECT * FROM orders;

--2 в каком порядке выбираем поля в таком они сартируются из таблицы БД
SELECT onum, cnum, snum, amt, odate FROM orders;

--3
SELECT amt, odate FROM orders;

--4 убираем дублирующие поля
SELECT DISTINCT odate FROM orders;

--5 Нужно выбрать все поля где дата =  1990-03-10
SELECT * FROM orders WHERE odate = '1990-03-10'; or '19900310' or '1990#03#10' or '1990.03.10'

--6
SELECT cname, city FROM customers WHERE rating = 200;

--7 кодировка соидинения БД
SET NAMES cp866;

-- Реаляционные операторы или операторы сравнения
-- "=" равенство
-- ">" Больше чем
-- "<" меньше чем
-- ">=" больше или равно
-- "<=" меньше или равно
-- "<>" "!=" неравенство

--8
SELECT amt FROM orders WHERE amt > 1000;

--9 Выбрать поля где не равно городу London
SELECT sname, city FROM salers WHERE city <> 'London';

--10
SELECT sname, city FROM salers WHERE city > 'Motika';

-- AND (И), OR (ИЛИ), NOT (НЕ)

--11
SELECT * FROM orders WHERE amt > 1000 AND odate = '1990-06.1000';

--12
SELECT * FROM orders WHERE amt > 1000 AND amt < 4000;

--13
SELECT * FROM salers WHERE city = 'London' AND comm > 0.11;

--14 Выбрать все поля из таблицы где город не Лондон;
SELECT * FROM customers WHERE NOT city = 'London';

--15
SELECT * FROM orders
        WHERE NOT ((odate = '10-03-1990' AND snum > 1002) OR amt > 2000.00);

+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3003 |  767.19 | 1990-03-10 | 2001 | 1001 |
| 3006 | 1098.16 | 1990-04-10 | 2008 | 1007 |
| 3010 | 1309.95 | 1990-06-10 | 2004 | 1002 |
| 3009 | 1713.23 | 1990-04-10 | 2004 | 1002 |
| 3007 |   75.75 | 1990-04-10 | 2004 | 1002 |
+------+---------+------------+------+------+
5 rows in set (0.001 sec)

--16

//++++++++++++++++++++++++++++++++++++++++++LESSON-3++++++++++++++++++++++++++++++++


//++++++++++++++++++++++++++++++++++++++++++LESSON-4++++++++++++++++++++++++++++++++







//++++++++++++++++++++++++++++++++++++++++++LESSON-4++++++++++++++++++++++++++++++++
