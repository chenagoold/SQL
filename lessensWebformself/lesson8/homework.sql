-- 1 �� ������� orders �������� ��� ����� �� 1000. ����������� ������� REGEXP. ������������ �������� ���������, ��������� 2 ������ �������.
SELECT amt FROM orders WHERE amt REGEXP '^[0-9]{1,3}\.[0-9]{1,2}$';
SELECT amt FROM orders WHERE amt REGEXP '^.{1,6}$';

-- 2 �� ������� salers �������� ��� ������, ��������� �� ���� ����.
SELECT city FROM salers WHERE city REGEXP ' ';

-- 3 �� ������� salers �������� ��� ����, ��� ����� ��������� � �������� ������� �� ��������� 6 ��������
SELECT * FROM salers WHERE sname REGEXP '^.{1,6}$' AND city REGEXP '^.{1,6}$';

-- 4 �������� �� ������� orders ��� ����� ��� ������� ����� (� �����������)
SELECT amt, ROUND(amt, 0) FROM orders;

-- 5 �������� �� ������� orders ��� ����� ��� ������� ����� (��� ����������)
SELECT amt, TRUNCATE(amt, 0) FROM orders;