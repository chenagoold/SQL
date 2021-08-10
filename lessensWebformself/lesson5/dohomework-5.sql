-- 1. Получите среднее значение поля amt (таблица orders), не используя при этом функцию AVG.
--Результат должен быть получен одним запросом
SELECT ((SELECT SUM(amt) FROM orders) / (SELECT count(amt) FROM orders)) AS result;


-- 2. Получить сумму всех продаж с индефикатором 1007.
SELECT SUM(amt) AS SUM FROM orders WHERE snum = 1007;
SELECT SUM(amt) AS SUM FROM orders GROUP BY snum HAVING snum = 1007;

-- 3. Получить список городов (без повторов) и максимальный рейтинг для каждого из них из таблицы customers
SELECT city, MAX(rating) FROM customers GROUP BY;

-- 4. Получить список городов (без повторов) и минимальный рейтинг для каждого из них из таблицы customers
SELECT city, MIN(rating) FROM customers GROUP BY;


