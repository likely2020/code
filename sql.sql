/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.21-log : Database - web
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`web` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `web`;

/*Table structure for table `article_images` */

DROP TABLE IF EXISTS `article_images`;

CREATE TABLE `article_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `imgPath` varchar(255) DEFAULT NULL,
  `article_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB59551E1A31F9ECE` (`article_id`),
  CONSTRAINT `FKB59551E1A31F9ECE` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `article_images` */

insert  into `article_images`(`id`,`imgPath`,`article_id`) values (1,'article/2152bd4e-4035-4b8b-be8f-bbbd38160e70.png',1),(2,'article/ddc079c4-fa6e-4ce1-8a97-f902e30b8006.jpg',2),(3,'article/d4946773-06d8-4215-9c05-3cb193877336.jpg',4),(4,'article/4dd21524-d368-408c-82da-18eb9bb4117a.jpg',4),(5,'article/fcf6838d-fec1-4faf-995c-efa3ec0b34b8.jpg',6);

/*Table structure for table `articles` */

DROP TABLE IF EXISTS `articles`;

CREATE TABLE `articles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `createDate` datetime DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB6C0D23D6096D186` (`user_id`),
  KEY `FKB6C0D23D37F4AAA6` (`category_id`),
  CONSTRAINT `FKB6C0D23D37F4AAA6` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FKB6C0D23D6096D186` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `articles` */

