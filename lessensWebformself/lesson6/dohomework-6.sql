-- 1. Выберите все заказы за 1990-03-10 из таблицы orders, упорядочив их по сумме в порядке возрастания
SELECT * FROM orders WHERE odate = '1990-03-10' ORDER BY amt ASC; 


-- 2. ВЫберите два последних заказа из таблицы orders
SELECT * FROM orders LIMIT 8, 9;

-- 3. Получите имена клиентов, рейтинг которых больше 200, город их проживания, а также имена продавцов, к кторым
-- относятся указанные клиенты.Используйте псевдонимы таблиц
SELECT c.name, c.rating, c.city s.sname FROM customers c, salers s WHERE rating > 200 AND c.snum = s.snum;

-- 4. Выберите имена продавцов (таблица salers), сумму каждой продажи прдавцов (таблица orders) и подсчитанную
--сумму комиссионных с каждой конкретной продажи. Вывод сопроводите пояснениями, чтобы каждый ряд таблицы имел 
--следующий вид: 
SELECT 'Продавец:', s.sname, 'Сумму Продажи:', o.amt, 'Размер комиссонных:,', s.comm * o.amt FROM salers s, orders 0
WHERE s.snum = o.snum;


