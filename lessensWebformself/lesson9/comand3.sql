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

--44 HAVING групирует
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

//++++++++++++++++++++++++++++++++++++++++++LESSON-7++++++++++++++++++++++++++++++++
--64
SELECT CONCAT(sname, city) FROM salers;
+-----------------+
| res             |
+-----------------+
| PeelLondon      |
| SerresSan Joes  |
| MotikaLondon    |
| RifkinBarcelona |
| AxelrodNew Your |
| NULL            |
| dArtanianParis  |
| SifkinSan Joes  |
+-----------------+


--65
SELECT CONCAT(sname, ' ', city) AS res FROM salers;
+------------------+
| res              |
+------------------+
| Peel London      |
| Serres San Joes  |
| Motika London    |
| Rifkin Barcelona |
| Axelrod New Your |
| NULL             |
| dArtanian  Paris |
| Sifkin San Joes  |
+------------------+

--66 первый аргумент это разделитель между столбцами
SELECT CONCAT_WS(' ', sname, city) AS res FROM salers;

--67 возвращает длину строки в байтах, 
SELECT sname, CHAR_LENGTH(sname) FROM salers;
+------------+---------------+
| sname      | LENGTH(sname) |
+------------+---------------+
| Peel       |             4 |
| Serres     |             6 |
| Motika     |             6 |
| Rifkin     |             6 |
| Axelrod    |             7 |
| NULL       |          NULL |
| dArtanian  |            10 |
| Sifkin     |             6 |
+------------+---------------+

--68 возвращает кол-во символов
SELECT sname, CHAR_LENGTH(sname) FROM salers;

--69 возвращает кол-во символов
SELECT sname, CHARACTER_LENGTH(sname) FROM salers;

--70
SELECT * FROM salers WHERE CHAR_LENGTH(sname) <= 6;
SELECT sname, city, comm, CHAR_LENGTH(sname) FROM salers WHERE CHAR_LENGTH(sname) <= 6;
+--------+-----------+------+--------------------+
| sname  | city      | comm | CHAR_LENGTH(sname) |
+--------+-----------+------+--------------------+
| Peel   | London    | 0.12 |                  4 |
| Serres | San Joes  | 0.13 |                  6 |
| Motika | London    | 0.11 |                  6 |
| Rifkin | Barcelona | 0.15 |                  6 |
| Sifkin | San Joes  | 0.17 |                  6 |
+--------+-----------+------+--------------------+

--71 Возращает позицию первого вхождения подстроки
SELECT * FROM salers WHERE LOCATE('kin', sname);

--72
SELECT * FROM salers WHERE LOCATE('\'', sname);

--73 Возвращает крайние слева len символов из строки
SELECT odate, LEFT(odate, 7) FROM orders;

--74 c права
SELECT odate RIGHT(odate, 5) FROM orders;

--75
SELECT odate, SUBSTRING(odate, 6) FROM orders;
+------------+---------------------+
| odate      | SUBSTRING(odate, 6) |
+------------+---------------------+
| 1990-03-10 | 03-10               |
| 1990-03-10 | 03-10               |
| 1990-03-10 | 03-10               |
| 1990-03-10 | 03-10               |
| 1990-04-10 | 04-10               |
| 1990-06-10 | 06-10               |
| 1990-06-10 | 06-10               |
| 1990-04-10 | 04-10               |
| 1990-04-10 | 04-10               |
| 1990-05-10 | 05-10               |
+------------+---------------------+

--76
SELECT odate, SUBSTRING(odate, 1,7) FROM orders;
+------------+----------------------+
| odate      | SUBSTRING(odate,1,7) |
+------------+----------------------+
| 1990-03-10 | 1990-03              |
| 1990-03-10 | 1990-03              |
| 1990-03-10 | 1990-03              |
| 1990-03-10 | 1990-03              |
| 1990-04-10 | 1990-04              |
| 1990-06-10 | 1990-06              |
| 1990-06-10 | 1990-06              |
| 1990-04-10 | 1990-04              |
| 1990-04-10 | 1990-04              |
| 1990-05-10 | 1990-05              |
+------------+----------------------+

--77
SELECT odate, SUBSTRING_INDEX(odate, '-', 2) FROM orders;

--78 Возвращает строку str c удаленным начальными пробелами
SELECT LTRIM('string  ');

--79
SELECT RTRIM('  string');

--80
SELECT LTRIM(RTRIM('   string')) AS res;