insert  into `articles`(`id`,`content`,`createDate`,`title`,`category_id`,`user_id`) values (1,'<p>央广网10月10日消息，河北省秦皇岛市山海关景区昨天成为国内首个被取消5A级景区资质的旅游景点。著名的杭州西溪湿地等6家5A级景区也同时被&ldquo;黄牌警告&rdquo;。面对如此严厉的处罚，景区有何反应？</p>\r\n\r\n<p>山海关景区由天下第一关、老龙头和孟姜女庙三个景点组成，2007年获得国家首批5A级景区资质。但长期以来，游客对这里的旅游环境抱怨颇多。</p>\r\n\r\n<p>今年十一期间，国家旅游局暗访发现，山海关景区存在价格欺诈、擅自更改门票价格、强迫游客在功德箱捐款、环境卫生脏乱、设施破损普遍、服务质量下降、管理水平差等问题，认为依据国家5A级景区标准和评分细则，山海关景区已不具备5A级景区条件，决定取消其5A级景区资质。</p>\r\n\r\n<p>这是自2011年国家旅游局启动对既有星级资质的景区暗访工作以来，第一次取消5A级景区资质。</p>\r\n\r\n<p>面对上述处理决定，山海关区昨晚（10月9日）连夜召开整改专项会议。秦皇岛市免去老龙头景区和区旅游监察大队负责人的职务，要求区委区政府主要领导、主管领导及旅游系统负责人作出检查，在全区范围内持续开展旅游市场整治和城市管理提升专项行动。</p>\r\n\r\n<p>今天（10月10日）上午，记者发现景区里的功德箱已被全部撤掉。天下第一关景区副主任马维玲表示，一是把城上1300米长城沿线上的所有摊位全部 下移，还原了长城的本体；环境卫生进行了彻底的整治；门票全部明码标价，不存在套票现象，游客购买门票能够把整个景区全部参观完。</p>\r\n\r\n<p>被国家旅游局严重警告的浙江杭州西溪湿地旅游区的主要问题，是存在安全隐患、商贩管理不当、导游不够专业。</p>\r\n\r\n<p>西溪湿地管委会办公室副主任梅晓增坦承，景区确实存在着管理漏洞，安全隐患主要像码头、桥梁，除了这个以外就是标识标牌，还有个别商户在占道经营。</p>\r\n\r\n<p>记者走访发现，这些问题中，游客反应最强烈的还是标识牌不清楚。温州的林女士就因为标识不清楚吃了苦头，早上10点入园走了两个小时都没有找到吃饭的地方： &ldquo;走了好久了，它这个路标不是很明确，而且没什么路标，很少。外面来的，我们也不知道该往哪边走，应该怎么走？&rdquo;</p>\r\n\r\n<p>西溪湿地管委会办公室副主任梅晓增表示，今天（10月10日）起开展三个月集中整治，按照5A级景区标准全面整改： &ldquo;环境卫生的，现在都已经分队落实到人；游客特别是在主游步道上肯定要加护栏；涉及到讲解员实习生，我们就会加强培训和管理，拿到上岗证他才上岗。&rdquo;</p>\r\n','2015-10-11 14:14:23','山海关景区被取消5A后续:相关负责人被连夜免职',1,NULL),(2,'<p>快报讯 &ldquo;常州百元白粥&rdquo;事件有了新进展。10月10日下午，常州市物价局发布了&ldquo;常州百元白粥&rdquo;的调查结果称，常州荔茵潮汕砂锅粥御园加盟连锁店（以下简称店方）违反明码标价的规定，物价部门按处罚上限，对该店方处以罚款5000元的行政处罚。</p>\r\n\r\n<p>店方也认识到自身的问题，积极配合调查处理，表示将主动向消费者朱先生退还粥款100元，并对其表示歉意。据常州物价部门介绍，消费者朱先生于10月8日下午向物价部门进行了投诉。常州市物价局立即受理并立案，并于10月9日派出检查组到店方进行了现场调查。</p>\r\n\r\n<p>物价部门表示，按照《价格法》和《关于商品和服务实行明码标价的规定》等法律法规，对店方违反明码标价规定的行为，按处罚上限处以罚款5000元的行政处罚。而店方也认识到自身的问题，积极配合调查处理，表示将主动向消费者朱先生退还粥款100元，并对其表示歉意。</p>\r\n\r\n<p>同时，物价部门也与朱先生联系，将处罚结果反馈给朱先生，朱先生表示满意。</p>\r\n','2015-10-11 14:16:10','江苏\"百元粥店\"被罚5000元 店方道歉',1,NULL),(3,'<p>【环球网综合报道报道】据香港&ldquo;东网&rdquo;10月9日报道，俄罗斯罗斯托夫一名母亲，16年前生下女儿后，见她有先天智障，竟狠心把她遗弃。日前重遇女儿后，甚至嫌对方貌丑，要有人免费为女儿整容，才考虑与她相认。</p>\r\n\r\n<p>据报道，现年41岁的娜齐达(Nadezhda)，是一名单亲妈妈，目前育有3名儿子，住在罗斯托夫的亚速市(Azov)。当年她诞下女儿卡蒂亚 (Katya)后，医生指女儿智力有先天问题，身体也有残障，有可能几天内夭折。娜齐达便将女儿遗弃在医院，多年来一直以为女儿已死。</p>\r\n\r\n<p>但实际上卡蒂亚活了下来，并由社工安排至孤儿院照顾长大。直到近日，娜齐达收到孤儿院来信指卡蒂亚仍然健在。信中还提到，如果娜齐达不领回卡蒂亚，她到18岁时就会被送入庇护所。</p>\r\n\r\n<p>娜齐达随后良心发现，去探望女儿。不过，当她见到耳鼻变形的女儿后，觉她相貌丑陋，怕被取笑拒绝领回女儿，还提出条件，指要有人免费为女儿整容才会领回她。现在社工正与慈善机构合作，望能在莫斯科找到肯免费动手术的医生，但目前仍未有进展。</p>\r\n','2015-10-11 14:17:25','俄女子找到被遗弃亲生女儿 嫌其太丑拒相认(图)',2,NULL),(4,'<p>10月10日，河南一家以野猴为特色的景区，一名小美女与野猴合影，遭&ldquo;流氓&rdquo;野猴跳到胸前&ldquo;骚扰&rdquo;，令人哭笑不得。</p>\r\n','2015-10-11 14:18:26','河南景区内\"流氓\"野猴跳女游客胸前\"骚扰\"',1,NULL),(5,'<p>近年娱乐圈艺人涉足商业投资已然成为新风尚。当年一曲《坚持到底》走红的歌手阿杜，最近也成为了这一队伍的一份子。近日，阿杜以明星老板身份现身广州，出席有份投资的美容医院落户开业仪式。</p>\r\n\r\n<p>谈到为何转型当生意人，阿杜表示：&ldquo;不论是以明星的身份站在舞台上，还是以投资人的身份站在这里，我都在做一个更好的自己，不断开启自己人生的新梦想新旅程。&rdquo;但阿杜表示不会放弃音乐事业：&ldquo;现在我是两年发一张专辑的节奏。目前是在筹备一些新的惊喜带给大家。&rdquo;</p>\r\n','2015-10-11 14:19:43','阿杜转型当老板身材发福 网友直呼认不出',5,NULL),(6,'<p>外星人飞碟</p>\r\n\r\n<p>　　近年来，科学家对宇宙的探索越来越深入，外星人被提及的次数也越来越频繁。据美国生活科学网报道，美国75岁物理学家 斯坦顿&middot;弗里德曼称，他确信外星生物曾到访地球，并且停留了很长时间。不仅如此，2010年曾有一名美国女子自称被外星人劫持136年，其头部还被安装了 一个秘密的金属异物，但根本取不出来。</p>\r\n\r\n<p>　　弗里德曼指出，外星人的存在并不奇怪，许多人都相信UFO和外星人的真实存在。对于弗里德曼的说法，另外几位资深科学家也表示了支持，但没有证据能够证实，前美国宇航局&ldquo;阿波罗号&rdquo;宇航员埃德加-米切尔更是认为美国政府对UFO和外星生命事件进行了掩盖。</p>\r\n\r\n<p>　 　据悉，美国政府内部许多工作人员都知道包括1947年罗斯韦尔镇飞碟碰撞在内的多起UFO和外星飞船事件。弗里德曼称，数十年来政府高层官员都谨慎对待 所有的UFO证据，而且相关研究的科学家对此没有十足的把握作出诊断，他们担心判断失误。不过，5年前的一名自称被外星人劫持的美国女子的经历似乎证明了 弗里德曼的推断。</p>\r\n','2015-10-11 14:28:59','科学家称外星人曾造访地球 美国女子被劫持136年',5,NULL),(7,'<p>Company: CompanyName</p>\r\n\r\n<p>Contact Name: FirstName And LastName</p>\r\n','2015-10-11 19:29:44','联系我们标题不会在页面显示',6,NULL);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`img`,`name`,`position`,`url`) values (1,'category/3406b66d-3fa9-4c5e-bc31-d33ec0511b10.jpg','公司新闻',1,'page_company'),(2,'category/f0287389-2e02-460a-914d-e75f1e1e1171.jpg','行业新闻',2,'page_trade'),(3,'category/f60f5999-1db7-468c-be4a-abf4067e65b8.jpg','教学视频',5,'page_video'),(4,'category/0e50c540-d70e-4b31-a173-91459e5dd17e.jpg','产品中心',6,'page_product'),(5,'category/a44145dc-f98f-4bfe-9712-f3c9f8b85c63.jpg','成功案例',7,'page_casus'),(6,'category/5774a5b5-b3a5-43bd-9eb2-978a51319337.jpg','联系我们',8,'page_us');

