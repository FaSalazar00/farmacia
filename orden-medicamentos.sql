

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `orden-medicamentos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Tabletas', 'forma oral de dosificación.', 1, 0, '2022-05-25 10:14:16', '2022-05-25 10:16:27'),
(2, 'Bebibles', 'Acción solvente, se disuelve en agua a pocos litros.', 1, 0, '2022-05-25 10:16:05', '2022-08-19 13:54:23'),
(3, 'Inyectables', 'Soluciones con altos niveles de concentración', 1, 0, '2022-05-26 10:57:14', '2022-08-19 14:11:47'),
(4, 'Jarabe', 'líquidos de consistencia viscosa', 1, 1, '2022-05-26 10:57:31', '2022-05-26 10:58:45'),
(5, 'Pastillas', 'Pastillas Humedas Hidro Geladas', 1, 0, '2022-08-19 10:57:18', '2022-08-19 10:57:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer_list`
--

CREATE TABLE `customer_list` (
  `id` int(30) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` varchar(100) NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `customer_list`
--

INSERT INTO `customer_list` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `email`, `password`, `avatar`, `date_created`, `date_updated`) VALUES
(1, 'Pedro', '', 'Escamoso', 'Male', '30100002', 'pedro@gmail.com', '4b67deeb9aba04a5b54632ad19934f26', 'uploads/customers/1.png?v=1661008291', '2022-05-25 13:21:28', '2022-08-20 10:11:31'),
(3, 'Patricia', '', 'Teram', 'Female', '30100003', 'patri@gmail.com', '4b67deeb9aba04a5b54632ad19934f26', 'uploads/customers/3.png?v=1661008569', '2022-05-26 10:54:53', '2022-08-20 10:16:09'),
(4, 'Juan', '', 'Valdez', 'Male', '330100004', 'juan@gmail.com', '4b67deeb9aba04a5b54632ad19934f26', 'uploads/customers/4.png?v=1660924439', '2022-08-19 10:53:59', '2022-08-19 10:53:59'),
(5, 'Diego', '', 'Cadena', 'Male', '30100006', 'diego@gmail.com', '4b67deeb9aba04a5b54632ad19934f26', 'uploads/customers/5.png?v=1661015083', '2022-08-20 12:04:43', '2022-08-20 12:04:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL DEFAULT 0,
  `price` float(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 2, 4, 7.00),
(1, 4, 5, 20.00),
(1, 3, 3, 25.00),
(3, 3, 2, 25.00),
(4, 3, 3, 25.00),
(4, 1, 3, 10.00),
(5, 4, 1, 20.00),
(6, 1, 2, 10.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `total_amount` float(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending,\r\n1=packed,\r\n2=out for delivery,\r\n3=paid\r\n',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `customer_id`, `delivery_address`, `total_amount`, `status`, `date_created`, `date_updated`) VALUES
(1, '2022216540068', 1, 'Sample Address Only.', 20300.00, 3, '2022-05-25 16:36:09', '2022-05-26 09:10:58'),
(3, '2022052600111', 1, 'test', 50.00, 0, '2022-05-26 09:22:37', '2022-05-26 09:22:37'),
(4, '2022052600004', 3, '', 10500.00, 3, '2022-05-26 10:56:25', '2022-05-26 11:03:01'),
(5, '2022081901111', 4, 'Calle 11 15 15', 20000.00, 0, '2022-08-19 10:54:39', '2022-08-19 10:54:39'),
(6, '2022022220001', 5, 'Calle 9 N 2 3', 20000.00, 3, '2022-08-20 12:24:29', '2022-08-20 12:34:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `brand` text NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `dose` varchar(250) NOT NULL,
  `price` float(12,2) NOT NULL DEFAULT 0.00,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `product_list`
--

INSERT INTO `product_list` (`id`, `category_id`, `brand`, `name`, `description`, `dose`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 2, 'Morcas', 'Benzatinica', 'informe a su médico o a la inyección de penicilina G; antibióticos de penicilina; antibióticos de cefalosporina como cefaclor, cefadroxil, cefazolin (Ancef, Kefzol), cefditoren (Spectracef), cefepime.', '200', 10000.00, 'uploads/medicines//benzatinica.jpg?v=1661009736', 1, 0, '2022-05-25 11:06:29', '2022-08-20 10:35:36'),
(2, 2, 'Gerber', 'Penicilina', 'La inyección de penicilina G se usa para tratar y prevenir ciertas infecciones provocadas por bacterias. La inyección de penicilina G pertenece a una clase de medicamentos llamados penicilinas. Funciona matando las bacterias que causan infecciones.', '125', 7000.00, 'uploads/medicines//penicilina.jpg?v=1661009033', 1, 0, '2022-05-25 11:10:23', '2022-08-20 10:23:53'),
(3, 1, 'Genfar', 'Ibruprofeno', 'Use la dosis que omitió tan pronto como lo recuerde. Sin embargo, si ya casi es hora de la próxima dosis, omita la dosis que le faltó y continúe con su programa regular de dosificación. No duplique la dosis para compensar la dosis omitida.', '25mg', 25000.00, 'uploads/medicines//7702057162818.jpg?v=1661014020', 1, 0, '2022-05-25 11:11:36', '2022-08-20 11:47:00'),
(4, 1, 'ColMed', 'Nimesulida', 'Asista a todas las citas con su médico y del laboratorio. Su médico ordenará algunas pruebas de laboratorio para comprobar la respuesta de su cuerpo a la inyección de penicilina G.', '50mg', 20000.00, 'uploads/medicines//07703153036119.jpg?v=1661014099', 1, 0, '2022-05-25 14:18:48', '2022-08-20 11:48:19'),
(5, 3, 'Bussié', 'Urexil', 'Informe a su médico y farmacéutico acerca de qué otros medicamentos con y sin receta médica, vitaminas, suplementos nutricionales y productos a base de hierbas está tomando o tiene planificado tomar. Asegúrese de mencionar cualquiera de los siguientes: aspirina; cloranfenicol; diuréticos (\'píldoras que provocan la eliminación de agua a través de la orina\') como ácido etacrínico (Edecrin) y furosemida (Lasix); eritromicina (Ery-tab, E.E.S., otros); indometacina (Indocin, Tivorbex); probenecid (Probalan); sulfa antibióticos; y tetraciclina (Achromycin). Es posible que su médico deba cambiar las dosis de sus medicamentos o supervisarle atentamente para saber si sufre efectos secundarios.', '135', 375.00, 'uploads/medicines//7702195205613-300x300.jpg?v=1661013738', 1, 0, '2022-05-26 10:59:44', '2022-08-20 11:42:18'),
(7, 5, 'Bayer', 'Acetaminofen Super', 'Quitan el dolor de cabeza y el resfriado común', '15', 15000.00, 'uploads/medicines//7702195057304.jpg?v=1661014170', 1, 0, '2022-08-19 10:59:23', '2022-08-20 11:49:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_list`
--

CREATE TABLE `stock_list` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `quantity` float(12,2) NOT NULL DEFAULT 0.00,
  `expiration` date DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `stock_list`
--

INSERT INTO `stock_list` (`id`, `product_id`, `code`, `quantity`, `expiration`, `date_created`, `date_updated`) VALUES
(1, 2, '1236548', 50.00, '2022-05-27', '2022-05-25 11:48:05', '2022-05-25 11:48:05'),
(2, 2, '8754665', 15.00, '2023-05-25', '2022-05-25 11:54:40', '2022-05-25 11:58:07'),
(3, 2, '111', 35.00, '2022-05-24', '2022-05-25 11:58:24', '2022-05-25 11:58:24'),
(4, 1, '1231', 35.00, '2023-05-26', '2022-05-25 12:06:04', '2022-05-25 12:06:04'),
(5, 3, '123111', 50.00, '2023-05-26', '2022-05-25 12:06:19', '2022-05-25 12:06:19'),
(6, 4, '89756452', 30.00, '2025-06-23', '2022-05-25 14:19:25', '2022-05-25 14:19:25'),
(7, 5, '06231415', 50.00, '2023-05-27', '2022-05-26 11:01:03', '2022-05-26 11:01:03'),
(8, 5, '9875652', 15.00, '2022-05-09', '2022-05-26 11:01:21', '2022-05-26 11:01:41'),
(10, 7, '121212ABC1', 500.00, '2023-10-19', '2022-08-19 11:00:22', '2022-08-19 11:00:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_out`
--

CREATE TABLE `stock_out` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `stock_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Sistema de Gestion y Pedido de Medicamentos en Línea'),
(6, 'short_name', 'FSGPM'),
(11, 'logo', 'uploads/logo.png?v=1660932690'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover.png?v=1653443581'),
(17, 'phone', '300000001'),
(18, 'mobile', '300000001'),
(19, 'email', 'fabi@gmail.com'),
(20, 'address', 'Calle falsa 123 avenida siempre viva');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='2';

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'fabian', '', 'Salazar', 'fabi', '123', 'uploads/avatars/1.png?v=1660934988', NULL, 1, '2021-01-20 14:02:37', '2022-08-19 13:49:48'),
(7, 'admin', '', 'admin', 'admin', 'admin', NULL, NULL, 2, '2022-05-26 11:04:16', '2022-08-19 10:56:19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `customer_list`
--
ALTER TABLE `customer_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indices de la tabla `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `stock_list`
--
ALTER TABLE `stock_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `stock_out`
--
ALTER TABLE `stock_out`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Indices de la tabla `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `customer_list`
--
ALTER TABLE `customer_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `stock_list`
--
ALTER TABLE `stock_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `stock_out`
--
ALTER TABLE `stock_out`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `customer_id_fk_cl` FOREIGN KEY (`customer_id`) REFERENCES `customer_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_id_fk_cl` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_id_fk_oi` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_id_fk_oi` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `customer_id_fk_ol` FOREIGN KEY (`customer_id`) REFERENCES `customer_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `category_id_fk_pl` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `stock_list`
--
ALTER TABLE `stock_list`
  ADD CONSTRAINT `product_id_fk_sl` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `stock_out`
--
ALTER TABLE `stock_out`
  ADD CONSTRAINT `order_id_fk_so` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `stock_id_fk_so` FOREIGN KEY (`stock_id`) REFERENCES `stock_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
