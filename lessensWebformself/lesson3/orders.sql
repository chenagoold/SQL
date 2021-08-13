-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Авг 08 2021 г., 14:38
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
(3006, '1098.16', '1990-03-10', 2008, 1007),
(3010, '1309.95', '1990-06-10', 2004, 1002),
(3011, '9891.88', '1990-06-10', 2006, 1001);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`onum`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