--81
SELECT TRIM(LEADING '1990-' FROM odate) FROM orders;
+----------------------------------+
| TRIM(LEADING '1990-' FROM odate) |
+----------------------------------+
| 03-10                            |
| 03-10                            |
| 03-10                            |
| 03-10                            |
| 04-10                            |
| 06-10                            |
| 06-10                            |
| 04-10                            |
| 04-10                            |
| 05-10                            |
+----------------------------------+


--82
SELECT TRIM(TRAILING '10' FROM odate) FROM orders;
+--------------------------------+
| TRIM(TRAILING '10' FROM odate) |
+--------------------------------+
| 1990-03-                       |
| 1990-03-                       |
| 1990-03-                       |
| 1990-03-                       |
| 1990-04-                       |
| 1990-06-                       |
| 1990-06-                       |
| 1990-04-                       |
| 1990-04-                       |
| 1990-05-                       |
+--------------------------------+

--83
SELECT TRIM(BOTH 'xx' FROM 'xxbarxx');
+---------------------------+
| TRIM('xx' FROM 'xxbarxx') |
+---------------------------+
| bar                       |
+---------------------------+

--84
SELECT comm, REPLACE(comm, '0.', '') AS res FROM salers;
+------+------+
| comm | res  |
+------+------+
| 0.12 | 12   |
| 0.13 | 13   |
| 0.11 | 11   |
| 0.15 | 15   |
| 0.10 | 10   |
| 0.15 | 15   |
| 0.10 | 10   |
| 0.17 | 17   |
+------+------+

--85нижний регистер
SELECT LOWER(sname) FROM salers;

--86 нижний регистор
SELECT LCASE(sname) FROM salers;

--87 верхний регистер
SELECT UPPER(sname) FROM salers;

--88 верхний регистер
SELECT UCASE(sname) FROM salers;


//++++++++++++++++++++++++++++++++++++++++++LESSON-7++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++LESSON-8++++++++++++++++++++++++++++++++
--89
SELECT 'a' REGEXP 'a'; --1
--90
SELECT 'a' REGEXP 'b'; --0

--91 от a до z в словах в этом диапозоне где есть буквы находим их
SELECT * FROM salers WHERE sname REGEXP '[a-z]';

--92 русские буквы
SELECT * FROM salers WHERE sname REGEXP '[а-я]';

--93 где начинается на '^S'
SELECT * FROM salers WHERE sname REGEXP '^S';

--94 имена которые закнчиваются на букву 'n$'
SELECT * FROM salers WHERE sname REGEXP 'n$';

--95 Точка любой символ кроме '^r' в начале
SELECT * FROM salers WHERE sname REGEXP '^[^r].*';


--96 Проверим от начала до конца на наличии буквы '^r' если есть не выводим
SELECT * FROM salers WHERE sname REGEXP '^[^r]*$';

--97 Провери на количество в слове букв (2)
SELECT * FROM salers WHERE sname REGEXP '[r]{2}';

