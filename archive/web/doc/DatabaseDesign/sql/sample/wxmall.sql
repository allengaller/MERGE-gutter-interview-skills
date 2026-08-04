/*
Navicat MySQL Data Transfer

Source Server         : 195
Source Server Version : 50158
Source Host           : 192.168.0.195:3306
Source Database       : wxmall

Target Server Type    : MYSQL
Target Server Version : 50158
File Encoding         : 65001

Date: 2013-11-19 13:54:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `articles`
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`title`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题' ,
`subtitle`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '摘要' ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章内容' ,
`keywords`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字' ,
`articles_comments_count`  int(11) NOT NULL DEFAULT 0 ,
`hits`  int(11) NOT NULL DEFAULT 0 COMMENT '点击次数' ,
`type`  int(11) NOT NULL DEFAULT 1 COMMENT '文章类型 1.新闻2.公告3.活动4.其他' ,
`likes`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '赞的次数' ,
`is_show`  int(11) NOT NULL DEFAULT 0 COMMENT '是否显示 1.显示 0.隐藏' ,
`is_top`  int(11) NOT NULL DEFAULT 0 COMMENT '是否置顶 1.是 0.否' ,
`is_banner`  int(11) NOT NULL DEFAULT 0 COMMENT '是否为轮播图 0 否 1 是' ,
`img_src`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片' ,
`seller_id`  int(11) NOT NULL ,
`create_time`  int(11) NOT NULL COMMENT '发表时间' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=29

;

-- ----------------------------
-- Table structure for `articles_comments`
-- ----------------------------
DROP TABLE IF EXISTS `articles_comments`;
CREATE TABLE `articles_comments` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`content`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容' ,
`articles_id`  int(11) NOT NULL COMMENT '文章ID' ,
`seller_id`  int(11) NOT NULL ,
`uid`  int(11) NULL DEFAULT NULL ,
`create_time`  int(11) NOT NULL ,
`is_show`  int(11) NOT NULL DEFAULT 1 ,
`nickname`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=33

;

-- ----------------------------
-- Table structure for `banner_settings`
-- ----------------------------
DROP TABLE IF EXISTS `banner_settings`;
CREATE TABLE `banner_settings` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`img1`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片链接' ,
`url1`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外链接' ,
`target1`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打开模式' ,
`img2`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`url2`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`target2`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`img3`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`url3`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`target3`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `seller_id` USING BTREE (`seller_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=26

;

-- ----------------------------
-- Table structure for `company_settings`
-- ----------------------------
DROP TABLE IF EXISTS `company_settings`;
CREATE TABLE `company_settings` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`companyname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称' ,
`companylat`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司纬度' ,
`companylng`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司经度' ,
`companyphone`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司座机' ,
`companybusinesshour`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '营业时间' ,
`companyaddress`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司地址' ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Table structure for `images`
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID自增长' ,
`name`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片名字' ,
`type`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`images_categories_id`  int(11) NULL DEFAULT 0 COMMENT '图片分类ID' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
`seller_id`  int(11) NOT NULL COMMENT '卖家ID' ,
`is_del`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否删除' ,
`width`  int(11) NULL DEFAULT NULL ,
`height`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='图库基本表'
AUTO_INCREMENT=840

;

-- ----------------------------
-- Table structure for `images_categories`
-- ----------------------------
DROP TABLE IF EXISTS `images_categories`;
CREATE TABLE `images_categories` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名' ,
`parent_id`  int(11) NOT NULL DEFAULT 0 COMMENT '父级ID' ,
`url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '存放路径' ,
`seller_id`  int(11) NOT NULL ,
`sort`  int(11) NOT NULL DEFAULT 50 COMMENT '排序' ,
`is_parent`  int(11) NOT NULL DEFAULT 0 COMMENT '是否父级 0,否;1,是' ,
`level`  int(11) NOT NULL DEFAULT 1 COMMENT '等级' ,
`count`  int(11) NOT NULL DEFAULT 0 COMMENT '图片数量' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='图片类目表'
AUTO_INCREMENT=125

;

-- ----------------------------
-- Table structure for `mall_settings`
-- ----------------------------
DROP TABLE IF EXISTS `mall_settings`;
CREATE TABLE `mall_settings` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`express_fee`  decimal(6,2) NOT NULL COMMENT '快递费用' ,
`ems_fee`  decimal(6,2) NOT NULL COMMENT 'EMS费用' ,
`is_freepostage`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启用免邮' ,
`is_alipay`  tinyint(1) NOT NULL ,
`is_tenpay`  tinyint(1) NOT NULL ,
`is_feeondeliver`  tinyint(1) NOT NULL ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `seller_id` USING BTREE (`seller_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=27

;

-- ----------------------------
-- Table structure for `managers`
-- ----------------------------
DROP TABLE IF EXISTS `managers`;
CREATE TABLE `managers` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '后台管理员ID' ,
`atype`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后台帐号类型，0-为超级管理员，1-为嵊灿内部管理员帐号，2-商家总管理帐号，3-次级商家管理帐号' ,
`account`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`apasswd`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`province`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省' ,
`city`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市' ,
`area`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区' ,
`mobile`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机' ,
`email`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱' ,
`qq`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qq' ,
`acl_info`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`last_log_time`  int(10) NOT NULL ,
`last_log_ip`  char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`login_count`  int(10) NOT NULL ,
`status`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态：1-有效,0-无效' ,
PRIMARY KEY (`id`),
INDEX `status` USING BTREE (`status`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=78

;

-- ----------------------------
-- Table structure for `marketing_coupon_datas`
-- ----------------------------
DROP TABLE IF EXISTS `marketing_coupon_datas`;
CREATE TABLE `marketing_coupon_datas` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠卷号码' ,
`is_send`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已派，1已派，0未派，默认0' ,
`is_use`  tinyint(1) NOT NULL COMMENT '是否已用，1已用，0未用，默认0' ,
`user_id`  int(11) NOT NULL COMMENT '用户id' ,
`marketing_coupon_id`  int(11) NOT NULL COMMENT '外键id' ,
PRIMARY KEY (`id`),
INDEX `marketing_coupon_id` USING BTREE (`marketing_coupon_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='优惠卷号码表'
AUTO_INCREMENT=71

;

-- ----------------------------
-- Table structure for `marketing_coupons`
-- ----------------------------
DROP TABLE IF EXISTS `marketing_coupons`;
CREATE TABLE `marketing_coupons` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠卷名称' ,
`wx_title`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信-活动标题' ,
`wx_description`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信-描述摘要' ,
`wx_pic`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信图片' ,
`introduction`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '使用规则' ,
`money`  float(10,2) NOT NULL COMMENT '优惠卷金额' ,
`limit_money`  float(8,2) NOT NULL COMMENT '订单限额' ,
`expire_type`  enum('nolimit','schedule') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'nolimit' COMMENT '有效类型,nolimit 无时间限制， schedule 指定时间' ,
`starttime`  int(10) NOT NULL COMMENT '开始时间' ,
`endtime`  int(10) NOT NULL COMMENT '结束时间' ,
`amount`  int(8) NOT NULL DEFAULT 0 COMMENT '生成优惠卷总数目' ,
`send_amount`  int(8) NOT NULL DEFAULT 0 COMMENT '发放优惠卷总数' ,
`is_active`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否生效' ,
`seller_id`  int(11) NOT NULL COMMENT '商家id' ,
PRIMARY KEY (`id`),
INDEX `seller_id` USING BTREE (`seller_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=19

;

-- ----------------------------
-- Table structure for `marketing_scratch_card_logs`
-- ----------------------------
DROP TABLE IF EXISTS `marketing_scratch_card_logs`;
CREATE TABLE `marketing_scratch_card_logs` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`uid`  int(11) NOT NULL COMMENT '用户uid' ,
`marketing_scratch_card_id`  int(11) NOT NULL ,
`time`  int(10) NOT NULL COMMENT '抽奖时间' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=48

;

-- ----------------------------
-- Table structure for `marketing_scratch_card_prizes`
-- ----------------------------
DROP TABLE IF EXISTS `marketing_scratch_card_prizes`;
CREATE TABLE `marketing_scratch_card_prizes` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`level`  tinyint(2) UNSIGNED NOT NULL COMMENT '奖项等级，例如 0表示未中奖，1表示一等奖，2表示二等奖' ,
`name`  varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '奖品名称' ,
`num`  int(8) NOT NULL COMMENT '奖品数量' ,
`probability`  int(10) NOT NULL COMMENT '中奖概率，必须为整数' ,
`marketing_scratch_card_id`  int(11) NOT NULL ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=13

;

-- ----------------------------
-- Table structure for `marketing_scratch_cards`
-- ----------------------------
DROP TABLE IF EXISTS `marketing_scratch_cards`;
CREATE TABLE `marketing_scratch_cards` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`activityname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称' ,
`activitydesc`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '其他补充活动说明' ,
`starttime`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间' ,
`endtime`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间' ,
`limittype`  enum('everyday','total') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'total' COMMENT 'everyday-每天限制次数类型，total-限制总次数类型' ,
`trylimit`  smallint(3) NOT NULL COMMENT '限制次数' ,
`expirytime`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '兑奖结束时间' ,
`sorryword`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '未中奖感谢词' ,
`wx_title`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信标题' ,
`wx_description`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信摘要内容' ,
`wx_pic`  varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信封面图片' ,
`wx_end_title`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信图文结束标题' ,
`wx_end_description`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信图文结束描述' ,
`wx_end_pic`  varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信图文结束图片' ,
`is_active`  enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '1-生效，0-不生效' ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='促销活动刮刮卡'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Table structure for `marketing_turn_table_logs`
-- ----------------------------
DROP TABLE IF EXISTS `marketing_turn_table_logs`;
CREATE TABLE `marketing_turn_table_logs` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`uid`  int(11) NOT NULL COMMENT '用户uid' ,
`marketing_turn_table_id`  int(11) NOT NULL ,
`time`  int(10) NOT NULL COMMENT '抽奖时间' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=199

;

-- ----------------------------
-- Table structure for `marketing_turn_table_prizes`
-- ----------------------------
DROP TABLE IF EXISTS `marketing_turn_table_prizes`;
CREATE TABLE `marketing_turn_table_prizes` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`level`  tinyint(2) UNSIGNED NOT NULL COMMENT '奖项等级，例如 0表示未中奖，1表示一等奖，2表示二等奖' ,
`name`  varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '奖品名称' ,
`num`  int(8) NOT NULL COMMENT '奖品数量' ,
`probability`  int(10) NOT NULL COMMENT '中奖概率，必须为整数' ,
`marketing_turn_table_id`  int(11) NOT NULL ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=48

;

-- ----------------------------
-- Table structure for `marketing_turn_tables`
-- ----------------------------
DROP TABLE IF EXISTS `marketing_turn_tables`;
CREATE TABLE `marketing_turn_tables` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`template`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '1-四格转盘，2-六格转盘，3-八格转盘' ,
`activityname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称' ,
`activitydesc`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '其他补充活动说明' ,
`starttime`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间' ,
`endtime`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间' ,
`limittype`  enum('everyday','total') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'total' COMMENT 'everyday-每天限制次数类型，total-限制总次数类型' ,
`trylimit`  smallint(3) NOT NULL COMMENT '限制次数' ,
`expirytime`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '兑奖结束时间' ,
`sorryword`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '未中奖感谢词' ,
`wx_title`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信标题' ,
`wx_description`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信摘要内容' ,
`wx_pic`  varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信封面图片' ,
`wx_end_title`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信活动结束标题' ,
`wx_end_description`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信活动结束描述' ,
`wx_end_pic`  varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信活动结束图片' ,
`is_active`  enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '1-生效，0-不生效' ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='促销活动大转盘'
AUTO_INCREMENT=17

;

-- ----------------------------
-- Table structure for `marketing_winning_records`
-- ----------------------------
DROP TABLE IF EXISTS `marketing_winning_records`;
CREATE TABLE `marketing_winning_records` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`uid`  int(11) NOT NULL COMMENT '用户uid' ,
`marketingtype`  enum('turntable','scratchcard') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '促销活动类别,\'turntable\'-大转盘，\'scratchcard\'-刮刮卡' ,
`marketingid`  int(11) NOT NULL COMMENT '相应活动的外键表id' ,
`level`  tinyint(2) UNSIGNED NOT NULL COMMENT '中奖等级，1表示一等奖，2表示二等奖' ,
`prizesname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '奖品名称' ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='促销活动中奖记录表'
AUTO_INCREMENT=10

;

-- ----------------------------
-- Table structure for `order_coupon_uses`
-- ----------------------------
DROP TABLE IF EXISTS `order_coupon_uses`;
CREATE TABLE `order_coupon_uses` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`order_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号码' ,
`coupon_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠卷号码' ,
`coupon_money`  float(10,2) NOT NULL COMMENT '订单优惠券优惠金额' ,
`seller_id`  int(11) NOT NULL COMMENT '商家id' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=6

;

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`orderid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号' ,
`uid`  int(10) NOT NULL COMMENT '用户外键id' ,
`ip`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人' ,
`mobile`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码' ,
`phone`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话' ,
`zip`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮编' ,
`province`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省' ,
`city`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市' ,
`area`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区' ,
`address`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址' ,
`totalprice`  decimal(10,2) NOT NULL COMMENT '总价格' ,
`delivery_fee`  decimal(6,2) NOT NULL COMMENT '配送费用' ,
`order_status`  int(3) NOT NULL COMMENT '订单状态，0表示未付款，1表示已付款等待发货 ，2表示已发货等待确认收货，3表示订单交易完成，4订单关闭（包含退货，退款，异常情况）' ,
`createtime`  int(10) NOT NULL COMMENT '订单创建时间' ,
`delivery_time`  int(10) NULL DEFAULT NULL COMMENT '订单发货时间' ,
`logi_company`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '物流公司' ,
`logi_no`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '物流单号' ,
`seller_mark`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家备注' ,
`paytype`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付类型' ,
`alipay_trade_no`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝交易号' ,
`tenpay_trade_no`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '财付通交易号' ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `seller_id` USING BTREE (`seller_id`) ,
INDEX `uid` USING BTREE (`uid`) ,
INDEX `order_status` USING BTREE (`order_status`) ,
INDEX `orderid` USING BTREE (`orderid`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=208

;

-- ----------------------------
-- Table structure for `orders_log`
-- ----------------------------
DROP TABLE IF EXISTS `orders_log`;
CREATE TABLE `orders_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作日志' ,
`order_id`  int(11) NOT NULL COMMENT '订单ID' ,
`seller_id`  int(11) NULL DEFAULT NULL COMMENT '卖家ID' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='操作日志'
AUTO_INCREMENT=273

;

-- ----------------------------
-- Table structure for `orders_products`
-- ----------------------------
DROP TABLE IF EXISTS `orders_products`;
CREATE TABLE `orders_products` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`order_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`products_sku_id`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`quantity`  smallint(5) NOT NULL COMMENT '数量' ,
`price`  decimal(10,2) NOT NULL COMMENT '单价' ,
`product_name`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名' ,
PRIMARY KEY (`id`),
INDEX `order_id` USING BTREE (`order_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=204

;

-- ----------------------------
-- Table structure for `payment_settings`
-- ----------------------------
DROP TABLE IF EXISTS `payment_settings`;
CREATE TABLE `payment_settings` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`alipay_account`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收款的支付宝帐号' ,
`alipay_pid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付宝合作者身份(PID)' ,
`alipay_key`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付宝交易安全校验码key' ,
`tenpay_client_num`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '财付通客户号' ,
`tenpay_key`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '财付通私钥' ,
`seller_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员外键id' ,
PRIMARY KEY (`id`),
INDEX `seller_id` USING BTREE (`seller_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=27

;

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`prod_id`  int(6) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '商品编号, 商家自定义' ,
`market_price`  decimal(10,2) NULL DEFAULT NULL COMMENT '市场价' ,
`cost_price`  decimal(10,2) NULL DEFAULT NULL COMMENT '成本价' ,
`retail_price`  decimal(10,2) NULL DEFAULT NULL COMMENT '零售价' ,
`categories_id`  int(10) NOT NULL COMMENT '分类ID' ,
`list_pic`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列表页中的商品图片' ,
`detail_pic`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细页的商品图片' ,
`description`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品总描述' ,
`detail`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详情' ,
`status`  tinyint(1) NULL DEFAULT 1 COMMENT '商品状态: 0下架 1上架' ,
`createtime`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`updatetime`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`prod_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`prod_subtitle`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`seller_id`  int(11) NOT NULL COMMENT 'seller id' ,
`hot`  int(11) NULL DEFAULT 0 COMMENT '人气点击数' ,
`sales`  int(11) NULL DEFAULT 0 COMMENT '销量' ,
PRIMARY KEY (`id`),
INDEX `seller_id` USING BTREE (`seller_id`) ,
INDEX `prod_id` USING BTREE (`prod_id`) ,
INDEX `categories_id` USING BTREE (`categories_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品款式表'
AUTO_INCREMENT=147

;

-- ----------------------------
-- Table structure for `products_attribute_name`
-- ----------------------------
DROP TABLE IF EXISTS `products_attribute_name`;
CREATE TABLE `products_attribute_name` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`attri_name`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`cate_id`  int(11) NOT NULL ,
`create_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP ,
`seller_id`  int(11) NOT NULL ,
`sort`  int(11) NOT NULL ,
`default`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品参数表'
AUTO_INCREMENT=51

;

-- ----------------------------
-- Table structure for `products_attribute_value`
-- ----------------------------
DROP TABLE IF EXISTS `products_attribute_value`;
CREATE TABLE `products_attribute_value` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`attri_id`  int(11) NOT NULL ,
`attri_value`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`prod_id`  int(11) NOT NULL DEFAULT 1 ,
`status`  int(1) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=92

;

-- ----------------------------
-- Table structure for `products_attributes`
-- ----------------------------
DROP TABLE IF EXISTS `products_attributes`;
CREATE TABLE `products_attributes` (
`id`  int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '属性总表： 包含普通属性，销售属性' ,
`attri_name`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称, 如颜色' ,
`attri_value`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值, 如红色' ,
`attri_id`  int(3) UNSIGNED ZEROFILL NOT NULL COMMENT '属性类型: 0普通属性,1 销售属性.' ,
`sort`  int(1) NOT NULL COMMENT '属性类型: 0普通属性,1 销售属性.' ,
`categories_id`  int(11) UNSIGNED ZEROFILL NOT NULL COMMENT '分类ID, 外键' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
`update_time`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0000-00-00 00:00:00' ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `seller_id` USING BTREE (`seller_id`) ,
INDEX `categories_id` USING BTREE (`categories_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品属性表'
AUTO_INCREMENT=83

;

-- ----------------------------
-- Table structure for `products_categories`
-- ----------------------------
DROP TABLE IF EXISTS `products_categories`;
CREATE TABLE `products_categories` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sort`  int(5) NULL DEFAULT NULL ,
`level`  int(5) NOT NULL ,
`parentid`  int(11) NOT NULL ,
`notes`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createtime`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
`updatetime`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0000-00-00 00:00:00' ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `seller_id` USING BTREE (`seller_id`) ,
INDEX `level` USING BTREE (`level`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=219

;

-- ----------------------------
-- Table structure for `products_comments`
-- ----------------------------
DROP TABLE IF EXISTS `products_comments`;
CREATE TABLE `products_comments` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`products_id`  int(11) NOT NULL ,
`seller_id`  int(11) NOT NULL ,
`createtime`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`updatetime`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`user_id`  int(11) NOT NULL ,
`score`  int(11) NOT NULL DEFAULT 0 COMMENT '评分' ,
`ip`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=29

;

-- ----------------------------
-- Table structure for `products_sku`
-- ----------------------------
DROP TABLE IF EXISTS `products_sku`;
CREATE TABLE `products_sku` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'SKU主键, 不是SKU ID' ,
`sid`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SKU ID: 123456款式码+001002003三个销售属性码' ,
`prod_id`  int(6) UNSIGNED ZEROFILL NOT NULL COMMENT '商品款式码ID' ,
`skuname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SKU名称' ,
`reserves`  int(11) NOT NULL COMMENT '商品库存, 商家添加商品时自定义, 添加后可以自定义' ,
`freez_reserve`  int(11) NOT NULL DEFAULT 0 COMMENT '冻结库存' ,
`market_price`  decimal(10,2) NOT NULL COMMENT '市场价, 商家自定义\n' ,
`cost_price`  decimal(10,2) NOT NULL COMMENT '成本价, 商家自定义' ,
`retail_price`  decimal(10,2) NULL DEFAULT NULL COMMENT '零售价, 商家自定义' ,
`sales`  int(10) NOT NULL DEFAULT 0 COMMENT '销量' ,
`skustatus`  int(2) NOT NULL COMMENT 'SKU状态: 0下架, 1上架' ,
`createdtime`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`updatedtime`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `seller_id` USING BTREE (`seller_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品SKU表'
AUTO_INCREMENT=238

;

-- ----------------------------
-- Table structure for `products_tags`
-- ----------------------------
DROP TABLE IF EXISTS `products_tags`;
CREATE TABLE `products_tags` (
`tags_id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`notes`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签的备注' ,
`sort`  int(11) NULL DEFAULT NULL ,
`status`  int(1) NOT NULL COMMENT '标签状态: 0禁用, 1启用' ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`tags_id`),
INDEX `seller_id` USING BTREE (`seller_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品标签'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `sellers_info`
-- ----------------------------
DROP TABLE IF EXISTS `sellers_info`;
CREATE TABLE `sellers_info` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`status`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '开通状态 ，默认开通，1代表开通，0代表不开通' ,
`type`  smallint(2) NOT NULL DEFAULT 1 COMMENT '1微信，2易信，3来往' ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帐号属性名称' ,
`headimg`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像' ,
`business_type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行业类型' ,
`created`  int(10) NOT NULL COMMENT '创建时间' ,
`manager_id`  int(11) NOT NULL COMMENT '产品官网注册会员外键id' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商家基本信息'
AUTO_INCREMENT=155

;

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mobile`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`nickname`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`seller_id`  int(11) NOT NULL ,
`group_id`  int(11) NULL DEFAULT NULL ,
`login_count`  int(10) NOT NULL DEFAULT 0 ,
`lastloginip`  char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`lastlogintime`  int(10) NULL DEFAULT NULL ,
`registime`  int(10) NOT NULL ,
`password`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `seller_id` USING BTREE (`seller_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4773

;

-- ----------------------------
-- Table structure for `users_address`
-- ----------------------------
DROP TABLE IF EXISTS `users_address`;
CREATE TABLE `users_address` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人' ,
`mobile`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码' ,
`phone`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '固定电话' ,
`zip`  int(6) NOT NULL COMMENT '邮编' ,
`province`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省' ,
`city`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市' ,
`area`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区' ,
`address`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址' ,
`uid`  int(10) NOT NULL COMMENT '用户外键id' ,
PRIMARY KEY (`id`),
INDEX `uid` USING BTREE (`uid`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=51

;

-- ----------------------------
-- Table structure for `users_groups`
-- ----------------------------
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE `users_groups` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `users_union`
-- ----------------------------
DROP TABLE IF EXISTS `users_union`;
CREATE TABLE `users_union` (
`id`  int(11) NOT NULL ,
`openid`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`avatar`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`nickname`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`gender`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`email`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`openkey`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`uid`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `uid` USING BTREE (`uid`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `website_categories`
-- ----------------------------
DROP TABLE IF EXISTS `website_categories`;
CREATE TABLE `website_categories` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名' ,
`describe`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述' ,
`parent_id`  int(11) NOT NULL DEFAULT 0 COMMENT '父类ID' ,
`level`  int(11) NULL DEFAULT 1 COMMENT '等级' ,
`sort`  int(11) NOT NULL DEFAULT 0 COMMENT '排序-越大越靠前' ,
`face`  varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面图片' ,
`icon`  varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'icon-smile' COMMENT '图标' ,
`is_show`  int(11) NOT NULL DEFAULT 1 COMMENT '是否显示' ,
`website_reply_categories_id`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复类型' ,
`typeurl`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接' ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='分类管理'
AUTO_INCREMENT=53

;

-- ----------------------------
-- Table structure for `website_reply_categories`
-- ----------------------------
DROP TABLE IF EXISTS `website_reply_categories`;
CREATE TABLE `website_reply_categories` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '展示名字' ,
`keyword`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'value值' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='回复类型'
AUTO_INCREMENT=7

;

-- ----------------------------
-- Table structure for `website_sets`
-- ----------------------------
DROP TABLE IF EXISTS `website_sets`;
CREATE TABLE `website_sets` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`seller_id`  int(11) NOT NULL ,
`title`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '官网标题' ,
`cover`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面' ,
`brief`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图文消息简介' ,
`logo`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '官网LOGO' ,
`bg_img`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/home/img/bg/1.jpg' COMMENT '官网背景' ,
`stat_code`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '统计代码' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=132

;

-- ----------------------------
-- Table structure for `website_shortcuts`
-- ----------------------------
DROP TABLE IF EXISTS `website_shortcuts`;
CREATE TABLE `website_shortcuts` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sort`  int(11) NULL DEFAULT NULL ,
`is_show`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`icon`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type_ext`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='快捷菜单'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `website_slides`
-- ----------------------------
DROP TABLE IF EXISTS `website_slides`;
CREATE TABLE `website_slides` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`description`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述' ,
`sort`  int(10) NOT NULL DEFAULT 50 COMMENT '排序-越大越靠前' ,
`picurl`  varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面' ,
`is_show`  int(11) NOT NULL DEFAULT 1 COMMENT '1显示 0不显示' ,
`type`  int(11) NULL DEFAULT NULL COMMENT '回复类型' ,
`typeurl`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转' ,
`seller_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='首页幻灯片'
AUTO_INCREMENT=43

;

-- ----------------------------
-- Table structure for `website_templates`
-- ----------------------------
DROP TABLE IF EXISTS `website_templates`;
CREATE TABLE `website_templates` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模版名' ,
`template_name`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模版名' ,
`describe`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述（鼠标经过图片显示）' ,
`face`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面图片' ,
`type`  int(11) NOT NULL COMMENT '模版类型' ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=10

;

-- ----------------------------
-- Table structure for `website_templates_categories`
-- ----------------------------
DROP TABLE IF EXISTS `website_templates_categories`;
CREATE TABLE `website_templates_categories` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sort`  int(11) NULL DEFAULT NULL ,
`controller`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`action`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'index' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=8

;

-- ----------------------------
-- Table structure for `website_templates_options`
-- ----------------------------
DROP TABLE IF EXISTS `website_templates_options`;
CREATE TABLE `website_templates_options` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`index`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'HomeTheme001' ,
`channel`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'HomeTheme001' ,
`articles`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'HomeTheme001' ,
`detail`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'HomeTheme001' ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=39

;

-- ----------------------------
-- Table structure for `wx_diy_menu`
-- ----------------------------
DROP TABLE IF EXISTS `wx_diy_menu`;
CREATE TABLE `wx_diy_menu` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`menuname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称' ,
`parent_id`  int(11) NOT NULL COMMENT '父菜单id' ,
`keyword`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键词' ,
`menuurl`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义菜单跳转链接' ,
`website_reply_categories_id`  smallint(6) NOT NULL COMMENT '回复类型外键id' ,
`order`  int(3) NOT NULL COMMENT '顺序' ,
`display`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否显示' ,
`mark`  char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标记' ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='微信自定义菜单表'
AUTO_INCREMENT=361

;

-- ----------------------------
-- Table structure for `wx_event_replys`
-- ----------------------------
DROP TABLE IF EXISTS `wx_event_replys`;
CREATE TABLE `wx_event_replys` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`keyReplyForHi`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被关注回复关键词' ,
`keyReplyForAll`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有自定义回复关键词' ,
`defaultReplyallFlag`  tinyint(4) NOT NULL COMMENT '1开启回复所有，0关闭回复所有' ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `seller_id` USING BTREE (`seller_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=10

;

-- ----------------------------
-- Table structure for `wx_fan_groups`
-- ----------------------------
DROP TABLE IF EXISTS `wx_fan_groups`;
CREATE TABLE `wx_fan_groups` (
`id`  smallint(3) NOT NULL COMMENT 'group_id' ,
`name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组名' ,
`cnt`  int(10) NOT NULL COMMENT '未知参数' ,
`seller_id`  int(11) NOT NULL 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `wx_fans`
-- ----------------------------
DROP TABLE IF EXISTS `wx_fans`;
CREATE TABLE `wx_fans` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`fake_id`  int(11) NOT NULL COMMENT '微信唯一标识用户id' ,
`nick_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称' ,
`user_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信号' ,
`signature`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '签名' ,
`city`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市' ,
`province`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省' ,
`country`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '国家' ,
`gender`  tinyint(1) NOT NULL COMMENT '1男性，2女性' ,
`remark_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备准名' ,
`group_id`  smallint(3) NOT NULL COMMENT '微信用户组外键id' ,
`update_time`  int(10) NOT NULL COMMENT '更新时间' ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `fake_id` USING BTREE (`fake_id`) ,
INDEX `seller_id` USING BTREE (`seller_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2122

;

-- ----------------------------
-- Table structure for `wx_imagetxt_replys`
-- ----------------------------
DROP TABLE IF EXISTS `wx_imagetxt_replys`;
CREATE TABLE `wx_imagetxt_replys` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`title`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`description`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`img_src`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`url`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`articles_comments_count`  int(11) NOT NULL COMMENT '评论次数' ,
`hits`  int(11) NOT NULL COMMENT '点击次数' ,
`likes`  int(11) NOT NULL COMMENT '喜欢总数' ,
`is_top`  smallint(6) NOT NULL COMMENT '是否置顶 1.是 0.否' ,
`is_banner`  smallint(6) NOT NULL COMMENT '是否为轮播图 0 否 1 是' ,
`create_time`  int(10) NOT NULL ,
`website_categories_id`  int(11) NOT NULL COMMENT '分类ID' ,
`website_reply_categories_id`  smallint(5) UNSIGNED NOT NULL ,
`keyid`  int(11) NOT NULL ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `keyid` USING BTREE (`keyid`) ,
INDEX `seller_id` USING BTREE (`seller_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=47

;

-- ----------------------------
-- Table structure for `wx_imagetxts_replys`
-- ----------------------------
DROP TABLE IF EXISTS `wx_imagetxts_replys`;
CREATE TABLE `wx_imagetxts_replys` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`title`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`cover`  int(11) NOT NULL ,
`theme1`  int(11) NOT NULL ,
`theme2`  int(11) NOT NULL ,
`theme3`  int(11) NOT NULL ,
`theme4`  int(11) NOT NULL ,
`theme5`  int(11) NOT NULL ,
`theme6`  int(11) NOT NULL ,
`theme7`  int(11) NOT NULL ,
`theme8`  int(11) NOT NULL ,
`theme9`  int(11) NOT NULL ,
`keyid`  int(11) NOT NULL ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `seller_id` USING BTREE (`seller_id`) ,
INDEX `keyid` USING BTREE (`keyid`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=26

;

-- ----------------------------
-- Table structure for `wx_keywords`
-- ----------------------------
DROP TABLE IF EXISTS `wx_keywords`;
CREATE TABLE `wx_keywords` (
`keyid`  int(11) NOT NULL AUTO_INCREMENT ,
`keyword`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`matchtype`  tinyint(1) NOT NULL COMMENT '1-完全匹配，0-包含匹配' ,
`runtype`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '0系统关键词，1为普通关键词' ,
`contenttype`  tinyint(3) NOT NULL COMMENT '1文字类型，2图文类型，3多图文类型，4语音类型' ,
`isDisabled`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用，默认不禁用，0-不禁用，1-禁用' ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`keyid`),
INDEX `seller_id` USING BTREE (`seller_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=188

;

-- ----------------------------
-- Table structure for `wx_settings`
-- ----------------------------
DROP TABLE IF EXISTS `wx_settings`;
CREATE TABLE `wx_settings` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`wxheadimg`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像' ,
`wxusername`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字' ,
`wxsignid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信号' ,
`wxsex`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '性别，男1，女0' ,
`wxprovince`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省地区' ,
`wxcity`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市地区' ,
`wxonquestion`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否开启微信用户咨询顾问功能' ,
`wxFqaReply`  char(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信回复咨询语' ,
`wxonfindgoods`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否开启通过？+关键字搜索相关商品' ,
`wxsigncard`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二维码名片' ,
`wxappid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信appid' ,
`wxappkey`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信appkey' ,
`wxappurl`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公众平台接口配置URL' ,
`wxapptoken`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公众平台接口配置Token' ,
`wxplatformlog`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信公众平台登录帐号' ,
`wxplatformps`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信公众平台登录密码' ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `seller_id` USING BTREE (`seller_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=82

;

-- ----------------------------
-- Table structure for `wx_txt_replys`
-- ----------------------------
DROP TABLE IF EXISTS `wx_txt_replys`;
CREATE TABLE `wx_txt_replys` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`replycontent`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`keyid`  int(11) NOT NULL ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `keyid` USING BTREE (`keyid`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=107

;

-- ----------------------------
-- Table structure for `wx_users`
-- ----------------------------
DROP TABLE IF EXISTS `wx_users`;
CREATE TABLE `wx_users` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`open_id`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信会员openId' ,
`user_id`  int(11) NOT NULL COMMENT 'users表外键' ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `seller_id` USING BTREE (`seller_id`) ,
INDEX `user_id` USING BTREE (`user_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='微信会员（暂只能保存open_id，等待以后接口开放）'
AUTO_INCREMENT=4741

;

-- ----------------------------
-- Table structure for `wx_users_msg`
-- ----------------------------
DROP TABLE IF EXISTS `wx_users_msg`;
CREATE TABLE `wx_users_msg` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`to_user_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开发者微信号' ,
`create_time`  int(10) NOT NULL COMMENT '消息创建时间 （整型）' ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文本消息内容' ,
`type`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '1是实时信息，2是咨询顾问信息' ,
`user_id`  int(11) NOT NULL ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `seller_id` USING BTREE (`seller_id`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='微信实时信息表'
AUTO_INCREMENT=2410

;

-- ----------------------------
-- Table structure for `wx_voice_replys`
-- ----------------------------
DROP TABLE IF EXISTS `wx_voice_replys`;
CREATE TABLE `wx_voice_replys` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`title`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`musicurl`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`hqmusicurl`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`description`  varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`keyid`  int(11) NOT NULL ,
`seller_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `seller_id` USING BTREE (`seller_id`) ,
INDEX `keyid` USING BTREE (`keyid`) 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=11

;

-- ----------------------------
-- Auto increment value for `articles`
-- ----------------------------
ALTER TABLE `articles` AUTO_INCREMENT=29;

-- ----------------------------
-- Auto increment value for `articles_comments`
-- ----------------------------
ALTER TABLE `articles_comments` AUTO_INCREMENT=33;

-- ----------------------------
-- Auto increment value for `banner_settings`
-- ----------------------------
ALTER TABLE `banner_settings` AUTO_INCREMENT=26;

-- ----------------------------
-- Auto increment value for `company_settings`
-- ----------------------------
ALTER TABLE `company_settings` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `images`
-- ----------------------------
ALTER TABLE `images` AUTO_INCREMENT=840;

-- ----------------------------
-- Auto increment value for `images_categories`
-- ----------------------------
ALTER TABLE `images_categories` AUTO_INCREMENT=125;

-- ----------------------------
-- Auto increment value for `mall_settings`
-- ----------------------------
ALTER TABLE `mall_settings` AUTO_INCREMENT=27;

-- ----------------------------
-- Auto increment value for `managers`
-- ----------------------------
ALTER TABLE `managers` AUTO_INCREMENT=78;

-- ----------------------------
-- Auto increment value for `marketing_coupon_datas`
-- ----------------------------
ALTER TABLE `marketing_coupon_datas` AUTO_INCREMENT=71;

-- ----------------------------
-- Auto increment value for `marketing_coupons`
-- ----------------------------
ALTER TABLE `marketing_coupons` AUTO_INCREMENT=19;

-- ----------------------------
-- Auto increment value for `marketing_scratch_card_logs`
-- ----------------------------
ALTER TABLE `marketing_scratch_card_logs` AUTO_INCREMENT=48;

-- ----------------------------
-- Auto increment value for `marketing_scratch_card_prizes`
-- ----------------------------
ALTER TABLE `marketing_scratch_card_prizes` AUTO_INCREMENT=13;

-- ----------------------------
-- Auto increment value for `marketing_scratch_cards`
-- ----------------------------
ALTER TABLE `marketing_scratch_cards` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `marketing_turn_table_logs`
-- ----------------------------
ALTER TABLE `marketing_turn_table_logs` AUTO_INCREMENT=199;

-- ----------------------------
-- Auto increment value for `marketing_turn_table_prizes`
-- ----------------------------
ALTER TABLE `marketing_turn_table_prizes` AUTO_INCREMENT=48;

-- ----------------------------
-- Auto increment value for `marketing_turn_tables`
-- ----------------------------
ALTER TABLE `marketing_turn_tables` AUTO_INCREMENT=17;

-- ----------------------------
-- Auto increment value for `marketing_winning_records`
-- ----------------------------
ALTER TABLE `marketing_winning_records` AUTO_INCREMENT=10;

-- ----------------------------
-- Auto increment value for `order_coupon_uses`
-- ----------------------------
ALTER TABLE `order_coupon_uses` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for `orders`
-- ----------------------------
ALTER TABLE `orders` AUTO_INCREMENT=208;

-- ----------------------------
-- Auto increment value for `orders_log`
-- ----------------------------
ALTER TABLE `orders_log` AUTO_INCREMENT=273;

-- ----------------------------
-- Auto increment value for `orders_products`
-- ----------------------------
ALTER TABLE `orders_products` AUTO_INCREMENT=204;

-- ----------------------------
-- Auto increment value for `payment_settings`
-- ----------------------------
ALTER TABLE `payment_settings` AUTO_INCREMENT=27;

-- ----------------------------
-- Auto increment value for `products`
-- ----------------------------
ALTER TABLE `products` AUTO_INCREMENT=147;

-- ----------------------------
-- Auto increment value for `products_attribute_name`
-- ----------------------------
ALTER TABLE `products_attribute_name` AUTO_INCREMENT=51;

-- ----------------------------
-- Auto increment value for `products_attribute_value`
-- ----------------------------
ALTER TABLE `products_attribute_value` AUTO_INCREMENT=92;

-- ----------------------------
-- Auto increment value for `products_attributes`
-- ----------------------------
ALTER TABLE `products_attributes` AUTO_INCREMENT=83;

-- ----------------------------
-- Auto increment value for `products_categories`
-- ----------------------------
ALTER TABLE `products_categories` AUTO_INCREMENT=219;

-- ----------------------------
-- Auto increment value for `products_comments`
-- ----------------------------
ALTER TABLE `products_comments` AUTO_INCREMENT=29;

-- ----------------------------
-- Auto increment value for `products_sku`
-- ----------------------------
ALTER TABLE `products_sku` AUTO_INCREMENT=238;

-- ----------------------------
-- Auto increment value for `products_tags`
-- ----------------------------
ALTER TABLE `products_tags` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `sellers_info`
-- ----------------------------
ALTER TABLE `sellers_info` AUTO_INCREMENT=155;

-- ----------------------------
-- Auto increment value for `users`
-- ----------------------------
ALTER TABLE `users` AUTO_INCREMENT=4773;

-- ----------------------------
-- Auto increment value for `users_address`
-- ----------------------------
ALTER TABLE `users_address` AUTO_INCREMENT=51;

-- ----------------------------
-- Auto increment value for `users_groups`
-- ----------------------------
ALTER TABLE `users_groups` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `website_categories`
-- ----------------------------
ALTER TABLE `website_categories` AUTO_INCREMENT=53;

-- ----------------------------
-- Auto increment value for `website_reply_categories`
-- ----------------------------
ALTER TABLE `website_reply_categories` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `website_sets`
-- ----------------------------
ALTER TABLE `website_sets` AUTO_INCREMENT=132;

-- ----------------------------
-- Auto increment value for `website_shortcuts`
-- ----------------------------
ALTER TABLE `website_shortcuts` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `website_slides`
-- ----------------------------
ALTER TABLE `website_slides` AUTO_INCREMENT=43;

-- ----------------------------
-- Auto increment value for `website_templates`
-- ----------------------------
ALTER TABLE `website_templates` AUTO_INCREMENT=10;

-- ----------------------------
-- Auto increment value for `website_templates_categories`
-- ----------------------------
ALTER TABLE `website_templates_categories` AUTO_INCREMENT=8;

-- ----------------------------
-- Auto increment value for `website_templates_options`
-- ----------------------------
ALTER TABLE `website_templates_options` AUTO_INCREMENT=39;

-- ----------------------------
-- Auto increment value for `wx_diy_menu`
-- ----------------------------
ALTER TABLE `wx_diy_menu` AUTO_INCREMENT=361;

-- ----------------------------
-- Auto increment value for `wx_event_replys`
-- ----------------------------
ALTER TABLE `wx_event_replys` AUTO_INCREMENT=10;

-- ----------------------------
-- Auto increment value for `wx_fans`
-- ----------------------------
ALTER TABLE `wx_fans` AUTO_INCREMENT=2122;

-- ----------------------------
-- Auto increment value for `wx_imagetxt_replys`
-- ----------------------------
ALTER TABLE `wx_imagetxt_replys` AUTO_INCREMENT=47;

-- ----------------------------
-- Auto increment value for `wx_imagetxts_replys`
-- ----------------------------
ALTER TABLE `wx_imagetxts_replys` AUTO_INCREMENT=26;

-- ----------------------------
-- Auto increment value for `wx_keywords`
-- ----------------------------
ALTER TABLE `wx_keywords` AUTO_INCREMENT=188;

-- ----------------------------
-- Auto increment value for `wx_settings`
-- ----------------------------
ALTER TABLE `wx_settings` AUTO_INCREMENT=82;

-- ----------------------------
-- Auto increment value for `wx_txt_replys`
-- ----------------------------
ALTER TABLE `wx_txt_replys` AUTO_INCREMENT=107;

-- ----------------------------
-- Auto increment value for `wx_users`
-- ----------------------------
ALTER TABLE `wx_users` AUTO_INCREMENT=4741;

-- ----------------------------
-- Auto increment value for `wx_users_msg`
-- ----------------------------
ALTER TABLE `wx_users_msg` AUTO_INCREMENT=2410;

-- ----------------------------
-- Auto increment value for `wx_voice_replys`
-- ----------------------------
ALTER TABLE `wx_voice_replys` AUTO_INCREMENT=11;
