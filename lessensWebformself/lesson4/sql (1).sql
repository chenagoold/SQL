-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Авг 10 2021 г., 21:45
-- Версия сервера: 10.3.24-MariaDB-2
-- Версия PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sql`
--

-- --------------------------------------------------------

--
-- Структура таблицы `customers`
--

CREATE TABLE `customers` (
  `cnum` int(11) NOT NULL,
  `cname` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `snum` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `customers`
--

INSERT INTO `customers` (`cnum`, `cname`, `city`, `rating`, `snum`) VALUES
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'San Joes', 200, 1003),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2008, 'Cisneros', 'San Joes', 300, 1007),
(2007, 'Pereira', 'Rome', 100, 1004),
(2010, 'Dickens', 'La', 0, 1001);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `onum` int(11) NOT NULL,
  `amt` decimal(6,2) NOT NULL,
  `odate` date NOT NULL,
  `cnum` int(11) NOT NULL,
  `snum` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`onum`, `amt`, `odate`, `cnum`, `snum`) VALUES
(3001, '18.69', '1990-03-10', 2008, 1007),
(3003, '767.19', '1990-03-10', 2001, 1001),
(3002, '1900.10', '1990-03-10', 2007, 1004),
(3005, '5160.45', '1990-03-10', 2003, 1002),
(3006, '1098.16', '1990-04-10', 2008, 1007),
(3010, '1309.95', '1990-06-10', 2004, 1002),
(3011, '9891.88', '1990-06-10', 2006, 1001),
(3009, '1713.23', '1990-04-10', 2004, 1002),
(3007, '75.75', '1990-04-10', 2004, 1002),
(3008, '4723.00', '1990-05-10', 2006, 1001);

-- --------------------------------------------------------

--
-- Структура таблицы `salers`
--

CREATE TABLE `salers` (
  `snum` int(11) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `comm` decimal(3,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `salers`
--

INSERT INTO `salers` (`snum`, `sname`, `city`, `comm`) VALUES
(1001, 'Peel', 'London', '0.12'),
(1002, 'Serres', 'San Joes', '0.13'),
(1003, 'Motika', 'London', '0.11'),
(1007, 'Rifkin', 'Barcelona', '0.15'),
(1004, 'Axelrod', 'New Your', '0.10');

-- --------------------------------------------------------

--
-- Структура таблицы `test`
--

CREATE TABLE `test` (
  `id` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  `num` int(11) NOT NULL,
  `odate` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `test`
--

INSERT INTO `test` (`id`, `num`, `odate`, `data`) VALUES
(001, 2, 23, '2021-08-11'),
(002, 13, 14, '2021-08-12');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cnum`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`onum`);

--
-- Индексы таблицы `salers`
--
ALTER TABLE `salers`
  ADD PRIMARY KEY (`snum`);

--
-- Индексы таблицы `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `test`
--
ALTER TABLE `test`
  MODIFY `id` tinyint(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
