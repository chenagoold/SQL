-- Используя внутреннее объединение в результирующей таблице получите имена продавцов и соответствующие им имена их клиентов, суммы их продаж и город... подсказка: для получения результата необходимо производить двойное объединение - объединение продавцов с клиентами на основе поля snum и второе объединение заказов с клиентами на основе поля cnum... результат должен быть представлен одним запросом
SELECT s.sname, c.cname, o.amt, s.city FROM salers s
	INNER JOIN customers c ON c.snum = s.snum
	INNER JOIN orders o ON o.cnum = c.cnum;