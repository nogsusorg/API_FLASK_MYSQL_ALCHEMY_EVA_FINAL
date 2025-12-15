-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--


CREATE TABLE `harr_mercados` (
  `id` int NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `harr_mercados`
--

INSERT INTO `harr_mercados` (`id`, `nombre`) VALUES
(1, 'Rancagua'),
(2, 'Talca'),
(3, 'Chillan'),
(4, 'Temuco'),
(5, 'Osorno'),
(6, 'Puerto Montt');

-- --------------------------------------------------------

--
-- Table structure for table `harr_productos`
--

CREATE TABLE `harr_productos` (
  `id` int NOT NULL,
  `idOrigen` int NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `uMedida` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `precio` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `harr_productos`
--

INSERT INTO `harr_productos` (`id`, `idOrigen`, `nombre`, `uMedida`, `precio`) VALUES
(1, 1, 'Manzana', 'Kilo', 2300),
(2, 1, 'Papas', 'Saco', 5500),
(3, 2, 'Manzana', 'Kilo', 2200),
(4, 3, 'Manzana', 'Kilo', 2100),
(5, 4, 'Manzana', 'Kilo', 2350),
(7, 3, 'Papas', 'Saco', 5000),
(8, 2, 'Melones', 'Bins', 15500);

-- --------------------------------------------------------

--
-- Table structure for table `harr_usuario`
--

CREATE TABLE `harr_usuario` (
  `id` int NOT NULL,
  `nombre` text COLLATE utf8mb4_general_ci,
  `apellido` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usuario` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `clave` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `api_key` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `harr_usuario`
--

INSERT INTO `harr_usuario` (`id`, `nombre`, `apellido`, `usuario`, `clave`, `api_key`) VALUES
(1, 'Ana', 'Lira', 'analira', 'JK5765/&g', '3d063b5b22a6453e81b244e2f0331da4'),
(2, 'Luis', 'Ríos', 'lrio', 'GJH565/&(', NULL),
(5, 'Matín', 'Lara', 'mlara', '1234_INACAP', '40c8a2818a49409a9b2f727a2faf7ea8'),
(6, 'Margarita', 'Campos', 'mcampos', 'HJK&%&12', NULL),
(7, 'José', 'González', 'jgonzalez', 'HJK&%&12', NULL),
(8, 'Gabriela', 'Ríos', 'grios', 'HJK&%&12', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `harr_mercados`
--
ALTER TABLE `harr_mercados`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `harr_productos`
--
ALTER TABLE `harr_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_mercado` (`idOrigen`);

--
-- Indexes for table `harr_usuario`
--
ALTER TABLE `harr_usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `harr_mercados`
--
ALTER TABLE `harr_mercados`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `harr_productos`
--
ALTER TABLE `harr_productos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `harr_usuario`
--
ALTER TABLE `harr_usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;