/*Table structure for table `friends` */

DROP TABLE IF EXISTS `friends`;

CREATE TABLE `friends` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `friends` */

insert  into `friends`(`id`,`name`,`position`,`url`) values (1,'百度',2,'http://www.baidu.com'),(3,'Microsoft',1,'http://www.microsoft.com'),(4,'Google',0,'http://www.google.com.hk'),(5,'sina',3,'http://www.sina.com.cn');

/*Table structure for table `privilege` */

DROP TABLE IF EXISTS `privilege`;

CREATE TABLE `privilege` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `order_` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA1FAF6B16D409B55` (`parent_id`),
  CONSTRAINT `FKA1FAF6B16D409B55` FOREIGN KEY (`parent_id`) REFERENCES `privilege` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `privilege` */

insert  into `privilege`(`id`,`name`,`order_`,`url`,`parent_id`) values (1,NULL,NULL,'/user_list',NULL),(2,NULL,NULL,'/user_edit',NULL),(3,NULL,NULL,'/home_index',NULL),(4,NULL,NULL,'/user_add',NULL),(5,NULL,NULL,'/webSettings_edit',NULL),(6,NULL,NULL,'/category_list',NULL),(7,NULL,NULL,'/category_edit',NULL),(8,NULL,NULL,'/category_add',NULL),(9,NULL,NULL,'/article_list',NULL),(10,NULL,NULL,'/article_edit',NULL),(11,NULL,NULL,'/article_add',NULL),(12,NULL,NULL,'/videoCategory_add',NULL),(13,NULL,NULL,'/videoCategory_list',NULL),(14,NULL,NULL,'/videoCategory_edit',NULL),(15,NULL,NULL,'/video_list',NULL),(16,NULL,NULL,'/video_edit',NULL),(17,NULL,NULL,'/video_add',NULL),(18,NULL,NULL,'/friends_list',NULL),(19,NULL,NULL,'/friends_add',NULL),(20,NULL,NULL,'/friends_edit',NULL),(21,NULL,NULL,'/home_nav',NULL);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roleName` (`roleName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

/*Table structure for table `role_privilege` */

DROP TABLE IF EXISTS `role_privilege`;

CREATE TABLE `role_privilege` (
  `role_id` bigint(20) NOT NULL,
  `privilege_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`privilege_id`),
  KEY `FK45FBD628C5C51BEE` (`privilege_id`),
  KEY `FK45FBD628BB6C0DA6` (`role_id`),
  CONSTRAINT `FK45FBD628BB6C0DA6` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FK45FBD628C5C51BEE` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_privilege` */

