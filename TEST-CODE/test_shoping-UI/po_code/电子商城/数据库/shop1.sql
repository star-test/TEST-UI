/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.5.15 : Database - shop1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop1` /*!40100 DEFAULT CHARACTER SET gb2312 */;

USE `shop1`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `a_name` varchar(30) NOT NULL COMMENT '管理员账号',
  `a_pass` varchar(30) NOT NULL COMMENT '管理员密码',
  `a_header` varchar(30) NOT NULL COMMENT '头像',
  `a_phone` char(11) DEFAULT NULL COMMENT '联系电话',
  `a_email` varchar(40) DEFAULT NULL COMMENT '电子邮箱',
  PRIMARY KEY (`a_name`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Data for the table `admin` */

insert  into `admin`(`a_name`,`a_pass`,`a_header`,`a_phone`,`a_email`) values ('admin','admin','images/face/Image28.gif','13576880000','yangfr@126.com'),('bbbbb','123','images/face/Image4.gif','66666666','yangfr@163.com'),('yangfan','yang','images/face/Image31.gif','13576051844','yangfr@126.com'),('yangfanr','123','images/face/Image53.gif','13687965555','yangfe@126.com');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `c_name` varchar(30) NOT NULL COMMENT '用户名',
  `c_pass` varchar(30) NOT NULL COMMENT '密码',
  `c_header` varchar(30) NOT NULL COMMENT '头像',
  `c_phone` varchar(11) NOT NULL COMMENT '电话号码',
  `c_question` varchar(30) NOT NULL COMMENT '问题提示',
  `c_answer` varchar(30) NOT NULL COMMENT '问题答案',
  `c_address` varchar(30) DEFAULT NULL COMMENT '地址',
  `c_email` varchar(50) NOT NULL COMMENT 'email',
  PRIMARY KEY (`c_name`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Data for the table `customer` */

insert  into `customer`(`c_name`,`c_pass`,`c_header`,`c_phone`,`c_question`,`c_answer`,`c_address`,`c_email`) values ('aaaaaa','aaa','images/face/Image26.gif','423424','你最喜欢的人是?','rewrwr','rwrwr','rwrew@123.com'),('caoguoxing','111','images\\face\\Image26.gif','2342424','你最喜欢的人是?','自己','南昌','caozuodf@126.com'),('dddddd','111','images/face/Image26.gif','23123213','你最喜欢的人是?','wrewr','wrewr','wrewr@qq.com'),('huangbin','123','images\\face\\Image23.gif','23424234','你最喜欢的人是?','本人','南昌','sdfaf@126.com'),('lisi123','123','images/face/Image4.gif','666666666','你最喜欢的人是?','李连杰','江西南昌','yangfe@126.com'),('liudahai2','1234','images\\face\\Image15.gif','13576890324','你最喜欢的偶像是?','王大治','南昌','wangdazhi@126.com'),('liuyang','123','images/face/Image4.gif','13457567429','你最喜欢的偶像是?','自己','江西抚州','jiangxi@126.com'),('qqqqqq','123','images/face/Image1.gif','12334','你最喜欢的人是?','自己','江西','yangfr89@126.com'),('username','username','images\\face\\Image27.gif','13823532361','你的家乡在哪?','江西','江西南昌青山湖区','wangd@126.com'),('username2','222','images\\face\\Image1.gif','3213123123','你最喜欢的人是?','大家','飞','fsafd@126.com'),('wanger','123','images/face/Image7.gif','133333333','你最喜欢的人是?','自己','江西南昌','yangfr89@126.com'),('wwwwwwwww','123','images/face/Image1.gif','121133','你最喜欢的人是?','自己','江西','yangfr89@126.com'),('yang123','123','images/face/Image12.gif','4424','你最喜欢的人是?','李连杰','江西安宁池','234234wr@126.vom'),('yang1234','123','images/face/Image1.gif','432423','你最喜欢的人是?','李刚11','w23','yangfr89@163.com'),('yang222','111','images/face/Image15.gif','5435345','你最喜欢的人是?','李连杰','fdsaf','faf@126.com'),('yangfanrong','123','images/face/Image17.gif','3424','你最喜欢的人是?','hello','fdaf','fadf@126.com'),('yangfanrong89','yang','images/face/Image1.gif','2423','你最喜欢的人是?','自己','wrw','faf@126.com'),('yangrong','123','images/face/Image49.gif','13567879084','你最喜欢的人是?','江西南昌','江西南昌','yangfae@126.com'),('yyyyyyy','123','images/face/Image1.gif','3423424','你最喜欢的人是?','自己','','yangfr89@126.com'),('zhudaihai','222','images\\face\\Image25.gif','14324543535','你最喜欢的人是?','自己','南昌','zhudaihao@126.com');

/*Table structure for table `idea` */

DROP TABLE IF EXISTS `idea`;

CREATE TABLE `idea` (
  `id` int(10) unsigned NOT NULL COMMENT '编号',
  `c_name` varchar(30) NOT NULL COMMENT '留言者',
  `c_header` varchar(30) NOT NULL COMMENT '留言者头像',
  `new_message` varchar(1000) NOT NULL COMMENT '留言信息',
  `re_message` varchar(1000) DEFAULT NULL COMMENT '回复信息',
  `new_time` char(15) NOT NULL COMMENT '留言时间',
  `re_time` char(15) DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Data for the table `idea` */

insert  into `idea`(`id`,`c_name`,`c_header`,`new_message`,`re_message`,`new_time`,`re_time`) values (1,'liuyang','images\\face\\Image13.gif','这家商场的商品比较便宜，质量过硬，使用放心。','aaaaaa','3:34 4-2-2014','9-11-2015'),(5,'yangfan','images\\face\\Image12.gif','本人在4月份买了一台联想G480型号的笔记本电脑，卖家的态度很好，电脑质量过硬，下次还来光顾。','谢谢你的光顾，本商城还有更多优惠活动等你来参加哦。','12:40 5-16-2014','22:6 5-31-2014'),(17,'liuyang','images\\face\\Image49.gif','ARASADASDASDSAD','谢谢你的评价，欢迎下次来购买商品!','10:38 6-17-2014','10:50 6-18-2014'),(41,'lisi123','images/face/Image4.gif','11111',NULL,'9-14-2015',NULL),(126,'lisi123','images/face/Image4.gif','fdaffffadsf',NULL,'9-15-2015',NULL),(175,'lisi123','images/face/Image4.gif','faf',NULL,'9-15-2015',NULL),(193,'yang1234','images/face/Image17.gif','fafdvfsg','qqqqq','14:24 3-16-2015','9-11-2015'),(272,'liuyang','images\\face\\Image49.gif','NIADFF FDF;WJSDFDSAFDSFAS\r\n',NULL,'10:38 6-17-2014',NULL),(341,'lisi123','images/face/Image4.gif','aaaaaaaaa',NULL,'9-14-2015',NULL),(342,'lisi123','images/face/Image4.gif','??????',NULL,'9-14-2015',NULL),(352,'liuyang','images\\face\\Image49.gif','dfjdsalfj dafdfdsfdsaf',NULL,'14:47 1-15-2015',NULL),(365,'yang123','images/face/Image12.gif','sfdsfsdfsdfsd',NULL,'10:46 3-11-2015',NULL),(368,'lisi123','images/face/Image4.gif','iiiiiiiii',NULL,'9-14-2015',NULL),(584,'liuyang','images\\face\\Image49.gif','null',NULL,'11:6 6-17-2014',NULL),(593,'lisi123','images/face/Image4.gif','kkkkkkkkkk',NULL,'9-14-2015',NULL),(602,'yang222','images/face/Image15.gif','fsfdsfsdfsdfd',NULL,'15:31 3-11-2015',NULL),(640,'liuyang','images\\face\\Image49.gif','fdsaff',NULL,'11:9 6-17-2014',NULL),(875,'liuyang','images/face/Image23.gif','nihao\r\n',NULL,'14:57 3-8-2015',NULL),(934,'yangfanrong89','images/face/Image1.gif','wrewr',NULL,'1-24-2016',NULL);

/*Table structure for table `main_type` */

DROP TABLE IF EXISTS `main_type`;

CREATE TABLE `main_type` (
  `t_id` char(10) NOT NULL COMMENT '编号',
  `t_type` varchar(30) NOT NULL COMMENT '菜单',
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Data for the table `main_type` */

insert  into `main_type`(`t_id`,`t_type`) values ('187','电视机系列'),('290','电脑专区'),('341','洗衣机系列'),('368','厨卫系列'),('525','电冰箱系列'),('981','照相机');

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `n_id` int(10) NOT NULL COMMENT '编号',
  `n_message` varchar(1000) NOT NULL COMMENT '公告信息',
  `n_admin` varchar(30) NOT NULL COMMENT '发布者',
  `n_header` varchar(50) NOT NULL COMMENT '头像',
  `n_time` char(10) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Data for the table `notice` */

insert  into `notice`(`n_id`,`n_message`,`n_admin`,`n_header`,`n_time`) values (11,'2014年4月4日全场电冰箱厂家进行促销活动，只要购买金额达到3000元，即可返回200元购物卷！asdf','amdin','images\\face\\Image33.gif','4-5-2014'),(12,'2014年端午节全场商品打3折，欢迎大家前来选购！','admin','images\\face\\Image28.gif','2-26-2014'),(13,'祝各位会员五一节快乐!本次活动截止到7月2日为止！','admin1','images\\face\\Image28.gif','10-22-2014'),(14,'2015年国庆节期间全场打折0.3折，欢迎大家来选购！','admin','images/face/Image28.gif','9-10-2015');

/*Table structure for table `orderdetails` */

DROP TABLE IF EXISTS `orderdetails`;

CREATE TABLE `orderdetails` (
  `order_id` char(10) NOT NULL COMMENT '订单号',
  `p_id` char(10) NOT NULL COMMENT '商品编号',
  `p_price` float(8,0) NOT NULL COMMENT '价格',
  `p_number` int(4) NOT NULL COMMENT '数量'
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Data for the table `orderdetails` */

insert  into `orderdetails`(`order_id`,`p_id`,`p_price`,`p_number`) values ('1593329672','cw0006',1098,2),('1593329672','tv0004',2000,3),('2093773401','Bp0001',2998,1),('2093773401','cp0001',380,1),('2093773401','cw0004',870,1),('2344057116','cw0010',118,1),('3420355773','cp0006',4500,2),('3420355773','cp0008',3440,1),('3481223913','Bp0001',2998,1),('3481223913','tv0005',3000,3),('4605080896','bx0002',4000,1),('4605080896','cp0006',4500,2),('6048868136','tv0004',2000,1),('6559132503','C003',1566,1),('6559132503','cp0006',4500,2),('6559132503','cw0008',320,1),('7789649612','tv0414',6600,1),('7789649613','cw0018',2728,2),('7789649613','tv0015',1790,2),('7986598780','cp0006',4500,2),('7986598780','cp0008',3440,1),('8507692323','bx0002',4000,1),('8507692323','cp0006',4500,2),('8649686522','cp0003',3400,1),('8649686522','x00001',3400,1),('9107938972','bx0002',4000,1),('9107938972','cp0009',4321,2),('8509869960','cp0006',4500,1),('8509869960','cp0007',4544,1),('7105262028','cp0006',4500,3),('7105262028','cp0008',3440,1),('5380379859','cp0006',4500,3),('5380379859','cp0008',3440,5),('4283908236','cp0006',4500,1),('4283908236','cp0007',4544,1),('4283908236','cp0008',3440,1);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` char(10) NOT NULL COMMENT '编号',
  `order_payment` varchar(1000) NOT NULL COMMENT '支付方式',
  `order_address` varchar(200) NOT NULL COMMENT '地址',
  `order_email` varchar(50) NOT NULL COMMENT 'email',
  `order_user` char(30) NOT NULL COMMENT '订购者',
  `order_time` char(30) NOT NULL COMMENT '订购时间',
  `order_sum` varchar(8) NOT NULL COMMENT '总价值',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Data for the table `orders` */

