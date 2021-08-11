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
--17
SELECT sname, city FROM salers WHERE city = 'London' OR city = 'New York';

--18 IN()
SELECT sname, city FROM salers WHERE city IN ('London', 'New York', 'Barcelona');

--19 IN() В поле SALERS задаем те имена которые хочем найти 
SELECT sname, city, comm FROM salers WHERE comm IN (0.11, 0.12, 0.13, 0.15);

--20 задает диапозон BETWEEN
SELECT * FROM salers WHERE comm BETWEEN 0.11 AND 0.15;

--21 
SELECT * FROM salers WHERE (comm BETWEEN 0.11 AND 0.15) AND comm NOT IN(0.11, 0.15);

--22
SELECT * FROM salers WHERE sname BETWEEN 'A' AND 'D';

--23
SELECT * FROM salers WHERE sname IS NULL;

--24
SELECT * FROM salers WHERE sname IS NOT NULL;

--25 Поиск с атрибутам (%-строка любой длины)
SELECT * FROM salers WHERE sname LIKE 'Mot%';

--26
SELECT * FROM salers WHERE sname LIKE '%kin';

--27 Атрибут '_' - любой одиночный символ
SELECT * FROM salers WHERE sname LIKE 'P__l';

--28 икранируем
SELECT * FROM salers WHERE sname LIKE '\_';

--29
SELECT * FROM salers WHERE sname LIKE '\%';

--30
SELECT * FROM salers WHERE sname LIKE 'd\'Artanian';

--31
SELECT * FROM salers WHERE sname LIKE '%fk%';

--32
SELECT * FROM salers WHERE sname NOT LIKE '%fk%';

--1
SELECT * FROM orders WHERE odate BETWEEN '1990.04.10' AND '1990.06.10';
--2
SELECT * FROM customers WHERE snum IN(1001, 1003);
--3
SELECT * FROM customers WHERE cname BETWEEN 'A' AND 'G';
--4
SELECT * FROM customers WHERE cname LIKE 'C%';
--5
SELECT * FROM customers WHERE cname LIKE 'D%n';
--6
SELECT * FROM customers WHERE cname BETWEEN 'D' and 'n';
--7

//++++++++++++++++++++++++++++++++++++++++++LESSON-4++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++LESSON-5++++++++++++++++++++++++++++++++
--33 Количество
SELECT COUNT(sname) FROM salers;

--34
SELECT COUNT(city) FROM salers;

--35
SELECT COUNT(*) FROM salers;

--36 
SELECT COUNT(*) as res FROM salers;

--37 СУММА 
SELECT SUM(amt) as sum FROM orders;

--38 Среднее значение
SELECT AVG(amt) as res FROM orders;

--39 минимальное число
SELECT MIN(amt) as res FROM orders;

--40 максимальное значение
SELECT MAX(amt) as res FROM orders;

--41
SELECT MAX(sname) as MAX FROM salers;

--42 Выбрать максимальный элемент из номеров (1007)
SELECT snum, MAX(amt) FROM orders WHERE snum = 1007;

--43 GROUP BY  отсортировать 
SELECT snum, MAX(amt) FROM orders GROUP BY snum;

--44
SELECT snum, MAX(amt) AS res FROM orders GROUP BY snum HAVING COUNT(snum) > 2;

--45 выбрать максимальное число где в поле res > 2000
SELECT snum, MAX(amt) AS res FROM orders GROUP BY snum HAVING res > 2000; 



//++++++++++++++++++++++++++++++++++++++++++LESSON-5++++++++++++++++++++++++++++++++


//++++++++++++++++++++++++++++++++++++++++++LESSON-6++++++++++++++++++++++++++++++++
--46
SELECT sname, comm FROM salers;

+------------+------+
| sname      | comm |
+------------+------+
| Peel       | 0.12 |
| Serres     | 0.13 |
| Motika     | 0.11 |
| Rifkin     | 0.15 |
| Axelrod    | 0.10 |
| NULL       | 0.15 |
| d Artanian | 0.10 |
| Sifkin     | 0.17 |
+------------+------+


--47
SELECT sname, comm*100 FROM salers;
+------------+----------+
| sname      | comm*100 |
+------------+----------+
| Peel       |    12.00 |
| Serres     |    13.00 |
| Motika     |    11.00 |
| Rifkin     |    15.00 |
| Axelrod    |    10.00 |
| NULL       |    15.00 |
| d Artanian |    10.00 |
| Sifkin     |    17.00 |
+------------+----------+

--48
SELECT sname, comm*100, '%' FROM salers;
+------------+----------+---+
| sname      | comm*100 | % |
+------------+----------+---+
| Peel       |    12.00 | % |
| Serres     |    13.00 | % |
| Motika     |    11.00 | % |
| Rifkin     |    15.00 | % |
| Axelrod    |    10.00 | % |
| NULL       |    15.00 | % |
| d Artanian |    10.00 | % |
| Sifkin     |    17.00 | % |
+------------+----------+---+

--49 отсортировать 
SELECT * FROM orders ORDER BY onum;

--50 отсортировать по убыванию
SELECT * FROM orders ORDER BY onum DESC;

--51 отсортировать по возрастанию
SELECT * FROM orders ORDER BY onum ASC;

--52 
SELECT snum, amt, odate FROM orders ORDER BY snum, amt;

--53
SELECT snum, amt, odate FROM orders ORDER BY snum DESC, amt DESC;

--54 GROUP BY группировать элементы
SELECT snum, MAX(amt), odate FROM orders GROUP BY snum;

--55
SELECT snum, MAX(amt), odate FROM orders GROUP BY snum ORDER BY 3;

--56 LIMIT - лимит выбора строк
SELECT * FROM salers LIMIT 2;

--57
SELECT * FROM salers LIMIT 0, 3;

--58
SELECT * FROM salers ORDER BY snum DESC LIMIT 1;

--59
SELECT sname, cname FROM salers, customers;

--60
SELECT salers.sname, customers.cname, salers.city FROM salers, customers;

--61
SELECT salers.sname, customers.cname, salers.city FROM salers, customers WHERE salers.snum = customers.snum;

--62
SELECT salers.sname, customers.cname, salers.city FROM salers, customers WHERE salers.snum = customers.snum ORDER BY salers.sname;

--63
SELECT s.sname, c.cname, s.city FROM salers s, customers c WHERE s.snum = c.snum ORDER BY s.sname;
 










//++++++++++++++++++++++++++++++++++++++++++LESSON-6++++++++++++++++++++++++++++++++

