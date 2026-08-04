CREATE DATABASE  IF NOT EXISTS `yytxjdy` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `yytxjdy`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 192.168.2.101    Database: yytxjdy
-- ------------------------------------------------------
-- Server version	5.1.69-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_admin`
--

DROP TABLE IF EXISTS `account_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL COMMENT '所属商务公司ID',
  `pid` int(11) DEFAULT '0' COMMENT '父帐号ID',
  `account` varchar(45) DEFAULT NULL COMMENT '帐号名称',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `permission` tinytext COMMENT '权限（系统）',
  `name` varchar(45) DEFAULT '' COMMENT '真实姓名',
  `gender` tinyint(4) DEFAULT '1' COMMENT '性别1男、2女',
  `position` varchar(45) DEFAULT NULL COMMENT '职务',
  `phone` varchar(45) DEFAULT '' COMMENT '联系电话',
  `mobile` bigint(11) DEFAULT NULL COMMENT '手机',
  `email` varchar(64) DEFAULT '',
  `qq` int(11) DEFAULT NULL,
  `remark` varchar(125) DEFAULT '' COMMENT '备注',
  `type` tinyint(4) DEFAULT NULL COMMENT '帐号类型1.总公司,2.商务公司，3.管理',
  `status` tinyint(4) DEFAULT NULL COMMENT '帐号状态1.正常，2.禁用，3.删除',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='管理员帐号表（总公司、商务公司、系统管理）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_admin`
--