insert  into `orders`(`order_id`,`order_payment`,`order_address`,`order_email`,`order_user`,`order_time`,`order_sum`) values ('1593329672','在线支付','江西南昌','fdafd@126.com','lisi12','6-16-2014','8196'),('2093773401','支付宝支付','江西南昌青山湖区','liuyang@126.com','liuyang','6-17-2014','4248'),('2344057116','银行支付','江西南昌','yangfanrong@126.com','yangfr89','5-31-2014','118'),('4283908236','在线支付','faf','faf@126.com','yangfanrong89','1-24-2016','12484.0'),('4292100765','银行支付','江西','yfafds@126.com','yangfr89','6-4-2014','1454'),('4605080896','支付宝支付','江西南昌','yanfdse@126.vom','yang123','3-11-2015','13000'),('5380379859','银行支付','ffdsfa','faf@124.com','lisi123','9-15-2015','30700.0'),('6048868136','在线支付','江西南昌','yangfr@126.com','username','6-17-2014','2000'),('6559132503','支付宝支付','gfdsfgs','yangfr89@163.com','yang1234','3-16-2015','10886'),('7105262028','现金支付','江西南昌','zhifu@126.com','lisi123','9-15-2015','16940.0'),('7789649613','银行支付','江西南昌','yangde@126.com','yangfr89','6-4-2014','13786'),('7986598780','支付宝支付','ghfghf','yangfr89@163.com','yyyyyy','4-9-2015','12440'),('8507692323','支付宝支付','jiangxinanchang','fae@126.com','lisi123','3-10-2015','13000'),('8509869960','现金支付','江西南昌','aaaaa@.com','lisi123','9-14-2015','9044.0'),('8649686522','在线支付','sdfafaf','fwrerewr@126.com','username','6-19-2014','6800'),('9107938972','支付宝支付','trwterwt','tw@126.com','yang222','3-11-2015','12642'),('9322260084','银行支付','jiangxi南昌','yfafw@126.com','liuyang','3-8-2015','460');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `pay_id` char(10) NOT NULL COMMENT '编号',
  `pay_payment` varchar(50) NOT NULL COMMENT '支付方式',
  `pay_msg` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Data for the table `payment` */

