/*
Navicat MySQL Data Transfer

Source Server         : 195
Source Server Version : 50158
Source Host           : 192.168.0.195:3306
Source Database       : newone

Target Server Type    : MYSQL
Target Server Version : 50158
File Encoding         : 65001

Date: 2013-11-19 13:57:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `action_logs`
-- ----------------------------
DROP TABLE IF EXISTS `action_logs`;
CREATE TABLE `action_logs` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`uid`  int(10) UNSIGNED NOT NULL ,
`uname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`action`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'add|del|edit..' ,
`dateline`  datetime NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='后台操行记录日志'
AUTO_INCREMENT=940

;

-- ----------------------------
-- Table structure for `activities`
-- ----------------------------
DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities` (
`id`  int(8) NOT NULL AUTO_INCREMENT ,
`user_id`  bigint(11) NOT NULL ,
`login`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'å§“å' ,
`email`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'é‚®ç®±' ,
`phone`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'æ‰‹æœº' ,
`code`  int(8) NULL DEFAULT NULL COMMENT 'é‚®ç¼–' ,
`ploy_id`  int(8) NOT NULL ,
`award_id`  int(8) NOT NULL ,
`level_id`  tinyint(4) NOT NULL DEFAULT 0 ,
`create_time`  datetime NOT NULL ,
`status`  tinyint(4) NOT NULL DEFAULT 1 ,
`receive`  tinyint(4) NOT NULL DEFAULT 1 ,
`province`  smallint(5) NOT NULL ,
`city`  smallint(5) NOT NULL ,
`district`  smallint(5) NOT NULL ,
`address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`shipping_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`depot_sn`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`order_id`  bigint(11) NOT NULL DEFAULT 0 ,
`del`  tinyint(4) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`id`),
INDEX `level_id` USING BTREE (`level_id`) ,
INDEX `user_id` USING BTREE (`user_id`) ,
INDEX `create_time` USING BTREE (`create_time`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='大转盘抽奖'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `ad_val`
-- ----------------------------
DROP TABLE IF EXISTS `ad_val`;
CREATE TABLE `ad_val` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`ad_id`  int(11) NOT NULL COMMENT 'å¹¿å‘Šid' ,
`order_id`  bigint(19) NULL DEFAULT 0 COMMENT 'è®¢å•ID' ,
`user_id`  bigint(19) NULL DEFAULT 0 COMMENT 'ç”¨æˆ·ID' ,
`add_time`  datetime NOT NULL COMMENT 'æ·»åŠ æ—¥æœŸ' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='记录广告来源'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `admin_carts`
-- ----------------------------
DROP TABLE IF EXISTS `admin_carts`;
CREATE TABLE `admin_carts` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`user_id`  bigint(11) NULL DEFAULT NULL ,
`user_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`goods_id`  int(11) NULL DEFAULT NULL ,
`shop_price`  decimal(10,2) NULL DEFAULT NULL ,
`market_price`  decimal(10,2) NULL DEFAULT NULL ,
`cost_price`  decimal(10,2) NULL DEFAULT NULL ,
`goods_count`  int(8) NULL DEFAULT NULL ,
`time`  int(10) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `user_id` USING BTREE (`user_id`) ,
INDEX `goods_id` USING BTREE (`goods_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='购物车'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `ads`
-- ----------------------------
DROP TABLE IF EXISTS `ads`;
CREATE TABLE `ads` (
`id`  int(2) NOT NULL AUTO_INCREMENT ,
`title`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`pic`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
COMMENT='消息中心广告'
AUTO_INCREMENT=3

;

-- ----------------------------
-- Table structure for `areas`
-- ----------------------------
DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas` (
`id`  smallint(5) NOT NULL AUTO_INCREMENT ,
`city`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`city_id`  smallint(5) NOT NULL ,
`district`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`district_id`  smallint(5) NOT NULL ,
`nature`  smallint(5) NOT NULL ,
`serive`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`non_service`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
INDEX `city_id` USING BTREE (`city_id`) ,
INDEX `district_id` USING BTREE (`district_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='快递配送地区表'
AUTO_INCREMENT=2117

;

-- ----------------------------
-- Table structure for `articles`
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
`id`  int(10) NOT NULL DEFAULT 1 ,
`cate_id`  int(10) NULL DEFAULT NULL ,
`title`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '大标题' ,
`astitle`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '副标题' ,
`version`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '版本号' ,
`author`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`update_time`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新时间' ,
`desc`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息摘要' ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`links`  int(10) NULL DEFAULT 1 ,
`status`  tinyint(4) NULL DEFAULT 1 COMMENT '1为未读，2为已读' ,
`time`  datetime NULL DEFAULT NULL ,
`sort`  int(10) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='消息中心'

;

-- ----------------------------
-- Table structure for `bonus`
-- ----------------------------
DROP TABLE IF EXISTS `bonus`;
CREATE TABLE `bonus` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`bonus_name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`bonus_money`  decimal(10,2) NULL DEFAULT NULL ,
`status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '红包状态：1有效2无效' ,
`type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '1，有效期 2，时长' ,
`when_long`  int(11) NOT NULL COMMENT '时长' ,
`begin_time`  datetime NULL DEFAULT NULL ,
`end_time`  datetime NULL DEFAULT NULL ,
`order_amount`  decimal(10,2) NULL DEFAULT NULL ,
`goods_limit`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`create_user`  int(11) NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
`modify_user`  int(11) NULL DEFAULT NULL ,
`modify_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `create_user` USING BTREE (`create_user`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='正在使用的红包'
AUTO_INCREMENT=2

;

-- ----------------------------
-- Table structure for `carts`
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`user_id`  bigint(11) NULL DEFAULT NULL ,
`goods_id`  int(11) NULL DEFAULT NULL ,
`goods_count`  int(8) NULL DEFAULT NULL ,
`modify_time`  datetime NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
`ploy_type`  tinyint(4) NOT NULL DEFAULT 0 ,
`ploy_id`  int(11) NOT NULL DEFAULT 0 ,
`goods_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
PRIMARY KEY (`id`),
INDEX `user_id` USING BTREE (`user_id`) ,
INDEX `goods_id` USING BTREE (`goods_id`) ,
INDEX `ploy_type` USING BTREE (`ploy_type`) ,
INDEX `ploy_id` USING BTREE (`ploy_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='购物车'
AUTO_INCREMENT=667

;

-- ----------------------------
-- Table structure for `cms_classes`
-- ----------------------------
DROP TABLE IF EXISTS `cms_classes`;
CREATE TABLE `cms_classes` (
`id`  mediumint(8) NOT NULL AUTO_INCREMENT ,
`parentid`  int(11) NOT NULL DEFAULT 0 COMMENT '父类id' ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称' ,
`text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述' ,
`keywords`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网页关键字' ,
`description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网页描述' ,
`sort`  tinyint(4) NOT NULL DEFAULT 50 ,
`level`  tinyint(3) NOT NULL DEFAULT 0 COMMENT '等级' ,
`level_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类id>分类id>….' ,
`count`  int(11) NOT NULL DEFAULT 0 COMMENT '文章数量' ,
`is_low`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '是否为最底级分类' ,
`create_date`  datetime NOT NULL COMMENT '插入时间' ,
`create_userid`  int(11) NOT NULL COMMENT '创建人' ,
`del`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '删除' ,
PRIMARY KEY (`id`),
INDEX `name` USING BTREE (`name`) ,
INDEX `parent_id` USING BTREE (`parentid`) ,
INDEX `del` USING BTREE (`del`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='文章分类'
AUTO_INCREMENT=10

;

-- ----------------------------
-- Table structure for `cms_contents`
-- ----------------------------
DROP TABLE IF EXISTS `cms_contents`;
CREATE TABLE `cms_contents` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`class_id`  int(10) NOT NULL COMMENT '分类id' ,
`title`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题' ,
`content_low`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章描述' ,
`content`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容' ,
`keywords`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章关键字，为搜索引擎收录用' ,
`description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章描述，为搜索引擎收录用' ,
`sort`  tinyint(4) NOT NULL DEFAULT 50 COMMENT '排序' ,
`show`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '是否显示 1 显示 2 否' ,
`is_top`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '是否置顶 1 置顶 2 否' ,
`create_date`  datetime NOT NULL COMMENT '插入时间' ,
`create_userid`  int(11) NOT NULL COMMENT '发表人' ,
`click_count`  int(11) NOT NULL DEFAULT 0 COMMENT '文章点击数' ,
`del`  tinyint(11) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`id`),
INDEX `class_id` USING BTREE (`class_id`) ,
INDEX `create_userid` USING BTREE (`create_userid`) ,
INDEX `show` USING BTREE (`show`, `del`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
COMMENT='文章内容'
AUTO_INCREMENT=50

;

-- ----------------------------
-- Table structure for `depots`
-- ----------------------------
DROP TABLE IF EXISTS `depots`;
CREATE TABLE `depots` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '库房名称' ,
`province`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '能送达的省份ID（用“,”隔开）' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='库房表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `e_classes`
-- ----------------------------
DROP TABLE IF EXISTS `e_classes`;
CREATE TABLE `e_classes` (
`id`  mediumint(8) NOT NULL AUTO_INCREMENT ,
`parentid`  int(11) NOT NULL DEFAULT 0 COMMENT '父类id' ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称' ,
`description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明' ,
`level`  tinyint(3) NULL DEFAULT 0 COMMENT '等级' ,
`level_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类id>分类id>….' ,
`is_low`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '是否为最底级分类' ,
`create_date`  datetime NOT NULL COMMENT '插入时间' ,
`create_userid`  int(11) NOT NULL COMMENT '创建人' ,
`del`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '删除' ,
PRIMARY KEY (`id`),
INDEX `name` USING BTREE (`name`) ,
INDEX `parent_id` USING BTREE (`parentid`) ,
INDEX `create_userid` USING BTREE (`create_userid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='资源分类'
AUTO_INCREMENT=9

;

-- ----------------------------
-- Table structure for `e_pictures`
-- ----------------------------
DROP TABLE IF EXISTS `e_pictures`;
CREATE TABLE `e_pictures` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`class_id`  int(10) NOT NULL COMMENT '分类id' ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片名称' ,
`text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`filename`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片路径' ,
`filename_big`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大缩略图路径' ,
`filename_small`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`is_thumb`  tinyint(4) NOT NULL DEFAULT 1 ,
`create_date`  datetime NOT NULL COMMENT '插入时间' ,
`create_userid`  int(11) NOT NULL ,
`del`  tinyint(11) NOT NULL DEFAULT 1 ,
`is_default`  tinyint(1) NULL DEFAULT 0 COMMENT 'logo中是否是默认LOGO' ,
PRIMARY KEY (`id`),
INDEX `class_id` USING BTREE (`class_id`) ,
INDEX `name` USING BTREE (`name`) ,
INDEX `create_userid` USING BTREE (`create_userid`) ,
INDEX `del` USING BTREE (`del`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
COMMENT='资源表，管理图片'
AUTO_INCREMENT=408

;

-- ----------------------------
-- Table structure for `e_sites`
-- ----------------------------
DROP TABLE IF EXISTS `e_sites`;
CREATE TABLE `e_sites` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`contents`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
INDEX `id` USING BTREE (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
COMMENT='商城配置'
AUTO_INCREMENT=21

;

-- ----------------------------
-- Table structure for `email_temps`
-- ----------------------------
DROP TABLE IF EXISTS `email_temps`;
CREATE TABLE `email_temps` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`title`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`old_content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`model_id`  bigint(11) NULL DEFAULT NULL ,
`type`  tinyint(4) NOT NULL DEFAULT 1 ,
`begin_time`  datetime NULL DEFAULT NULL ,
`end_time`  datetime NULL DEFAULT NULL ,
`del`  tinyint(4) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
COMMENT='邮件模板'
AUTO_INCREMENT=14

;

-- ----------------------------
-- Table structure for `erp_goods_locks`
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_locks`;
CREATE TABLE `erp_goods_locks` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`depot_id`  int(11) NOT NULL ,
`goods_sn`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`num`  int(11) NOT NULL DEFAULT 0 ,
`comments`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`status`  tinyint(4) NOT NULL DEFAULT 1 ,
`create_userid`  int(11) NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
`update_userid`  int(11) NULL DEFAULT NULL ,
`update_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `id` USING BTREE (`id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='ERP锁定商品'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `erp_goods_stocks`
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_stocks`;
CREATE TABLE `erp_goods_stocks` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '编号' ,
`depot_id`  int(11) NULL DEFAULT 1 COMMENT '库房ID' ,
`goods_sn`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码' ,
`goods_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称' ,
`barcode`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条码' ,
`style_sn`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '款号' ,
`color_sn`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '色码' ,
`color`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色' ,
`size`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺码' ,
`units`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位' ,
`weight`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '量重' ,
`all_stocks`  int(6) NULL DEFAULT 0 COMMENT '总库存' ,
`sale_stocks`  int(6) NULL DEFAULT 0 COMMENT '可销售库存' ,
`box_stocks`  int(6) NOT NULL DEFAULT 0 ,
`not_sale_stocks`  int(6) NULL DEFAULT 0 COMMENT '不可销售库存' ,
`lock_stocks`  int(6) NULL DEFAULT 0 COMMENT '锁定库存' ,
`occupy_stocks`  int(6) NULL DEFAULT 0 COMMENT '单订占用库存' ,
`order_lock_stocks`  int(6) NOT NULL DEFAULT 0 ,
`type`  int(11) NOT NULL DEFAULT 1 COMMENT 'ç±»åž‹: 1å•†å“ 2è¾…æ–™' ,
PRIMARY KEY (`id`),
INDEX `depot_id` USING BTREE (`depot_id`, `goods_sn`, `goods_name`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='ERP库存'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `exchanges`
-- ----------------------------
DROP TABLE IF EXISTS `exchanges`;
CREATE TABLE `exchanges` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`user_id`  bigint(11) NULL DEFAULT NULL ,
`goods_id`  int(11) NULL DEFAULT NULL ,
`exchange_sn`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`order_id`  int(11) NOT NULL DEFAULT 0 ,
`goods_count`  int(8) NULL DEFAULT NULL ,
`modify_time`  datetime NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
`ploy_type`  tinyint(4) NOT NULL DEFAULT 0 ,
`ploy_id`  int(11) NOT NULL DEFAULT 0 ,
`goods_ids`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
PRIMARY KEY (`id`),
INDEX `user_id` USING BTREE (`user_id`) ,
INDEX `goods_id` USING BTREE (`goods_id`) ,
INDEX `exchange_sn` USING BTREE (`exchange_sn`) ,
INDEX `order_id` USING BTREE (`order_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='兑换商品'
AUTO_INCREMENT=7

;

-- ----------------------------
-- Table structure for `express_details`
-- ----------------------------
DROP TABLE IF EXISTS `express_details`;
CREATE TABLE `express_details` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`shipping_id`  smallint(5) NULL DEFAULT NULL ,
`shipping_sn`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`shipping_status`  tinyint(4) NULL DEFAULT 1 ,
`shipping_time`  datetime NULL DEFAULT NULL ,
`shipping_context`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `shipping_id` USING BTREE (`shipping_id`) ,
INDEX `shipping_sn` USING BTREE (`shipping_sn`) ,
INDEX `shipping_time` USING BTREE (`shipping_time`) ,
INDEX `shipping_status` USING BTREE (`shipping_status`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='快递详情'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `express_temps`
-- ----------------------------
DROP TABLE IF EXISTS `express_temps`;
CREATE TABLE `express_temps` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`title`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`old_content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`express_id`  bigint(11) NULL DEFAULT NULL ,
`del`  tinyint(4) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='快递单模板'
AUTO_INCREMENT=9

;

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`sn`  varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '款色码 SKU -> 商品编码' ,
`sn_style`  varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '款码  参与活动商品查询' ,
`sn_color`  varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '999' COMMENT '颜色 参与活动商品查询' ,
`sn_size`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '尺码' ,
`brand_id`  int(11) NULL DEFAULT 0 ,
`supplier_id`  int(11) NOT NULL DEFAULT 0 ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称' ,
`alias`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品别名' ,
`color`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品颜色名称' ,
`size`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品尺码' ,
`color_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`goods_classes_id`  int(11) NOT NULL COMMENT '商品所属分类ID' ,
`sort`  int(11) NOT NULL DEFAULT 100 COMMENT '排序' ,
`reserves`  int(11) NOT NULL DEFAULT 0 COMMENT '商品库存' ,
`weight`  decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT '商品重量,以千克为单位' ,
`market_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '市场售价' ,
`shop_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '本店售价' ,
`change_type`  tinyint(4) NOT NULL DEFAULT 1 ,
`cost_price`  decimal(10,2) NOT NULL DEFAULT 0.00 ,
`type`  tinyint(4) NOT NULL COMMENT '1普通商品，2礼盒' ,
`box_number`  int(10) NULL DEFAULT NULL COMMENT '礼盒商品数量' ,
`box_goods_type`  tinyint(4) NOT NULL DEFAULT 0 ,
`goods_ids`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '礼盒存放的ID 以“,”隔开' ,
`keywords`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品关键字，放在商品页的关键字中，为搜索引擎收录用' ,
`description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述，放在商品页的描述中，为搜索引擎收录用' ,
`show_img`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品展示图' ,
`main_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品主图' ,
`goods_description`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述' ,
`text`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品特点展示' ,
`quality_default`  tinyint(4) NULL DEFAULT NULL COMMENT '是否默认质量，包装信息' ,
`quality`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品质量和包装' ,
`clean`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品洗涤说明' ,
`sale_service`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品售后说明' ,
`create_userid`  int(11) NOT NULL COMMENT '商品创建人' ,
`create_date`  datetime NOT NULL COMMENT '商品创建时间' ,
`update_userid`  int(11) NULL DEFAULT NULL COMMENT '最近一次更新商品配置的时间' ,
`update_date`  int(11) NULL DEFAULT NULL COMMENT '更新时间' ,
`first_show_date`  int(11) NULL DEFAULT NULL COMMENT '第一次上架时间' ,
`new_show_date`  int(11) NULL DEFAULT NULL COMMENT '最近上架时间' ,
`new_hide_date`  int(11) NULL DEFAULT NULL COMMENT '最近下架时间' ,
`click_count`  int(10) NULL DEFAULT 0 COMMENT '点击次数' ,
`show`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '是否上架 1上架 2下架' ,
`collect`  int(10) NULL DEFAULT 0 COMMENT '商品收藏数量' ,
`comment_count`  int(10) NOT NULL DEFAULT 0 COMMENT '评论次数' ,
`comment_star`  int(10) NOT NULL DEFAULT 0 COMMENT '评论星（总和）' ,
`sales`  int(10) NOT NULL DEFAULT 0 COMMENT '销量' ,
`del`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1正常 2删除' ,
`goods_source`  tinyint(1) NULL DEFAULT NULL ,
`third_goods_sn`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '第三方商品ID' ,
`third_goods_skuid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方商品SKUID' ,
`is_recommend`  tinyint(1) NULL DEFAULT 0 COMMENT '是否推荐商品' ,
`is_mark`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '用于区分商品是哪种标签' ,
PRIMARY KEY (`id`),
INDEX `del` USING BTREE (`del`) ,
INDEX `show` USING BTREE (`show`) ,
INDEX `price` USING BTREE (`market_price`, `shop_price`, `cost_price`) ,
INDEX `sn` USING BTREE (`sn`, `sn_style`, `sn_color`, `sn_size`) ,
INDEX `alias` USING BTREE (`alias`, `color`, `size`, `goods_classes_id`, `reserves`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品表'
AUTO_INCREMENT=75

;

-- ----------------------------
-- Table structure for `goods_all_association`
-- ----------------------------
DROP TABLE IF EXISTS `goods_all_association`;
CREATE TABLE `goods_all_association` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`classes_id`  int(11) NOT NULL COMMENT '分类id' ,
`group_id`  int(11) NOT NULL COMMENT '分组id' ,
`group_name`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组名称' ,
`group_sort`  tinyint(4) NOT NULL DEFAULT 50 COMMENT '分组排序' ,
`attribute_id`  int(11) NOT NULL COMMENT '属性id' ,
`attribute_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称' ,
`attribute_input_type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '属性输入方式： 1手动录入 2单选 3多选' ,
`attribute_values`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '属性可选值' ,
`attribute_sort`  tinyint(4) NOT NULL DEFAULT 50 COMMENT '属性排序，默认50' ,
`attribute_is_search`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '属性是否参与搜索 1参与 2否' ,
PRIMARY KEY (`id`),
INDEX `classes_id` USING BTREE (`classes_id`) ,
INDEX `group_id` USING BTREE (`group_id`) ,
INDEX `attribute_id` USING BTREE (`attribute_id`) ,
INDEX `attribute_is_search` USING BTREE (`attribute_is_search`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品分类属性管理'
AUTO_INCREMENT=83

;

-- ----------------------------
-- Table structure for `goods_attribute_group`
-- ----------------------------
DROP TABLE IF EXISTS `goods_attribute_group`;
CREATE TABLE `goods_attribute_group` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组名称' ,
`sort`  tinyint(4) NOT NULL DEFAULT 50 COMMENT '排序，默认50' ,
`del`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1正常 2删除' ,
PRIMARY KEY (`id`),
INDEX `name` USING BTREE (`name`) ,
INDEX `sort` USING BTREE (`sort`, `del`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品属性分组'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `goods_attributes`
-- ----------------------------
DROP TABLE IF EXISTS `goods_attributes`;
CREATE TABLE `goods_attributes` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID 号' ,
`goods_id`  int(11) NOT NULL COMMENT '商品ID' ,
`attributes_id`  int(11) NOT NULL COMMENT '属性ID' ,
`value`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值' ,
PRIMARY KEY (`id`),
INDEX `goods_id` USING BTREE (`goods_id`) ,
INDEX `attributes_id` USING BTREE (`attributes_id`) ,
INDEX `value` USING BTREE (`value`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品属性'
AUTO_INCREMENT=2091

;

-- ----------------------------
-- Table structure for `goods_brands`
-- ----------------------------
DROP TABLE IF EXISTS `goods_brands`;
CREATE TABLE `goods_brands` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`logo`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`del`  tinyint(4) NOT NULL DEFAULT 1 COMMENT ' 1 2' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品品牌'
AUTO_INCREMENT=50

;

-- ----------------------------
-- Table structure for `goods_classes`
-- ----------------------------
DROP TABLE IF EXISTS `goods_classes`;
CREATE TABLE `goods_classes` (
`id`  mediumint(8) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称' ,
`text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分类说明' ,
`keywords`  varchar(140) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字' ,
`description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明' ,
`goods_size`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`parentid`  int(11) NOT NULL DEFAULT 0 COMMENT '父类id' ,
`sort`  tinyint(4) NOT NULL DEFAULT 50 COMMENT '排序' ,
`count`  int(11) NOT NULL DEFAULT 0 COMMENT '商品数量' ,
`attr_count`  int(10) NOT NULL DEFAULT 0 COMMENT '属性数量' ,
`level`  tinyint(3) NOT NULL DEFAULT 0 COMMENT '等级' ,
`level_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类id>分类id>….' ,
`is_low`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '是否为最底级分类' ,
`show`  tinyint(3) NOT NULL DEFAULT 1 COMMENT '是否显示' ,
`create_date`  datetime NOT NULL COMMENT '插入时间' ,
`create_userid`  int(11) NOT NULL COMMENT '创建人' ,
`del`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '删除' ,
`is_shouji`  tinyint(3) NOT NULL DEFAULT 2 COMMENT '是否是手机一级分类 1是2不是' ,
`shouji_img`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机分类图片' ,
PRIMARY KEY (`id`),
INDEX `parentid` USING BTREE (`parentid`) ,
INDEX `level_id` USING BTREE (`level_id`) ,
INDEX `level` USING BTREE (`level`) ,
INDEX `count` USING BTREE (`count`) ,
INDEX `is_low` USING BTREE (`is_low`) ,
INDEX `del` USING BTREE (`del`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品分类'
AUTO_INCREMENT=60

;

-- ----------------------------
-- Table structure for `goods_classes_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `goods_classes_attribute`;
CREATE TABLE `goods_classes_attribute` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`attr_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称' ,
`attr_input_type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '属性输入方式： 1手动录入 2单选 3多选' ,
`attr_values`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '属性可选值' ,
`sort`  int(5) NULL DEFAULT NULL ,
`is_search`  tinyint(4) NOT NULL DEFAULT 2 ,
`del`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1正常 2删除' ,
PRIMARY KEY (`id`),
INDEX `del` USING BTREE (`del`) ,
INDEX `attr_name` USING BTREE (`attr_name`, `sort`, `is_search`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品属性表，在添加商品时搜索此表'
AUTO_INCREMENT=35

;

-- ----------------------------
-- Table structure for `goods_classes_map`
-- ----------------------------
DROP TABLE IF EXISTS `goods_classes_map`;
CREATE TABLE `goods_classes_map` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`local_id`  int(11) NOT NULL COMMENT '该分类在本地的id' ,
`source`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '该分类的来源，暂时有taobao,paipai' ,
`remote_id`  int(11) NOT NULL COMMENT '该分类在淘宝或拍拍上的分类id' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品同步时，外部网站和本站的商品分类对应关系'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `goods_collects`
-- ----------------------------
DROP TABLE IF EXISTS `goods_collects`;
CREATE TABLE `goods_collects` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id号' ,
`goods_id`  bigint(20) NOT NULL COMMENT '商品ID' ,
`user_id`  bigint(20) NOT NULL COMMENT '用户ID' ,
`create_time`  datetime NOT NULL COMMENT '收藏时间' ,
PRIMARY KEY (`id`),
INDEX `goods_id` USING BTREE (`goods_id`) ,
INDEX `user_id` USING BTREE (`user_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品收藏表'
AUTO_INCREMENT=23

;

-- ----------------------------
-- Table structure for `goods_colors`
-- ----------------------------
DROP TABLE IF EXISTS `goods_colors`;
CREATE TABLE `goods_colors` (
`id`  int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称' ,
`code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '颜色代码' ,
`series`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`color_size`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`show_name`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`),
INDEX `sn_1` USING BTREE (`name`, `color_size`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品颜色'
AUTO_INCREMENT=78

;

-- ----------------------------
-- Table structure for `goods_depots`
-- ----------------------------
DROP TABLE IF EXISTS `goods_depots`;
CREATE TABLE `goods_depots` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`goods_id`  bigint(20) NOT NULL COMMENT '商品ID' ,
`depot_id`  bigint(20) NOT NULL COMMENT '库房ID' ,
`reserves`  int(11) NOT NULL COMMENT '库存' ,
`reserves_lock`  int(11) NOT NULL COMMENT '占用库存' ,
PRIMARY KEY (`id`),
INDEX `goods_id` USING BTREE (`goods_id`) ,
INDEX `depot_id` USING BTREE (`depot_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品与库房关系表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `goods_ga_association`
-- ----------------------------
DROP TABLE IF EXISTS `goods_ga_association`;
CREATE TABLE `goods_ga_association` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`group_id`  int(11) NOT NULL COMMENT '分组id' ,
`attribute_id`  int(11) NOT NULL COMMENT '属性id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='属性分组与属性关联关系'
AUTO_INCREMENT=40

;

-- ----------------------------
-- Table structure for `goods_gc_association`
-- ----------------------------
DROP TABLE IF EXISTS `goods_gc_association`;
CREATE TABLE `goods_gc_association` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`classes_id`  int(11) NOT NULL COMMENT '分类id' ,
`group_id`  int(11) NOT NULL COMMENT '分组id' ,
`sort`  tinyint(4) NOT NULL DEFAULT 50 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='属性分组和商品分类对应关系'
AUTO_INCREMENT=6

;

-- ----------------------------
-- Table structure for `goods_goods_colors`
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods_colors`;
CREATE TABLE `goods_goods_colors` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色名称' ,
`number`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数字' ,
`code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色代码' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品颜色表，code用于商品编码最后三位'
AUTO_INCREMENT=52

;

-- ----------------------------
-- Table structure for `goods_goods_tags`
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods_tags`;
CREATE TABLE `goods_goods_tags` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`goods_id`  bigint(20) NOT NULL COMMENT '商品ID' ,
`goods_tag_id`  bigint(20) NOT NULL COMMENT '标签ID' ,
PRIMARY KEY (`id`),
INDEX `goods_id` USING BTREE (`goods_id`, `goods_tag_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品与标签关系表'
AUTO_INCREMENT=360

;

-- ----------------------------
-- Table structure for `goods_marks`
-- ----------------------------
DROP TABLE IF EXISTS `goods_marks`;
CREATE TABLE `goods_marks` (
`id`  tinyint(4) NOT NULL AUTO_INCREMENT ,
`name`  varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`show`  tinyint(4) NULL DEFAULT 1 ,
`del`  tinyint(4) NULL DEFAULT 1 ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品标识表，用于商品列表中显示'
AUTO_INCREMENT=8

;

-- ----------------------------
-- Table structure for `goods_mobile`
-- ----------------------------
DROP TABLE IF EXISTS `goods_mobile`;
CREATE TABLE `goods_mobile` (
`id`  int(11) NOT NULL DEFAULT 0 COMMENT 'ID' ,
`sn`  varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '款色码' ,
`sn_style`  varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '款' ,
`sn_color`  varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '(色)' ,
`sn_size`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '（码）' ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称' ,
`alias`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品别名' ,
`color`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品颜色' ,
`size`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品尺码' ,
`goods_classes_id`  int(11) NOT NULL COMMENT '商品所属分类ID' ,
`sort`  int(11) NOT NULL DEFAULT 100 COMMENT '排序' ,
`reserves`  int(11) NOT NULL DEFAULT 0 COMMENT '商品库存' ,
`weight`  decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT '商品重量,以千克为单位' ,
`market_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '市场售价' ,
`shop_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '本店售价' ,
`change_type`  tinyint(4) NOT NULL DEFAULT 1 ,
`cost_price`  decimal(10,2) NOT NULL DEFAULT 0.00 ,
`type`  tinyint(4) NOT NULL COMMENT '1普通商品，2礼盒' ,
`box_number`  int(10) NULL DEFAULT NULL COMMENT '礼盒商品数量' ,
`box_goods_type`  tinyint(4) NOT NULL DEFAULT 0 ,
`goods_ids`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '礼盒存放的ID 以“,”隔开' ,
`keywords`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品关键字，放在商品页的关键字中，为搜索引擎收录用' ,
`description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述，放在商品页的描述中，为搜索引擎收录用' ,
`show_img`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品展示图' ,
`main_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品主图' ,
`goods_description`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述' ,
`text`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品特点展示' ,
`quality_default`  tinyint(4) NULL DEFAULT NULL COMMENT '是否默认质量，包装信息' ,
`quality`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品质量和包装' ,
`clean`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品洗涤说明' ,
`sale_service`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品售后说明' ,
`create_userid`  int(11) NOT NULL COMMENT '商品创建人' ,
`create_date`  datetime NOT NULL COMMENT '商品创建时间' ,
`update_userid`  int(11) NULL DEFAULT NULL COMMENT '最近一次更新商品配置的时间' ,
`update_date`  int(11) NULL DEFAULT NULL COMMENT '更新时间' ,
`first_show_date`  int(11) NULL DEFAULT NULL COMMENT '第一次上架时间' ,
`new_show_date`  int(11) NULL DEFAULT NULL COMMENT '最近上架时间' ,
`new_hide_date`  int(11) NULL DEFAULT NULL COMMENT '最近下架时间' ,
`click_count`  int(10) NULL DEFAULT 0 COMMENT '点击次数' ,
`show`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '是否上架 1上架 2下架' ,
`collect`  int(10) NULL DEFAULT 0 COMMENT '商品收藏数量' ,
`comment_count`  int(10) NOT NULL DEFAULT 0 COMMENT '评论次数' ,
`comment_star`  int(10) NOT NULL DEFAULT 0 COMMENT '评论星（总和）' ,
`sales`  int(10) NOT NULL DEFAULT 0 COMMENT '销量' ,
`del`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1正常 2删除' 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='中国移动商城商品表'

;

-- ----------------------------
-- Table structure for `goods_reminds`
-- ----------------------------
DROP TABLE IF EXISTS `goods_reminds`;
CREATE TABLE `goods_reminds` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`user_id`  int(10) NULL DEFAULT 0 COMMENT '是否登录' ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱' ,
`goods_id`  int(10) NULL DEFAULT 0 COMMENT '商品ID' ,
`goods_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商品名称' ,
`create_time`  int(10) NULL DEFAULT 0 COMMENT '添加时间' ,
`send_time`  int(10) NULL DEFAULT 0 COMMENT '发货提醒时间' ,
`status`  tinyint(4) NULL DEFAULT 1 COMMENT '是否发送过邮件1为未发送，2为发送' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='到货通知提醒'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `goods_suppliers`
-- ----------------------------
DROP TABLE IF EXISTS `goods_suppliers`;
CREATE TABLE `goods_suppliers` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`province`  int(11) NOT NULL ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`del`  tinyint(4) NOT NULL DEFAULT 1 COMMENT ' 1 2' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品供应商'
AUTO_INCREMENT=2

;

-- ----------------------------
-- Table structure for `goods_tags`
-- ----------------------------
DROP TABLE IF EXISTS `goods_tags`;
CREATE TABLE `goods_tags` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名称' ,
`sort`  int(11) NOT NULL DEFAULT 100 COMMENT '排序' ,
`del`  tinyint(4) NULL DEFAULT 1 COMMENT '1为正常，2为删除' ,
PRIMARY KEY (`id`),
INDEX `name` USING BTREE (`name`) ,
INDEX `del` USING BTREE (`del`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品标签表'
AUTO_INCREMENT=9

;

-- ----------------------------
-- Table structure for `goods_thirds`
-- ----------------------------
DROP TABLE IF EXISTS `goods_thirds`;
CREATE TABLE `goods_thirds` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`third_goods_sn`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方商品ID' ,
`goods_sn`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地商品编码' ,
`title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称' ,
`type`  tinyint(4) NULL DEFAULT 1 COMMENT '1为淘宝，2为拍拍，3为京东4，一号店' ,
`status`  tinyint(4) NULL DEFAULT 1 COMMENT '1为未编辑,2' ,
`del`  tinyint(4) NULL DEFAULT 1 COMMENT '1为没删除' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='第三方导入的商品'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `goods_weibo`
-- ----------------------------
DROP TABLE IF EXISTS `goods_weibo`;
CREATE TABLE `goods_weibo` (
`id`  int(20) NOT NULL AUTO_INCREMENT ,
`parent_class_id`  int(10) NULL DEFAULT NULL ,
`goods_classes_id`  int(20) NULL DEFAULT NULL ,
`goods_id`  int(50) NULL DEFAULT NULL ,
`types`  int(11) NULL DEFAULT NULL COMMENT '1 æ–°æµª' ,
`show`  int(4) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `NewIndex1` USING BTREE (`goods_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `invite_friends`
-- ----------------------------
DROP TABLE IF EXISTS `invite_friends`;
CREATE TABLE `invite_friends` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`user_id`  bigint(11) NOT NULL COMMENT '被邀请用户id' ,
`friend_id`  bigint(11) NOT NULL COMMENT '邀请者id' ,
`invite_time`  datetime NOT NULL COMMENT '邀请时间' ,
`is_valid`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '是否验证通过，1已通过2未通过' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='邀请朋友，user_id邀请了friend_id'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `jiayuan`
-- ----------------------------
DROP TABLE IF EXISTS `jiayuan`;
CREATE TABLE `jiayuan` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`type`  tinyint(4) NOT NULL DEFAULT 1 ,
`ploy_id`  int(11) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=401

;

-- ----------------------------
-- Table structure for `member_addresses`
-- ----------------------------
DROP TABLE IF EXISTS `member_addresses`;
CREATE TABLE `member_addresses` (
`id`  mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '序号' ,
`user_id`  mediumint(11) NULL DEFAULT NULL COMMENT '用户ID' ,
`consignee`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人' ,
`country`  smallint(5) NULL DEFAULT NULL COMMENT '国家' ,
`province`  smallint(5) NULL DEFAULT NULL COMMENT '所在省' ,
`city`  smallint(5) NULL DEFAULT NULL COMMENT '所在市' ,
`district`  smallint(5) NULL DEFAULT NULL COMMENT '所在区/县' ,
`address`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址' ,
`zip_code`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编' ,
`contact_phone`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话' ,
`sign_building`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标志性建筑' ,
`best_time`  tinyint(4) NULL DEFAULT 1 COMMENT '最佳送货时间' ,
`is_default`  tinyint(4) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`id`),
INDEX `user_id` USING BTREE (`user_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户收货地址'
AUTO_INCREMENT=44

;

-- ----------------------------
-- Table structure for `member_bonus`
-- ----------------------------
DROP TABLE IF EXISTS `member_bonus`;
CREATE TABLE `member_bonus` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`bonus_id`  int(11) NULL DEFAULT NULL ,
`ploy_id`  int(8) NOT NULL DEFAULT 0 ,
`bonus_sn`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`bonus_code`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`user_id`  bigint(11) NULL DEFAULT NULL ,
`used_time`  datetime NULL DEFAULT NULL ,
`order_id`  bigint(11) NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL COMMENT '领取时间' ,
`end_time`  datetime NULL DEFAULT NULL COMMENT '到期时间' ,
PRIMARY KEY (`id`),
INDEX `bonus_id` USING BTREE (`bonus_id`, `user_id`, `order_id`, `bonus_sn`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='会员拥有的红包'
AUTO_INCREMENT=8

;

-- ----------------------------
-- Table structure for `member_cash_cards`
-- ----------------------------
DROP TABLE IF EXISTS `member_cash_cards`;
CREATE TABLE `member_cash_cards` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`card_no`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡号' ,
`card_pwd`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码' ,
`amount`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '面值' ,
`balabce`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '余额' ,
`expiration_time`  datetime NULL DEFAULT NULL COMMENT '有效期' ,
`status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态：1未充值2已充值' ,
`member_id`  int(11) NULL DEFAULT 0 COMMENT '会员ID' ,
`last_used_time`  datetime NULL DEFAULT NULL COMMENT '最后使用时间' ,
`verify_user`  int(11) NULL DEFAULT NULL COMMENT '审核人(充值)' ,
`verify_time`  datetime NULL DEFAULT NULL COMMENT '审核时间(充值)' ,
`create_user`  int(11) NOT NULL COMMENT '创建人' ,
`create_time`  datetime NOT NULL COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='会员拥有的礼品卡'
AUTO_INCREMENT=45

;

-- ----------------------------
-- Table structure for `member_cash_cards_logs`
-- ----------------------------
DROP TABLE IF EXISTS `member_cash_cards_logs`;
CREATE TABLE `member_cash_cards_logs` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`cards_id`  int(11) NOT NULL DEFAULT 0 COMMENT '卡号' ,
`amount`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '金额' ,
`order_sn`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '订单号' ,
`create_time`  datetime NOT NULL COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='礼品卡使用记录'
AUTO_INCREMENT=8

;

-- ----------------------------
-- Table structure for `member_codes`
-- ----------------------------
DROP TABLE IF EXISTS `member_codes`;
CREATE TABLE `member_codes` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`user_id`  bigint(11) NULL DEFAULT NULL ,
`code_type`  int(11) NULL DEFAULT NULL ,
`code`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
`count`  tinyint(4) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`id`),
INDEX `user_id` USING BTREE (`user_id`) ,
INDEX `code_type` USING BTREE (`code_type`, `code`, `count`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户拥有的兑换码，手机验证码等'
AUTO_INCREMENT=28

;

-- ----------------------------
-- Table structure for `member_comments`
-- ----------------------------
DROP TABLE IF EXISTS `member_comments`;
CREATE TABLE `member_comments` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '编号' ,
`user_id`  bigint(11) NULL DEFAULT NULL COMMENT '会员ID' ,
`nickname`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论作者' ,
`goods_sn`  varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编号' ,
`goods_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称' ,
`goods_sn_style`  varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`parent_id`  bigint(11) NOT NULL DEFAULT 0 COMMENT '回复ID' ,
`type_id`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '评论类型：1评论2留言' ,
`class_id`  tinyint(4) NULL DEFAULT NULL ,
`order_sn`  bigint(13) NULL DEFAULT NULL ,
`title`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题' ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容' ,
`star_level`  tinyint(4) NULL DEFAULT NULL COMMENT '星级' ,
`create_time`  datetime NOT NULL COMMENT '创建时间' ,
`ip`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论IP' ,
`is_comment`  tinyint(4) NOT NULL COMMENT '是否回复过 1．已回复 2．未回复' ,
`hidden`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '1隐藏2显示' ,
`points`  int(8) NULL DEFAULT 0 ,
`del`  tinyint(4) NOT NULL COMMENT '1正常2删除' ,
PRIMARY KEY (`id`),
INDEX `user_id` USING BTREE (`user_id`, `goods_sn_style`, `parent_id`, `type_id`) ,
INDEX `parent_id` USING BTREE (`parent_id`) ,
INDEX `class_id` USING BTREE (`class_id`, `del`) ,
INDEX `is_comment` USING BTREE (`is_comment`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户的评论'
AUTO_INCREMENT=172

;

-- ----------------------------
-- Table structure for `member_coupons`
-- ----------------------------
DROP TABLE IF EXISTS `member_coupons`;
CREATE TABLE `member_coupons` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`coupons_id`  int(11) NULL DEFAULT NULL ,
`ploy_id`  int(8) NOT NULL DEFAULT 0 ,
`coupons_code`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`user_id`  bigint(11) NULL DEFAULT NULL ,
`used_time`  datetime NULL DEFAULT NULL ,
`order_id`  bigint(11) NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL COMMENT '领取时间' ,
PRIMARY KEY (`id`),
INDEX `bonus_id` USING BTREE (`coupons_id`, `user_id`, `order_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='会员拥有的优惠券'
AUTO_INCREMENT=18

;

-- ----------------------------
-- Table structure for `member_groups`
-- ----------------------------
DROP TABLE IF EXISTS `member_groups`;
CREATE TABLE `member_groups` (
`id`  int(8) NOT NULL AUTO_INCREMENT COMMENT '用户组ID' ,
`group_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户组名称' ,
`group_description`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户组描述' ,
`rebate`  smallint(5) NOT NULL DEFAULT 100 ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='会员等级'
AUTO_INCREMENT=6

;

-- ----------------------------
-- Table structure for `member_infos`
-- ----------------------------
DROP TABLE IF EXISTS `member_infos`;
CREATE TABLE `member_infos` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`user_id`  bigint(11) NOT NULL COMMENT '用户ID' ,
`full_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名' ,
`birthday`  date NULL DEFAULT NULL COMMENT '用户生日' ,
`sex`  tinyint(1) NULL DEFAULT 0 COMMENT '性别' ,
`province`  smallint(5) NULL DEFAULT 0 ,
`city`  smallint(5) NULL DEFAULT 0 ,
`alias`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里旺旺' ,
`msn`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MSN' ,
`qq`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ' ,
`office_phone`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话' ,
`home_phone`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭电话' ,
`mobile_phone`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '移动电话' ,
`mobile_validated`  tinyint(4) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`id`),
INDEX `user_id` USING BTREE (`user_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户信息'
AUTO_INCREMENT=53

;

-- ----------------------------
-- Table structure for `member_openids`
-- ----------------------------
DROP TABLE IF EXISTS `member_openids`;
CREATE TABLE `member_openids` (
`id`  mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT ,
`member_id`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`openid`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`access_token`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`member_refer`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`create_time`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户第三方登录信息'
AUTO_INCREMENT=31

;

-- ----------------------------
-- Table structure for `member_points`
-- ----------------------------
DROP TABLE IF EXISTS `member_points`;
CREATE TABLE `member_points` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·' ,
`member_id`  bigint(11) NOT NULL COMMENT 'ä¼šå‘˜ID' ,
`order_sn`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'è®¢å•å·' ,
`points`  int(8) NOT NULL COMMENT 'ç§¯åˆ†' ,
`type`  tinyint(4) NOT NULL COMMENT 'ç§¯åˆ†ç±»åž‹' ,
`balance`  int(8) NOT NULL DEFAULT 0 ,
`content`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`create_user`  int(8) NULL DEFAULT NULL COMMENT 'åˆ›å»ºäºº' ,
`create_time`  datetime NULL DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´' ,
PRIMARY KEY (`id`),
INDEX `order_sn` USING BTREE (`order_sn`) ,
INDEX `type` USING BTREE (`type`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='会员积分'
AUTO_INCREMENT=69

;

-- ----------------------------
-- Table structure for `members`
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID' ,
`user_id`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方用户ID' ,
`source`  int(4) NULL DEFAULT 0 COMMENT '1=新浪微博，2=支付宝，3=腾讯QQ，4=奇虎360，5=开心网，6=腾讯微薄，7=人人网，8=淘宝网' ,
`login`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`email`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`password`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`nickname`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`money`  decimal(10,2) NOT NULL DEFAULT 0.00 ,
`create_time`  datetime NULL DEFAULT NULL ,
`last_time`  datetime NULL DEFAULT NULL ,
`reg_ip`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`last_ip`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`question`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`answer`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`group_id`  int(8) NULL DEFAULT 1 ,
`login_count`  int(8) NULL DEFAULT NULL ,
`points`  int(8) UNSIGNED NOT NULL DEFAULT 0 ,
`is_validated`  tinyint(1) NULL DEFAULT 2 ,
`recommend_id`  bigint(11) NULL DEFAULT 0 ,
`tips`  tinyint(4) NOT NULL DEFAULT 0 ,
`exp_time`  datetime NULL DEFAULT NULL ,
`web_source`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `user_id` USING BTREE (`user_id`) ,
INDEX `group_id` USING BTREE (`group_id`) ,
INDEX `login` USING BTREE (`login`) ,
INDEX `create_time` USING BTREE (`create_time`) ,
INDEX `reg_ip` USING BTREE (`reg_ip`) ,
INDEX `create_time_2` USING BTREE (`create_time`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='会员表，包含登录信息'
AUTO_INCREMENT=74

;

-- ----------------------------
-- Table structure for `mobile_blacks`
-- ----------------------------
DROP TABLE IF EXISTS `mobile_blacks`;
CREATE TABLE `mobile_blacks` (
`id`  int(20) NOT NULL AUTO_INCREMENT ,
`mobile`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ֻ���' ,
`comment`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '�Ӻڱ�ע' ,
`create_date`  datetime NOT NULL ,
`create_userid`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='手机黑名单'
AUTO_INCREMENT=6

;

-- ----------------------------
-- Table structure for `navsets`
-- ----------------------------
DROP TABLE IF EXISTS `navsets`;
CREATE TABLE `navsets` (
`id`  mediumint(8) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称' ,
`url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`cateid`  int(10) NULL DEFAULT NULL ,
`parentid`  int(11) NOT NULL DEFAULT 0 COMMENT '父类id' ,
`sort`  tinyint(4) NOT NULL DEFAULT 50 COMMENT '排序' ,
`level`  tinyint(3) NOT NULL DEFAULT 0 COMMENT '等级' ,
`level_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类id>分类id>….' ,
`is_low`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '是否为最底级分类' ,
`show`  tinyint(3) NOT NULL DEFAULT 1 COMMENT '是否显示' ,
`create_date`  datetime NOT NULL COMMENT '插入时间' ,
`del`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '删除' ,
PRIMARY KEY (`id`),
INDEX `parentid` USING BTREE (`parentid`) ,
INDEX `cateid` USING BTREE (`cateid`) ,
INDEX `show_del` USING BTREE (`show`, `del`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='前台导航菜单'
AUTO_INCREMENT=13

;

-- ----------------------------
-- Table structure for `online_pay_logs`
-- ----------------------------
DROP TABLE IF EXISTS `online_pay_logs`;
CREATE TABLE `online_pay_logs` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '编号' ,
`member_id`  bigint(11) NOT NULL COMMENT '会员ID' ,
`order_id`  bigint(11) NOT NULL COMMENT '订单ID' ,
`amount`  decimal(10,2) NOT NULL COMMENT '支付金额' ,
`pay_id`  tinyint(4) NOT NULL COMMENT '支付接口ID' ,
`result`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '支付接口返回结果' ,
`pay_sn`  int(11) NULL DEFAULT NULL COMMENT '在线支付交易号' ,
`pay_time`  datetime NOT NULL COMMENT '支付成功时间' ,
`pay_mac`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付签名' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='在线支付日志'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `online_services`
-- ----------------------------
DROP TABLE IF EXISTS `online_services`;
CREATE TABLE `online_services` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`account`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '1,QQ2,SKYPE3,QQ4,' ,
`position`  int(11) NOT NULL DEFAULT 1 COMMENT ' 1234' ,
`url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`show`  tinyint(4) NOT NULL DEFAULT 1 ,
`del`  tinyint(4) NOT NULL DEFAULT 1 COMMENT ' 1 2' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='客服列表'
AUTO_INCREMENT=19

;

-- ----------------------------
-- Table structure for `order_exchanges`
-- ----------------------------
DROP TABLE IF EXISTS `order_exchanges`;
CREATE TABLE `order_exchanges` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '受理单号' ,
`exchange_type`  tinyint(4) NULL DEFAULT NULL COMMENT '1:退货2:换货' ,
`order_sn`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原订单号' ,
`new_order_sn`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新订单号' ,
`order_shipping_fee`  decimal(10,2) NULL DEFAULT 0.00 COMMENT '补原订单运费' ,
`refund_shipping_fee`  decimal(10,2) NULL DEFAULT 0.00 COMMENT '退换货运费' ,
`refund_money`  decimal(10,2) NULL DEFAULT 0.00 COMMENT '退款金额' ,
`refund_goods_money`  decimal(10,2) NULL DEFAULT NULL COMMENT '退回商品总金额' ,
`payee`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款人' ,
`paybank`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款开户行' ,
`paycardno`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款帐号' ,
`paymoney`  decimal(10,2) NULL DEFAULT 0.00 COMMENT '汇款金额' ,
`balance`  decimal(10,2) NULL DEFAULT 0.00 COMMENT '退回帐户余额' ,
`comments`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
`status`  tinyint(4) NULL DEFAULT NULL COMMENT '状态' ,
`reason`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`create_user`  int(8) NULL DEFAULT NULL COMMENT '创建人' ,
`create_time`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`update_user`  int(8) NULL DEFAULT NULL COMMENT '更新人' ,
`update_time`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
`contact_phone`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_person`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`depot_id`  int(11) NOT NULL DEFAULT 1 ,
`verify_user`  int(11) NOT NULL DEFAULT 0 ,
`verify_time`  datetime NULL DEFAULT NULL ,
`express_sn`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`express_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `exchange_type` USING BTREE (`exchange_type`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='退换货订单'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`order_id`  bigint(11) NULL DEFAULT NULL ,
`goods_id`  int(11) NULL DEFAULT NULL ,
`goods_class_id`  tinyint(4) NULL DEFAULT NULL ,
`sn_style`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sn_color`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sn`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`color`  varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`size`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`shop_price`  decimal(10,2) NULL DEFAULT NULL ,
`market_price`  decimal(10,2) NOT NULL ,
`rebate_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '折后价' ,
`paid_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '结算价' ,
`goods_count`  smallint(5) NOT NULL DEFAULT 0 COMMENT '商品数量' ,
`goods_img`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`goods_type`  tinyint(4) NULL DEFAULT 1 ,
`parent_id`  bigint(11) NULL DEFAULT 0 COMMENT '订单商品父ID' ,
`ploy_type`  tinyint(4) NULL DEFAULT 0 ,
`ploy_id`  int(8) NULL DEFAULT 0 COMMENT '活动ID' ,
`refund_count`  tinyint(4) NOT NULL DEFAULT 0 ,
`barter_count`  tinyint(4) NOT NULL DEFAULT 0 ,
`points`  int(8) NULL DEFAULT 0 ,
PRIMARY KEY (`id`),
INDEX `order_id` USING BTREE (`order_id`) ,
INDEX `goods_id` USING BTREE (`goods_id`) ,
INDEX `sn` USING BTREE (`sn`) ,
INDEX `goods_class_id` USING BTREE (`goods_class_id`, `sn_style`, `sn_color`, `parent_id`) ,
INDEX `ploy_type` USING BTREE (`ploy_type`, `ploy_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='订单和商品对应表'
AUTO_INCREMENT=187

;

-- ----------------------------
-- Table structure for `order_invoices`
-- ----------------------------
DROP TABLE IF EXISTS `order_invoices`;
CREATE TABLE `order_invoices` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`order_id`  bigint(11) NULL DEFAULT NULL ,
`sn`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`title`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`item`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`money`  decimal(10,2) NULL DEFAULT NULL ,
`dak_sn`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`zip_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`address`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_phone`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`receiver`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`create_user`  int(8) NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `order_id` USING BTREE (`order_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='订单发票信息'
AUTO_INCREMENT=2

;

-- ----------------------------
-- Table structure for `order_logs`
-- ----------------------------
DROP TABLE IF EXISTS `order_logs`;
CREATE TABLE `order_logs` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`order_id`  bigint(11) NOT NULL ,
`user_id`  int(8) NOT NULL ,
`add_time`  datetime NOT NULL ,
`content`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`detail`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='订单记录'
AUTO_INCREMENT=344

;

-- ----------------------------
-- Table structure for `order_refund_goods`
-- ----------------------------
DROP TABLE IF EXISTS `order_refund_goods`;
CREATE TABLE `order_refund_goods` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`exchange_id`  bigint(11) NULL DEFAULT NULL COMMENT '受理单号' ,
`order_id`  bigint(11) NULL DEFAULT NULL COMMENT '订单号' ,
`order_goods_id`  bigint(11) NULL DEFAULT NULL COMMENT '订单商品编号' ,
`goods_price`  decimal(10,2) NULL DEFAULT NULL COMMENT '退货单价' ,
`goods_count`  tinyint(4) NULL DEFAULT NULL COMMENT '退货数量' ,
`reason`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='退换货商品表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `order_sources`
-- ----------------------------
DROP TABLE IF EXISTS `order_sources`;
CREATE TABLE `order_sources` (
`id`  int(11) NOT NULL ,
`name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`del`  tinyint(4) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='订单来源'

;

-- ----------------------------
-- Table structure for `order_templist`
-- ----------------------------
DROP TABLE IF EXISTS `order_templist`;
CREATE TABLE `order_templist` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`type`  tinyint(4) NULL DEFAULT NULL COMMENT '1新订单 2 退货单3换货单' ,
`third_sn`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方订单号' ,
`create_time`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`last_time`  datetime NULL DEFAULT NULL COMMENT '最后修改时间' ,
`del`  tinyint(4) NULL DEFAULT NULL COMMENT '1 正常 2已删除' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `order_third`
-- ----------------------------
DROP TABLE IF EXISTS `order_third`;
CREATE TABLE `order_third` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`order_id`  bigint(50) NULL DEFAULT NULL COMMENT '订单ID' ,
`order_source`  int(20) NULL DEFAULT NULL COMMENT '订单来源' ,
`third_sn`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方订单号' ,
`third_order_id`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方订单id' ,
`third_goods`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`third_discount`  decimal(10,2) NULL DEFAULT NULL COMMENT '第三方优惠金额' ,
`third_status`  int(50) NULL DEFAULT NULL COMMENT '第三方订单状态' ,
`third_no`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方财务流水号' ,
`third_context`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`),
INDEX `order_id` USING BTREE (`order_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='第三方订单扩展表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `order_third_abnormals`
-- ----------------------------
DROP TABLE IF EXISTS `order_third_abnormals`;
CREATE TABLE `order_third_abnormals` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`user_id`  bigint(11) NULL DEFAULT NULL ,
`order_sn`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`order_status`  tinyint(4) NULL DEFAULT 1 COMMENT '订单状态： 1待处理 2已确认 3库房处理中 4已发货 5订单完成 6订单取消 7无效 8异常' ,
`shipping_status`  tinyint(4) NULL DEFAULT 1 COMMENT '发货状态： 1未发货 2已发货 3确认收货' ,
`pay_status`  tinyint(4) NULL DEFAULT 1 COMMENT '付款状态： 1未付款 2付款中 3已付款' ,
`consignee`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`country`  smallint(5) NULL DEFAULT 1 ,
`region`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '省、市、区 json格式' ,
`email`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`zip_code`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_phone`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`best_time`  tinyint(4) NULL DEFAULT NULL ,
`shipping_id`  tinyint(4) NULL DEFAULT NULL ,
`shipping_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`pay_id`  tinyint(4) NULL DEFAULT NULL ,
`pay_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`goods_amount`  decimal(10,2) NULL DEFAULT 0.00 ,
`shipping_fee`  decimal(10,2) NULL DEFAULT 0.00 ,
`pay_fee`  decimal(10,2) NULL DEFAULT 0.00 ,
`balance`  decimal(10,2) NULL DEFAULT 0.00 ,
`paid`  decimal(10,2) NOT NULL DEFAULT 0.00 ,
`money_paid`  decimal(10,2) NULL DEFAULT 0.00 ,
`money_decimal`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '舍去小数点金额' ,
`create_time`  datetime NULL DEFAULT NULL ,
`confirm_time`  datetime NULL DEFAULT NULL ,
`shipping_time`  datetime NULL DEFAULT NULL ,
`pay_time`  datetime NULL DEFAULT NULL ,
`done_time`  datetime NULL DEFAULT NULL COMMENT '完成时间' ,
`order_source`  int(8) NULL DEFAULT NULL ,
`order_cps_ext`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`order_type`  tinyint(4) NULL DEFAULT NULL ,
`invoice_status`  tinyint(4) NULL DEFAULT NULL COMMENT '开票状态：2已开发票1未开发票' ,
`invoice_title`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头' ,
`depot_sn`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`shipping_sn`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`bonus_id`  bigint(11) NULL DEFAULT NULL ,
`bonus_money`  decimal(10,2) NULL DEFAULT NULL ,
`ploy_rebate_id`  int(11) NULL DEFAULT NULL ,
`ploy_rebate_money`  decimal(10,2) NULL DEFAULT NULL ,
`ploy_combination_id`  int(11) NULL DEFAULT NULL ,
`ploy_combination_money`  decimal(10,2) NULL DEFAULT NULL ,
`use_points`  int(8) NULL DEFAULT 0 ,
`ploy_freight_id`  int(8) NOT NULL DEFAULT 0 ,
`comments`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注' ,
`modify_time`  datetime NULL DEFAULT NULL ,
`modify_user`  int(11) NULL DEFAULT NULL ,
`locked`  tinyint(4) NULL DEFAULT 1 ,
`cancel_text`  tinyint(4) NOT NULL DEFAULT 0 ,
`ad_adip`  int(8) NOT NULL DEFAULT 0 ,
`rebate`  smallint(5) NOT NULL DEFAULT 100 ,
`levelup`  tinyint(4) NOT NULL DEFAULT 1 ,
`receive_time`  datetime NULL DEFAULT NULL ,
`web_source`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`orders_goods`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '订单商品数据，json格式' ,
`orders_invoce`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '发票信息，json格式' ,
`orders_thirds`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`third_goods`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`status`  tinyint(4) NULL DEFAULT 1 COMMENT '1未修复 2已修复' ,
PRIMARY KEY (`id`),
INDEX `user_id` USING BTREE (`user_id`) ,
INDEX `shipping_id` USING BTREE (`shipping_id`) ,
INDEX `pay_id` USING BTREE (`pay_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='第三方异常订单'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`order_sn`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`user_id`  bigint(11) NULL DEFAULT NULL ,
`order_status`  tinyint(4) NULL DEFAULT 1 COMMENT '订单状态： 1待处理 2已确认 3库房处理中 4已发货 5订单完成 6订单取消 7无效 8异常' ,
`shipping_status`  tinyint(4) NULL DEFAULT 1 COMMENT '发货状态： 1未发货 2已发货 3确认收货' ,
`pay_status`  tinyint(4) NULL DEFAULT 1 COMMENT '付款状态： 1未付款 2付款中 3已付款' ,
`consignee`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`country`  smallint(5) NULL DEFAULT 1 ,
`province`  smallint(5) NULL DEFAULT NULL ,
`city`  smallint(5) NULL DEFAULT NULL ,
`district`  smallint(5) NULL DEFAULT NULL ,
`email`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`zip_code`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_phone`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`best_time`  tinyint(4) NULL DEFAULT NULL ,
`shipping_id`  tinyint(4) NULL DEFAULT NULL ,
`shipping_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`pay_id`  tinyint(4) NULL DEFAULT NULL ,
`pay_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`goods_amount`  decimal(10,2) NULL DEFAULT 0.00 ,
`shipping_fee`  decimal(10,2) NULL DEFAULT 0.00 ,
`pay_fee`  decimal(10,2) NULL DEFAULT 0.00 ,
`balance`  decimal(10,2) NULL DEFAULT 0.00 ,
`paid`  decimal(10,2) NOT NULL DEFAULT 0.00 ,
`money_paid`  decimal(10,2) NULL DEFAULT 0.00 ,
`money_decimal`  decimal(10,2) NULL DEFAULT 0.00 ,
`create_time`  datetime NULL DEFAULT NULL ,
`confirm_time`  datetime NULL DEFAULT NULL ,
`shipping_time`  datetime NULL DEFAULT NULL ,
`pay_time`  datetime NULL DEFAULT NULL ,
`done_time`  datetime NULL DEFAULT NULL COMMENT '完成时间' ,
`order_source`  int(8) NULL DEFAULT 1 ,
`cps_source`  int(11) NOT NULL DEFAULT 1 ,
`order_cps_ext`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`order_type`  tinyint(4) NULL DEFAULT NULL COMMENT '1:正常,2:换货,3:退货,4:拒收,5:赠品' ,
`invoice_status`  tinyint(4) NULL DEFAULT NULL COMMENT '开票状态：2已开发票1未开发票' ,
`invoice_title`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头' ,
`depot_sn`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`shipping_sn`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`cash_card_id`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' ,
`bonus_id`  bigint(11) NULL DEFAULT 0 ,
`bonus_money`  decimal(10,2) NULL DEFAULT 0.00 ,
`ploy_rebate_id`  int(11) NULL DEFAULT 0 ,
`ploy_rebate_money`  decimal(10,2) NULL DEFAULT 0.00 ,
`ploy_combination_id`  int(11) NULL DEFAULT 0 ,
`ploy_combination_money`  decimal(10,2) NULL DEFAULT 0.00 ,
`ploy_rebate_bonus_id`  int(11) NULL DEFAULT 0 COMMENT 'Âú·µ»î¶¯id' ,
`use_points`  int(8) NULL DEFAULT 0 ,
`ploy_freight_id`  int(8) NOT NULL DEFAULT 0 ,
`comments`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注' ,
`modify_time`  datetime NULL DEFAULT NULL ,
`modify_user`  int(11) NULL DEFAULT NULL ,
`locked`  tinyint(4) NULL DEFAULT 1 ,
`cancel_text`  tinyint(4) NOT NULL DEFAULT 0 ,
`ad_adip`  int(8) NOT NULL DEFAULT 0 ,
`rebate`  smallint(5) NOT NULL DEFAULT 100 ,
`levelup`  tinyint(4) NOT NULL DEFAULT 1 COMMENT 'æ˜¯å¦å‡çº§ä¼šå‘˜ï¼š1å¦2å‡' ,
`receive_time`  datetime NULL DEFAULT NULL COMMENT 'ç­¾æ”¶æ—¶é—´' ,
`web_source`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`specials_id`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`coupons_id`  bigint(11) NULL DEFAULT 0 ,
`coupons_money`  decimal(10,0) NULL DEFAULT 0 ,
`admin_id`  int(10) NULL DEFAULT 0 COMMENT '后台用户下单' ,
PRIMARY KEY (`id`),
INDEX `order_sn` USING BTREE (`order_sn`) ,
INDEX `user_id` USING BTREE (`user_id`) ,
INDEX `shipping_id` USING BTREE (`shipping_id`) ,
INDEX `pay_id` USING BTREE (`pay_id`) ,
INDEX `create_time` USING BTREE (`create_time`) ,
INDEX `shipping_time` USING BTREE (`shipping_time`) ,
INDEX `order_status` USING BTREE (`order_status`, `pay_id`, `order_type`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='订单列表'
AUTO_INCREMENT=111

;

-- ----------------------------
-- Table structure for `payments`
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
`id`  tinyint(4) NOT NULL AUTO_INCREMENT ,
`pay_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`bank_code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`api_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`pay_desc`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`pay_fee`  decimal(10,2) NULL DEFAULT 0.00 ,
`pay_order`  tinyint(3) UNSIGNED NULL DEFAULT 0 ,
`pay_config`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`enabled`  tinyint(4) UNSIGNED NULL DEFAULT 0 ,
`is_cod`  tinyint(4) UNSIGNED NULL DEFAULT 0 ,
`is_online`  tinyint(4) UNSIGNED NULL DEFAULT 0 ,
`sort`  int(10) NULL DEFAULT 100 ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='支付方式列表'
AUTO_INCREMENT=43

;

-- ----------------------------
-- Table structure for `per_role_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `per_role_permissions`;
CREATE TABLE `per_role_permissions` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`role_id`  int(11) NOT NULL COMMENT '角色id' ,
`per_id`  int(11) NOT NULL COMMENT '三级权限id' ,
`item`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限代码' ,
PRIMARY KEY (`id`),
INDEX `role_id` USING BTREE (`role_id`, `per_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='权限和角色关联表'
AUTO_INCREMENT=17296

;

-- ----------------------------
-- Table structure for `per_roles`
-- ----------------------------
DROP TABLE IF EXISTS `per_roles`;
CREATE TABLE `per_roles` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称' ,
`description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述' ,
`del`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 正常 2 删除' ,
`user_count`  int(11) NOT NULL DEFAULT 0 COMMENT '数量' ,
PRIMARY KEY (`id`),
INDEX `name` USING BTREE (`name`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='角色表'
AUTO_INCREMENT=42

;

-- ----------------------------
-- Table structure for `per_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `per_user_permissions`;
CREATE TABLE `per_user_permissions` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NOT NULL COMMENT '管理员ID' ,
`per_id`  int(11) NOT NULL COMMENT '三级权限id' ,
`item`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限代码' ,
PRIMARY KEY (`id`),
INDEX `user_id` USING BTREE (`user_id`, `per_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='权限和用户关联表'
AUTO_INCREMENT=39219

;

-- ----------------------------
-- Table structure for `per_users`
-- ----------------------------
DROP TABLE IF EXISTS `per_users`;
CREATE TABLE `per_users` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`login`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名称' ,
`password`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码' ,
`name`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称' ,
`description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述' ,
`email`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱' ,
`phone`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话' ,
`create_date`  datetime NOT NULL COMMENT '创建时间' ,
`del`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 正常  2 禁用' ,
`role_id`  int(11) NOT NULL COMMENT '角色id' ,
`role_name`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称' ,
`create_userid`  int(11) NOT NULL COMMENT '创建人id' ,
`create_name`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人姓名' ,
PRIMARY KEY (`id`),
INDEX `login` USING BTREE (`login`) ,
INDEX `NewIndex1` USING BTREE (`role_id`, `create_userid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='后台用户表'
AUTO_INCREMENT=5

;

-- ----------------------------
-- Table structure for `play_act`
-- ----------------------------
DROP TABLE IF EXISTS `play_act`;
CREATE TABLE `play_act` (
`member_id`  int(11) NOT NULL ,
`is_xiu`  tinyint(1) NOT NULL COMMENT '是否申请选秀' ,
`is_try`  tinyint(1) NOT NULL COMMENT '是否申请试用' ,
PRIMARY KEY (`member_id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
COMMENT='大转盘'

;

-- ----------------------------
-- Table structure for `ploy_awards`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_awards`;
CREATE TABLE `ploy_awards` (
`id`  int(8) NOT NULL AUTO_INCREMENT ,
`lottery_id`  int(8) NULL DEFAULT NULL COMMENT 'æ´»åŠ¨id' ,
`name`  varchar(51) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '1.å®žç‰©2.è™šç‰©' ,
`location`  tinyint(4) NULL DEFAULT NULL COMMENT 'æŠ½å¥–è½¬ç›˜ä½ç½®' ,
`worth`  decimal(10,2) NULL DEFAULT NULL ,
`peak_amount`  int(4) NULL DEFAULT NULL ,
`day_amount`  int(4) NULL DEFAULT NULL COMMENT 'æ¯æ—¥æ€»ä¸­å¥–æ•°é‡' ,
`rule`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'å¥–å“ä½¿ç”¨è§„åˆ™' ,
`dedescription`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='大转盘奖品'
AUTO_INCREMENT=7

;

-- ----------------------------
-- Table structure for `ploy_bonus`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_bonus`;
CREATE TABLE `ploy_bonus` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`bonus_name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`bonus_description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`bonus_type`  tinyint(4) NULL DEFAULT 1 ,
`bonus_money`  decimal(10,2) NULL DEFAULT NULL ,
`bonus_nums`  int(11) NULL DEFAULT NULL ,
`bonus_active_nums`  int(11) NULL DEFAULT NULL ,
`bonus_user`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`bonus_begin_time`  datetime NULL DEFAULT NULL ,
`bonus_end_time`  datetime NULL DEFAULT NULL ,
`bonus_status`  tinyint(4) NULL DEFAULT NULL ,
`use_status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '红包状态：1有效2无效' ,
`use_begin_time`  datetime NULL DEFAULT NULL ,
`use_end_time`  datetime NULL DEFAULT NULL ,
`use_quota`  decimal(10,2) NULL DEFAULT NULL ,
`use_goods`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`create_user`  int(11) NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
`modify_user`  int(11) NULL DEFAULT NULL ,
`modify_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `bonus_type` USING BTREE (`bonus_type`) ,
INDEX `create_user` USING BTREE (`create_user`, `bonus_status`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='红包'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `ploy_bonus_codes`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_bonus_codes`;
CREATE TABLE `ploy_bonus_codes` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`bonus_id`  int(11) NULL DEFAULT NULL ,
`ploy_id`  int(8) NOT NULL DEFAULT 0 ,
`sn`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`active_code`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`active_nums`  int(11) NULL DEFAULT NULL ,
`used_nums`  int(11) NULL DEFAULT 0 ,
`create_time`  datetime NULL DEFAULT NULL ,
`last_active_time`  datetime NULL DEFAULT NULL ,
`recycle`  tinyint(4) NULL DEFAULT 1 ,
PRIMARY KEY (`id`),
INDEX `bonus_id` USING BTREE (`bonus_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='红包激活码'
AUTO_INCREMENT=17

;

-- ----------------------------
-- Table structure for `ploy_code_change_codes`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_code_change_codes`;
CREATE TABLE `ploy_code_change_codes` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`code_change_id`  int(11) NULL DEFAULT NULL COMMENT '活动ID' ,
`member_id`  int(11) NULL DEFAULT NULL COMMENT '用户ID' ,
`code`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '激活码' ,
`count`  int(11) NULL DEFAULT NULL COMMENT '数量' ,
`typed`  tinyint(4) NOT NULL DEFAULT 1 ,
`date`  datetime NULL DEFAULT NULL COMMENT '使用日期' ,
`order_sn`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号吗' ,
PRIMARY KEY (`id`),
INDEX `code_change_id` USING BTREE (`code_change_id`, `member_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='生成的兑换码'
AUTO_INCREMENT=401

;

-- ----------------------------
-- Table structure for `ploy_code_change_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_code_change_goods`;
CREATE TABLE `ploy_code_change_goods` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '编号' ,
`code_change_id`  int(11) NULL DEFAULT NULL COMMENT '活动ID' ,
`sn_style`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`color_sn`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品色码' ,
`total_count`  int(11) NULL DEFAULT 0 COMMENT '总数' ,
`use_count`  int(11) NOT NULL DEFAULT 0 COMMENT '已兑换数量' ,
PRIMARY KEY (`id`),
INDEX `code_change_id` USING BTREE (`code_change_id`, `sn_style`, `color_sn`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='兑换码商品关联表'
AUTO_INCREMENT=3

;

-- ----------------------------
-- Table structure for `ploy_code_changes`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_code_changes`;
CREATE TABLE `ploy_code_changes` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称' ,
`shipping_fee`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'è¿è´¹' ,
`description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述' ,
`count`  int(11) NULL DEFAULT NULL COMMENT '兑换数量' ,
`code_count`  int(11) NULL DEFAULT NULL COMMENT '兑换码数量' ,
`grant_count`  tinyint(4) NOT NULL DEFAULT 1 ,
`special`  int(11) NULL DEFAULT NULL ,
`begin_time`  datetime NULL DEFAULT NULL COMMENT '开始时间' ,
`end_time`  datetime NULL DEFAULT NULL COMMENT '结束时间' ,
`status`  tinyint(4) NULL DEFAULT 1 COMMENT '红包活动状态：1未上线，2一上线，3一下线，4暂停，5取消' ,
`create_user`  int(11) NULL DEFAULT NULL COMMENT '创建人' ,
`create_time`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`modify_user`  int(11) NULL DEFAULT NULL COMMENT '更新人' ,
`modify_time`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `begin_time` USING BTREE (`begin_time`, `end_time`, `status`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='兑换码活动'
AUTO_INCREMENT=17

;

-- ----------------------------
-- Table structure for `ploy_combinations`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_combinations`;
CREATE TABLE `ploy_combinations` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`start_date`  datetime NOT NULL ,
`end_date`  datetime NOT NULL ,
`goods_count`  int(11) NOT NULL ,
`limit_count`  int(11) NOT NULL ,
`cheap_way`  tinyint(4) NOT NULL ,
`cheap_quota`  decimal(10,2) NOT NULL DEFAULT 0.00 ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述' ,
`status`  tinyint(4) NOT NULL DEFAULT 1 ,
`create_date`  datetime NOT NULL ,
`create_userid`  int(11) NOT NULL ,
`update_date`  datetime NOT NULL ,
`update_userid`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `name` USING BTREE (`name`) ,
INDEX `create_userid` USING BTREE (`create_userid`) ,
INDEX `update_userid` USING BTREE (`update_userid`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='组合返活动'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `ploy_coupons`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_coupons`;
CREATE TABLE `ploy_coupons` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`type_id`  int(2) NULL DEFAULT 1 COMMENT '优惠券分类1为单品，2为全场' ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '优惠券名称' ,
`sn_style`  varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '款码' ,
`sn_color`  varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '色码' ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '使用规则' ,
`money`  float(10,2) NULL DEFAULT 0.00 COMMENT '面值' ,
`start_date`  datetime NULL DEFAULT NULL COMMENT '开始时间' ,
`end_date`  datetime NULL DEFAULT NULL COMMENT '结束时间' ,
`show`  tinyint(4) NULL DEFAULT 1 COMMENT '状态;1为正常，2为关闭' ,
`create_userid`  int(4) NULL DEFAULT 0 COMMENT '创建人' ,
`create_date`  datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间' ,
`modify_user`  varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改人' ,
`modify_time`  int(10) NULL DEFAULT 0 COMMENT '修改时间' ,
`sort`  int(10) NULL DEFAULT 100 COMMENT '排序' ,
`del`  tinyint(4) NULL DEFAULT 1 COMMENT '是否删除，2为删除' ,
`status`  tinyint(4) NULL DEFAULT 1 COMMENT '1未上线2已上线3已下线4暂停5取消' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='优惠券'
AUTO_INCREMENT=7

;

-- ----------------------------
-- Table structure for `ploy_coupons_codes`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_coupons_codes`;
CREATE TABLE `ploy_coupons_codes` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`coupon_id`  int(10) NULL DEFAULT NULL COMMENT '优惠券ID' ,
`sn`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠码' ,
`money`  float(10,2) NULL DEFAULT 0.00 COMMENT '面值' ,
`is_use`  tinyint(4) NULL DEFAULT 1 COMMENT '是否使用，1为未使用 2为使用' ,
`is_pay`  tinyint(4) NULL DEFAULT 1 COMMENT '是否支付，1为未支付，2为支付' ,
`user_id`  int(10) NULL DEFAULT 0 COMMENT '用户ID' ,
`mobile`  varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户手机号' ,
`address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户地址' ,
`order_sn`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '订单号' ,
`create_date`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='优惠码表'
AUTO_INCREMENT=1052

;

-- ----------------------------
-- Table structure for `ploy_custom_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_custom_goods`;
CREATE TABLE `ploy_custom_goods` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`custom_id`  int(11) NOT NULL COMMENT 'æ´»åŠ¨id' ,
`sn_style`  varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`style_color`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'å•†å“id' ,
`goods_count`  int(11) NOT NULL COMMENT 'é™å®šå•†å“æ•°é‡' ,
`goods_sold`  int(11) NOT NULL DEFAULT 0 COMMENT 'å·²å”®å•†å“æ•°é‡' ,
`sort`  tinyint(4) NOT NULL DEFAULT 100 ,
`del`  tinyint(4) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`id`),
INDEX `markup_id` USING BTREE (`custom_id`) ,
INDEX `goods_id` USING BTREE (`style_color`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='大礼包商品'
AUTO_INCREMENT=42

;

-- ----------------------------
-- Table structure for `ploy_customs`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_customs`;
CREATE TABLE `ploy_customs` (
`id`  int(8) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·' ,
`name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动名称' ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动描述' ,
`sku`  int(8) NOT NULL DEFAULT 0 COMMENT '实际商品数量，必须和count字段相等才有效' ,
`count`  int(8) NOT NULL DEFAULT 0 COMMENT '礼包内商品数量，约定值' ,
`prices`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '礼盒价格' ,
`status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '1未上线,2已上线,3已下线' ,
`img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`begin_time`  datetime NULL DEFAULT NULL COMMENT '开始时间' ,
`end_time`  datetime NULL DEFAULT NULL COMMENT '结束时间' ,
`create_user`  int(8) NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
`modify_user`  int(8) NULL DEFAULT NULL ,
`modify_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='大礼包活动'
AUTO_INCREMENT=5

;

-- ----------------------------
-- Table structure for `ploy_emails`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_emails`;
CREATE TABLE `ploy_emails` (
`id`  int(8) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·' ,
`name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'æ´»åŠ¨åç§°' ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'æ´»åŠ¨è¯´æ˜Ž' ,
`discount`  decimal(10,1) NOT NULL DEFAULT 0.0 COMMENT 'æŠ˜æ‰£' ,
`content`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'é‚®ç®±åŽç¼€' ,
`status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT 'æ´»åŠ¨çŠ¶æ€' ,
`begin_time`  datetime NULL DEFAULT NULL COMMENT 'å¼€å§‹æ—¶é—´' ,
`end_time`  datetime NULL DEFAULT NULL COMMENT 'ç»“æŸæ—¶é—´' ,
`create_user`  int(8) NULL DEFAULT NULL COMMENT 'åˆ›å»ºäºº' ,
`create_time`  datetime NULL DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´' ,
`modify_user`  int(8) NULL DEFAULT NULL COMMENT 'ä¿®æ”¹äºº' ,
`modify_time`  datetime NULL DEFAULT NULL COMMENT 'ä¿®æ”¹æ—¶é—´' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='邮箱折扣活动'
AUTO_INCREMENT=3

;

-- ----------------------------
-- Table structure for `ploy_favourables`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_favourables`;
CREATE TABLE `ploy_favourables` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '特惠名称' ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '特惠描述' ,
`sn_style`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`style_color`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '款式+颜色' ,
`start_date`  datetime NOT NULL COMMENT '开始时间' ,
`end_date`  datetime NOT NULL COMMENT '结束时间' ,
`price`  decimal(10,2) NOT NULL COMMENT '特惠价格' ,
`number`  int(11) NOT NULL COMMENT '总数量' ,
`limit`  int(8) NOT NULL ,
`number_restrict`  int(11) NOT NULL COMMENT '用户限购数量' ,
`type`  tinyint(4) NOT NULL COMMENT '特惠类型 1.无限制 2.首次购物 3.规定注册时间' ,
`is_weixin`  tinyint(3) NOT NULL DEFAULT 0 COMMENT '0 不是 1 是' ,
`status`  tinyint(4) NOT NULL COMMENT '状态 1．	未上线 2．已上线 3．已过期 4．暂停' ,
`reg_start_date`  datetime NULL DEFAULT NULL COMMENT '注册开始时间' ,
`reg_end_date`  datetime NULL DEFAULT NULL COMMENT '注册结束时间' ,
`create_user_id`  bigint(20) NOT NULL COMMENT '创建者' ,
`create_date`  datetime NOT NULL COMMENT '创建时间' ,
`update_user_id`  bigint(20) NOT NULL COMMENT '更新者' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
`sales`  int(8) NULL DEFAULT 0 ,
PRIMARY KEY (`id`),
INDEX `name` USING BTREE (`name`) ,
INDEX `goods_id` USING BTREE (`style_color`) ,
INDEX `create_user_id` USING BTREE (`create_user_id`) ,
INDEX `update_user_id` USING BTREE (`update_user_id`) ,
INDEX `sn_style` USING BTREE (`sn_style`, `style_color`, `start_date`, `end_date`, `status`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='特惠表'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `ploy_freights`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_freights`;
CREATE TABLE `ploy_freights` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称' ,
`start_date`  datetime NOT NULL COMMENT '开始时间' ,
`end_date`  datetime NOT NULL COMMENT '结束时间' ,
`amount`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '免运费金额' ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述' ,
`status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态，1未上线、2已上线、3已过期、4暂停、5取消' ,
`is_default`  tinyint(4) NOT NULL DEFAULT 2 COMMENT '运费1默认，2否' ,
`type`  int(4) NOT NULL DEFAULT 0 ,
`create_date`  datetime NOT NULL COMMENT '创建时间' ,
`create_userid`  int(11) NOT NULL COMMENT '创建人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
`update_userid`  int(11) NOT NULL COMMENT '更新人' ,
`is_weixin`  tinyint(3) NOT NULL DEFAULT 0 COMMENT '0 不是 1 是' ,
PRIMARY KEY (`id`),
INDEX `create_userid` USING BTREE (`create_userid`) ,
INDEX `update_userid` USING BTREE (`update_userid`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='免运费活动'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `ploy_groupbuy`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_groupbuy`;
CREATE TABLE `ploy_groupbuy` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`start_date`  datetime NOT NULL ,
`end_date`  datetime NOT NULL ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`content`  text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL ,
`status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '12345' ,
`create_date`  datetime NOT NULL ,
`create_userid`  int(11) NOT NULL ,
`update_date`  datetime NOT NULL ,
`update_userid`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `create_userid` USING BTREE (`create_userid`) ,
INDEX `update_userid` USING BTREE (`update_userid`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='团购活动'
AUTO_INCREMENT=6

;

-- ----------------------------
-- Table structure for `ploy_groupbuy_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_groupbuy_goods`;
CREATE TABLE `ploy_groupbuy_goods` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`spike_id`  int(11) NOT NULL COMMENT 'id' ,
`goods_name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`style`  varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`limit_count`  int(11) NOT NULL COMMENT '每人限购个数' ,
`prices`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '团购价格' ,
`goods_count`  int(11) NOT NULL COMMENT '团购数量' ,
`goods_show_count`  int(11) NOT NULL DEFAULT 100 COMMENT '默认显示多少人参团' ,
`market_price`  float(10,2) NOT NULL DEFAULT 0.00 ,
`goods_sold`  int(11) NOT NULL DEFAULT 0 COMMENT '已售数量' ,
`img`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`del`  tinyint(4) NOT NULL DEFAULT 1 COMMENT ' 1 2' ,
PRIMARY KEY (`id`),
INDEX `markup_id` USING BTREE (`spike_id`) ,
INDEX `goods_id` USING BTREE (`style`) ,
INDEX `del` USING BTREE (`del`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='团购商品'
AUTO_INCREMENT=9

;

-- ----------------------------
-- Table structure for `ploy_liuyanqiangs`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_liuyanqiangs`;
CREATE TABLE `ploy_liuyanqiangs` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`user_id`  int(10) NOT NULL COMMENT '用户ID' ,
`name_receive`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称' ,
`name_send`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称' ,
`content`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容' ,
`create_time`  datetime NULL DEFAULT NULL COMMENT '发布时间' ,
`color`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'note_color1' COMMENT '颜色' ,
`show`  tinyint(3) NOT NULL DEFAULT 1 COMMENT '是否显示 1显示2不显示' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `ploy_lotteries`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_lotteries`;
CREATE TABLE `ploy_lotteries` (
`id`  int(8) NOT NULL AUTO_INCREMENT ,
`name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'æ´»åŠ¨è¯´æ˜Ž' ,
`begin_time`  datetime NULL DEFAULT NULL ,
`end_time`  datetime NULL DEFAULT NULL ,
`status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '1.æœªä¸Šçº¿2ã€‚å·²ä¸Šçº¿3.å·²ä¸‹çº¿4.æš‚åœ5.å–æ¶ˆ' ,
`create_user`  int(8) NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
`modify_user`  int(8) NULL DEFAULT NULL ,
`modify_time`  datetime NULL DEFAULT NULL ,
`cede`  tinyint(4) NOT NULL DEFAULT 2 COMMENT 'æ˜¯å¦è®¾ç½®æ”¾å¼ƒå¥–å“1.æ˜¯2.å¦' ,
`amount`  tinyint(4) NULL DEFAULT NULL COMMENT 'å‚ä¸ŽæŠ½å¥–çš„æ¬¡æ•°' ,
`peak_time`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'é«˜å³°æ—¶é—´æ®µ' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='抽奖活动'
AUTO_INCREMENT=2

;

-- ----------------------------
-- Table structure for `ploy_markup_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_markup_goods`;
CREATE TABLE `ploy_markup_goods` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`markup_id`  int(11) NOT NULL COMMENT '活动id' ,
`sn_style`  varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`style_color`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id' ,
`reach_money`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '满足钱数' ,
`prices`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '加价后价格' ,
`goods_count`  int(11) NOT NULL COMMENT '限定商品数量' ,
`goods_sold`  int(11) NOT NULL DEFAULT 0 COMMENT '已售商品数量' ,
`sort`  tinyint(4) NOT NULL DEFAULT 100 ,
`del`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1正常 2删除' ,
PRIMARY KEY (`id`),
INDEX `markup_id` USING BTREE (`markup_id`) ,
INDEX `goods_id` USING BTREE (`style_color`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='加价购商品'
AUTO_INCREMENT=10

;

-- ----------------------------
-- Table structure for `ploy_markups`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_markups`;
CREATE TABLE `ploy_markups` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称' ,
`start_date`  datetime NOT NULL COMMENT '开始时间' ,
`end_date`  datetime NOT NULL COMMENT '结束时间' ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述' ,
`status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态，1未上线、2已上线、3已过期、4暂停、5取消' ,
`create_date`  datetime NOT NULL COMMENT '创建时间' ,
`create_userid`  int(11) NOT NULL COMMENT '创建人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
`update_userid`  int(11) NOT NULL COMMENT '更新人' ,
PRIMARY KEY (`id`),
INDEX `create_userid` USING BTREE (`create_userid`) ,
INDEX `update_userid` USING BTREE (`update_userid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='加价购活动'
AUTO_INCREMENT=3

;

-- ----------------------------
-- Table structure for `ploy_pays`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_pays`;
CREATE TABLE `ploy_pays` (
`id`  int(8) NOT NULL AUTO_INCREMENT COMMENT '??C??' ,
`name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????' ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '???????' ,
`discount`  decimal(10,1) NOT NULL DEFAULT 0.0 COMMENT '????' ,
`content`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '?????????' ,
`status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '?????????' ,
`begin_time`  datetime NULL DEFAULT NULL COMMENT '??????' ,
`end_time`  datetime NULL DEFAULT NULL COMMENT '???????' ,
`create_user`  int(8) NULL DEFAULT NULL COMMENT '?????o?oo' ,
`create_time`  datetime NULL DEFAULT NULL COMMENT '?????o??' ,
`modify_user`  int(8) NULL DEFAULT NULL COMMENT '????1?oo' ,
`modify_time`  datetime NULL DEFAULT NULL COMMENT '????1??' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='支付折扣，网银相关'
AUTO_INCREMENT=9

;

-- ----------------------------
-- Table structure for `ploy_points`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_points`;
CREATE TABLE `ploy_points` (
`id`  int(8) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·' ,
`name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'æ´»åŠ¨åç§°' ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'æ´»åŠ¨è¯´æ˜Ž' ,
`type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT 'æ´»åŠ¨ç±»åž‹' ,
`points`  int(8) NOT NULL DEFAULT 0 COMMENT 'ç§¯åˆ†æ•°é‡' ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'åŒå€ç§¯åˆ†æ´»åŠ¨ç±»å®¹' ,
`status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT 'æ´»åŠ¨çŠ¶æ€' ,
`begin_time`  datetime NULL DEFAULT NULL COMMENT 'å¼€å§‹æ—¶é—´' ,
`end_time`  datetime NULL DEFAULT NULL COMMENT 'ç»“æŸæ—¶é—´' ,
`create_user`  int(8) NULL DEFAULT NULL COMMENT 'åˆ›å»ºäºº' ,
`create_time`  datetime NULL DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´' ,
`modify_user`  int(8) NULL DEFAULT NULL COMMENT 'ä¿®æ”¹äºº' ,
`modify_time`  datetime NULL DEFAULT NULL COMMENT 'ä¿®æ”¹æ—¶é—´' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='积分活动'
AUTO_INCREMENT=2

;

-- ----------------------------
-- Table structure for `ploy_points_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_points_goods`;
CREATE TABLE `ploy_points_goods` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`points_id`  int(11) NOT NULL COMMENT 'æ´»åŠ¨id' ,
`sn_style`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`style_color`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'å•†å“id' ,
`points`  int(8) NOT NULL DEFAULT 0 COMMENT 'æ¢è´­ä»·æ ¼' ,
PRIMARY KEY (`id`),
INDEX `points_id` USING BTREE (`points_id`) ,
INDEX `style_color` USING BTREE (`style_color`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='参与积分活动的商品'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `ploy_promotions`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_promotions`;
CREATE TABLE `ploy_promotions` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`begin_time`  datetime NOT NULL COMMENT 'å¼€å§‹æ—¶é—´' ,
`end_time`  datetime NOT NULL COMMENT 'ç»“æŸæ—¶é—´' ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'å•†å“ä¿¡æ¯' ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'æè¿°' ,
`status`  tinyint(4) NOT NULL DEFAULT 1 ,
`create_date`  datetime NULL DEFAULT NULL ,
`create_userid`  int(11) NULL DEFAULT NULL ,
`update_date`  datetime NULL DEFAULT NULL ,
`update_userid`  int(11) NULL DEFAULT NULL ,
`is_weixin`  tinyint(3) NOT NULL DEFAULT 0 COMMENT '0 不是 1 是' ,
PRIMARY KEY (`id`),
INDEX `name` USING BTREE (`name`) ,
INDEX `create_userid` USING BTREE (`create_userid`) ,
INDEX `update_userid` USING BTREE (`update_userid`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='促销信息'
AUTO_INCREMENT=2

;

-- ----------------------------
-- Table structure for `ploy_rebates`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_rebates`;
CREATE TABLE `ploy_rebates` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`rebate_name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`rebate_description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`rebate_status`  tinyint(4) NULL DEFAULT 1 ,
`rebate_goods`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`rebate_content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`begin_time`  datetime NULL DEFAULT NULL ,
`end_time`  datetime NULL DEFAULT NULL ,
`create_user`  int(11) NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
`modify_user`  int(11) NULL DEFAULT NULL ,
`modify_time`  datetime NULL DEFAULT NULL ,
`is_weixin`  tinyint(3) NOT NULL DEFAULT 0 COMMENT '0 不是 1 是' ,
PRIMARY KEY (`id`),
INDEX `modify_user` USING BTREE (`modify_user`) ,
INDEX `create_user` USING BTREE (`create_user`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='满减活动'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `ploy_spike_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_spike_goods`;
CREATE TABLE `ploy_spike_goods` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`spike_id`  int(11) NOT NULL COMMENT '活动id' ,
`goods_name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '秒杀商品名称' ,
`style`  varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品款' ,
`limit_count`  int(11) NOT NULL COMMENT '每人限购数量' ,
`prices`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '秒杀价格' ,
`goods_count`  int(11) NOT NULL COMMENT '限定商品数量' ,
`goods_show_count`  int(11) NOT NULL DEFAULT 100 COMMENT '显示数量' ,
`market_price`  decimal(10,2) NOT NULL DEFAULT 0.00 ,
`goods_sold`  int(11) NOT NULL DEFAULT 0 COMMENT '已售商品数量' ,
`img`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`del`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1正常 2删除' ,
PRIMARY KEY (`id`),
INDEX `markup_id` USING BTREE (`spike_id`) ,
INDEX `goods_id` USING BTREE (`style`) ,
INDEX `del` USING BTREE (`del`) ,
INDEX `goods_sold` USING BTREE (`goods_sold`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='参与秒杀的商品'
AUTO_INCREMENT=5

;

-- ----------------------------
-- Table structure for `ploy_spikes`
-- ----------------------------
DROP TABLE IF EXISTS `ploy_spikes`;
CREATE TABLE `ploy_spikes` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称' ,
`status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态，1未上线、2已上线、3已过期、4暂停、5取消' ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述' ,
`start_date`  datetime NOT NULL COMMENT '开始时间' ,
`end_date`  datetime NOT NULL COMMENT '结束时间' ,
`shipping_date`  datetime NOT NULL COMMENT '发货时间' ,
`create_date`  datetime NOT NULL COMMENT '创建时间' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
`create_userid`  int(11) NOT NULL COMMENT '创建人' ,
`update_userid`  int(11) NOT NULL COMMENT '更新人' ,
PRIMARY KEY (`id`),
INDEX `status` USING BTREE (`status`, `start_date`, `end_date`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='秒杀活动'
AUTO_INCREMENT=2

;

-- ----------------------------
-- Table structure for `ploys`
-- ----------------------------
DROP TABLE IF EXISTS `ploys`;
CREATE TABLE `ploys` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`ploy_type`  int(8) NOT NULL DEFAULT 5 ,
`ploy_name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ploy_description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ploy_condition`  tinyint(4) NULL DEFAULT 1 ,
`min_price`  smallint(5) NULL DEFAULT NULL COMMENT '¶©µ¥×îÐ¡½ð¶îÏÞÖÆ' ,
`bonus_id`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`begin_time`  datetime NULL DEFAULT NULL ,
`end_time`  datetime NULL DEFAULT NULL ,
`status`  tinyint(4) NULL DEFAULT NULL ,
`is_login`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否登录送红包' ,
`create_user`  int(11) NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
`modify_user`  int(11) NULL DEFAULT NULL ,
`modify_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `bonus_type` USING BTREE (`ploy_condition`) ,
INDEX `create_user` USING BTREE (`create_user`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='红包活动表'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `position_manages`
-- ----------------------------
DROP TABLE IF EXISTS `position_manages`;
CREATE TABLE `position_manages` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`page_name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '页面名称' ,
`position_name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '位置名称' ,
`type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '12' ,
`width`  int(11) NOT NULL COMMENT '宽' ,
`height`  int(11) NOT NULL COMMENT '高' ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '位置全内容' ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '位置描述' ,
`update_userid`  int(11) NULL DEFAULT NULL COMMENT '更新人' ,
`update_date`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='位置管理表'
AUTO_INCREMENT=8

;

-- ----------------------------
-- Table structure for `position_timers`
-- ----------------------------
DROP TABLE IF EXISTS `position_timers`;
CREATE TABLE `position_timers` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`position_id`  int(11) NOT NULL ,
`begin_date`  datetime NOT NULL ,
`state`  tinyint(4) NOT NULL DEFAULT 1 ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`update_userid`  int(11) NULL DEFAULT NULL ,
`update_date`  datetime NULL DEFAULT NULL ,
`del`  tinyint(4) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='定时广告位置'
AUTO_INCREMENT=3

;

-- ----------------------------
-- Table structure for `pre_users_logins`
-- ----------------------------
DROP TABLE IF EXISTS `pre_users_logins`;
CREATE TABLE `pre_users_logins` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`role_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '角色名' ,
`admin_id`  int(10) NULL DEFAULT 0 COMMENT '管理员ID' ,
`admin_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号' ,
`ip`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'ip' ,
`login_time`  datetime NULL DEFAULT '0000-00-00 00:00:00' COMMENT '登录时间' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
COMMENT='后台登录日志'
AUTO_INCREMENT=482

;

-- ----------------------------
-- Table structure for `regions`
-- ----------------------------
DROP TABLE IF EXISTS `regions`;
CREATE TABLE `regions` (
`id`  smallint(5) NOT NULL AUTO_INCREMENT ,
`parent_id`  smallint(5) NULL DEFAULT NULL ,
`region_name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`region_type`  tinyint(1) NULL DEFAULT NULL ,
`time`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`default_city`  tinyint(2) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`),
INDEX `parent_id` USING BTREE (`parent_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='地区表'
AUTO_INCREMENT=3477

;

-- ----------------------------
-- Table structure for `seo_contents`
-- ----------------------------
DROP TABLE IF EXISTS `seo_contents`;
CREATE TABLE `seo_contents` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`typeid`  int(10) NULL DEFAULT 0 COMMENT '分类' ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面名称' ,
`page`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属页面' ,
`title`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '标题' ,
`keyword`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关键字' ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述' ,
`self_title`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`self_keyword`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`self_description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='站点seo表'
AUTO_INCREMENT=7

;

-- ----------------------------
-- Table structure for `seo_types`
-- ----------------------------
DROP TABLE IF EXISTS `seo_types`;
CREATE TABLE `seo_types` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`parentid`  int(10) NULL DEFAULT 0 ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`val`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=7

;

-- ----------------------------
-- Table structure for `share_settings`
-- ----------------------------
DROP TABLE IF EXISTS `share_settings`;
CREATE TABLE `share_settings` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`icon`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`key`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`type`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`state`  tinyint(4) NOT NULL DEFAULT 1 ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`del`  tinyint(4) NOT NULL DEFAULT 1 COMMENT ' 1 2' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='分享到SNS设置'
AUTO_INCREMENT=6

;

-- ----------------------------
-- Table structure for `share_templates`
-- ----------------------------
DROP TABLE IF EXISTS `share_templates`;
CREATE TABLE `share_templates` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题' ,
`content`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容' ,
`custom_title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`custom_content`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ftype`  tinyint(4) NOT NULL DEFAULT 1 ,
`show`  tinyint(4) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='分享模板表'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `shell_sites`
-- ----------------------------
DROP TABLE IF EXISTS `shell_sites`;
CREATE TABLE `shell_sites` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`type`  tinyint(4) NOT NULL DEFAULT 1 ,
`key`  tinyint(4) NOT NULL ,
`value`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`state`  tinyint(4) NOT NULL DEFAULT 1 ,
`del`  tinyint(4) NOT NULL DEFAULT 1 ,
`name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='脚本配置'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `shippings`
-- ----------------------------
DROP TABLE IF EXISTS `shippings`;
CREATE TABLE `shippings` (
`id`  tinyint(4) NOT NULL AUTO_INCREMENT ,
`shipping_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`shipping_description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`shipping_fee`  decimal(10,2) NOT NULL DEFAULT 0.00 ,
`other_region_fee`  decimal(10,2) NOT NULL DEFAULT 0.00 ,
`enabled`  tinyint(4) NOT NULL DEFAULT 1 ,
`cod_default`  tinyint(4) NULL DEFAULT 0 ,
`online_default`  tinyint(4) NULL DEFAULT 0 ,
`sort`  tinyint(4) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='快递方式列表'
AUTO_INCREMENT=19

;

-- ----------------------------
-- Table structure for `specials`
-- ----------------------------
DROP TABLE IF EXISTS `specials`;
CREATE TABLE `specials` (
`id`  int(8) NOT NULL AUTO_INCREMENT COMMENT '编号' ,
`title`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专题名称' ,
`alias`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名' ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '专题内容' ,
`goods_ids`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`status`  tinyint(4) NOT NULL DEFAULT 1 ,
`is_weixin`  tinyint(3) NOT NULL DEFAULT 0 COMMENT '0 不是 1是' ,
`create_time`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`del`  tinyint(4) NULL DEFAULT 1 COMMENT '1:未删除2:已删除' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='专题列表'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `syslists`
-- ----------------------------
DROP TABLE IF EXISTS `syslists`;
CREATE TABLE `syslists` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`uid`  int(11) NOT NULL ,
`name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`sort`  int(11) NOT NULL ,
`is_show`  tinyint(1) NOT NULL DEFAULT 1 ,
`level`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=15

;

-- ----------------------------
-- Table structure for `t_conversion`
-- ----------------------------
DROP TABLE IF EXISTS `t_conversion`;
CREATE TABLE `t_conversion` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`goods_ip`  int(10) NULL DEFAULT NULL COMMENT 'goods的控制器访问量' ,
`carts_ip`  int(10) NULL DEFAULT NULL COMMENT 'carts的控制器访问量' ,
`checkout_ip`  int(10) NULL DEFAULT NULL COMMENT 'checkout的控制器访问量' ,
`checkout_payment_ip`  int(10) NULL DEFAULT NULL COMMENT '支付的控制器访问量' ,
`date`  date NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
COMMENT='控制器访问量(goods/carts/checkout)'
AUTO_INCREMENT=2

;

-- ----------------------------
-- Table structure for `t_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`goods_id`  int(10) NULL DEFAULT NULL ,
`pv`  int(10) NULL DEFAULT NULL ,
`ip`  int(10) NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `goods_id` USING BTREE (`goods_id`, `pv`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
COMMENT='商品信息统计信息'
AUTO_INCREMENT=6

;

-- ----------------------------
-- Table structure for `t_source`
-- ----------------------------
DROP TABLE IF EXISTS `t_source`;
CREATE TABLE `t_source` (
`id`  bigint(19) NOT NULL AUTO_INCREMENT ,
`domain`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`pv`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='来源分析'
AUTO_INCREMENT=8

;

-- ----------------------------
-- Table structure for `t_specials`
-- ----------------------------
DROP TABLE IF EXISTS `t_specials`;
CREATE TABLE `t_specials` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`specials_id`  int(10) NOT NULL DEFAULT 0 COMMENT 'id' ,
`pv`  int(10) NOT NULL ,
`ip`  int(10) NOT NULL ,
`create_time`  datetime NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='专题活动的统计信息'
AUTO_INCREMENT=3

;

-- ----------------------------
-- Table structure for `t_value`
-- ----------------------------
DROP TABLE IF EXISTS `t_value`;
CREATE TABLE `t_value` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`pv`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ip`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`capita`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人均浏览' ,
`tiaochu`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳出率' ,
`create_time`  datetime NOT NULL ,
PRIMARY KEY (`id`),
INDEX `pv` USING BTREE (`pv`, `ip`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='总PV和IP'
AUTO_INCREMENT=2

;

-- ----------------------------
-- Table structure for `t_value_h`
-- ----------------------------
DROP TABLE IF EXISTS `t_value_h`;
CREATE TABLE `t_value_h` (
`id`  bigint(19) NOT NULL AUTO_INCREMENT ,
`pv`  bigint(19) NOT NULL DEFAULT 0 ,
`ip`  bigint(19) NOT NULL DEFAULT 0 ,
`create_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='24小时访问pv\\ip记录'
AUTO_INCREMENT=25

;

-- ----------------------------
-- Table structure for `tel_resetpasswords`
-- ----------------------------
DROP TABLE IF EXISTS `tel_resetpasswords`;
CREATE TABLE `tel_resetpasswords` (
`id`  int(10) NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`code`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '验证码' ,
`tel`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号' ,
`create_time`  datetime NOT NULL COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `template_cate`
-- ----------------------------
DROP TABLE IF EXISTS `template_cate`;
CREATE TABLE `template_cate` (
`id`  int(4) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sort`  int(4) NULL DEFAULT 50 ,
`del`  tinyint(1) NULL DEFAULT 1 ,
`show`  tinyint(1) NULL DEFAULT 1 ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='模板分类'
AUTO_INCREMENT=17

;

-- ----------------------------
-- Table structure for `templates`
-- ----------------------------
DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`cateid`  int(10) NULL DEFAULT 0 ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`dirname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`themes`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主题' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='模板'
AUTO_INCREMENT=16

;

-- ----------------------------
-- Table structure for `themes`
-- ----------------------------
DROP TABLE IF EXISTS `themes`;
CREATE TABLE `themes` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主题名称' ,
`dir`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主题目录' ,
`img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '预览图' ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '介绍' ,
`is_use`  tinyint(1) NULL DEFAULT 0 COMMENT '1为当前使用' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='模板主题'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `third_lands`
-- ----------------------------
DROP TABLE IF EXISTS `third_lands`;
CREATE TABLE `third_lands` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`logo`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`app_key`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`app_secret`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`state`  tinyint(4) NOT NULL DEFAULT 1 ,
`is_use_snsshop`  tinyint(1) NULL DEFAULT 0 COMMENT '是否启用snsshop登陆' ,
`app_ids`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '第三方的APPID' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='第三方登录配置'
AUTO_INCREMENT=9

;

-- ----------------------------
-- Table structure for `thirds_goods_temps`
-- ----------------------------
DROP TABLE IF EXISTS `thirds_goods_temps`;
CREATE TABLE `thirds_goods_temps` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`third_goods_sn`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品ID，淘宝' ,
`third_goods_skuid`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`goods_brands`  int(10) NULL DEFAULT 0 COMMENT '商品品牌' ,
`goods_classid`  int(10) NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`alias`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`color`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sn_color`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`color_code`  varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`size`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`main_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品主图' ,
`reserves`  int(10) NULL DEFAULT NULL ,
`shop_price`  float(10,2) NULL DEFAULT NULL ,
`type`  tinyint(4) NULL DEFAULT NULL COMMENT '第三方类型 1 淘宝  2 拍拍 3 京东 4 一号店 ' ,
`show_img`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品展示图片' ,
`gooods_colors`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '原店铺商品颜色' ,
`goods_skus`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '原店铺商品SKU' ,
`input_str`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌和货号' ,
`goods_description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`is_edit`  tinyint(1) NULL DEFAULT 0 COMMENT '是否编辑过，1为已编辑' ,
`is_copy`  tinyint(1) NULL DEFAULT NULL ,
`status`  tinyint(1) NULL DEFAULT 0 COMMENT '状态' ,
`del`  tinyint(4) NULL DEFAULT 1 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='第三方商品表'
AUTO_INCREMENT=34

;

-- ----------------------------
-- Table structure for `tuans`
-- ----------------------------
DROP TABLE IF EXISTS `tuans`;
CREATE TABLE `tuans` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`company`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`tel`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`mobile`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`create_user_id`  int(11) NOT NULL ,
`create_date`  datetime NOT NULL ,
`update_user_id`  int(11) NOT NULL ,
`update_date`  datetime NOT NULL ,
`del`  tinyint(4) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='大客户信息记录'
AUTO_INCREMENT=2

;

-- ----------------------------
-- Table structure for `user_logs`
-- ----------------------------
DROP TABLE IF EXISTS `user_logs`;
CREATE TABLE `user_logs` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
`user_id`  int(11) NOT NULL COMMENT '管理员ID' ,
`user_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员姓名' ,
`member_id`  int(11) NULL DEFAULT NULL COMMENT '用户id' ,
`order_sn`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号' ,
`type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '类型' ,
`date`  datetime NOT NULL COMMENT '操作日期' ,
`info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作明细' ,
PRIMARY KEY (`id`),
INDEX `user_id` USING BTREE (`id`, `user_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户后台操作日志'
AUTO_INCREMENT=37

;

-- ----------------------------
-- Table structure for `web_fans`
-- ----------------------------
DROP TABLE IF EXISTS `web_fans`;
CREATE TABLE `web_fans` (
`id`  int(2) NOT NULL AUTO_INCREMENT ,
`tqq`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '腾讯微博' ,
`qq`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证QQ' ,
`sina`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新浪微博' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='关注设置'
AUTO_INCREMENT=2

;

-- ----------------------------
-- Table structure for `widgets`
-- ----------------------------
DROP TABLE IF EXISTS `widgets`;
CREATE TABLE `widgets` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`base_file`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`base_slot`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`base_id`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`widgets_type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`widgets_order`  tinyint(3) UNSIGNED NOT NULL DEFAULT 5 ,
`title`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`domid`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`border`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`classname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`tpl`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`params`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`modified`  int(10) UNSIGNED NULL DEFAULT 0 ,
`vary`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
PRIMARY KEY (`id`),
INDEX `base_file` USING BTREE (`base_file`) ,
INDEX ` base_id` USING BTREE (`base_id`) ,
INDEX `widgets_type` USING BTREE (`widgets_type`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='插件'
AUTO_INCREMENT=172

;

-- ----------------------------
-- Table structure for `yitao`
-- ----------------------------
DROP TABLE IF EXISTS `yitao`;
CREATE TABLE `yitao` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`type`  tinyint(4) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='一淘兑换码'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Auto increment value for `action_logs`
-- ----------------------------
ALTER TABLE `action_logs` AUTO_INCREMENT=940;

-- ----------------------------
-- Auto increment value for `activities`
-- ----------------------------
ALTER TABLE `activities` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `ad_val`
-- ----------------------------
ALTER TABLE `ad_val` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `admin_carts`
-- ----------------------------
ALTER TABLE `admin_carts` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `ads`
-- ----------------------------
ALTER TABLE `ads` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `areas`
-- ----------------------------
ALTER TABLE `areas` AUTO_INCREMENT=2117;

-- ----------------------------
-- Auto increment value for `bonus`
-- ----------------------------
ALTER TABLE `bonus` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `carts`
-- ----------------------------
ALTER TABLE `carts` AUTO_INCREMENT=667;

-- ----------------------------
-- Auto increment value for `cms_classes`
-- ----------------------------
ALTER TABLE `cms_classes` AUTO_INCREMENT=10;

-- ----------------------------
-- Auto increment value for `cms_contents`
-- ----------------------------
ALTER TABLE `cms_contents` AUTO_INCREMENT=50;

-- ----------------------------
-- Auto increment value for `depots`
-- ----------------------------
ALTER TABLE `depots` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `e_classes`
-- ----------------------------
ALTER TABLE `e_classes` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for `e_pictures`
-- ----------------------------
ALTER TABLE `e_pictures` AUTO_INCREMENT=408;

-- ----------------------------
-- Auto increment value for `e_sites`
-- ----------------------------
ALTER TABLE `e_sites` AUTO_INCREMENT=21;

-- ----------------------------
-- Auto increment value for `email_temps`
-- ----------------------------
ALTER TABLE `email_temps` AUTO_INCREMENT=14;

-- ----------------------------
-- Auto increment value for `erp_goods_locks`
-- ----------------------------
ALTER TABLE `erp_goods_locks` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `erp_goods_stocks`
-- ----------------------------
ALTER TABLE `erp_goods_stocks` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `exchanges`
-- ----------------------------
ALTER TABLE `exchanges` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `express_details`
-- ----------------------------
ALTER TABLE `express_details` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `express_temps`
-- ----------------------------
ALTER TABLE `express_temps` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for `goods`
-- ----------------------------
ALTER TABLE `goods` AUTO_INCREMENT=75;

-- ----------------------------
-- Auto increment value for `goods_all_association`
-- ----------------------------
ALTER TABLE `goods_all_association` AUTO_INCREMENT=83;

-- ----------------------------
-- Auto increment value for `goods_attribute_group`
-- ----------------------------
ALTER TABLE `goods_attribute_group` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `goods_attributes`
-- ----------------------------
ALTER TABLE `goods_attributes` AUTO_INCREMENT=2091;

-- ----------------------------
-- Auto increment value for `goods_brands`
-- ----------------------------
ALTER TABLE `goods_brands` AUTO_INCREMENT=50;

-- ----------------------------
-- Auto increment value for `goods_classes`
-- ----------------------------
ALTER TABLE `goods_classes` AUTO_INCREMENT=60;

-- ----------------------------
-- Auto increment value for `goods_classes_attribute`
-- ----------------------------
ALTER TABLE `goods_classes_attribute` AUTO_INCREMENT=35;

-- ----------------------------
-- Auto increment value for `goods_classes_map`
-- ----------------------------
ALTER TABLE `goods_classes_map` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `goods_collects`
-- ----------------------------
ALTER TABLE `goods_collects` AUTO_INCREMENT=23;

-- ----------------------------
-- Auto increment value for `goods_colors`
-- ----------------------------
ALTER TABLE `goods_colors` AUTO_INCREMENT=78;

-- ----------------------------
-- Auto increment value for `goods_depots`
-- ----------------------------
ALTER TABLE `goods_depots` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `goods_ga_association`
-- ----------------------------
ALTER TABLE `goods_ga_association` AUTO_INCREMENT=40;

-- ----------------------------
-- Auto increment value for `goods_gc_association`
-- ----------------------------
ALTER TABLE `goods_gc_association` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for `goods_goods_colors`
-- ----------------------------
ALTER TABLE `goods_goods_colors` AUTO_INCREMENT=52;

-- ----------------------------
-- Auto increment value for `goods_goods_tags`
-- ----------------------------
ALTER TABLE `goods_goods_tags` AUTO_INCREMENT=360;

-- ----------------------------
-- Auto increment value for `goods_marks`
-- ----------------------------
ALTER TABLE `goods_marks` AUTO_INCREMENT=8;

-- ----------------------------
-- Auto increment value for `goods_reminds`
-- ----------------------------
ALTER TABLE `goods_reminds` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `goods_suppliers`
-- ----------------------------
ALTER TABLE `goods_suppliers` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `goods_tags`
-- ----------------------------
ALTER TABLE `goods_tags` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for `goods_thirds`
-- ----------------------------
ALTER TABLE `goods_thirds` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `goods_weibo`
-- ----------------------------
ALTER TABLE `goods_weibo` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `invite_friends`
-- ----------------------------
ALTER TABLE `invite_friends` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `jiayuan`
-- ----------------------------
ALTER TABLE `jiayuan` AUTO_INCREMENT=401;

-- ----------------------------
-- Auto increment value for `member_addresses`
-- ----------------------------
ALTER TABLE `member_addresses` AUTO_INCREMENT=44;

-- ----------------------------
-- Auto increment value for `member_bonus`
-- ----------------------------
ALTER TABLE `member_bonus` AUTO_INCREMENT=8;

-- ----------------------------
-- Auto increment value for `member_cash_cards`
-- ----------------------------
ALTER TABLE `member_cash_cards` AUTO_INCREMENT=45;

-- ----------------------------
-- Auto increment value for `member_cash_cards_logs`
-- ----------------------------
ALTER TABLE `member_cash_cards_logs` AUTO_INCREMENT=8;

-- ----------------------------
-- Auto increment value for `member_codes`
-- ----------------------------
ALTER TABLE `member_codes` AUTO_INCREMENT=28;

-- ----------------------------
-- Auto increment value for `member_comments`
-- ----------------------------
ALTER TABLE `member_comments` AUTO_INCREMENT=172;

-- ----------------------------
-- Auto increment value for `member_coupons`
-- ----------------------------
ALTER TABLE `member_coupons` AUTO_INCREMENT=18;

-- ----------------------------
-- Auto increment value for `member_groups`
-- ----------------------------
ALTER TABLE `member_groups` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for `member_infos`
-- ----------------------------
ALTER TABLE `member_infos` AUTO_INCREMENT=53;

-- ----------------------------
-- Auto increment value for `member_openids`
-- ----------------------------
ALTER TABLE `member_openids` AUTO_INCREMENT=31;

-- ----------------------------
-- Auto increment value for `member_points`
-- ----------------------------
ALTER TABLE `member_points` AUTO_INCREMENT=69;

-- ----------------------------
-- Auto increment value for `members`
-- ----------------------------
ALTER TABLE `members` AUTO_INCREMENT=74;

-- ----------------------------
-- Auto increment value for `mobile_blacks`
-- ----------------------------
ALTER TABLE `mobile_blacks` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for `navsets`
-- ----------------------------
ALTER TABLE `navsets` AUTO_INCREMENT=13;

-- ----------------------------
-- Auto increment value for `online_pay_logs`
-- ----------------------------
ALTER TABLE `online_pay_logs` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `online_services`
-- ----------------------------
ALTER TABLE `online_services` AUTO_INCREMENT=19;

-- ----------------------------
-- Auto increment value for `order_exchanges`
-- ----------------------------
ALTER TABLE `order_exchanges` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `order_goods`
-- ----------------------------
ALTER TABLE `order_goods` AUTO_INCREMENT=187;

-- ----------------------------
-- Auto increment value for `order_invoices`
-- ----------------------------
ALTER TABLE `order_invoices` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `order_logs`
-- ----------------------------
ALTER TABLE `order_logs` AUTO_INCREMENT=344;

-- ----------------------------
-- Auto increment value for `order_refund_goods`
-- ----------------------------
ALTER TABLE `order_refund_goods` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `order_templist`
-- ----------------------------
ALTER TABLE `order_templist` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `order_third`
-- ----------------------------
ALTER TABLE `order_third` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `order_third_abnormals`
-- ----------------------------
ALTER TABLE `order_third_abnormals` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `orders`
-- ----------------------------
ALTER TABLE `orders` AUTO_INCREMENT=111;

-- ----------------------------
-- Auto increment value for `payments`
-- ----------------------------
ALTER TABLE `payments` AUTO_INCREMENT=43;

-- ----------------------------
-- Auto increment value for `per_role_permissions`
-- ----------------------------
ALTER TABLE `per_role_permissions` AUTO_INCREMENT=17296;

-- ----------------------------
-- Auto increment value for `per_roles`
-- ----------------------------
ALTER TABLE `per_roles` AUTO_INCREMENT=42;

-- ----------------------------
-- Auto increment value for `per_user_permissions`
-- ----------------------------
ALTER TABLE `per_user_permissions` AUTO_INCREMENT=39219;

-- ----------------------------
-- Auto increment value for `per_users`
-- ----------------------------
ALTER TABLE `per_users` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `ploy_awards`
-- ----------------------------
ALTER TABLE `ploy_awards` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `ploy_bonus`
-- ----------------------------
ALTER TABLE `ploy_bonus` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `ploy_bonus_codes`
-- ----------------------------
ALTER TABLE `ploy_bonus_codes` AUTO_INCREMENT=17;

-- ----------------------------
-- Auto increment value for `ploy_code_change_codes`
-- ----------------------------
ALTER TABLE `ploy_code_change_codes` AUTO_INCREMENT=401;

-- ----------------------------
-- Auto increment value for `ploy_code_change_goods`
-- ----------------------------
ALTER TABLE `ploy_code_change_goods` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `ploy_code_changes`
-- ----------------------------
ALTER TABLE `ploy_code_changes` AUTO_INCREMENT=17;

-- ----------------------------
-- Auto increment value for `ploy_combinations`
-- ----------------------------
ALTER TABLE `ploy_combinations` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `ploy_coupons`
-- ----------------------------
ALTER TABLE `ploy_coupons` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `ploy_coupons_codes`
-- ----------------------------
ALTER TABLE `ploy_coupons_codes` AUTO_INCREMENT=1052;

-- ----------------------------
-- Auto increment value for `ploy_custom_goods`
-- ----------------------------
ALTER TABLE `ploy_custom_goods` AUTO_INCREMENT=42;

-- ----------------------------
-- Auto increment value for `ploy_customs`
-- ----------------------------
ALTER TABLE `ploy_customs` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `ploy_emails`
-- ----------------------------
ALTER TABLE `ploy_emails` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `ploy_favourables`
-- ----------------------------
ALTER TABLE `ploy_favourables` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `ploy_freights`
-- ----------------------------
ALTER TABLE `ploy_freights` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `ploy_groupbuy`
-- ----------------------------
ALTER TABLE `ploy_groupbuy` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for `ploy_groupbuy_goods`
-- ----------------------------
ALTER TABLE `ploy_groupbuy_goods` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for `ploy_liuyanqiangs`
-- ----------------------------
ALTER TABLE `ploy_liuyanqiangs` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `ploy_lotteries`
-- ----------------------------
ALTER TABLE `ploy_lotteries` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `ploy_markup_goods`
-- ----------------------------
ALTER TABLE `ploy_markup_goods` AUTO_INCREMENT=10;

-- ----------------------------
-- Auto increment value for `ploy_markups`
-- ----------------------------
ALTER TABLE `ploy_markups` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `ploy_pays`
-- ----------------------------
ALTER TABLE `ploy_pays` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for `ploy_points`
-- ----------------------------
ALTER TABLE `ploy_points` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `ploy_points_goods`
-- ----------------------------
ALTER TABLE `ploy_points_goods` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `ploy_promotions`
-- ----------------------------
ALTER TABLE `ploy_promotions` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `ploy_rebates`
-- ----------------------------
ALTER TABLE `ploy_rebates` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `ploy_spike_goods`
-- ----------------------------
ALTER TABLE `ploy_spike_goods` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `ploy_spikes`
-- ----------------------------
ALTER TABLE `ploy_spikes` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `ploys`
-- ----------------------------
ALTER TABLE `ploys` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `position_manages`
-- ----------------------------
ALTER TABLE `position_manages` AUTO_INCREMENT=8;

-- ----------------------------
-- Auto increment value for `position_timers`
-- ----------------------------
ALTER TABLE `position_timers` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `pre_users_logins`
-- ----------------------------
ALTER TABLE `pre_users_logins` AUTO_INCREMENT=482;

-- ----------------------------
-- Auto increment value for `regions`
-- ----------------------------
ALTER TABLE `regions` AUTO_INCREMENT=3477;

-- ----------------------------
-- Auto increment value for `seo_contents`
-- ----------------------------
ALTER TABLE `seo_contents` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `seo_types`
-- ----------------------------
ALTER TABLE `seo_types` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `share_settings`
-- ----------------------------
ALTER TABLE `share_settings` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for `share_templates`
-- ----------------------------
ALTER TABLE `share_templates` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `shell_sites`
-- ----------------------------
ALTER TABLE `shell_sites` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `shippings`
-- ----------------------------
ALTER TABLE `shippings` AUTO_INCREMENT=19;

-- ----------------------------
-- Auto increment value for `specials`
-- ----------------------------
ALTER TABLE `specials` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `syslists`
-- ----------------------------
ALTER TABLE `syslists` AUTO_INCREMENT=15;

-- ----------------------------
-- Auto increment value for `t_conversion`
-- ----------------------------
ALTER TABLE `t_conversion` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `t_goods`
-- ----------------------------
ALTER TABLE `t_goods` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for `t_source`
-- ----------------------------
ALTER TABLE `t_source` AUTO_INCREMENT=8;

-- ----------------------------
-- Auto increment value for `t_specials`
-- ----------------------------
ALTER TABLE `t_specials` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `t_value`
-- ----------------------------
ALTER TABLE `t_value` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `t_value_h`
-- ----------------------------
ALTER TABLE `t_value_h` AUTO_INCREMENT=25;

-- ----------------------------
-- Auto increment value for `tel_resetpasswords`
-- ----------------------------
ALTER TABLE `tel_resetpasswords` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `template_cate`
-- ----------------------------
ALTER TABLE `template_cate` AUTO_INCREMENT=17;

-- ----------------------------
-- Auto increment value for `templates`
-- ----------------------------
ALTER TABLE `templates` AUTO_INCREMENT=16;

-- ----------------------------
-- Auto increment value for `themes`
-- ----------------------------
ALTER TABLE `themes` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `third_lands`
-- ----------------------------
ALTER TABLE `third_lands` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for `thirds_goods_temps`
-- ----------------------------
ALTER TABLE `thirds_goods_temps` AUTO_INCREMENT=34;

-- ----------------------------
-- Auto increment value for `tuans`
-- ----------------------------
ALTER TABLE `tuans` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `user_logs`
-- ----------------------------
ALTER TABLE `user_logs` AUTO_INCREMENT=37;

-- ----------------------------
-- Auto increment value for `web_fans`
-- ----------------------------
ALTER TABLE `web_fans` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `widgets`
-- ----------------------------
ALTER TABLE `widgets` AUTO_INCREMENT=172;

-- ----------------------------
-- Auto increment value for `yitao`
-- ----------------------------
ALTER TABLE `yitao` AUTO_INCREMENT=1;
