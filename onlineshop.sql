-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 16 2023 г., 10:17
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `onlineshop`
--

--
-- Структура таблицы `branches`
--

CREATE TABLE `branches` (
  `branch_id` int(10) NOT NULL,
  `full_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `branches`
--

INSERT INTO `branches` (`branch_id`, `full_name`) VALUES
(200, 'Филиал на Кировском'),
(201, 'Филиал на Советском'),
(202, 'Филиал на Камышенском'),
(203, 'Филиал на Первомайском');

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `client_id` int(10) NOT NULL,
  `client_full_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`client_id`, `client_full_name`) VALUES
(1, 'Жмышенко  Валерий Альбертович'),
(2, 'Игнатьева Анна Игнатиевна'),
(3, 'Трубник Геннадий Витальевич'),
(4, 'Дудка Егор Витальевич');

-- --------------------------------------------------------

--
-- Структура таблицы `manufactures`
--

CREATE TABLE `manufactures` (
  `factur_id` int(10) NOT NULL,
  `full_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `manufactures`
--

INSERT INTO `manufactures` (`factur_id`, `full_name`) VALUES
(101, 'ООО \"Марина\"'),
(102, 'АО \"Елена\"'),
(103, 'ИП \"Максим\"'),
(104, 'ООО \"Иван\"');

-- --------------------------------------------------------

--
-- Структура таблицы `price_change`
--

CREATE TABLE `price_change` (
  `change_date` date NOT NULL,
  `product_id` int(10) NOT NULL,
  `branch_id` int(10) NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `price_change`
--

INSERT INTO `price_change` (`change_date`, `product_id`, `branch_id`, `price`) VALUES
('2023-06-01', 4, 202, 4000),
('2023-06-13', 1, 201, 5000),
('2023-06-25', 2, 203, 600),
('2023-06-30', 3, 200, 700);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `short_descript` varchar(255) NOT NULL,
  `factur_id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `short_descript`, `factur_id`, `category`) VALUES
(1, 'Онлайн вентилятор', 'Wi-fi вентилятор, чем быстрее интернет, тем лучше работает вентилятор', 103, 'Электроприборы'),
(2, 'Пневмотапки', 'Тапки на воздушной подушке', 102, 'Товары для дома'),
(3, 'Ультрафиолетовый светильник', 'УФ фонарь', 104, 'Товары для дома'),
(4, 'Обруч', 'Гимнастический обруч', 101, 'Спорт товары');

-- --------------------------------------------------------

--
-- Структура таблицы `products_in_purchase`
--

CREATE TABLE `products_in_purchase` (
  `purchase_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `branch_id` int(10) NOT NULL,
  `amount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `products_in_purchase`
--

INSERT INTO `products_in_purchase` (`purchase_id`, `product_id`, `branch_id`, `amount`) VALUES
(1, 4, 200, 1),
(2, 1, 202, 1),
(3, 2, 203, 1),
(3, 3, 203, 1),
(4, 3, 201, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_suppliy`
--

CREATE TABLE `product_suppliy` (
  `supply_date` date NOT NULL,
  `supplier_id` int(10) NOT NULL,
  `branch_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `supply_amount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `product_suppliy`
--

INSERT INTO `product_suppliy` (`supply_date`, `supplier_id`, `branch_id`, `product_id`, `supply_amount`) VALUES
('2023-06-01', 2, 200, 4, 5),
('2023-06-02', 1, 202, 1, 50),
('2023-06-03', 4, 203, 2, 7),
('2023-06-07', 3, 201, 3, 8),
('2023-06-14', 4, 203, 3, 8),
('2023-06-30', 4, 201, 3, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `purchases`
--

CREATE TABLE `purchases` (
  `purchase_id` int(10) NOT NULL,
  `purchase_date` date NOT NULL,
  `client_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `purchases`
--

INSERT INTO `purchases` (`purchase_id`, `purchase_date`, `client_id`) VALUES
(1, '2023-06-29', 4),
(2, '2023-06-14', 1),
(3, '2023-06-26', 2),
(4, '2023-06-27', 3);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `rating`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `rating` (
`product_id` int(10)
,`SUM(review)` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `client_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `review` int(10) NOT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`client_id`, `product_id`, `review`, `comment`) VALUES
(1, 1, 3, ''),
(2, 2, 5, ''),
(3, 3, 4, ''),
(4, 4, 4, '');

-- --------------------------------------------------------

--
-- Структура таблицы `suppliers`
--

CREATE TABLE `suppliers` (
  `supl_id` int(10) NOT NULL,
  `full_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `suppliers`
--

INSERT INTO `suppliers` (`supl_id`, `full_name`) VALUES
(1, 'ООО \"АИСТ\"'),
(2, 'АО \"ГРАЧ\"'),
(3, 'ООО \"Синица\"'),
(4, 'ООО \"Журавль\"');

-- --------------------------------------------------------

--
-- Структура для представления `availability`
--
DROP TABLE IF EXISTS `availability`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `availability`  AS  select `product_suppliy`.`branch_id` AS `branch_id`,`product_suppliy`.`product_id` AS `product_id`,sum(`product_suppliy`.`supply_amount`) - sum(case when `product_suppliy`.`supply_date` < `purchases`.`purchase_date` then `products_in_purchase`.`amount` else 0 end) AS `aviailable_amount` from ((`product_suppliy` join `products_in_purchase` on(`product_suppliy`.`product_id` = `products_in_purchase`.`product_id` and `product_suppliy`.`branch_id` = `products_in_purchase`.`branch_id`)) join `purchases` on(`products_in_purchase`.`purchase_id` = `purchases`.`purchase_id`)) group by `product_suppliy`.`branch_id`,`product_suppliy`.`product_id` ;

-- --------------------------------------------------------

--
-- Структура для представления `rating`
--
DROP TABLE IF EXISTS `rating`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rating`  AS  select `reviews`.`product_id` AS `product_id`,sum(`reviews`.`review`) AS `SUM(review)` from `reviews` group by `reviews`.`product_id` ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`);

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Индексы таблицы `manufactures`
--
ALTER TABLE `manufactures`
  ADD PRIMARY KEY (`factur_id`);

--
-- Индексы таблицы `price_change`
--
ALTER TABLE `price_change`
  ADD PRIMARY KEY (`change_date`,`product_id`,`branch_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `factur_id` (`factur_id`);

--
-- Индексы таблицы `products_in_purchase`
--
ALTER TABLE `products_in_purchase`
  ADD PRIMARY KEY (`purchase_id`,`product_id`,`branch_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `product_suppliy`
--
ALTER TABLE `product_suppliy`
  ADD PRIMARY KEY (`supply_date`,`supplier_id`,`branch_id`,`product_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Индексы таблицы `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`client_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supl_id`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `price_change`
--
ALTER TABLE `price_change`
  ADD CONSTRAINT `price_change_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `price_change_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`factur_id`) REFERENCES `manufactures` (`factur_id`);

--
-- Ограничения внешнего ключа таблицы `products_in_purchase`
--
ALTER TABLE `products_in_purchase`
  ADD CONSTRAINT `products_in_purchase_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`purchase_id`),
  ADD CONSTRAINT `products_in_purchase_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `products_in_purchase_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Ограничения внешнего ключа таблицы `product_suppliy`
--
ALTER TABLE `product_suppliy`
  ADD CONSTRAINT `product_suppliy_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `product_suppliy_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `product_suppliy_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supl_id`);

--
-- Ограничения внешнего ключа таблицы `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`);

--
-- Ограничения внешнего ключа таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
