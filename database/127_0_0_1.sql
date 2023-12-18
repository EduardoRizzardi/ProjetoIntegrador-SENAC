-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16/12/2023 às 01:45
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `distribuidora_de_pecas`
--
CREATE DATABASE IF NOT EXISTS `distribuidora_de_pecas` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `distribuidora_de_pecas`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnpj` varchar(18) NOT NULL,
  `nome_fantasia` varchar(70) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `telefone1` varchar(12) NOT NULL,
  `telefone2` varchar(12) DEFAULT NULL,
  `credito` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cnpj`, `nome_fantasia`, `endereco`, `telefone1`, `telefone2`, `credito`, `email`) VALUES
('0001/44', 'Oficina do seu Jair', 'Rua do jair', '79', '12', 'Até 12x', 'jair@');

-- --------------------------------------------------------

--
-- Estrutura para tabela `colaborador`
--

CREATE TABLE `colaborador` (
  `nome` varchar(70) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone1` varchar(12) NOT NULL,
  `telefone2` varchar(12) DEFAULT NULL,
  `data_nascimento` varchar(10) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `colaborador`
--

INSERT INTO `colaborador` (`nome`, `endereco`, `cpf`, `telefone1`, `telefone2`, `data_nascimento`, `email`) VALUES
('Felipe Sereno', 'Rua do Felipe', '000-96', '54', '51', '02/06/1996', 'felipe@');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `nome_prod` varchar(500) NOT NULL,
  `valor_total` float NOT NULL,
  `forma_de_pagamento` varchar(45) NOT NULL,
  `vendedor` varchar(45) NOT NULL,
  `separador` varchar(45) NOT NULL,
  `conferente` varchar(45) NOT NULL,
  `Cliente_cnpj` varchar(18) NOT NULL,
  `Colaborador_cpf` varchar(14) NOT NULL,
  `Transportadora_cnpj` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_has_produto`
--

CREATE TABLE `pedido_has_produto` (
  `Pedido_id_pedido` int(11) NOT NULL,
  `Produto_id_produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `valor_unitario` double NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `endereco_estoque` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `marca`, `modelo`, `valor_unitario`, `descricao`, `endereco_estoque`) VALUES
(1, 'Truckmais', 'Escap100', 599, 'Escapamento de caminhão', 'P18');

-- --------------------------------------------------------

--
-- Estrutura para tabela `transportadora`
--

CREATE TABLE `transportadora` (
  `cnpj` varchar(18) NOT NULL,
  `nome_fantasia` varchar(45) NOT NULL,
  `destinos` varchar(45) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefone1` varchar(12) NOT NULL,
  `telefone2` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `transportadora`
--

INSERT INTO `transportadora` (`cnpj`, `nome_fantasia`, `destinos`, `endereco`, `email`, `telefone1`, `telefone2`) VALUES
('0001/96', 'Leva tudo', 'Porto Alegre', 'Rua leva tudo', 'levatudo@', '77', '88');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cnpj`);

--
-- Índices de tabela `colaborador`
--
ALTER TABLE `colaborador`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`,`Cliente_cnpj`,`Colaborador_cpf`,`Transportadora_cnpj`),
  ADD KEY `Cliente_cnpj` (`Cliente_cnpj`),
  ADD KEY `Colaborador_cpf` (`Colaborador_cpf`),
  ADD KEY `Transportadora_cnpj` (`Transportadora_cnpj`);

--
-- Índices de tabela `pedido_has_produto`
--
ALTER TABLE `pedido_has_produto`
  ADD PRIMARY KEY (`Pedido_id_pedido`,`Produto_id_produto`),
  ADD KEY `Produto_id_produto` (`Produto_id_produto`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices de tabela `transportadora`
--
ALTER TABLE `transportadora`
  ADD PRIMARY KEY (`cnpj`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`Cliente_cnpj`) REFERENCES `cliente` (`cnpj`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`Colaborador_cpf`) REFERENCES `colaborador` (`cpf`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`Transportadora_cnpj`) REFERENCES `transportadora` (`cnpj`);

--
-- Restrições para tabelas `pedido_has_produto`
--
ALTER TABLE `pedido_has_produto`
  ADD CONSTRAINT `pedido_has_produto_ibfk_1` FOREIGN KEY (`Pedido_id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `pedido_has_produto_ibfk_2` FOREIGN KEY (`Produto_id_produto`) REFERENCES `produto` (`id_produto`);
--
-- Banco de dados: `faculdade`
--
CREATE DATABASE IF NOT EXISTS `faculdade` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `faculdade`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE `aluno` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aluno`
--

INSERT INTO `aluno` (`matricula`, `nome`, `email`) VALUES
(1, 'ss', 'ss');

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor`
--

CREATE TABLE `professor` (
  `idProfessor` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `salario` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `professor`
--

INSERT INTO `professor` (`idProfessor`, `nome`, `email`, `salario`) VALUES
(1, 'ss', 'ss', 1.4),
(2, 'ss', 'ss', 1.5),
(3, 'aa', 'aa', 1.6),
(4, 'aa', 'aa', 1.6);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`matricula`);

--
-- Índices de tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`idProfessor`),
  ADD UNIQUE KEY `idProfessor` (`idProfessor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `idProfessor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Banco de dados: `farmaciau`
--
CREATE DATABASE IF NOT EXISTS `farmaciau` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `farmaciau`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cpf` varchar(11) NOT NULL,
  `endereco` varchar(80) DEFAULT NULL,
  `nome` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cpf`, `endereco`, `nome`) VALUES
('22233366655', 'Venancio', 'thyfany'),
('60127608799', 'Ary Veiga', 'thayna'),
('66622244455', 'Venancio', 'tia helena');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `descricao` varchar(70) DEFAULT NULL,
  `valor` double(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`codigo`, `nome`, `descricao`, `valor`) VALUES
(1, 'cloridrato', NULL, 52.00),
(2, 'betametazona', NULL, 20.00),
(3, 'dexametazona', NULL, 15.00);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Banco de dados: `laricao_db`
--
CREATE DATABASE IF NOT EXISTS `laricao_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laricao_db`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `logradouro` varchar(10) DEFAULT NULL,
  `endereco` varchar(100) NOT NULL,
  `numero` int(5) NOT NULL,
  `complemento` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cpf`, `nome`, `senha`, `email`, `telefone`, `logradouro`, `endereco`, `numero`, `complemento`) VALUES
('52849504013', 'Rita Lua', 'xchero', 'xche@', '55999999977', 'Rua', 'Venâncio Aires', 93, 'Em frente ao mercadinho da larva'),
('52849504663', 'Alfredo', 'xcher', 'xch@', '55999559977', 'Rua', 'Borger', 100, ''),
('64849504013', 'Enzo', 'xche', 'xc@', '55998499977', 'Avenida', 'Praia de Belas', 1000, ''),
('72849504015', 'Zezin', 'xcheros', 'xcher@', '54999999998', 'Rua', 'Lugar nenhum', 666, 'Próximo a ovelha negra'),
('92849504013', 'Xcherolayni', 'xcherosa', 'xchero@', '51999999999', 'Avenida', 'Suvaco da Cobra', 231, 'Do lado do cachorro do claudião');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens`
--

CREATE TABLE `itens` (
  `id_produto` int(5) NOT NULL,
  `id_pedido` int(5) NOT NULL,
  `qtd_item` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itens`
--

INSERT INTO `itens` (`id_produto`, `id_pedido`, `qtd_item`) VALUES
(1, 1, 2),
(1, 3, 2),
(1, 5, 5),
(2, 2, 4),
(3, 1, 1),
(3, 4, 1),
(4, 3, 1),
(5, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(5) NOT NULL,
  `valor_total` float(5,2) NOT NULL,
  `observacoes` varchar(200) DEFAULT NULL,
  `data_pedido` datetime NOT NULL,
  `cliente_cpf` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `valor_total`, `observacoes`, `data_pedido`, `cliente_cpf`) VALUES
(1, 50.00, 'Sem tomate e milho', '2015-12-12 22:32:00', '92849504013'),
(2, 40.00, '', '2017-12-12 22:32:00', '72849504015'),
(3, 90.00, 'Caprixa no suco', '2018-12-12 22:32:00', '52849504013'),
(4, 999.99, '', '2013-12-12 22:32:00', '52849504663'),
(5, 200.00, '', '2023-12-12 22:32:00', '64849504013');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(5) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `disponivel` varchar(3) NOT NULL,
  `valor_unitario` float(5,2) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `descricao` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `nome`, `disponivel`, `valor_unitario`, `tipo`, `descricao`) VALUES
(1, 'Cachorro quente vegano', 'Sim', 20.00, 'Lanche', 'Cachorro delícia sem sofrimento animal'),
(2, 'Xis tudo vegano', 'Sim', 30.00, 'Lanche', 'Xis delícia sem sofrimento animal'),
(3, 'Guaraná Jesus', 'Sim', 5.00, 'Bebida', 'Lata 350ml'),
(4, 'Suco de bergamota', 'Sim', 100.00, 'Bebida', 'Suco delícia natural'),
(5, 'Maionese extra', 'Sim', 2.00, 'Adicional', '10g de maionese'),
(6, 'Porção de batata frita', 'Não', 15.00, 'Porção', '250g de batata frita'),
(7, 'Pastel de chocolate', 'Sim', 20.00, 'Lanche', 'pastel de chocolate descrição'),
(8, 'Salada de feijão-fradinho', 'Sim', 15.00, 'Adicional', 'Salada saudável delícia'),
(9, 'Xis bacon e ovo', 'Sim', 20.00, 'Lanche', 'Xisão');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `telefone` (`telefone`);

--
-- Índices de tabela `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`id_produto`,`id_pedido`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `cliente_cpf` (`cliente_cpf`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `itens`
--
ALTER TABLE `itens`
  ADD CONSTRAINT `itens_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  ADD CONSTRAINT `itens_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`cliente_cpf`) REFERENCES `cliente` (`cpf`);
--
-- Banco de dados: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Despejando dados para a tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-12-16 00:44:39', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"pt_BR\"}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Índices de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Índices de tabela `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Índices de tabela `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Índices de tabela `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Índices de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Índices de tabela `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Índices de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Índices de tabela `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Índices de tabela `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Índices de tabela `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Índices de tabela `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Índices de tabela `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Índices de tabela `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Banco de dados: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
