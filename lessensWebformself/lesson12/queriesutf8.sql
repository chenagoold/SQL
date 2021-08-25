-- JOIN
-- INNER JOIN
-- LEFT OUTER JOIN
-- RIGHT OUTER JOIN
-- !FULL OUTER JOIN!
-- CROSS JOIN
-- UNION UNION - это объединение множеств одинаковых кортежей, JOIN - создание нового множества кортежей на основе исходных множеств
-- Внимание: если не используется ключевое слово ALL для UNION, все возвращенные строки будут уникальными, 
--так как по умолчанию подразумевается DISTINCT, который удаляет неуникальные значения.

Чтобы отменить такое поведение - нужно указать ключевое слово ALL, вот так: UNION ALL. 
-- 1
SELECT * FROM salers INNER JOIN customers ON customers.snum = salers.snum;

-- 2
SELECT * FROM salers JOIN customers ON customers.snum = salers.snum;

-- 3
SELECT s.sname, c.cname, s.city FROM salers s INNER JOIN customers c ON c.snum = s.snum;

-- 4
SELECT s.sname, c.cname, s.city FROM salers s, customers c WHERE c.snum = s.snum; 

-- 5
SELECT s.sname, c.cname, s.city FROM salers s INNER JOIN customers c ON c.snum = s.snum WHERE s.city = 'London';

-- 6
SELECT s.sname, c.cname, s.city FROM salers s LEFT OUTER JOIN customers c ON c.snum = s.snum;

-- 7
SELECT s.sname, c.cname, s.city FROM salers s RIGHT OUTER JOIN customers c ON c.snum = s.snum;

-- 8 ERROR!
SELECT s.sname, c.cname, s.city FROM salers s FULL OUTER JOIN customers c ON c.snum = s.snum;

-- 9
SELECT s.sname, c.cname, s.city FROM salers s LEFT OUTER JOIN customers c ON c.snum = s.snum
UNION
SELECT s.sname, c.cname, s.city FROM salers s RIGHT OUTER JOIN customers c ON c.snum = s.snum;

-- 10
SELECT s.sname, c.cname, s.city FROM salers s CROSS JOIN customers c;

-- 11 Полнотекстовый поиск
SELECT * FROM customers WHERE MATCH (text) AGAINST ('test');

-- 12 Полнотекстовый поиск в режиме естественного языка (NATURAL LANGUAGE MODE) морфология не поддерживается
SELECT * FROM customers WHERE MATCH (text) AGAINST ('программирование');

-- 13 Полнотекстовый поиск... в режиме NATURAL LANGUAGE MODE имеется порог шумовых слов = 50%
SELECT * FROM customers WHERE MATCH (text) AGAINST ('mysql');

-- 14
SELECT * FROM customers WHERE MATCH (text) AGAINST ('php' IN NATURAL LANGUAGE MODE);

-- 15 Полнотекстовый поиск в булевом режиме (BOOLEAN MODE) поддерживается морфология
SELECT * FROM customers WHERE MATCH (text) AGAINST ('программ*' IN BOOLEAN MODE);

-- 16
SELECT * FROM customers WHERE MATCH (text) AGAINST ('+php -mysql' IN BOOLEAN MODE);

--17
SELECT * FROM имя_таблицы1 WHERE условие
	UNION SELECT * FROM имя_таблицы2 WHERE условие;

--18
SELECT * FROM имя_таблицы1 WHERE условие
	UNION SELECT * FROM имя_таблицы2 WHERE условие
	UNION SELECT * FROM имя_таблицы3 WHERE условие
	UNION SELECT * FROM имя_таблицы4 WHERE условие

--19
SELECT id, name FROM countries UNION ALL SELECT id, name FROM cities;

--20
