-- 1 Получите идентификатор клиента, имя клиента, сумму и дату совершения им покупки
SELECT c.snum, c.cname, o.amt, o.odate FROM customers c, orders o WHERE c.snum =  o.snum;

-- 2 Выберите идентификаторы и имена продавцов, имеющих только по 1 клиенту
SELECT snum, sname FROM salers WHERE snum IN (
	SELECT snum FROM customers GROUP BY snum HAVING COUNT(snum) = 1);
-- 3 Получите идентификатор и имя продавца, совершившего максимальную продажу
SELECT snum, sname FROM salers WHERE snum = (
	SELECT snum FROM orders WHERE amt = (
		SELECT MAX(amt) FROM orders
	));
-- 4 Получите идентификатор и имя продавца, совершившего наименьшую продажу
SELECT snum, sname FROM salers WHERE snum = (
	SELECT snum FROM orders WHERE amt = (
		SELECT MIN(amt) FROM orders
	)
);

-- 5 Получите идентификаторы и имена продавцов, совершивших наименьшую и наибольшую продажи
SELECT snum, sname FROM salers WHERE snum IN (
	SELECT snum FROM orders WHERE amt IN (
		(SELECT MAX(amt) FROM orders), (SELECT MIN(amt) FROM orders)
	)
);