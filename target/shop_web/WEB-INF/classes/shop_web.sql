/*
SQLyog v10.2 
MySQL - 8.0.15 : Database - shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `shop`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `alive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`name`,`password`,`type`,`alive`) values (11,'XX1','202CB962AC59075B964B07152D234B70','普通管理员',1);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `alive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`fid`,`alive`) values (11,'液晶电视',10,1),(12,'智能手机',10,1),(13,'个人电脑',10,1),(15,'服饰',10,1),(35,'首饰',11,1),(38,'测试分类',10,0);

/*Table structure for table `firm` */

DROP TABLE IF EXISTS `firm`;

CREATE TABLE `firm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `alive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `firm` */

insert  into `firm`(`id`,`name`,`password`,`fullname`,`message`,`alive`) values (10,'CBA','E10ADC3949BA59ABBE56E057F20F883E','天宇商城','主营手机等业务',1),(11,'xiaomi','FF5E66B76340C5636AA40E7C6A46628F','小米之家','',1);

/*Table structure for table `order_` */

DROP TABLE IF EXISTS `order_`;

CREATE TABLE `order_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderCode` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `user_message` varchar(255) DEFAULT NULL,
  `firm_message` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `alive` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

/*Data for the table `order_` */

insert  into `order_`(`id`,`orderCode`,`address`,`receiver`,`mobile`,`user_message`,`firm_message`,`create_date`,`pay_date`,`confirm_date`,`uid`,`status`,`alive`) values (94,'201906291314558768650','','','',NULL,NULL,'2019-06-29 13:15:02','2019-06-29 13:15:36','2019-06-29 13:17:10',1020,'closed',1),(95,'201906291314579207379',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `alive` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

/*Data for the table `orderitem` */

insert  into `orderitem`(`id`,`pid`,`uid`,`oid`,`price`,`number`,`alive`) values (148,1005,1020,91,769,1,1),(149,1005,1020,93,769,1,1),(150,1005,1020,94,769,50,1),(151,1005,1020,95,769,2,1);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'default',
  `original_price` float DEFAULT NULL,
  `now_price` float DEFAULT NULL,
  `stock_number` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `alive` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1041 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`image`,`original_price`,`now_price`,`stock_number`,`cid`,`create_date`,`message`,`alive`) values (1001,'沃科玛（WOKEMA）4K高清智能网络电视','1561010137',13000,12000,0,11,'2018-10-17 13:46:22','',1),(1002,'Apple iPhone XR (A2108)','1561010619',5399,5299,54,12,'2019-06-20 14:08:20','AppleiPhone XR (A2108) 128GB 黑色 移动联通电信4G手机 双卡双待',1),(1003,'戴尔灵越14燃','77b5bdc2006f3028',4300,4299,32,13,'2019-06-20 14:10:40','戴尔灵越14燃 14英寸英特尔酷睿i5轻薄窄边框笔记本电脑(i5-8265U 8G 256G MX250 2G独显 背光键盘)冰河银',1),(1004,'小米 (MI)Ruby 2019款','d9d9375ab2b1b83f',3999,3899,12,13,'2019-06-20 14:12:41','小米 (MI)Ruby 2019款 15.6英寸金属轻薄笔记本电脑(第八代英特尔酷睿i5-8250U 8G 512G SSD 2G GDDR5独显 FHD 全键盘 Office Win10) 深空灰',1),(1005,'小米（MI）小米电视','5abb6b5bN151761c1',800,769,1,11,'2019-06-20 14:14:16','',1),(1006,'乐视（Letv）超级电视 Y43','5cdb8d46Na6975595',1399,1199,79,11,'2019-06-20 14:15:06','乐视（Letv）超级电视 Y43 43英寸 1GB+8GB大存储 人工智能全高清LED平板液晶网络超薄电视机',1),(1007,'乐视（Letv）超级电视 X40C','5cdbaa17N14c37b8f',900,899,17,11,'2019-06-20 14:16:20','',1),(1008,'索尼（SONY）KD-65X8566F','8930b417c9eb4619',6999,6999,22,11,'2019-06-20 14:17:44','索尼（SONY）KD-65X8566F 65英寸 大屏4K超高清 智能液晶平板电视 腾讯视频内容（黑色）',1),(1009,'荣耀20','5ce4148aN55586a52',2699,2699,90,12,'2019-06-20 14:21:11','荣耀20 4800万超广角AI四摄 3200W美颜自拍 麒麟Kirin980全网通版8GB+128GB 幻夜黑 移动联通电信4G全面屏',1),(1010,'OPPO K3','957eb134fff9b8a7',1899,1899,89,12,'2019-06-20 14:22:11','OPPO K3 高通骁龙710 升降摄像头 VOOC闪充 8GB+128GB 星云紫 全网通4G 全面屏拍照游戏智能手机',1),(1011,'荣耀8X','0a5f5e008d032291',1199,1199,90,12,'2019-06-20 14:22:58','荣耀8X 千元屏霸 91%屏占比 2000万AI双摄 4GB+64GB 幻影蓝 移动联通电信4G全面屏手机 双卡双待\r\n',1),(1012,'联想ThinkPad 翼480（0VCD）','5bea36b6N79ca2695',4899,4799,12,13,'2019-06-20 14:26:41','联想ThinkPad 翼480（0VCD） 英特尔酷睿i5 14英寸轻薄窄边框笔记本电脑（i5-8250U 8G 128GSSD+500G 2G独显）冰原银',1),(1013,'荣耀MagicBook 2019','6efe62222097d1b1',4699,4499,60,13,'2019-06-20 14:27:49','荣耀MagicBook 2019 14英寸轻薄窄边框笔记本电脑（AMD锐龙7 3700U 8G 512G FHD IPS 指纹解锁）冰河银',1),(1014,'EEP（吉普）短袖t恤男','eeef5ed63916348c',148,130,100,15,'2019-06-20 14:30:33','JEEP（吉普）短袖t恤男2019春夏季薄款商务休闲半袖翻领条纹polo衫上衣韩版修身男装中年服饰 蓝色 L',1),(1015,'小米 红米Redmi Note7Pro','9cd57e3a481c7160',1799,1599,45,12,'2019-06-24 17:11:11','小米 红米Redmi Note7Pro AI双摄 6GB+128GB 梦幻蓝 全网通4G 双卡双待 水滴屏拍照游戏手机',1),(1016,'vivo iQOO','044c52520956ebfb',3100,2998,20,12,'2019-06-24 17:12:23','vivo iQOO 44W超快闪充 8GB+128GB电光蓝 全面屏拍照手机 骁龙855电竞游戏 全网通4G手机',1),(1017,'realme X','5ce4f888N01ba2454',1899,1799,88,12,'2019-06-24 17:14:04','ealme X 4800万双摄 升降摄像头 屏下指纹 游戏手机 8GB+128GB朋克蓝 全网通双卡',1),(1018,'黑鲨游戏手机2','5e93dbb87a8c354d',3299,3199,45,12,'2019-06-24 17:15:22','黑鲨游戏手机2 8GB+128GB 暗影黑 骁龙855 Magic Press立体操控 塔式全域液冷 全面屏 全网通4G 双卡双待',1),(1019,'小辣椒 红辣椒7X','35010a834b806ec6',639,600,12,12,'2019-06-24 17:29:57','小辣椒 红辣椒7X 4+64GB 学生智能手机 美颜双摄 微Q多开 人脸识别 移动联通电信4G全网通 黑色',1),(1020,'努比亚 nubia 红魔3游戏手机','f13d6c2e3bfc5e11',3599,3499,30,12,'2019-06-24 17:33:46','努比亚 nubia 红魔3游戏手机 8GB+128GB 赤焰红 骁龙855 内置风扇 5000mAh大电池 90Hz 全面屏拍照电竞手机',1),(1021,'荣耀V20','500f99a976998161',2399,2299,23,12,'2019-06-24 17:34:45','荣耀V20 胡歌同款 麒麟980芯片 魅眼全视屏 4800万深感相机 6GB+128GB 幻影蓝 移动联通电信4G全面屏手机',1),(1022,'小米8屏幕指纹版','19f155adacf55419',2299,2199,100,12,'2019-06-24 18:45:11','小米8屏幕指纹版 8GB+128GB 暮光金 全网通4G 骁龙845 双卡双待 全面屏拍照游戏智能手机\r\n',1),(1024,'一加 OnePlus 7','cc61ce9e0d53fee9',2399,2999,100,12,'2019-06-24 18:46:38','一加 OnePlus 7 骁龙855旗舰性能 4800万超清双摄 8GB+256GB 珐琅红 全面屏拍照游戏智能手机\r\n',1),(1025,'联想（Lenovo）AIO逸','f43d5b12864ab86a',4899,4799,20,13,'2019-06-24 18:58:10','联想（Lenovo）AIO逸 英特尔酷睿i5 个人商务一体机台式电脑23.8英寸（i5-8400T 8G 1T 2G独显 ）白',1),(1026,'惠普（HP）小欧22-c013','5420f5be0bcd3721',2699,2499,45,13,'2019-06-24 18:59:23','惠普（HP）小欧22-c013 高清一体机电脑21.5英寸（八代J4005 4G 256GB SSD 2G独显 WiFi蓝牙 三年上门）\r\n',1),(1027,'单蜜短袖连衣裙女装','baa1f183ddc76ebf',159,139,90,15,'2019-06-24 19:02:15','单蜜短袖连衣裙女装2019夏季新品韩版修身时尚显瘦印花两件套装裙子女潮 图色 M\r\n',1),(1028,'列伽 中国风男装大码夏季新款','33a7f344f14d5413',250,198,100,15,'2019-06-24 20:04:19','列伽 中国风男装大码夏季新款棉麻盘扣七分袖开衫男士汉服套装青年唐装亚麻两件套男套装潮 A718款（灰色) L',1),(1029,'RUMONICA高端品牌雪纺西装连衣裙','b69dbf5d4cd8330d',450,398,100,15,'2019-06-24 19:05:38','RUMONICA高端品牌雪纺西装连衣裙2019新款夏职业赫本风收腰显瘦复古裙法式小黑裙女 黑色 M',1),(1031,'德兰潮牌2019夏季新款学院风','344e4bcf01847882',400,389,35,15,'2019-06-24 19:11:07','丹德兰潮牌2019夏季新款学院风chic风港味小黑裙俏皮气质时髦连衣裙女 黑色 S(成人)',1),(1039,'长虹电视机','default',99.98,19.98,99,11,'2019-06-28 09:24:23','',0),(1040,'长虹电视机','default',99.98,19.98,99,11,'2019-06-28 09:58:34','',1);

/*Table structure for table `shopcart` */

DROP TABLE IF EXISTS `shopcart`;

CREATE TABLE `shopcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `alive` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `shopcart` */

insert  into `shopcart`(`id`,`uid`,`pid`,`number`,`alive`) values (18,1020,1005,1,0),(19,1020,1001,3,0),(20,1020,1006,1,0),(21,1020,1006,10,0),(22,1020,1005,1,0),(23,1020,1007,1,0),(24,1020,1001,1,0),(25,1020,1006,1,0),(26,1020,1005,1,0);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` char(2) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `alive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1023 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`password`,`sex`,`telephone`,`address`,`email`,`alive`) values (1020,'Tom','B1E6D1BD047F43AF0AB59556C394A376','男','13569126433','shanxi','973125857@qq.com',1),(1021,'Jerry','B1E6D1BD047F43AF0AB59556C394A376','男','','','',1),(1022,'rww94','B1E6D1BD047F43AF0AB59556C394A376','男','','','',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
