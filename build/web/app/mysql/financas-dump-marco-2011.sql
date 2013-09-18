-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Abr 02, 2011 as 07:55 PM
-- Versão do Servidor: 5.1.41
-- Versão do PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `financas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `ano`
--

CREATE TABLE IF NOT EXISTS `ano` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `ano`
--

INSERT INTO `ano` (`id`, `descricao`) VALUES
(1, 2010),
(2, 2011),
(3, 2012),
(4, 2013),
(5, 2014),
(6, 2015);

-- --------------------------------------------------------

--
-- Estrutura da tabela `campos`
--

CREATE TABLE IF NOT EXISTS `campos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(250) NOT NULL,
  `ativo` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `campos`
--

INSERT INTO `campos` (`id`, `descricao`, `ativo`) VALUES
(1, 'conta', 1),
(2, 'valor', 1),
(3, 'vencimento', 1),
(4, 'sacado', 1),
(5, 'status', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `conta`
--

CREATE TABLE IF NOT EXISTS `conta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) NOT NULL,
  `valor` double NOT NULL,
  `sacado` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `contames` int(11) NOT NULL,
  `contaano` int(11) NOT NULL,
  `observacoes` varchar(250) DEFAULT NULL,
  `vencimento` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Extraindo dados da tabela `conta`
--

INSERT INTO `conta` (`id`, `nome`, `valor`, `sacado`, `status`, `contames`, `contaano`, `observacoes`, `vencimento`) VALUES
(9, 'conta 1', 30.15, 1, 1, 4, 2, '', '2011-04-10'),
(10, 'conta 2', 0, 3, 2, 4, 2, 'esta conta sera paga, referente ao combinado em marÃ§o/2011', '2011-04-10'),
(8, 'conta 3', 100, 2, 1, 4, 2, 'valor aproximado.', '2011-04-10'),
(12, 'conta 4', 100, 1, 1, 4, 2, '', '2011-04-10'),
(11, 'conta 5', 255.56, 2, 1, 4, 2, '', '2011-04-10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modulo` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `log`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `mes`
--

CREATE TABLE IF NOT EXISTS `mes` (
  `id` int(11) NOT NULL,
  `descricao` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mes`
--

INSERT INTO `mes` (`id`, `descricao`) VALUES
(1, 'Janeiro'),
(2, 'Fevereiro'),
(3, 'Março'),
(4, 'Abril'),
(5, 'Maio'),
(6, 'Junho'),
(7, 'Julho'),
(8, 'Agosto'),
(9, 'Setembro'),
(10, 'outubro'),
(11, 'Novembro'),
(12, 'Dezembro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sacado`
--

CREATE TABLE IF NOT EXISTS `sacado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(250) NOT NULL,
  `ativo` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `sacado`
--

INSERT INTO `sacado` (`id`, `descricao`, `ativo`) VALUES
(1, 'usuario 1', 1),
(2, 'usuario 2', 1),
(3, 'outros', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(250) NOT NULL,
  `ativo` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `status`
--

INSERT INTO `status` (`id`, `descricao`, `ativo`) VALUES
(1, 'aberto', 1),
(2, 'pago', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
