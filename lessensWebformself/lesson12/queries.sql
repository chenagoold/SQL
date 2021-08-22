-- 1 Создание БД
CREATE DATABASE IF NOT EXISTS `sql2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 2 Создание таблиц
CREATE TABLE [IF NOT EXISTS] `tbl_name` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=MyISAM;

-- 3 Создание копии таблицы
CREATE TABLE customers2 SELECT * FROM customers;

-- 4 Просмотр структуры таблицы
DESCRIBE `tbl_name`;
DESC `tbl_name`;

-- 5 INSERT
INSERT INTO customers2(cname, city, rating, snum, text) VALUES ('Вася Пупкин', 'Васюки', 150, 1002, 'Какой-то текст');
INSERT INTO customers2 SET cname='Вася Пупкин', city='Васюки', rating=150, snum=1002, text='Какой-то текст';

-- 6 UPDATE
UPDATE customers2 SET cname='John Doe', city='LA' WHERE cnum=2013;

-- 7 DELETE
DELETE FROM customers2 WHERE cname='вася пупкин';

-- 8 DROP
DROP TABLE [IF EXISTS] `tbl_name`;
DROP DATABASE [IF EXISTS] `db_name`;