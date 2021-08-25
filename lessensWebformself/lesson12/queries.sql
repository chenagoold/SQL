-- JOIN
-- INNER JOIN
-- LEFT OUTER JOIN
-- RIGHT OUTER JOIN
-- !FULL OUTER JOIN!
-- CROSS JOIN
-- UNION UNION - ��� ����������� �������� ���������� ��������, JOIN - �������� ������ ��������� �������� �� ������ �������� ��������
-- ��������: ���� �� ������������ �������� ����� ALL ��� UNION, ��� ������������ ������ ����� �����������, 
--��� ��� �� ��������� ��������������� DISTINCT, ������� ������� ������������ ��������.

����� �������� ����� ��������� - ����� ������� �������� ����� ALL, ��� ���: UNION ALL. 
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

-- 11 �������������� �����
SELECT * FROM customers WHERE MATCH (text) AGAINST ('test');

-- 12 �������������� ����� � ������ ������������� ����� (NATURAL LANGUAGE MODE) ���������� �� ��������������
SELECT * FROM customers WHERE MATCH (text) AGAINST ('����������������');

-- 13 �������������� �����... � ������ NATURAL LANGUAGE MODE ������� ����� ������� ���� = 50%
SELECT * FROM customers WHERE MATCH (text) AGAINST ('mysql');

-- 14
SELECT * FROM customers WHERE MATCH (text) AGAINST ('php' IN NATURAL LANGUAGE MODE);

-- 15 �������������� ����� � ������� ������ (BOOLEAN MODE) �������������� ����������
SELECT * FROM customers WHERE MATCH (text) AGAINST ('��������*' IN BOOLEAN MODE);

-- 16
SELECT * FROM customers WHERE MATCH (text) AGAINST ('+php -mysql' IN BOOLEAN MODE);

--17
SELECT * FROM ���_�������1 WHERE �������
	UNION SELECT * FROM ���_�������2 WHERE �������;

--18
SELECT * FROM ���_�������1 WHERE �������
	UNION SELECT * FROM ���_�������2 WHERE �������
	UNION SELECT * FROM ���_�������3 WHERE �������
	UNION SELECT * FROM ���_�������4 WHERE �������

--19
SELECT id, name FROM countries UNION ALL SELECT id, name FROM cities;

--20
