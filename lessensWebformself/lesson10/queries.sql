-- 1 ����������� ������� � �����... �������� ���� ���������� � ����������� ����������
SELECT f.cname, s.cname, f.rating FROM customers f, customers s WHERE f.rating = s.rating;

-- 2 ����������� ������� � �����... �������� ���� ���������� � ����������� ���������� - ��������� ������������
SELECT f.cname, s.cname, f.rating FROM customers f, customers s WHERE f.rating = s.rating AND f.cname > s.cname;

-- 3 ����������� ������� � �����... ����� ���������� ��������� � 1 ������
SELECT f.sname, s.sname, s.city FROM salers f, salers s WHERE f.city = s.city AND f.sname < s.sname;

-- 4 ������� ���� �������� ��������
SELECT cname FROM customers WHERE snum = (SELECT snum FROM salers WHERE sname = 'Peel');

-- 5 ������, ������������ ������, ��������� ����������� ���������� ���� ���������
SELECT * FROM orders WHERE snum = (SELECT snum FROM salers WHERE city = 'London');

-- 6 ��� �� ������, �� ��� ������
SELECT * FROM orders WHERE snum IN (SELECT snum FROM salers WHERE city = 'London');

-- 7 ������� ��������� � ����� ��� 1 ��������
SELECT snum, sname FROM salers WHERE snum IN (SELECT snum FROM customers GROUP BY snum HAVING COUNT(snum) > 1);

-- 8 ����� ��������� ��� ��������
SELECT snum, sname FROM salers WHERE snum NOT IN (SELECT snum FROM customers);

-- 9 ������������ ���������... ������� ���� �������� �� ������
SELECT * FROM customers c WHERE '1990-04-10' IN (SELECT odate FROM orders o WHERE o.cnum = c.cnum);

-- 10 ��� �� ���������, �� � ������������ ������ �� ������ ���������� �����������
SELECT o.cnum, c.cname, c.city, c.rating, c.snum FROM orders o, customers c WHERE c.cnum = o.cnum AND o.odate = '1990-04-10';