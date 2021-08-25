
SQL условие EXISTS
В этом учебном материале вы узнаете, как использовать SQL условие EXISTS с синтаксисом и примерами.
Описание
SQL условие EXISTS используется в сочетании с подзапросом и считается выполненным, 
если подзапрос возвращает хотя бы одну строку. 
Его можно использовать в операторе SELECT, INSERT, UPDATE или DELETE.

-- Выборка из таблицы продавцов только в случае, если есть клиенты с рейтингом больше 100 TRUE
SELECT * FROM salers WHERE EXISTS (
	SELECT * FROM customers WHERE rating > 100
);

-- FALSE
SELECT * FROM salers WHERE EXISTS (
	SELECT * FROM customers WHERE rating < 100
);

-- Выборка продавцов из Сан-Хосе только в том случае, если есть клиенты с рейтингом больше 100 TRUE
 

-- FALSE
SELECT * FROM salers WHERE city = 'San Jose' AND EXISTS (
	SELECT cnum FROM customers WHERE rating > 400
);

-- EXISTS с соотнесенным подзапросом... получаем продавцов, у которых есть клиенты
SELECT * FROM salers s WHERE EXISTS (
	SELECT * FROM customers c WHERE s.snum = c.snum
);

-- EXISTS с соотнесенным подзапросом... получаем продавцов без клиентов
SELECT snum, sname FROM salers s WHERE NOT EXISTS (
	SELECT cnum FROM customers c WHERE s.snum = c.snum
);

-- UNION выборка продавцов и клиентов
SELECT snum, sname FROM salers
UNION
SELECT cnum, cname FROM customers;

-- количество полей в запросах должно совпадать... ERROR!
SELECT snum, sname, city FROM salers
UNION
SELECT cnum, cname FROM customers;

-- дубликаты значений опускаются
SELECT snum, city FROM salers
UNION
SELECT snum, city FROM customers;

-- включение дубликатов
SELECT snum, city FROM salers
UNION ALL
SELECT snum, city FROM customers;
