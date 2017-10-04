-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 04 2017 г., 19:54
-- Версия сервера: 5.7.19
-- Версия PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `classificator_country`
--

CREATE TABLE `classificator_country` (
  `Country_ID` int(11) NOT NULL,
  `Country_Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `classificator_country`
--

INSERT INTO `classificator_country` (`Country_ID`, `Country_Name`) VALUES
(1, 'Россия'),
(2, 'Украина'),
(3, 'Белоруссия');

-- --------------------------------------------------------

--
-- Структура таблицы `classificator_region`
--

CREATE TABLE `classificator_region` (
  `Region_ID` int(11) NOT NULL,
  `Region_Name` varchar(50) DEFAULT NULL,
  `Parent_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `classificator_region`
--

INSERT INTO `classificator_region` (`Region_ID`, `Region_Name`, `Parent_ID`) VALUES
(1, 'Москва', 1),
(2, 'Санкт-Петербург', 1),
(3, 'Воронеж', 1),
(4, 'Сочи', 1),
(5, 'Минск', 3),
(6, 'Харьков', 2),
(7, 'Владивосток', 1),
(8, 'Хабаровск', 1),
(9, 'Киев', 2),
(10, 'Ялта', 1),
(11, 'Симферополь', 1),
(12, 'Тверь', 1),
(13, 'Одесса', 2),
(14, 'Гомель', 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `classificator_country`
--
ALTER TABLE `classificator_country`
  ADD PRIMARY KEY (`Country_ID`);

--
-- Индексы таблицы `classificator_region`
--
ALTER TABLE `classificator_region`
  ADD PRIMARY KEY (`Region_ID`),
  ADD KEY `Parent_ID` (`Parent_ID`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `classificator_region`
--
ALTER TABLE `classificator_region`
  ADD CONSTRAINT `classificator_region_ibfk_1` FOREIGN KEY (`Parent_ID`) REFERENCES `classificator_country` (`Country_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