/*Table structure for table `slider_images` */

DROP TABLE IF EXISTS `slider_images`;

CREATE TABLE `slider_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `slider_images` */

/*Table structure for table `temp` */

DROP TABLE IF EXISTS `temp`;

CREATE TABLE `temp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `temp` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `passWord` varchar(50) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK36EBCBBB6C0DA6` (`role_id`),
  CONSTRAINT `FK36EBCBBB6C0DA6` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`passWord`,`userName`,`role_id`) values (1,'21232f297a57a5a743894a0e4a801fc3','admin',NULL);

/*Table structure for table `video` */

DROP TABLE IF EXISTS `video`;

CREATE TABLE `video` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tudouUrl` varchar(255) DEFAULT NULL,
  `youkuUrl` varchar(255) DEFAULT NULL,
  `videoCategory_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6B0147B6A32010E` (`videoCategory_id`),
  CONSTRAINT `FK6B0147B6A32010E` FOREIGN KEY (`videoCategory_id`) REFERENCES `video_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `video` */

insert  into `video`(`id`,`img`,`title`,`tudouUrl`,`youkuUrl`,`videoCategory_id`) values (1,'video/5cf4f1d9-e0d8-4e05-b754-d982ec8041d5.jpg','期初开账','http://www.todou.com','http://www.youku.com',1),(2,'video/19ff0d51-db19-4f9c-9615-5627bc93464c.jpg','MRP基础','http://www.todou.com','http://www.youku.com',2),(3,'video/baf78618-0abb-43c7-b769-85b69e6be603.jpg','基础视频1','http://www.todou.com/','http://www.youku.com/',1),(4,'video/7d863d1f-dc06-43e7-8133-4a6e147325b5.jpg','基础视频2','http://www.todou.com/','http://www.youku.com/',1),(5,'video/81ab9cfa-dd5f-49f8-b775-b3a4d81aeb3b.jpg','基础视频3','http://www.todou.com/','http://www.youku.com/',1);

/*Table structure for table `video_category` */

DROP TABLE IF EXISTS `video_category`;

CREATE TABLE `video_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `video_category` */

insert  into `video_category`(`id`,`name`,`position`) values (1,'基础视频',1),(2,'MRP',2);

/*Table structure for table `web_settings` */

DROP TABLE IF EXISTS `web_settings`;

CREATE TABLE `web_settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `copyRight` varchar(255) DEFAULT NULL,
  `webLogo` varchar(255) DEFAULT NULL,
  `webName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `web_settings` */

insert  into `web_settings`(`id`,`address`,`copyRight`,`webLogo`,`webName`) values (1,'广州体育中心天河城308','© 软件·广州 备案号：粤ICP备13000949号-1','web_logo/19c21940-f193-40db-b7d9-a3d0b5d69492.png','什么科技');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
