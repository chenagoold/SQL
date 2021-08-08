//создание БД 
CREATE DATABASE `sql` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

//просмотр БД
show databases;

//создание таблиц в БД
CREATE TABLE orders (
	onum INT(11) NOT NULL,
	amt DECIMAL(6,2) NOT NULL,
	odate DATE NOT NULL,
	cnum INT(11) NOT NULL,
	snum INT(11) NOT NULL,
	PRIMARY KEY(onum)
) ENGINE=MyISAM;


//++++++++++++++++++++++++++++++++++++++++++LESSON-2++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++LESSON-2++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++LESSON-3++++++++++++++++++++++++++++++++
--1 выбрать из таблицы все `orders`-правильнее будет
SELECT * FROM orders;

--2 в каком порядке выбираем поля в таком они сартируются из таблицы БД
SELECT onum, cnum, snum, amt, odate FROM orders;

--3
//++++++++++++++++++++++++++++++++++++++++++LESSON-3++++++++++++++++++++++++++++++++
