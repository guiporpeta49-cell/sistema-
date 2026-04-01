-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: imobiliaria
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `interesse` enum('compra','aluguel') NOT NULL,
  `faixa_preco` decimal(12,2) DEFAULT NULL,
  `empresa_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `empresa_id` (`empresa_id`),
  KEY `ix_clientes_id` (`id`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corretores`
--

DROP TABLE IF EXISTS `corretores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corretores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `creci` varchar(30) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `perfil` enum('admin','corretor','atendente') DEFAULT NULL,
  `empresa_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `creci` (`creci`),
  KEY `empresa_id` (`empresa_id`),
  KEY `ix_corretores_id` (`id`),
  CONSTRAINT `corretores_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corretores`
--

LOCK TABLES `corretores` WRITE;
/*!40000 ALTER TABLE `corretores` DISABLE KEYS */;
INSERT INTO `corretores` VALUES (1,'GUILHERME GOKDAR','guilherme-justiniano@hotmail.com','16992829942','1','$2b$12$EwVO2Ze2a7E5vQt3CMLQr.onZAJpxFgNJnURImaygvJZd8T8hvG2G',1,'admin',1);
/*!40000 ALTER TABLE `corretores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `cnpj` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `licenca` varchar(50) NOT NULL DEFAULT 'basica',
  `limite_usuarios` int NOT NULL DEFAULT '1',
  `ativa` tinyint(1) NOT NULL DEFAULT '1',
  `vencimento` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnpj` (`cnpj`),
  UNIQUE KEY `email` (`email`),
  KEY `ix_empresas_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'GONDEV','12345678000100','guilherme-justiniano@hotmail.com','16992829942','/uploads/logos/55369b68a74348298e26c097bd2de40f.png','basica',5,1,'2035-12-31');
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imoveis`
--

DROP TABLE IF EXISTS `imoveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imoveis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empresa_id` int NOT NULL,
  `corretor_id` int DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` text,
  `tipo` varchar(50) DEFAULT NULL,
  `finalidade` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'disponivel',
  `cep` varchar(10) DEFAULT NULL,
  `rua` varchar(255) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `link_maps` text,
  `proprietario_nome` varchar(255) DEFAULT NULL,
  `proprietario_cpf_cnpj` varchar(20) DEFAULT NULL,
  `proprietario_data_nascimento` date DEFAULT NULL,
  `proprietario_telefone` varchar(20) DEFAULT NULL,
  `proprietario_email` varchar(150) DEFAULT NULL,
  `valor_venda` float DEFAULT NULL,
  `valor_locacao` float DEFAULT NULL,
  `valor_iptu` float DEFAULT NULL,
  `valor_condominio` float DEFAULT NULL,
  `link_video` text,
  `observacao_geral` text,
  `casa_tipo` varchar(20) DEFAULT NULL,
  `quartos` int DEFAULT NULL,
  `suites` int DEFAULT NULL,
  `banheiros` int DEFAULT NULL,
  `sala_estar` tinyint(1) DEFAULT '0',
  `sala_jantar` tinyint(1) DEFAULT '0',
  `copa` tinyint(1) DEFAULT '0',
  `cozinha` tinyint(1) DEFAULT '0',
  `vagas_cobertas` int DEFAULT NULL,
  `vagas_descobertas` int DEFAULT NULL,
  `area_construida` float DEFAULT NULL,
  `area_terreno` float DEFAULT NULL,
  `area_livre` float DEFAULT NULL,
  `ap_numero` varchar(20) DEFAULT NULL,
  `ap_bloco` varchar(20) DEFAULT NULL,
  `ap_andar` varchar(10) DEFAULT NULL,
  `tem_elevador` tinyint(1) DEFAULT '0',
  `vagas_demarcadas` tinyint(1) DEFAULT '0',
  `cond_academia` tinyint(1) DEFAULT '0',
  `cond_salao_festas` tinyint(1) DEFAULT '0',
  `cond_piscina` tinyint(1) DEFAULT '0',
  `cond_portaria_24h` tinyint(1) DEFAULT '0',
  `topografia` varchar(20) DEFAULT NULL,
  `frente` float DEFAULT NULL,
  `fundo` float DEFAULT NULL,
  `lateral_esquerda` float DEFAULT NULL,
  `lateral_direita` float DEFAULT NULL,
  `zoneamento` varchar(20) DEFAULT NULL,
  `possui_asfalto` tinyint(1) DEFAULT '0',
  `possui_luz` tinyint(1) DEFAULT '0',
  `possui_esgoto` tinyint(1) DEFAULT '0',
  `possui_agua_encanada` tinyint(1) DEFAULT '0',
  `distancia_asfalto_km` float DEFAULT NULL,
  `distancia_cidade_km` float DEFAULT NULL,
  `area_total_hectares` float DEFAULT NULL,
  `area_total_alqueires` float DEFAULT NULL,
  `area_agricultavel` float DEFAULT NULL,
  `area_pastagem` float DEFAULT NULL,
  `area_inaproveitavel` float DEFAULT NULL,
  `possui_rio` tinyint(1) DEFAULT '0',
  `possui_nascente` tinyint(1) DEFAULT '0',
  `possui_poco_artesiano` tinyint(1) DEFAULT '0',
  `possui_curral` tinyint(1) DEFAULT '0',
  `possui_casa_caseiro` tinyint(1) DEFAULT '0',
  `comercio_tipo` varchar(50) DEFAULT NULL,
  `pe_direito` float DEFAULT NULL,
  `tipo_piso` varchar(50) DEFAULT NULL,
  `vitrine` tinyint(1) DEFAULT '0',
  `banheiro_pne` tinyint(1) DEFAULT '0',
  `rampas_acesso` tinyint(1) DEFAULT '0',
  `tipo_energia` varchar(20) DEFAULT NULL,
  `tem_piscina` tinyint(1) DEFAULT '0',
  `tem_churrasqueira` tinyint(1) DEFAULT '0',
  `tem_portao_eletronico` tinyint(1) DEFAULT '0',
  `tem_ar_condicionado` tinyint(1) DEFAULT '0',
  `tem_armarios` tinyint(1) DEFAULT '0',
  `tem_cerca_eletrica` tinyint(1) DEFAULT '0',
  `aceita_permuta` tinyint(1) DEFAULT '0',
  `aceita_financiamento` tinyint(1) DEFAULT '0',
  `ativo` tinyint(1) DEFAULT '1',
  `criado_em` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `public_token` varchar(64) DEFAULT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '1',
  `endereco` varchar(255) DEFAULT NULL,
  `vagas` int DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `area_hectares` float DEFAULT NULL,
  `referencia_local` varchar(255) DEFAULT NULL,
  `nome_fazenda` varchar(255) DEFAULT NULL,
  `municipio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empresa_id` (`empresa_id`),
  KEY `corretor_id` (`corretor_id`),
  CONSTRAINT `imoveis_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `imoveis_ibfk_2` FOREIGN KEY (`corretor_id`) REFERENCES `corretores` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imoveis`
--

LOCK TABLES `imoveis` WRITE;
/*!40000 ALTER TABLE `imoveis` DISABLE KEYS */;
INSERT INTO `imoveis` VALUES (1,1,1,'Jogo Incríveldsadasdasdsa',NULL,'fazenda','venda','disponivel','','e','','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,'',0.07,NULL,NULL,NULL,NULL,NULL,'',0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,'','','',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,'',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,1,1,'',NULL,'',0,0,0,'',0,0,0,0,0,0,0,0,1,'2026-03-30 23:05:16','abc123teste',1,NULL,NULL,NULL,NULL,'',NULL,NULL);
/*!40000 ALTER TABLE `imoveis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imovel_midias`
--

DROP TABLE IF EXISTS `imovel_midias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imovel_midias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imovel_id` int NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `arquivo_url` varchar(255) NOT NULL,
  `nome_arquivo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `imovel_id` (`imovel_id`),
  KEY `ix_imovel_midias_id` (`id`),
  CONSTRAINT `imovel_midias_ibfk_1` FOREIGN KEY (`imovel_id`) REFERENCES `imoveis` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imovel_midias`
--

LOCK TABLES `imovel_midias` WRITE;
/*!40000 ALTER TABLE `imovel_midias` DISABLE KEYS */;
/*!40000 ALTER TABLE `imovel_midias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `negociacoes`
--

DROP TABLE IF EXISTS `negociacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `negociacoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empresa_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `imovel_id` int NOT NULL,
  `corretor_id` int NOT NULL,
  `valor_imovel` decimal(12,2) NOT NULL,
  `valor_negociado` decimal(12,2) NOT NULL,
  `percentual_lucro` decimal(5,2) NOT NULL,
  `valor_lucro` decimal(12,2) NOT NULL,
  `status` enum('em_negociacao','fechada','cancelada') NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `empresa_id` (`empresa_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `imovel_id` (`imovel_id`),
  KEY `corretor_id` (`corretor_id`),
  KEY `ix_negociacoes_id` (`id`),
  CONSTRAINT `negociacoes_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `negociacoes_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `negociacoes_ibfk_3` FOREIGN KEY (`imovel_id`) REFERENCES `imoveis` (`id`),
  CONSTRAINT `negociacoes_ibfk_4` FOREIGN KEY (`corretor_id`) REFERENCES `corretores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `negociacoes`
--

LOCK TABLES `negociacoes` WRITE;
/*!40000 ALTER TABLE `negociacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `negociacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propostas`
--

DROP TABLE IF EXISTS `propostas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propostas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `imovel_id` int NOT NULL,
  `empresa_id` int NOT NULL,
  `valor_ofertado` decimal(12,2) NOT NULL,
  `status` enum('pendente','aceita','recusada') NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `imovel_id` (`imovel_id`),
  KEY `empresa_id` (`empresa_id`),
  KEY `ix_propostas_id` (`id`),
  CONSTRAINT `propostas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `propostas_ibfk_2` FOREIGN KEY (`imovel_id`) REFERENCES `imoveis` (`id`),
  CONSTRAINT `propostas_ibfk_3` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propostas`
--

LOCK TABLES `propostas` WRITE;
/*!40000 ALTER TABLE `propostas` DISABLE KEYS */;
INSERT INTO `propostas` VALUES (1,2,1,1,5000.00,'pendente','2026-03-21 03:49:46');
/*!40000 ALTER TABLE `propostas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_admins`
--

DROP TABLE IF EXISTS `super_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `ix_super_admins_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_admins`
--

LOCK TABLES `super_admins` WRITE;
/*!40000 ALTER TABLE `super_admins` DISABLE KEYS */;
INSERT INTO `super_admins` VALUES (1,'Master','master@sistema.com','$2b$12$2BLzUMx8FEUfEX11ipRIj.g2qbt0OGBZirLb4/4eezSo.YKdtU4L2',1);
/*!40000 ALTER TABLE `super_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitas`
--

DROP TABLE IF EXISTS `visitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `imovel_id` int DEFAULT NULL,
  `corretor_id` int NOT NULL,
  `empresa_id` int NOT NULL,
  `data_visita` datetime NOT NULL,
  `observacoes` text,
  `status` enum('agendada','realizada','cancelada') NOT NULL,
  `tipo` varchar(20) NOT NULL DEFAULT 'visita',
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `imovel_id` (`imovel_id`),
  KEY `corretor_id` (`corretor_id`),
  KEY `empresa_id` (`empresa_id`),
  KEY `ix_visitas_id` (`id`),
  CONSTRAINT `visitas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `visitas_ibfk_2` FOREIGN KEY (`imovel_id`) REFERENCES `imoveis` (`id`),
  CONSTRAINT `visitas_ibfk_3` FOREIGN KEY (`corretor_id`) REFERENCES `corretores` (`id`),
  CONSTRAINT `visitas_ibfk_4` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitas`
--

LOCK TABLES `visitas` WRITE;
/*!40000 ALTER TABLE `visitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-01  1:29:06
