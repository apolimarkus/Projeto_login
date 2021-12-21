-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21-Dez-2021 às 01:43
-- Versão do servidor: 10.4.20-MariaDB
-- versão do PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdsistema`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tblclientes`
--

CREATE TABLE `tblclientes` (
  `id` int(11) NOT NULL,
  `cliente` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `foto` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tblclientes`
--

INSERT INTO `tblclientes` (`id`, `cliente`, `email`, `foto`) VALUES
(1, 'Daniel Silva', 'daniel@gmail.com', 'img01.png'),
(2, 'João de Sousa', 'joaosousa@gmail.com', 'img02.png'),
(3, 'Anna Sofia', 'annasofia@gmail.com', 'img03.jpg'),
(4, 'Antonio Freitas', 'antonio@gmail.com', 'img06.jpg'),
(5, 'Roberto de Sousa', 'roberto@gmail.com', ''),
(6, 'Fabiano Arantes', 'fabianoarantes@gmail.com', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tblnivelacesso`
--

CREATE TABLE `tblnivelacesso` (
  `idnivel` int(11) NOT NULL,
  `acesso` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tblnivelacesso`
--

INSERT INTO `tblnivelacesso` (`idnivel`, `acesso`) VALUES
(1, 'Administrador'),
(2, 'Colaborador'),
(3, 'Fornecedor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tblprodutos`
--

CREATE TABLE `tblprodutos` (
  `id` int(11) NOT NULL,
  `produto` varchar(40) NOT NULL,
  `preco` float(10,2) NOT NULL,
  `estoque` int(11) NOT NULL,
  `estoquemax` int(11) NOT NULL,
  `estoquemin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tblprodutos`
--

INSERT INTO `tblprodutos` (`id`, `produto`, `preco`, `estoque`, `estoquemax`, `estoquemin`) VALUES
(1, 'Mouse sem fio', 39.90, 5, 50, 10),
(2, 'Teclado com fio', 35.00, 9, 30, 5),
(3, 'Gabinete', 2640.00, 12, 20, 5),
(5, 'Impressora Epson', 1800.00, 15, 50, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tblsituacao`
--

CREATE TABLE `tblsituacao` (
  `idsit` int(11) NOT NULL,
  `situacao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tblsituacao`
--

INSERT INTO `tblsituacao` (`idsit`, `situacao`) VALUES
(1, 'Ativo'),
(2, 'Inativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tblusuarios`
--

CREATE TABLE `tblusuarios` (
  `iduser` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `idsit` int(11) NOT NULL,
  `idnivel` int(11) NOT NULL,
  `criado` date NOT NULL,
  `modificado` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tblusuarios`
--

INSERT INTO `tblusuarios` (`iduser`, `nome`, `email`, `senha`, `idsit`, `idnivel`, `criado`, `modificado`) VALUES
(1, 'Marcos', 'apolimarkus@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, 1, '2021-12-17', '2021-12-17'),
(2, 'Gustavo Ramos', 'gustavo@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, 2, '2021-12-20', '2021-12-20'),
(3, 'Fernanda Cabral', 'fernanda@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, 3, '2021-12-20', '2021-12-20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tblvendas`
--

CREATE TABLE `tblvendas` (
  `id` int(11) NOT NULL,
  `datavenda` date NOT NULL,
  `idvendedor` int(11) NOT NULL,
  `idproduto` int(11) NOT NULL,
  `qtd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tblvendas`
--

INSERT INTO `tblvendas` (`id`, `datavenda`, `idvendedor`, `idproduto`, `qtd`) VALUES
(2, '2021-12-08', 1, 2, 5),
(3, '2021-12-08', 1, 2, 3),
(4, '2021-12-01', 2, 1, 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tblvendedores`
--

CREATE TABLE `tblvendedores` (
  `id` int(11) NOT NULL,
  `vendedor` varchar(40) NOT NULL,
  `dataadmissao` date NOT NULL,
  `salario` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tblvendedores`
--

INSERT INTO `tblvendedores` (`id`, `vendedor`, `dataadmissao`, `salario`) VALUES
(1, 'Rodrigo de Freitas', '2021-10-11', 2500.00),
(2, 'Claudio Gomes', '2021-10-04', 1700.00);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tblclientes`
--
ALTER TABLE `tblclientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tblnivelacesso`
--
ALTER TABLE `tblnivelacesso`
  ADD PRIMARY KEY (`idnivel`);

--
-- Índices para tabela `tblprodutos`
--
ALTER TABLE `tblprodutos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tblsituacao`
--
ALTER TABLE `tblsituacao`
  ADD PRIMARY KEY (`idsit`);

--
-- Índices para tabela `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD PRIMARY KEY (`iduser`);

--
-- Índices para tabela `tblvendas`
--
ALTER TABLE `tblvendas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tblvendedores`
--
ALTER TABLE `tblvendedores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tblclientes`
--
ALTER TABLE `tblclientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tblnivelacesso`
--
ALTER TABLE `tblnivelacesso`
  MODIFY `idnivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tblprodutos`
--
ALTER TABLE `tblprodutos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tblsituacao`
--
ALTER TABLE `tblsituacao`
  MODIFY `idsit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tblusuarios`
--
ALTER TABLE `tblusuarios`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tblvendas`
--
ALTER TABLE `tblvendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tblvendedores`
--
ALTER TABLE `tblvendedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
