-- 1. Напишите запрос, который выберет все ряды из таблицы заказов (orders) за март и апрель
SELECT * FROM orders WHERE odate IN('1990-03-10','1990-04-10');

-- 2. Выберите всех клиентов (таблица customer) продавцов Peel и Motika.
SELECT snum FROM salers WHERE sname IN('Peel', 'Motika');
SELECT cname FROM customers WHERE snum IN(1001, 1004);
SELECT cname FROM customers WHERE snum IN(SELECT snum FROM salers WHERE sname IN('Peel','Motika'));


-- 3. Составте запрос, который выведет всех клиентов, чьи имена находятся в диапазоне A-G
SELECT cname FROM customers WHERE cname BETWEEN 'A' AND 'H';

-- 4. Выберите всех представителей, чьи имена начинаются с латинской литеры "C".
SELECT sname FROM salers WHERE sname LIKE 'C%';

-- 5. Выберите все представителей, чьи имена начинаются с латинской литеру "D" и при этом заканчиваются на "n"
SELECT sname FROM salers WHERE sname LIKE 'D%' AND sname LIKE'$n';
SELECT sname FRoM salers WHERE sname LIKE 'D%n';

-- 6. Выберите всех представителей, чьи имена начинаются на латинскую литеру "n", но не начинаются на латинскую литеру
SELECT sname FROM salers WHERE sname LIKE 'n%' AND sname NOT LIKE 'D%';

-- 7.Выберите все ряды с NULL-значениям из таблицы продавцов.
SELECT * FROM salers WHERE sname IS NULL;