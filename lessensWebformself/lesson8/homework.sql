-- 1 Из таблицы orders выберите все суммы до 1000. Используйте функцию REGEXP. Постарайтесь получить результат, используя 2 разных шаблона.
SELECT amt FROM orders WHERE amt REGEXP '^[0-9]{1,3}\.[0-9]{1,2}$';
SELECT amt FROM orders WHERE amt REGEXP '^.{1,6}$';

-- 2 Из таблицы salers выберите все города, состоящие из двух слов.
SELECT city FROM salers WHERE city REGEXP ' ';

-- 3 Из таблицы salers получите все ряды, где имена продавцов и названия городов не превышают 6 символов
SELECT * FROM salers WHERE sname REGEXP '^.{1,6}$' AND city REGEXP '^.{1,6}$';

-- 4 Получите из таблицы orders все суммы без дробной части (с округлением)
SELECT amt, ROUND(amt, 0) FROM orders;

-- 5 Получите из таблицы orders все суммы без дробной части (без округления)
SELECT amt, TRUNCATE(amt, 0) FROM orders;