insert  into `payment`(`pay_id`,`pay_payment`,`pay_msg`) values ('091','在线支付','www.yfr89@126.com'),('100','现金支付','别带太多现金哦'),('434','微信支付','小心支付，别被骗了'),('439','银行支付','请记住帐号：1324659831221656'),('629','支付宝支付','使用支付宝的时候请多注意哦'),('850','手机支付','顾客可以通过手机进行网上支\r\n付。');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `p_type` varchar(30) NOT NULL COMMENT '商品类型',
  `p_id` varchar(10) NOT NULL COMMENT '商品编号',
  `p_name` varchar(40) NOT NULL COMMENT '商品名称',
  `p_price` varchar(8) NOT NULL COMMENT '商品价格',
  `p_quantity` varchar(4) NOT NULL COMMENT '商品数量',
  `p_image` varchar(100) NOT NULL COMMENT '商品图片',
  `p_description` varchar(2000) NOT NULL COMMENT '商品描述信息',
  `p_time` varchar(20) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Data for the table `product` */

insert  into `product`(`p_type`,`p_id`,`p_name`,`p_price`,`p_quantity`,`p_image`,`p_description`,`p_time`) values ('电脑专区','Bp0001','海尔A62-T20','2998','210','images/computer/8.jpg','质量保证，放心使用！','3-27-2007'),('电冰箱系列','bx0001 ','美的（Midea）M321','3228','11','images/fridge/2.jpg','产品参数：1.使用温度：冷藏室：0到10度之间。软冷冻室：0到-6度之间。冷冻室：0到-18度之间。','2-5-2013'),('电冰箱系列','bx0002    ','海尔（Haier）BCD-236SDCN','4000','-1','images/fridge/4.jpg','产品规格三门颜色金色规格显示屏支持制冷类型压缩机制冷制冷方式直冷式温控方式电脑式总容积236L总容积200-249L冷冻室容积80冷藏室容积116冷冻能力15KG能效等级一级定频/变频定频耗电量0.49制冷剂R600a运转音38dB电压/频率220V/50HZ功能产品外形尺寸584*590*1804（深×宽×高mm）商品净重量72KG','1-5-2013'),('电冰箱系列','BX001','容声','2333','5','images/fridge/5.jpg','质量保证，放心使用！','5-23-2014'),('电冰箱系列','BX002','海尔','2444','5','images/fridge/6.jpg','质量保证，放心使用！','5-23-2014'),('电冰箱系列','BX003','海尔','3555','6','images/fridge/20.jpg','质量保证，放心使用！','5-23-2014'),('电冰箱系列','BX004','创维','3444','3','images/fridge/8.jpg','质量保证，放心使用！','5-23-2014'),('电冰箱系列','BX005','海信','2442','6','images/fridge/9.jpg','质量保证，放心使用！','5-23-2014'),('电冰箱系列','BX006','海尔','3221','5','images/fridge/11.jpg','质量保证，放心使用！','6-23-2014'),('照相机','C001','康佳','2545','4','images/camera/1.jpg','质量保证，放心使用！','6-23-2014'),('照相机','C002','索尼','2443','4','images/camera/2.jpg','质量保证，放心使用！','6-23-2014'),('照相机','C003','索尼','1566','3','images/camera/3.jpg','质量保证，放心使用！','6-23-2014'),('照相机','C004','康佳','2333','2','images/camera/4.jpg','质量保证，放心使用！','6-23-2014'),('照相机','C005','三星','2300','5','images/camera/5.jpg','质量保证，放心使用！','6-23-2014'),('照相机','C006','佳能','5432','5','images/camera/6.jpg','质量保证，放心使用！','6-23-2014'),('照相机','C007','佳能','3222','6','images/camera/7.jpg','质量保证，放心使用！','6-23-2014'),('照相机','C008','松下','2355','7','images/camera/8.jpg','质量保证，放心使用！','6-23-2014'),('照相机','C009','佳能','2300','8','images/camera/9.jpg','质量保证，放心使用！','6-23-2014'),('照相机','C010','佳能','3400','8','images/camera/10.jpg','质量保证，放心使用！','6-23-2014'),('电脑专区','cp0001','联想笔记本G480','380','22','images/computer/11.jpg','这是一款2013年出来的机子，性能比较好','4-1-2014'),('电脑专区','cp0002    ','海尔A60-430','2999','64','images/computer/13.jpg','性能稳定，简单易用：75000小时无故障运行，直流变频散热技术，一键快速恢复给您解决一切后顾之忧； \r\n领先配置，全面无忧：海尔独有的速启技术、纳税筹划平台、无忧上网功能给您提供一种全面无忧的工作空间； \r\n环保健康，节能降噪：润眼、负离子健康科技、全封闭面板设计、人体工学超薄键盘为您打造健康的工作平台。 \r\n海尔天龙系列商用机，让学校、机关单位和中小企业快速驶上信息化高速公路。 \r\n通过整合优化的、国际化的供应商，采用成熟的、可靠的零部件，打造出性能如装甲车一样稳定、可靠的天龙系列商用机。 \r\n海尔天龙系列商用机的“忙闲分段供电系统”，电脑在不用的情况下直接转化为节能状态，既不影响正常学习、办公使用，又帮用户节省每一分钱! \r\n海尔电脑独有的“快速恢复”功能，快速、便捷又安全，操作简便，不需要专业人员，轻松一键，恢复数据。 \r\n海尔天龙系列商用机提供专业的财税筹划解决方案，六大功能为中小企业的合理纳税保驾护航，这也是学校、机关单位财务工作和财税筹划教学的一个强有力的武器。 ','3-18-2005'),('电脑专区','cp0003','联想笔记本G490','3400','7','images/computer/12.jpg','这是2013年9月份出来的新品，是G480的改进品。','5-2-2014'),('电脑专区','cp0004    ','海尔8010-G001 ','4499','11','images/computer/14.jpg','性能稳定，简单易用：75000小时无故障运行，直流变频散热技术，一键快速恢复给您解决一切后顾之忧； \r\n领先配置，全面无忧：海尔独有的速启技术、纳税筹划平台、无忧上网功能给您提供一种全面无忧的工作空间； \r\n环保健康，节能降噪：润眼、负离子健康科技、全封闭面板设计、人体工学超薄键盘为您打造健康的工作平台。 \r\n海尔天龙系列商用机，让学校、机关单位和中小企业快速驶上信息化高速公路。 \r\n通过整合优化的、国际化的供应商，采用成熟的、可靠的零部件，打造出性能如装甲车一样稳定、可靠的天龙系列商用机。 \r\n海尔天龙系列商用机的“忙闲分段供电系统”，电脑在不用的情况下直接转化为节能状态，既不影响正常学习、办公使用，又帮用户节省每一分钱! \r\n海尔电脑独有的“快速恢复”功能，快速、便捷又安全，操作简便，不需要专业人员，轻松一键，恢复数据。 \r\n海尔天龙系列商用机提供专业的财税筹划解决方案，六大功能为中小企业的合理纳税保驾护航，这也是学校、机关单位财务工作和财税筹划教学的一个强有力的武器。 ','3-18-2005'),('电脑专区','cp0005','苹果笔记本D3-2','10000','4','images/computer/10.jpg','质量保证，放心使用！','2-2-2013'),('电脑专区','cp0006','联想G420','4500','-5','images/computer/14.jpg','质量保证，放心使用！','6-24-2014'),('电脑专区','cp0007','联想','4544','6','images/computer/7.jpg','质量保证，放心使用！','6-24-2014'),('电脑专区','cp0008','联想','3440','3','images/computer/8.jpg','质量保证，放心使用！','6-24-2014'),('电脑专区','cp0009','戴尔','4321','3','images/computer/9.jpg','质量保证，放心使用！','6-24-2014'),('电脑专区','cp0010','戴尔','3443','5','images/computer/10.jpg','质量保证，放心使用！','6-24-2014'),('电脑专区','cp0011','戴尔','3200','5','images/computer/11.jpg','质量保证，放心使用！','6-24-2014'),('厨卫系列','cw0001    ','海尔 KCD-X11','2311','65','images/other/1.jpg','厨房专用热水器 \r\n\r\n防电墙技术，确保不安全用电环境下的洗浴安全 \r\n\r\n精确温控器，达到设定温度自动断电 \r\n\r\n卫生级别塑料内胆，防腐耐用，干净卫生 \r\n\r\n可以安装在水槽下，节省空间 \r\n\r\n防电墙技术，专门针对中国普遍存在的接地不可靠、装修接错线等环境漏电问题设计的防电墙技术，杜绝正、逆向漏电 \r\n\r\n高效英格莱不锈钢加热管，快速加热 \r\n\r\n卫生级别塑料内胆，防腐耐用，干净卫生 \r\n\r\n上出水设计，可安装在橱柜内或水槽下，不占有效空间 \r\n\r\n方形弧线外观，美观大方 \r\n\r\n超温保护，内胆超压保护','3-18-2014'),('厨卫系列','cw0002    ','美的FY08PB-A（GZ）','3090','13','images/other/4.jpg','暂无说明','3-18-2005'),('厨卫系列','cw0003','美的PD-32','290','4','images/other/2.jpg','不错，还是美的的质量好，用的很放心','2-12-2014'),('厨卫系列','cw0004','美的FADLOE','870','7','images/other/3.jpg','使用方便，好东西。','11-4-2013'),('厨卫系列','cw0005','格力CPDW','899','12','images/other/5.jpg','格力好品牌，客户用的放心。','11-3-2013'),('厨卫系列','cw0006','格力电炉','1098','6','images/other/6.jpg','省电，使用方便，性价比高。','5-11-2014'),('厨卫系列','cw0007','美的','420','4','images/other/7.jpg','质量保证，放心使用！','6-24-2014'),('厨卫系列','cw0008','美的','320','4','images/other/8.jpg','质量保证，放心使用！','6-24-2014'),('电视机系列','tv0001    ','创维TFT32L16SW','800','22','images/TV/1.jpg','可选颜色：浅绿色  \r\n六基色图像处理技术\r\nV12数字引擎\r\nBlue wave无线蓝波\r\n超稳USB流媒体技术\r\n画中画、双视窗\r\n高亮度600cd/m2\r\n超高动态对比度3000:1\r\n超快响应时间6ms\r\n超宽可视角度178°\r\n物理分辨率1366x768\r\n超高支持分辨率1920x1200\r\nHDMI高清晰多媒体端口 ','3-18-2005'),('电视机系列','tv0002','海信DWE','1090','23','images/TV/4.jpg','海信电视功能比较齐全','4-1-2014'),('电视机系列','tv0003','创维TF23032W','2999','8','images/TV/2.jpg','有LED，LCD两种款式','12-3-2013'),('电视机系列','tv0004','LG3243C234','2000','6','images/TV/3.jpg','保修两年，三个月内有质量问题包换。','4-21-2014'),('电视机系列','tv0005','海信H023','3000','0','images/TV/5.jpg','数量有限，国庆黄金周搞促销。','4-12-2014'),('电视机系列','tv0006    ','LG42LC2RR','13500','31','images/TV/6.jpg','产品分类：等离子 \r\n产品型号：50PC1R \r\n显示器尺寸：50英寸 \r\n屏幕比例：16:9 \r\n扫描方式：逐行','3-17-2005'),('电视机系列','tv0007','创维','230','4','images/TV/7.jpg','质量保证，放心使用！','6-24-2014'),('电视机系列','tv0009','创维','423','7','images/TV/9.jpg','质量保证，放心使用！','6-24-2014'),('电视机系列','tv0010','海信','1078','8','images/TV/10.jpg','质量保证，放心使用！','6-24-2014'),('洗衣机系列','x00001','海尔C234','3400','2','images/washing/1.jpg','质量很好','4-25-2013'),('洗衣机系列','x00002','小天鹅E03','3200','10','images/washing/3.jpg','小天鹅这个品牌还是不错的','3-12-2013');

/*Table structure for table `sub_type` */

DROP TABLE IF EXISTS `sub_type`;

CREATE TABLE `sub_type` (
  `s_id` char(10) NOT NULL,
  `s_supertype` char(10) NOT NULL,
  `s_name` char(30) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Data for the table `sub_type` */

insert  into `sub_type`(`s_id`,`s_supertype`,`s_name`) values ('1','187','海尔'),('2','187','松下'),('3','187','长虹'),('4','187','康佳'),('5','187','海信'),('7','368','爱妻'),('8','368','欧派'),('9','368','海尔');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