--98 Найдем значения где есть опостроф (')
SELECT * FROM salers WHERE sname REGEXP '\'';

--99 Провери на количество в слове букв (2)
SELECT * FROM salers WHERE sname REGEXP '(r){2}';

--100 Найти сочетание букв 
SELECT * FROM salers WHERE sname REGEXP '(rr)';

--101 функция ABS() меняет отрицательное число на положительное
SELECT comm, ABS(comm) AS res FROM salers; 

--102 
SELECT SIGN(comm) AS res FROM salers;

--103
SELECT * FROM salers WHERE SIGN(comm) = -1;

--104
SELECT MOD(5,2);

--105
SELECT comm, FLOOR(comm) FROM salers;

--106
SELECT comm, CEIL(comm) FROM salers;

--107 округляем
SELECT ROUND(2.6);

--108
SELECT comm, ROUND(comm, 1) FROM salers;

--109
SELECT comm, ROUND(comm, 0) FROM salers;

--110
SELECT POW(3,2)

--111
SELECT SQRT(9)

--112
SELECT * FROM salers ORDER BY RAND() LIMIT 1;

--113
SELECT * FROM salers ORDER BY RAND() LIMIT 1;

--114 показать количество после запятой
SELECT comm, TRUNCATE(comm, 1) FROM salers;

--115
SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2021-08-13 09:13:34 |
+---------------------+

--116
SELECT SYSDATE();

--117
SELECT CURRENT_TIMESTAMP();

--118
SELECT NOW() + 0;
+----------------+
| NOW() + 0      |
+----------------+
| 20210813092721 |
+----------------+

--119
SELECT NOW(), SLEEP(2), NOW();
+---------------------+----------+---------------------+
| NOW()               | SLEEP(2) | NOW()               |
+---------------------+----------+---------------------+
| 2021-08-13 09:28:59 |        0 | 2021-08-13 09:28:59 |
+---------------------+----------+---------------------+

--120
SELECT SYSDATE(), SLEEP(2), SYSDATE()


--121
SELECT CURDATE();

--122
SELECT CURTIME();

--123
SELECT odate, DAYFWEEK(odate) FROM orders;

--124
SELECT odate, DAYOFWEEK(NOW());

--125
SELECT odate, MONTH(odate) FROM orders;
+------------+--------------+
| odate      | MONTH(odate) |
+------------+--------------+
| 1990-03-10 |            3 |
| 1990-03-10 |            3 |
| 1990-03-10 |            3 |


--126
SELECT DAYNAME(NOW());
+----------------+
| DAYNAME(NOW()) |
+----------------+
| Friday         |
+----------------+

--127
SELECT @@lc_time_names;
+-----------------+
| @@lc_time_names |
+-----------------+
| en_US           |
+-----------------+

--128 установка временной зоны
SET lc_time_names = 'ru_Ru';

--129 
SELECT MONTHNAME(NOW());
+------------------+
| MONTHNAME(NOW()) |
+------------------+
| Августа          |
+------------------+

--130
SELECT DAY(NOW()), MONTHNAME(NOW());
+------------+------------------+
| DAY(NOW()) | MONTHNAME(NOW()) |
+------------+------------------+
|         13 | Августа          |
+------------+------------------+

--131
SELECT CONCAT_WS(' ', DAY(NOW()), MONTHNAME(NOW())) AS date;
+-------------------+
| date              |
+-------------------+
| 13 Августа        | 
+-------------------+

--132 возращает номер квартала для function NOW()
SELECT QUARTER(NOW());

--133
SELECT odate, YEAR(odate) FROM orders;
+------------+-------------+
| odate      | YEAR(odate) |
+------------+-------------+
| 1990-03-10 |        1990 |
| 1990-03-10 |        1990 |

--134 возвращает часы даты
SELECT NOW(), HOUR(NOW());

--125 возвращает минуты даты
SELECT NOW(), MINUTE(NOW());

--126 возвращает секунды даты
SELECT NOW(), SECOND(NOW());

--127
SELECT NOW(), DATE_FORMAT(NOW(), '%e/%m/%Y');
+---------------------+--------------------------------+
| NOW()               | DATE_FORMAT(NOW(), '%e/%m/%Y') |
+---------------------+--------------------------------+
| 2021-08-16 04:26:01 | 16/08/2021                     |
+---------------------+--------------------------------+

--128
SELECT NOW(), DATE_FORMAT(NOW(), '%e/%M/%Y');
+---------------------+--------------------------------+
| NOW()               | DATE_FORMAT(NOW(), '%e/%M/%Y') |
+---------------------+--------------------------------+
| 2021-08-16 04:27:51 | 16/Августа/2021                |
+---------------------+--------------------------------+

--129
SELECT PERIOD_ADD(DATE_FORMAT(NOW(), '%Y%m'), 2);
+------------------------------------------+
| PERIOD_ADD(DATE_FORMAT(NOW(), '%Y%m'),2) |
+------------------------------------------+
|                                   202110 |
+------------------------------------------+

--130 Добавление N месяцев к периоду M
SELECT PERIOD_ADD(201203, 2);

--131 Возвращает колиество месяцев между N и M месяцев 
SELECT PERIOD_DIFF(201205, 201203);

--132
SELECT NOW(), ADDDATE(NOW(), INTERVAL 1 SECOND);
+---------------------+-----------------------------------+
| NOW()               | ADDDATE(NOW(), INTERVAL 5 SECOND) |
+---------------------+-----------------------------------+
| 2021-08-16 05:24:03 | 2021-08-16 05:24:08               |
+---------------------+-----------------------------------+


--133
SELECT NOW(), ADDDATE(NOW(), INTERVAL 1 MINUTE);


--134
SELECT NOW(), ADDDATE(NOW(), INTERVAL '2:5' DAY_HOUR);
+---------------------+-----------------------------------------+
| NOW()               | ADDDATE(NOW(), INTERVAL '2:5' DAY_HOUR) |
+---------------------+-----------------------------------------+
| 2021-08-16 05:43:47 | 2021-08-18 10:43:47                     |
+---------------------+-----------------------------------------+

--135
SELECT NOW(), NOW() + INTERVAL 1 HOUR;
+---------------------+-------------------------+
| NOW()               | NOW() + INTERVAL 1 HOUR |
+---------------------+-------------------------+
| 2021-08-16 05:46:50 | 2021-08-16 06:46:50     |
+---------------------+-------------------------+

--136
SELECT NOW(), SUBDATE(NOW(), INTERVAL 2 HOUR);
+---------------------+---------------------------------+
| NOW()               | SUBDATE(NOW(), INTERVAL 2 HOUR) |
+---------------------+---------------------------------+
| 2021-08-16 05:48:45 | 2021-08-16 03:48:45             |
+---------------------+---------------------------------+


--137
SELECT NOW(), ADDDATE(NOW(), 10);

--138
SELECT NOW(), SUBDATE(NOW(), 10);

--139
SELECT NOW(), EXTRACT(MINUTE FROM NOW());
+---------------------+----------------------------+
| NOW()               | EXTRACT(MINUTE FROM NOW()) |
+---------------------+----------------------------+
| 2021-08-16 07:48:01 |                         48 |
+---------------------+----------------------------+

--140
SELECT NOW(), TIME_FORMAT(NOW(), '%H:%i');
+---------------------+-----------------------------+
| NOW()               | TIME_FORMAT(NOW(), '%H:%i') |
+---------------------+-----------------------------+
| 2021-08-16 07:50:28 | 07:50                       |
+---------------------+-----------------------------+

--141
SELECT SEC_TO_TIME(60);
+-----------------+
| SEC_TO_TIME(60) |
+-----------------+
| 00:01:00        |
+-----------------+

--142
SELECT TIME_TO_SEC('1:00:00');
+------------------------+
| TIME_TO_SEC('1:00:00') |
+------------------------+
|                   3600 |
+------------------------+

--143
SELECT NOW(), DATE(NOW());
+---------------------+-------------+
| NOW()               | DATE(NOW()) |
+---------------------+-------------+
| 2021-08-16 07:54:37 | 2021-08-16  |
+---------------------+-------------+

--144
SELECT NOW(), TIME(NOW());
+---------------------+-------------+
| NOW()               | TIME(NOW()) |
+---------------------+-------------+
| 2021-08-16 07:55:24 | 07:55:24    |
+---------------------+-------------+

//++++++++++++++++++++++++++++++++++++++++++LESSON-9++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++LESSON-10++++++++++++++++++++++++++++++++
-- 145 Объединение таблицы с собой... получаем пары заказчиков с одинаковыми рейтингами
SELECT f.cname, s.cname, f.rating FROM customers f, customers s WHERE f.rating = s.rating;

-- 146 Объединение таблицы с собой... получаем пары заказчиков с одинаковыми рейтингами - устраняем избыточность
SELECT f.cname, s.cname, f.rating FROM customers f, customers s WHERE f.rating = s.rating AND f.cname > s.cname;

--147 Объединение таблицы с собой... выбор нескольких продавцов в 1 городе
SELECT f.cname, s.cname, f.rating FROM customers f, customers s WHERE f.city = s.city AND f.cname < s.cname;

--148 Выборка всех клиентов продавца
SELECT cname, snum FROM customers WHERE snum = (SELECT snum FROM salers WHERE sname = 'Peel');

--149 Запрос, возвращающий ошибку, поскольку результатом подзапроса есть множество
SELECT * FROM orders WHERE snum = (SELECT snum FROM salers WHERE city = 'London');

--150 Тот же запрос, но без ошибки
SELECT * FROM orders WHERE snum IN(SELECT snum FROM salers WHERE city = 'London');

--151 Выборка продавцов с более чем 1 клиентом
SELECT snum, sname FROM salers WHERE snum IN(SELECT snum FROM customers GROUP BY snum HAVING COUNT(snum) > 1);

--152 ВЫбор продовцов без клиентов
SELECT snum, sname FROM salers WHERE snum NOT IN(SELECT snum FROM customers);

--153 Соотнесенный подзапрос... выборка всех клиентов за апрель
SELECT * FROM customers c WHERE '1990-04-10' IN(SELECT odate FROM orders o WHERE c.cnum = o.cnum);

--154 Тот же результат, но с объединением таблиц на основе справочной целостности
SELECT o.cnum, c.name, c.city, c.rating, s.snum FROM orders o, customers c WHERE o.cnum = c.cnum AND odate = '1990-04-10';




//++++++++++++++++++++++++++++++++++++++++++LESSON-10++++++++++++++++++++++++++++++++