LOCK TABLES `account_admin` WRITE;
/*!40000 ALTER TABLE `account_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_customer`
--

DROP TABLE IF EXISTS `account_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL COMMENT '所属商务公司ID',
  `customer_org_id` int(11) DEFAULT NULL COMMENT '客户的公司、组织ID',
  `pid` int(11) DEFAULT '0' COMMENT '父帐号ID',
  `is_manager` tinyint(4) DEFAULT '0' COMMENT '是否负责人帐号0.否，1.是',
  `name` varchar(45) DEFAULT NULL COMMENT '员工姓名',
  `gender` tinyint(4) DEFAULT '1' COMMENT '性别1男、2女',
  `code` varchar(45) DEFAULT '' COMMENT '员工编号',
  `phone` varchar(45) DEFAULT '' COMMENT '电话号码',
  `mobile` bigint(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(64) DEFAULT '' COMMENT '电子邮箱',
  `qq` int(11) DEFAULT NULL COMMENT 'QQ号码',
  `position` varchar(45) DEFAULT '' COMMENT '职务',
  `remark` varchar(125) DEFAULT '' COMMENT '备注',
  `account` varchar(45) DEFAULT NULL COMMENT '登录帐号',
  `password` varchar(64) DEFAULT NULL COMMENT '登录密码',
  `lastlogin` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `lastip` bigint(20) DEFAULT '0' COMMENT '最后登录IP',
  `status` tinyint(4) DEFAULT NULL COMMENT '帐号状态（0.新建，1.启用，2.禁用，3.删除）',
  `permission` tinytext COMMENT '权限',
  `credit_id` int(11) DEFAULT NULL COMMENT '信用策略id',
  `type` tinyint(4) DEFAULT '6' COMMENT '帐号类型(6.客户)',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='用户帐号表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_customer`
--

LOCK TABLES `account_customer` WRITE;
/*!40000 ALTER TABLE `account_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_supplier`
--

DROP TABLE IF EXISTS `account_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属商务公司ID',
  `supplier_org_id` int(11) DEFAULT NULL COMMENT '供应商/服务商的公司、组织ID',
  `pid` int(11) DEFAULT '0' COMMENT '父帐号ID',
  `name` varchar(45) DEFAULT '' COMMENT '员工姓名',
  `gender` tinyint(4) DEFAULT '1' COMMENT '性别1男、2女',
  `code` varchar(45) DEFAULT '' COMMENT '员工编号',
  `phone` varchar(45) DEFAULT '' COMMENT '电话号码',
  `mobile` bigint(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(64) DEFAULT '' COMMENT '电子邮箱',
  `qq` int(11) DEFAULT NULL COMMENT 'QQ号码',
  `position` varchar(45) DEFAULT '' COMMENT '职务',
  `remark` varchar(125) DEFAULT '' COMMENT '备注',
  `account` varchar(45) DEFAULT NULL COMMENT '登录帐号',
  `password` varchar(64) DEFAULT NULL COMMENT '登录密码',
  `lastlogin` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `lastip` bigint(20) DEFAULT '0' COMMENT '最后登录IP',
  `status` tinyint(4) DEFAULT NULL COMMENT '帐号状态（1正常，2禁用，3删除）',
  `permission` tinytext COMMENT '权限',
  `type` tinyint(4) DEFAULT NULL COMMENT '帐号类型（4.供应商,5.服务商）',
  `contract` varchar(255) DEFAULT NULL COMMENT '合同地址',
  `logo` varchar(255) DEFAULT NULL COMMENT 'logo地址',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='供应商/服务商帐号表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_supplier`
--

LOCK TABLES `account_supplier` WRITE;
/*!40000 ALTER TABLE `account_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `balance_apply_record`
--

DROP TABLE IF EXISTS `balance_apply_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance_apply_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL COMMENT '客户帐号ID(主帐号)',
  `org_id` int(11) DEFAULT NULL COMMENT '用户所属商务公司ID',
  `amount` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `creator_id` int(11) DEFAULT NULL COMMENT '录入者的ID',
  `creator_type` tinyint(4) DEFAULT NULL COMMENT '创建者类型（1.总公司，2.商务公司，6.客户）',
  `op_id` int(11) DEFAULT '0' COMMENT '操作员ID(0为系统)',
  `op_type` tinyint(4) DEFAULT '0' COMMENT '1,总公司财务确认到账录入、2,用户（线上操作）',
  `financial_account_id` int(11) DEFAULT '0' COMMENT '入账到哪个帐号了（总公司分配给商务公司的财务帐号里面选）',
  `balance_online_payment_id` int(11) DEFAULT '0' COMMENT '线上汇款操作对应的记录ID',
  `evidence` varchar(255) DEFAULT '' COMMENT '凭据保存地址',
  `apply_type` tinyint(4) DEFAULT NULL COMMENT '入账申请来源（1.线上，2.线下）',
  `status` int(11) DEFAULT NULL COMMENT '1.新建，2.审核通过，3.审核不通过',
  `currency_id` int(11) DEFAULT NULL COMMENT '币种',
  `transfer_day` datetime DEFAULT NULL COMMENT '转账日期',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='预付款入账申请记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balance_apply_record`
--

LOCK TABLES `balance_apply_record` WRITE;
/*!40000 ALTER TABLE `balance_apply_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `balance_apply_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `balance_online_payment`
--

DROP TABLE IF EXISTS `balance_online_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance_online_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL COMMENT '客户主帐号ID',
  `org_id` int(11) DEFAULT NULL COMMENT '所属商务公司ID',
  `amount` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `pay_type` tinyint(4) DEFAULT '0' COMMENT '在线支付方式（1.支付宝,2.财付通,3.快钱）',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（1.新建,2.成功）',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='在线充值预付款记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balance_online_payment`
--

LOCK TABLES `balance_online_payment` WRITE;
/*!40000 ALTER TABLE `balance_online_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `balance_online_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulletins`
--

DROP TABLE IF EXISTS `bulletins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_org_id` int(11) DEFAULT NULL COMMENT '组织id（任何组织不是特指商务公司）（creator_type=1，to_org_id=0时是整个系统的公告）',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建者帐号id',
  `creator_type` int(11) DEFAULT NULL COMMENT '创建者帐号类型（1.总公司，2.商务公司，）',
  `bulletin` tinytext COMMENT '公告内容',
  `status` tinyint(4) DEFAULT '0' COMMENT '0.草稿，1.可查阅，2.删除',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='公告表（针对某个商务公司全体帐号）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulletins`
--

LOCK TABLES `bulletins` WRITE;
/*!40000 ALTER TABLE `bulletins` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulletins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(45) DEFAULT NULL,
  `pinyin` varchar(64) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `county`
--

DROP TABLE IF EXISTS `county`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `county` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `county` varchar(45) DEFAULT NULL,
  `pinyin` varchar(64) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `county`
--

LOCK TABLES `county` WRITE;
/*!40000 ALTER TABLE `county` DISABLE KEYS */;
/*!40000 ALTER TABLE `county` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_policy`
--

DROP TABLE IF EXISTS `credit_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_policy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_ids` varchar(255) DEFAULT NULL COMMENT '使用该策略的商务公司id集合',
  `name` varchar(45) DEFAULT NULL COMMENT '信用策略名称',
  `creator_account` varchar(45) DEFAULT NULL COMMENT '创建者帐号（总公司员工ID）',
  `creator_id` int(11) DEFAULT '0' COMMENT '创建者ID（总公司员工ID）',
  `auditor_id` int(11) DEFAULT '0' COMMENT '审核者ID（总公司员工ID）',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '信用额度',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) DEFAULT NULL COMMENT '0.新建，1.启用，2.禁用，3.删除',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='信用策略';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_policy`
--

LOCK TABLES `credit_policy` WRITE;
/*!40000 ALTER TABLE `credit_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '币种名称',
  `code` varchar(25) DEFAULT NULL COMMENT '货币符号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='币种表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_wallet`
--

DROP TABLE IF EXISTS `customer_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL COMMENT '客户账号ID',
  `credit` decimal(10,2) DEFAULT NULL COMMENT '信用余额',
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '预付款',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='客户钱包（记录资金变动）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_wallet`
--

LOCK TABLES `customer_wallet` WRITE;
/*!40000 ALTER TABLE `customer_wallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_wallet_record`
--

DROP TABLE IF EXISTS `customer_wallet_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_wallet_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '资金额度',
  `type` tinyint(4) DEFAULT NULL COMMENT '操作类型1.预定，2.退订，3.订单变更，4.充值，5.调整信用额等级',
  `op_id` int(11) DEFAULT '0' COMMENT '操作员ID（针对订单类型）',
  `order_id` int(11) DEFAULT '0' COMMENT '订单ID（针对订单类型）',
  `remark` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='客户信用余额变化记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_wallet_record`
--

LOCK TABLES `customer_wallet_record` WRITE;
/*!40000 ALTER TABLE `customer_wallet_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_wallet_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_account`
--

DROP TABLE IF EXISTS `financial_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financial_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank` varchar(125) DEFAULT NULL COMMENT '开户行',
  `bank_id` varchar(45) DEFAULT NULL COMMENT '银行帐号/卡号',
  `bank_user` varchar(45) DEFAULT NULL COMMENT '开户行帐号名称',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '资金总额',
  `currency_id` int(11) DEFAULT NULL COMMENT '货币ID',
  `remark` varchar(125) DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='总公司银行/在线支付结算账户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_account`
--

LOCK TABLES `financial_account` WRITE;
/*!40000 ALTER TABLE `financial_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `financial_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_detail`
--

DROP TABLE IF EXISTS `financial_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financial_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '应收来源订单ID(应收项有可能是利息)',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户帐号ID（客户主账号）',
  `org_id` int(11) DEFAULT NULL COMMENT '商务公司ID(客户是哪个商务公司管辖)',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `total_price` decimal(10,2) DEFAULT NULL COMMENT '订单总价',
  `total_transaction_fee` decimal(10,2) DEFAULT NULL COMMENT '通道费总价',
  `total_service_fee` decimal(10,2) DEFAULT NULL COMMENT '服务费总价',
  `total_cost` decimal(10,2) DEFAULT NULL COMMENT '总成本价',
  `status` tinyint(4) DEFAULT '1' COMMENT '1.新建，2.结转',
  `currency_id` int(11) DEFAULT NULL COMMENT '币种',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='应收、应付款项明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_detail`
--

LOCK TABLES `financial_detail` WRITE;
/*!40000 ALTER TABLE `financial_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `financial_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_fund_record`
--

DROP TABLE IF EXISTS `financial_fund_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financial_fund_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '与amount_type相关，仅在amount_type为3,7有意义',
  `account_id` int(11) DEFAULT NULL COMMENT '与amount_type相关，仅在amount_type为1，4，5为对应帐号的ID',
  `amount_type` tinyint(4) DEFAULT NULL COMMENT '资金类型1.客户充值，2.利息收入，3.资金调入，4.出款给供应商，5.出款给商务公司，6.出款给总公司，7.资金调出，8.手续费',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建者ID(0为系统,一般是财务/出纳的ID)',
  `bank_account_id` int(11) DEFAULT NULL COMMENT '银行账户',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '金额(记录对应的正负值)',
  `remark` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0.新建，1.正常，2.删除',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='资金记录表(用于记录现金的出入记录)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_fund_record`
--

LOCK TABLES `financial_fund_record` WRITE;
/*!40000 ALTER TABLE `financial_fund_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `financial_fund_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_statement`
--

DROP TABLE IF EXISTS `financial_statement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financial_statement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL COMMENT '供应商/客户/商务公司/总公司的ID',
  `account_type` tinyint(4) DEFAULT NULL COMMENT '帐号类型(1.总公司，2.商务公司，4.供应商， 6.客户)',
  `org_id` int(11) DEFAULT NULL COMMENT '商务公司ID(客户/供应商是哪个商务公司管辖)',
  `total_price` decimal(10,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '款项状态(1.新建，2.划账成功，3.划账失败)',
  `currency_id` int(11) DEFAULT NULL COMMENT '币种',
  `payment_day` datetime DEFAULT NULL COMMENT '划账日期',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='月结单（对于总公司来说）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_statement`
--

LOCK TABLES `financial_statement` WRITE;
/*!40000 ALTER TABLE `financial_statement` DISABLE KEYS */;
/*!40000 ALTER TABLE `financial_statement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_virtual_account`
--

DROP TABLE IF EXISTS `financial_virtual_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financial_virtual_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL COMMENT '帐号id',
  `account_type` tinyint(4) DEFAULT NULL COMMENT '帐号类型(1.总公司，2.商务公司，4.供应商，6.客户)',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '资金',
  `transaction_fee` decimal(10,2) DEFAULT '0.00' COMMENT '通道费，(仅帐号type=2时才有相应记录，总公司的钱)',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='虚拟账户(用于记录每种帐号下面的应有资金)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_virtual_account`
--

LOCK TABLES `financial_virtual_account` WRITE;
/*!40000 ALTER TABLE `financial_virtual_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `financial_virtual_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry`
--

DROP TABLE IF EXISTS `inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquiry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL COMMENT '资源id',
  `resource_price_id` int(11) DEFAULT NULL COMMENT '资源报价id',
  `resource_everyday_price_id` int(11) DEFAULT NULL COMMENT '资源每日报价id',
  `org_id` int(11) DEFAULT NULL COMMENT '所属商务公司id',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商id',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建者id（客户）',
  `op_id` int(11) DEFAULT NULL COMMENT '供应商处理者ID',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '报价单价',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `remark` tinytext COMMENT '报价说明',
  `status` tinyint(4) DEFAULT '1' COMMENT '询价单状态（1.新建。2.供应商修改。3.客户拒绝。4.客户确认）',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='虚拟账户(用于记录每种帐号下面的应有资金)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry`
--

LOCK TABLES `inquiry` WRITE;
/*!40000 ALTER TABLE `inquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_login`
--

DROP TABLE IF EXISTS `log_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL COMMENT '组织ID',
  `account_id` int(11) DEFAULT NULL COMMENT '帐号ID',
  `account_type` tinyint(4) DEFAULT NULL COMMENT '帐号类型（1.总公司，2.商务公司，3.管理，4.供应商，5.服务商，6.用户）',
  `logintype` tinyint(4) DEFAULT NULL COMMENT '登录类型1.登录2.退出',
  `time` int(11) DEFAULT NULL COMMENT '登录时间',
  `ip` bigint(20) DEFAULT NULL COMMENT '登录IP',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='登录日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_login`
--

LOCK TABLES `log_login` WRITE;
/*!40000 ALTER TABLE `log_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_orders_op`
--

DROP TABLE IF EXISTS `log_orders_op`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_orders_op` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `order_history_id` int(11) DEFAULT NULL COMMENT '订单历史记录ID',
  `org_id` int(11) DEFAULT NULL COMMENT '操作员商务公司ID',
  `op_id` int(11) DEFAULT NULL COMMENT '操作员ID',
  `op_type` tinyint(4) DEFAULT NULL COMMENT '操作员帐号类型（1.总公司，2.商务公司，3.管理，4.供应商，5.服务商，6.用户）',
  `remark` tinytext COMMENT '具体操作描述',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='订单操作记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_orders_op`
--

LOCK TABLES `log_orders_op` WRITE;
/*!40000 ALTER TABLE `log_orders_op` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_orders_op` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_system`
--

DROP TABLE IF EXISTS `log_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL COMMENT '组织/公司ID，当前记录是属于哪个组织对应的账号操作引起的',
  `account_id` int(11) DEFAULT NULL COMMENT '帐号ID。供应商/客户/商务公司/总公司的ID',
  `account_type` int(11) DEFAULT NULL COMMENT '帐号类型',
  `account` varchar(45) DEFAULT NULL COMMENT '帐号',
  `name` varchar(45) DEFAULT '' COMMENT '姓名',
  `remark` tinytext,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='系统操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_system`
--

LOCK TABLES `log_system` WRITE;
/*!40000 ALTER TABLE `log_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_log`
--

DROP TABLE IF EXISTS `message_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) DEFAULT NULL,
  `to_account_id` int(11) DEFAULT NULL COMMENT '接受者帐号id',
  `to_account_type` tinyint(4) DEFAULT NULL COMMENT '帐号类型（2.商务公司，4.供应商，5.服务商，6.客户）',
  `status` tinyint(4) DEFAULT NULL COMMENT '1.已阅，2.删除',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='站内消息记录表（用于记录群组消息的查阅、删除状态）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_log`
--

LOCK TABLES `message_log` WRITE;
/*!40000 ALTER TABLE `message_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL COMMENT '商务公司组织ID',
  `to_account_id` int(11) DEFAULT NULL COMMENT '接受者帐号id',
  `to_account_type` tinyint(4) DEFAULT NULL COMMENT '帐号类型（2.商务公司，4.供应商，5.服务商，6.客户）',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建者帐号id',
  `creator_type` tinyint(4) DEFAULT NULL COMMENT '创建者帐号类型（0.系统，1.总公司，2.商务公司，）',
  `group_type` tinyint(4) DEFAULT NULL COMMENT '群组类别0.非群组消息，2.商务公司，4.供应商，5.服务商，6.客户',
  `message` tinytext COMMENT '消息内容',
  `message_type` tinyint(4) DEFAULT '1' COMMENT '消息类型，1.个人消息(私信)，2.群组消息',
  `status` tinyint(4) DEFAULT NULL COMMENT '0.草稿，1.可查阅，2.已阅，3.删除（仅针对私信）',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='站内消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '主订单ID',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建者ID',
  `everyday_price_snapshot_id` int(11) DEFAULT NULL COMMENT '每日报价快照ID',
  `price` decimal(10,2) DEFAULT NULL COMMENT '资源单价',
  `num` varchar(45) DEFAULT NULL COMMENT '资源数量',
  `cost` decimal(10,2) DEFAULT NULL COMMENT '成本价',
  `transaction_fee` decimal(10,2) DEFAULT NULL COMMENT '通道费单价',
  `service_fee` decimal(10,2) DEFAULT NULL COMMENT '服务费单价',
  `status` tinyint(4) DEFAULT NULL COMMENT '订单状态(1.新订单，2.供应商已确认， 3.供应商否决，4.客户修改)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sys_type` int(11) DEFAULT NULL COMMENT '系统大类，方便查询用',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='订单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail_history`
--

DROP TABLE IF EXISTS `order_detail_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` datetime DEFAULT NULL COMMENT '记录orders的modified方便回滚',
  `order_detail_id` int(11) DEFAULT NULL COMMENT '订单详细ID',
  `order_id` int(11) DEFAULT NULL COMMENT '主订单ID',
  `creator_id` int(11) DEFAULT NULL COMMENT '操作员ID',
  `everyday_price_snapshot_id` int(11) DEFAULT NULL COMMENT '每日报价快照ID',
  `price` decimal(10,2) DEFAULT NULL COMMENT '资源单价',
  `num` varchar(45) DEFAULT NULL COMMENT '资源数量',
  `cost` decimal(10,2) DEFAULT NULL COMMENT '成本价',
  `transaction_fee` decimal(10,2) DEFAULT NULL COMMENT '通道费单价',
  `service_fee` decimal(10,2) DEFAULT NULL COMMENT '服务费单价',
  `status` tinyint(4) DEFAULT NULL COMMENT '订单状态(1.新订单，2.供应商已确认， 3.供应商否决)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sys_type` int(11) DEFAULT NULL COMMENT '系统大类，方便查询用',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='订单变更记录明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail_history`
--

LOCK TABLES `order_detail_history` WRITE;
/*!40000 ALTER TABLE `order_detail_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_history`
--

DROP TABLE IF EXISTS `order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` datetime DEFAULT NULL COMMENT '记录order_main的modified方便回滚',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `order_main_id` varchar(20) DEFAULT NULL COMMENT '主订单ID',
  `num` int(11) DEFAULT NULL COMMENT '资源购买数量',
  `total_transaction_fee` decimal(10,2) DEFAULT '0.00' COMMENT '通道费总价(总公司的分成)',
  `total_service_charge` decimal(10,2) DEFAULT NULL COMMENT '服务费总价(商务公司的分成)',
  `total_price` decimal(10,2) DEFAULT NULL COMMENT '订单总价',
  `starttime` time DEFAULT NULL COMMENT '使用开始时间',
  `endtime` time DEFAULT NULL COMMENT '使用结束时间',
  `use_date` datetime DEFAULT NULL COMMENT '资源使用日期',
  `end_use_time` datetime DEFAULT NULL COMMENT '资源结束使用具体时间',
  `cancel_day` int(11) DEFAULT NULL COMMENT '取消提前天数',
  `cancellation_fee` decimal(10,2) DEFAULT NULL COMMENT '过期取消手续费单价',
  `cancellation_fee_rate` float(4,2) DEFAULT NULL COMMENT '过期取消手续费比例',
  `cancellation_fee_type` float(4,2) DEFAULT NULL COMMENT '手续费适用类型型（1. 按单价收2.按比例收）',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单状态(1.新订单，2.已确认， 3.客户修改， 4.供应商修改，5.订单锁定，6.已结转，7.取消）',
  `change_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单变更状态每次确认或者回滚这个状态都要归0（1.客户修改。2.客户申请退订。3.供应商修改。4.供应商申请退订）',
  `remark` varchar(255) DEFAULT '',
  `type` tinyint(4) DEFAULT NULL COMMENT '1.正常订单，2.滞纳金，3.询价订单',
  `currency_id` int(11) DEFAULT NULL COMMENT '币种',
  `sys_type` int(11) DEFAULT NULL COMMENT '系统大类，方便查询用',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_history`
--

LOCK TABLES `order_history` WRITE;
/*!40000 ALTER TABLE `order_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_main`
--

DROP TABLE IF EXISTS `order_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '父订单ID（针对退单罚款的类型）',
  `order_sn` varchar(20) DEFAULT NULL COMMENT '订单号',
  `group_sn` varchar(20) DEFAULT '' COMMENT '订单绑定的团号',
  `from_id` int(11) DEFAULT '0' COMMENT ' 订单来源ID（针对罚息、询价类型的订单）',
  `org_id` int(11) DEFAULT NULL COMMENT ' 客户所属商务公司ID',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `supplier_org_id` int(11) DEFAULT NULL COMMENT '供应商组织ID',
  `service_id` int(11) DEFAULT NULL COMMENT '服务商ID',
  `service_org_id` int(11) DEFAULT NULL COMMENT '服务商组织ID',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户负责人ID',
  `creator_id` int(11) DEFAULT NULL COMMENT '（客户）创建者ID',
  `customer_org_id` int(11) DEFAULT NULL COMMENT '客户负责人所属组织ID',
  `resource_price_id` int(11) DEFAULT NULL COMMENT '资源报价ID',
  `resource_price_name` varchar(64) DEFAULT NULL COMMENT '资源报价名称',
  `total_price` decimal(10,2) DEFAULT NULL COMMENT '订单总价',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单状态(1.新订单，2.已确认， 3.修改，4.锁定(待结转)，5.已结转，6.取消）',
  `remark` varchar(255) DEFAULT '',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1.正常订单，2.滞纳金，3.询价订单',
  `currency_id` int(11) DEFAULT NULL COMMENT '币种',
  `sys_type` int(11) NOT NULL COMMENT '资源对应的系统类别',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_main`
--

LOCK TABLES `order_main` WRITE;
/*!40000 ALTER TABLE `order_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_verify_code`
--

DROP TABLE IF EXISTS `order_verify_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_verify_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_main_id` int(11) DEFAULT NULL COMMENT '主订单ID',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `customer_code` int(11) DEFAULT NULL COMMENT '客户验证码',
  `supplier_code` int(11) DEFAULT NULL COMMENT '供应商验证码',
  `status` tinyint(4) NOT NULL COMMENT '验证码状态（1.新建，2.已使用，3.已过期）',
  `invalid` datetime DEFAULT NULL COMMENT '失效时间',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_verify_code`
--

LOCK TABLES `order_verify_code` WRITE;
/*!40000 ALTER TABLE `order_verify_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_verify_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_main_id` int(11) DEFAULT NULL COMMENT '主订单ID',
  `num` int(11) DEFAULT NULL COMMENT '资源购买数量',
  `total_transaction_fee` decimal(10,2) DEFAULT '0.00' COMMENT '通道费总价(总公司的分成)',
  `total_service_fee` decimal(10,2) DEFAULT NULL COMMENT '服务费总价(商务公司的分成)',
  `total_price` decimal(10,2) DEFAULT NULL COMMENT '订单总价',
  `starttime` time DEFAULT NULL COMMENT '使用开始时间',
  `endtime` time DEFAULT NULL COMMENT '使用结束时间',
  `use_date` datetime DEFAULT NULL COMMENT '资源使用日期',
  `end_use_time` datetime DEFAULT NULL COMMENT '资源结束使用具体时间',
  `cancel_day` int(11) DEFAULT NULL COMMENT '取消提前天数',
  `cancellation_fee` decimal(10,2) DEFAULT NULL COMMENT '过期取消手续费单价',
  `cancellation_fee_rate` float(4,2) DEFAULT NULL COMMENT '过期取消手续费比例',
  `cancellation_fee_type` float(4,2) DEFAULT NULL COMMENT '手续费适用类型型（1. 按单价收2.按比例收）',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单状态(1.新订单，2.已确认， 3.客户加订， 4.客户减订，5.客户退订，6.客户申请免罚退订，7.供应商加订，8.供应商减订，9.供应商退订，10.锁单，11.已结转，12.取消）',
  `remark` varchar(255) DEFAULT '',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1.正常订单，2.滞纳金，3.询价订单',
  `currency_id` int(11) DEFAULT NULL COMMENT '币种',
  `sys_type` int(11) NOT NULL COMMENT '资源对应的系统类别',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '父id',
  `name` varchar(125) NOT NULL DEFAULT '' COMMENT '公司名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '公司地址',
  `province_id` int(11) NOT NULL COMMENT '省ID',
  `city_id` int(11) NOT NULL COMMENT '市/县ID',
  `county_id` int(11) NOT NULL COMMENT '区ID',
  `phone` varchar(45) DEFAULT '' COMMENT '电话(固话或者手机)',
  `fax` varchar(45) DEFAULT '' COMMENT '传真',
  `postcode` int(11) DEFAULT '0' COMMENT '邮编',
  `email` varchar(64) DEFAULT '',
  `currency_id` int(11) DEFAULT NULL COMMENT '使用币种（商务公司）',
  `bank` varchar(125) DEFAULT NULL COMMENT '开户行',
  `bank_id` varchar(45) DEFAULT NULL COMMENT '银行帐号/卡号',
  `bank_user` varchar(45) DEFAULT NULL COMMENT '开户行帐号名称',
  `remark` varchar(255) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL COMMENT '创建者ID',
  `creator_type` tinyint(4) DEFAULT NULL COMMENT '创建者账号类型1.总公司，2.商务公司，4.供应商',
  `auditor_id` int(11) DEFAULT NULL COMMENT '商务公司审核人员ID（针对服务商组织信息。其他类型的是线下审核通过直接录入的）',
  `org_type` tinyint(4) DEFAULT NULL COMMENT '组织类型(1.总公司。2.商务公司。3管理公司。4供应商公司。5.服务商公司。6.客户公司)',
  `payment_days` int(11) DEFAULT NULL COMMENT '划账周期(org_type=2时是指该商务公司的所有客户的划账周期。org_type=4时是指该供应商的划账周期)',
  `financial_account_id` int(11) DEFAULT NULL COMMENT '财务帐号ID（总公司分配的管理商务公司的财务的帐号ID）',
  `cashier_id` int(11) DEFAULT NULL COMMENT '出纳帐号ID(总公司分配的管理商务公司出纳帐号ID)',
  `status` tinyint(4) DEFAULT NULL COMMENT '组织状态（0.新建，1正常，2禁用，3删除）',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='组织架构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overdue_payment_policy`
--

DROP TABLE IF EXISTS `overdue_payment_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overdue_payment_policy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cycle` int(11) DEFAULT NULL COMMENT '周期时长(单位:天)',
  `percent` float(5,3) DEFAULT NULL COMMENT '罚息比例',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) DEFAULT NULL COMMENT '1.启用，2.禁用',
  `is_customer_suspended` tinyint(4) DEFAULT NULL COMMENT '是否停用系统(1.否，2.是)',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='滞纳金策略表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overdue_payment_policy`
--

LOCK TABLES `overdue_payment_policy` WRITE;
/*!40000 ALTER TABLE `overdue_payment_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `overdue_payment_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overdue_payment_policy_org`
--

DROP TABLE IF EXISTS `overdue_payment_policy_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overdue_payment_policy_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL COMMENT '商务公司ID',
  `overdue_payment_policy_id` int(11) DEFAULT NULL COMMENT '罚息条款ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='滞纳金策略-商务公司使用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overdue_payment_policy_org`
--

LOCK TABLES `overdue_payment_policy_org` WRITE;
/*!40000 ALTER TABLE `overdue_payment_policy_org` DISABLE KEYS */;
/*!40000 ALTER TABLE `overdue_payment_policy_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='价格策略表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_policy`
--

DROP TABLE IF EXISTS `price_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_policy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_type` int(11) DEFAULT NULL COMMENT '策略对应的资源分类（系统大类）',
  `name` varchar(45) DEFAULT NULL COMMENT '策略名称',
  `org_ids` varchar(255) DEFAULT NULL COMMENT '分配给哪些商务公司（针对通道费）',
  `org_id` int(11) DEFAULT '0' COMMENT '所属商务公司（针对服务费）',
  `is_default` tinyint(4) DEFAULT '2' COMMENT '是否默认的策略1.默认，2.非默认',
  `creator_account` varchar(45) DEFAULT NULL COMMENT '创建者帐号',
  `creator_id` int(11) DEFAULT '0' COMMENT '创建者ID',
  `auditor_id` int(11) DEFAULT '0' COMMENT '审核者ID（总公司员工ID）',
  `addtion_fee` decimal(10,2) DEFAULT '0.00' COMMENT '附加费(单件资源要加的固定费用)',
  `addtion_fee_rate` float(4,2) DEFAULT '0.00' COMMENT '附加费用折扣',
  `policy_type` tinyint(4) DEFAULT NULL COMMENT '策略类型（1.通道费，2.服务费）',
  `type` tinyint(4) DEFAULT NULL COMMENT '启用哪个计价方式1.addtion_fee,2.addtion_fee_rate',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) DEFAULT '1' COMMENT '策略状态（1.新建，2.审核通过，3.审核不通过，4.禁用，5.删除）',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='价格策略表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_policy`
--

LOCK TABLES `price_policy` WRITE;
/*!40000 ALTER TABLE `price_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `price_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_policy_supplier`
--

DROP TABLE IF EXISTS `price_policy_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_policy_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price_policy_id` int(11) NOT NULL COMMENT '对应价格策略ID',
  `addtion_fee` decimal(10,2) NOT NULL COMMENT '附加费',
  `addtion_fee_rate` float(4,2) NOT NULL COMMENT '附加费用折扣',
  `sys_type` int(11) DEFAULT '1' COMMENT '适用分类(系统大类)',
  `policy_type` tinyint(4) DEFAULT NULL COMMENT '策略类型（1.通道费，2.服务费）',
  `type` tinyint(4) DEFAULT NULL COMMENT '启用哪个计价方式1.addtion_fee,2.addtion_fee_rate',
  `resource_id` int(11) DEFAULT NULL COMMENT '资源ID\n仅在type=2时有效，针对某个具体的资源设置的价格策略',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `org_id` int(11) DEFAULT NULL COMMENT '策略适用组织ID',
  `status` tinyint(4) DEFAULT NULL COMMENT '价格策略状态\n1.正常，2.禁用，3.删除',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='价格策略-供应商对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_policy_supplier`
--

LOCK TABLES `price_policy_supplier` WRITE;
/*!40000 ALTER TABLE `price_policy_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `price_policy_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(45) NOT NULL,
  `pinyin` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_everyday_price`
--

DROP TABLE IF EXISTS `resource_everyday_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_everyday_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_price_id` int(11) DEFAULT NULL COMMENT '报价ID',
  `org_id` int(11) DEFAULT NULL COMMENT '所属商务公司ID',
  `group_num` int(11) DEFAULT NULL COMMENT '团价起订量',
  `num` int(11) DEFAULT NULL COMMENT '资源数量',
  `group_show` decimal(10,2) DEFAULT NULL COMMENT '团价销售价',
  `single_show` decimal(10,2) DEFAULT NULL COMMENT '散价销售价',
  `group_cost` decimal(10,2) DEFAULT NULL COMMENT '团价结算价',
  `single_cost` decimal(10,2) DEFAULT NULL COMMENT '散价结算价',
  `group_transaction_fee` decimal(10,2) DEFAULT NULL COMMENT '团价通道费',
  `single_transaction_fee` decimal(10,2) DEFAULT NULL COMMENT '散价通道费',
  `group_service_fee` decimal(10,2) DEFAULT NULL COMMENT '团价服务费',
  `single_service_fee` decimal(10,2) DEFAULT NULL COMMENT '散价服务费',
  `enduser_price` decimal(10,2) DEFAULT NULL COMMENT '门市价',
  `sys_type` int(11) DEFAULT NULL COMMENT '系统大类，方便查询用',
  `cancel_policy` varchar(255) DEFAULT NULL COMMENT '取消条款',
  `creator_id` int(11) DEFAULT NULL COMMENT '供应商ID/OPID',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='每日定价(其他费用实时计算)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_everyday_price`
--

LOCK TABLES `resource_everyday_price` WRITE;
/*!40000 ALTER TABLE `resource_everyday_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_everyday_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_everyday_price_snapshoot`
--

DROP TABLE IF EXISTS `resource_everyday_price_snapshoot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_everyday_price_snapshoot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_everyday_price_id` int(11) DEFAULT NULL COMMENT '资源每日报价ID',
  `resource_everyday_price_info` text COMMENT '每日报价完整信息。用json数据保存',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='资源每日报价快照表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_everyday_price_snapshoot`
--

LOCK TABLES `resource_everyday_price_snapshoot` WRITE;
/*!40000 ALTER TABLE `resource_everyday_price_snapshoot` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_everyday_price_snapshoot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_fields`
--

DROP TABLE IF EXISTS `resource_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '分类名称',
  `is_top` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否顶级(1是，2否)',
  `path` varchar(45) NOT NULL COMMENT '父级路径',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分类类型（0.默认，1.资源类型，2.报价类型）',
  `is_multi` tinyint(4) DEFAULT NULL COMMENT '子选项是否多选。1.是，2.不是',
  `is_must` tinyint(4) DEFAULT NULL COMMENT '是否必须。（1.是，2.否）',
  `is_leaf` tinyint(4) DEFAULT '0' COMMENT '是否叶子节点（1.是，2.否）',
  `is_show` tinyint(4) DEFAULT '0' COMMENT '是否用于展示（1.是，2.否）',
  `sys_type` tinyint(4) DEFAULT '0' COMMENT '系统大类，设置在配置中sys_type=0时是公共字段。所有类别可以使用',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='资源字段（）表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_fields`
--

LOCK TABLES `resource_fields` WRITE;
/*!40000 ALTER TABLE `resource_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_price`
--

DROP TABLE IF EXISTS `resource_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL COMMENT '省ID',
  `city_id` int(11) NOT NULL COMMENT '市/县ID',
  `county_id` int(11) NOT NULL COMMENT '区ID',
  `org_id` int(11) DEFAULT NULL COMMENT '所属商务公司ID',
  `resource_id` int(11) DEFAULT NULL COMMENT '对应的资源ID',
  `fields` tinytext NOT NULL COMMENT '规格、分类属性（用于保存所属分类的类别）',
  `supplier_id` int(11) NOT NULL COMMENT '供应商ID（录入者）',
  `service_id` int(11) NOT NULL COMMENT '服务商ID',
  `auditor_id` int(11) DEFAULT NULL COMMENT '审核者ID（商务公司员工ID）',
  `creator_id` int(11) DEFAULT NULL COMMENT '供应商ID/OPID',
  `name` varchar(64) NOT NULL COMMENT '报价名称',
  `type` tinyint(4) NOT NULL COMMENT '单项资源还是组合资源（1.单项，2.组合）\n继承自资源',
  `num` int(11) DEFAULT '0' COMMENT '资源数量',
  `single_cost` decimal(10,2) DEFAULT NULL COMMENT '结算价散价参考价',
  `group_cost` decimal(10,2) DEFAULT NULL COMMENT '结算价团价参考价',
  `group_num` int(11) DEFAULT NULL COMMENT '团价起订量',
  `single_show` decimal(10,2) DEFAULT NULL COMMENT '购买时的参考散价',
  `group_show` decimal(10,2) DEFAULT NULL COMMENT '购买时的参考团价',
  `enduser_price` decimal(10,2) DEFAULT NULL COMMENT '门市价',
  `info` tinytext COMMENT '说明',
  `duration_days` tinyint(4) DEFAULT '1' COMMENT '使用持续天数',
  `starttime` time DEFAULT NULL COMMENT '开始使用时间',
  `endtime` time DEFAULT NULL COMMENT '结束使用时间',
  `is_check` tinyint(4) DEFAULT '1' COMMENT '是否需要确认（1.需要，2.不需要）',
  `is_inquiry` tinyint(4) DEFAULT '2' COMMENT '是否需要询价（1.需要，2.不需要）',
  `cancel_policy` varchar(255) DEFAULT NULL COMMENT '取消条款',
  `status` tinyint(4) DEFAULT '0' COMMENT '报价状态（0.未审核，1.审核通过，2.审核不通过）',
  `sys_type` int(11) DEFAULT NULL COMMENT '系统大类，方便查询用',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='资源报价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_price`
--

LOCK TABLES `resource_price` WRITE;
/*!40000 ALTER TABLE `resource_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(125) NOT NULL COMMENT '资源名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '单项资源还是组合资源（1.单项，2.组合）',
  `org_id` int(11) DEFAULT NULL COMMENT '所属商务公司ID',
  `creator_id` int(11) DEFAULT NULL COMMENT '供应商ID（录入者）',
  `auditor_id` int(11) DEFAULT NULL COMMENT '审核者ID（商务公司员工ID）',
  `service_id` int(11) DEFAULT NULL COMMENT '服务商ID',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `province_id` int(11) NOT NULL COMMENT '省ID',
  `city_id` int(11) NOT NULL COMMENT '市/县ID',
  `county_id` int(11) NOT NULL COMMENT '区ID',
  `lat` float(10,6) DEFAULT NULL COMMENT '纬度',
  `lng` float(10,6) DEFAULT NULL COMMENT '经度',
  `contacts` varchar(45) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(45) DEFAULT NULL COMMENT '联系电话',
  `remark` tinytext COMMENT '描述信息',
  `fields` tinytext COMMENT '规格、分类属性（用于保存所属分类以··及属性、规格值对应的ID）',
  `currency_id` int(11) DEFAULT NULL COMMENT '币种',
  `sys_type` int(11) DEFAULT NULL COMMENT '系统大类，方便查询用',
  `status` tinyint(4) DEFAULT NULL COMMENT '0.新建，1.审核通过 2.审核不通过，3.删除',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='资源信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-05 18:00:01
