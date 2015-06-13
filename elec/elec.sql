/*
SQLyog Enterprise - MySQL GUI v6.14
MySQL - 5.0.22-community-nt : Database - elec
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `elec`;

USE `elec`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `elec_adjust` */

DROP TABLE IF EXISTS `elec_adjust`;

CREATE TABLE `elec_adjust` (
  `adjustID` int(11) NOT NULL,
  `equapmentID` int(11) default NULL,
  `jctID` varchar(255) default NULL,
  `devName` varchar(255) default NULL,
  `adjustPeriod` varchar(255) default NULL,
  `apunit` varchar(255) default NULL,
  `useDate` date default NULL,
  `devType` varchar(255) default NULL,
  `startDate` date default NULL,
  `isHaving` varchar(255) default NULL,
  `comment` varchar(255) default NULL,
  `record` varchar(255) default NULL,
  PRIMARY KEY  (`adjustID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_adjust` */

insert  into `elec_adjust`(`adjustID`,`equapmentID`,`jctID`,`devName`,`adjustPeriod`,`apunit`,`useDate`,`devType`,`startDate`,`isHaving`,`comment`,`record`) values (6,2,'1','笔记本电脑','1','月','2014-05-04','2','2014-05-05','2','hhhhh','呵呵呵'),(7,3,'4','Iphone4','1','月','2014-05-04','3','2014-05-05','2','hhhhh','呵呵呵'),(8,4,'1','word2007','1','月','2014-05-04','5','2014-05-05','2','hhhhh','呵呵呵'),(9,5,'1','电视机','1','月','2014-05-04','6','2014-05-05','2','hhhhh','呵呵呵'),(10,6,'1','office','1','月','2014-05-04','5','2014-05-05','2','hhhhh','呵呵呵'),(11,7,'3','联想','1','月','2014-05-04','3','2014-05-05','2','hhhhh','呵呵呵'),(13,9,'4','东芝','1','月','2014-05-04','3','2014-05-05','2','hhhhh','呵呵呵'),(15,11,'4','避雷针','2','月','2014-05-04','4','2014-05-05','2','hhhhh','呵呵呵'),(16,12,'1','笔记本电脑','1','月','2014-05-04','2','2014-05-05','2','hhhhh','呵呵呵'),(17,1,'4','usb电脑连接接口','1','月','2014-05-04','2','2014-05-05','2','有意义','医院'),(18,1,'4','usb电脑连接接口','1','月','2014-05-04','2','2014-05-05','2','adjustID','adjustID'),(19,1,'4','usb电脑连接接口','1','月','2014-05-04','2','2014-05-05','2','','');

/*Table structure for table `elec_application` */

DROP TABLE IF EXISTS `elec_application`;

CREATE TABLE `elec_application` (
  `applicationID` int(11) NOT NULL,
  `title` varchar(255) default NULL,
  `path` varchar(255) default NULL,
  `applyTime` datetime default NULL,
  `status` varchar(255) default NULL,
  `processInstanceID` varchar(255) default NULL,
  `applicationTemplateID` int(11) default NULL,
  `applicationUserID` varchar(255) default NULL,
  PRIMARY KEY  (`applicationID`),
  KEY `FKA907BB962E934728` (`applicationTemplateID`),
  KEY `FKA907BB968F86D388` (`applicationUserID`),
  CONSTRAINT `FKA907BB962E934728` FOREIGN KEY (`applicationTemplateID`) REFERENCES `elec_application_template` (`id`),
  CONSTRAINT `FKA907BB968F86D388` FOREIGN KEY (`applicationUserID`) REFERENCES `elec_user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_application` */

/*Table structure for table `elec_application_template` */

DROP TABLE IF EXISTS `elec_application_template`;

CREATE TABLE `elec_application_template` (
  `id` int(11) NOT NULL,
  `name` varchar(255) default NULL,
  `processDefinitionKey` varchar(255) default NULL,
  `path` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_application_template` */

/*Table structure for table `elec_approveinfo` */

DROP TABLE IF EXISTS `elec_approveinfo`;

CREATE TABLE `elec_approveinfo` (
  `approveID` int(11) NOT NULL,
  `comment` varchar(255) default NULL,
  `approval` bit(1) default NULL,
  `approveTime` datetime default NULL,
  `applicationID` int(11) default NULL,
  `approveUserID` varchar(255) default NULL,
  PRIMARY KEY  (`approveID`),
  KEY `FK764523E1D1280994` (`applicationID`),
  KEY `FK764523E1EB349FC5` (`approveUserID`),
  CONSTRAINT `FK764523E1D1280994` FOREIGN KEY (`applicationID`) REFERENCES `elec_application` (`applicationID`),
  CONSTRAINT `FK764523E1EB349FC5` FOREIGN KEY (`approveUserID`) REFERENCES `elec_user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_approveinfo` */

/*Table structure for table `elec_bug` */

DROP TABLE IF EXISTS `elec_bug`;

CREATE TABLE `elec_bug` (
  `bugID` int(11) NOT NULL,
  `stationID` int(11) default NULL,
  `bugType` varchar(255) default NULL,
  `occurDate` date default NULL,
  `produceHome` varchar(255) default NULL,
  `bugDescribe` varchar(255) default NULL,
  `resolveDate` date default NULL,
  `resolveMethod` varchar(255) default NULL,
  `btnResolve` varchar(255) default NULL,
  `bugReason` varchar(255) default NULL,
  `comment` varchar(255) default NULL,
  `sbYear` varchar(255) default NULL,
  `sbMonth` varchar(255) default NULL,
  PRIMARY KEY  (`bugID`),
  KEY `FK2CADABA9416660A` (`stationID`),
  CONSTRAINT `FK2CADABA9416660A` FOREIGN KEY (`stationID`) REFERENCES `elec_station` (`stationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_bug` */

insert  into `elec_bug`(`bugID`,`stationID`,`bugType`,`occurDate`,`produceHome`,`bugDescribe`,`resolveDate`,`resolveMethod`,`btnResolve`,`bugReason`,`comment`,`sbYear`,`sbMonth`) values (1,1,'1','2014-05-30','北京市','北京停电','2014-05-30','发电机发电',NULL,'举国哀悼','胡扯','2014','1'),(2,2,'3','2014-05-30','北京市传智播客','通讯故障','2014-05-30','回复通讯',NULL,'通讯膨胀','增加通讯带宽','2014','2'),(3,3,'1','2014-05-15','信阳市五月计划','信阳市五月计划','2014-05-22','信阳市五月计划',NULL,'信阳市五月计划','信阳市五月计划','2014','2'),(4,4,'1','2014-05-30','声震市五月计划','声震市五月计划','2014-06-26','声震市五月计划',NULL,'声震市五月计划','声震市五月计划','2014','3'),(5,1,'1','2014-05-29','hhhhhhhhhh','hhhhhhhhhh','2014-05-30','hhhhhhhhhh',NULL,'hhhhhhhhhh','hhhhhhhhhh','2014','5'),(6,2,'2','2014-05-30','信阳市伊尔和','信阳市伊尔和','2014-05-30','信阳市伊尔和',NULL,'信阳市伊尔和','信阳市伊尔和','2014','5'),(7,1,'1','2014-05-30','河南工业大学','河南工业大学','2014-05-30','河南工业大学',NULL,'河南工业大学','河南工业大学','2014','6'),(8,1,'1','2014-05-30','河南工业大学','河南工业大学','2014-05-30','河南工业大学',NULL,'河南工业大学','河南工业大学','2014','5'),(9,8,'2','2014-05-21','','河南工业大学','2014-05-30','河南工业大学',NULL,'河南工业大学','河南工业大学','2014','3'),(10,8,'1','2014-05-08','河南工业大学','河南工业大学','2014-05-31','河南工业大学',NULL,'河南工业大学','河南工业大学','2012','5'),(11,1,'3','2014-05-05','甘亮','bugID','2014-05-30','bugID',NULL,'bugID','bugID','2014','6');

/*Table structure for table `elec_building` */

DROP TABLE IF EXISTS `elec_building`;

CREATE TABLE `elec_building` (
  `buildingID` int(11) NOT NULL,
  `jctID` varchar(255) default NULL,
  `buildName` varchar(255) default NULL,
  `buildType` varchar(255) default NULL,
  `buildLayer` int(11) default NULL,
  `buildArea` double default NULL,
  `buildStartDate` date default NULL,
  `extendBuildDate` date default NULL,
  `extendBuildArea` double default NULL,
  `dxDate` date default NULL,
  `buildExpense` double default NULL,
  `useDate` date default NULL,
  `comment` varchar(255) default NULL,
  PRIMARY KEY  (`buildingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_building` */

insert  into `elec_building`(`buildingID`,`jctID`,`buildName`,`buildType`,`buildLayer`,`buildArea`,`buildStartDate`,`extendBuildDate`,`extendBuildArea`,`dxDate`,`buildExpense`,`useDate`,`comment`) values (7,'3','007','3',NULL,1234,NULL,NULL,0,NULL,0,NULL,''),(9,'4','009','3',NULL,1234,NULL,NULL,0,NULL,0,NULL,''),(10,'1','010','3',NULL,11234,NULL,NULL,0,NULL,0,NULL,''),(11,'2','011','3',NULL,12345,NULL,NULL,0,NULL,0,NULL,''),(12,'1','012','1',NULL,1123,NULL,NULL,0,NULL,0,NULL,''),(15,'2','015','1',NULL,123,NULL,NULL,0,NULL,0,NULL,''),(16,'3','016','1',NULL,123,NULL,NULL,0,NULL,0,NULL,''),(19,'4','019','1',NULL,123,NULL,NULL,0,NULL,0,NULL,''),(20,'3','020','2',NULL,123,NULL,NULL,0,NULL,0,NULL,''),(21,'1','001','1',NULL,123,NULL,NULL,0,NULL,0,NULL,''),(22,'1','001','1',NULL,123,NULL,NULL,0,NULL,0,NULL,''),(23,'1','001','1',NULL,1,NULL,NULL,0,NULL,0,NULL,''),(24,'3','007','3',12,1234,'1990-05-15','1990-05-15',0,'1990-05-15',0,'1990-05-15','geggege'),(25,'3','3',NULL,12,1234,'1990-05-15','1990-05-15',0,'1990-05-15',0,'1990-05-15','geggege'),(26,'3','007','3',12,1234,'1990-05-15','1990-05-15',0,'1990-05-15',0,'1990-05-15','geggege'),(27,'3','007','3',12,1234,'1990-05-15','1990-05-15',0,'1990-05-15',0,'1990-05-15','geggege');

/*Table structure for table `elec_commonmsg` */

DROP TABLE IF EXISTS `elec_commonmsg`;

CREATE TABLE `elec_commonmsg` (
  `comID` varchar(255) NOT NULL,
  `stationRun` varchar(255) default NULL,
  `devRun` varchar(255) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`comID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_commonmsg` */

insert  into `elec_commonmsg`(`comID`,`stationRun`,`devRun`,`createDate`) values ('8aa50bc745828d0d0145829039360001','<p>\r\n	&nbsp;hello &nbsp; &nbsp;&nbsp;</p>\r\n','<p>\r\n	我去 &nbsp;这是在那里啊 &nbsp;小子</p>\r\n','2014-04-22 11:48:42');

/*Table structure for table `elec_datachart` */

DROP TABLE IF EXISTS `elec_datachart`;

CREATE TABLE `elec_datachart` (
  `dataChartID` int(11) NOT NULL,
  `jctID` varchar(255) default NULL,
  `belongTo` varchar(255) default NULL,
  `dataChartName` varchar(255) default NULL,
  `comment` varchar(255) default NULL,
  PRIMARY KEY  (`dataChartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_datachart` */

/*Table structure for table `elec_devplan` */

DROP TABLE IF EXISTS `elec_devplan`;

CREATE TABLE `elec_devplan` (
  `devPlanID` int(11) NOT NULL,
  `devType` varchar(255) default NULL,
  `devName` varchar(255) default NULL,
  `trademark` varchar(255) default NULL,
  `specType` varchar(255) default NULL,
  `produceHome` varchar(255) default NULL,
  `quality` int(11) default NULL,
  `qunit` varchar(255) default NULL,
  `useness` varchar(255) default NULL,
  `produceArea` varchar(255) default NULL,
  `devExpense` double default NULL,
  `useUnit` varchar(255) default NULL,
  `jctID` varchar(255) default NULL,
  `planDate` date default NULL,
  `adjustPeriod` varchar(255) default NULL,
  `apunit` varchar(255) default NULL,
  `overhaulPeriod` varchar(255) default NULL,
  `opunit` varchar(255) default NULL,
  `configure` varchar(255) default NULL,
  PRIMARY KEY  (`devPlanID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_devplan` */

insert  into `elec_devplan`(`devPlanID`,`devType`,`devName`,`trademark`,`specType`,`produceHome`,`quality`,`qunit`,`useness`,`produceArea`,`devExpense`,`useUnit`,`jctID`,`planDate`,`adjustPeriod`,`apunit`,`overhaulPeriod`,`opunit`,`configure`) values (22,'4','避雷针','避雷针','避雷针5555','避雷针',1,'个','避雷针','避雷针',234,'人民币','4','2014-05-03','2','月','5','月','避雷针避雷针避雷针避雷针避雷针'),(23,'1','usb电脑连接接口','USB','USB-2259','usb电脑连接接口',1000,'个','usb电脑连接接口','usb电脑连接接口',122,'人民币','1','2014-05-04','1','月','5','日','usb电脑连接接口'),(25,'3','Iphone4','Apple','拼过四代','郑州富士康',1,'个','耍酷','郑州市',3600,'人民币','4','2014-05-03','1','月','5','日','苹果电脑'),(26,'5','word2007','office','word2007','微软',1,'份','编写word文档','中国',200,'人民币','1','2014-05-03','1','月','5','日','office'),(27,'6','电视机','IT','IT-5525','中关村',100,'台','销售','北京市',8000,'人民币','1','2014-05-03','1','月','5','日','中关村电视机'),(28,'5','office','office','office','office',1,'台','office','office',234,'人民币','1','2014-05-03','1','月','5','日','officeofficeofficeoffice'),(29,'3','联想','联想','lenovon-i7','联想',1,'台','联想','联想',345,'人民币','3','2014-05-03','1','月','5','周','联想联想联想联想联想'),(30,'3','戴尔','戴尔','戴尔678','戴尔',1,'台','戴尔','戴尔',4567,'人民币','3','2014-05-03','2','月','6','月',NULL),(31,'3','东芝','东芝','东芝4567','东芝',1,'台','东芝','东芝',5678,'人民币','4','2014-05-03','1','月','5','月','东芝东芝东芝东芝'),(32,'3','西部数据','西部数据','西部数据123','西部数据',1,'台','西部数据','西部数据',480,'人民币','3','2014-05-03','1','月','4','月','西部数据西部数据西部数据西部数据西部数据'),(34,'1','usb电脑连接接口','USB','USB-2259','usb电脑连接接口',1000,'个','usb电脑连接接口','usb电脑连接接口',122,'人民币',NULL,'2014-05-04','1','月','5','日','usb电脑连接接口');

/*Table structure for table `elec_elecfileupload` */

DROP TABLE IF EXISTS `elec_elecfileupload`;

CREATE TABLE `elec_elecfileupload` (
  `fileUploadID` int(11) NOT NULL,
  `bugID` int(11) default NULL,
  `planID` int(11) default NULL,
  `file` longblob,
  `fileFileName` varchar(255) default NULL,
  `fileContentType` varchar(255) default NULL,
  `adjustID` int(11) default NULL,
  `repairID` int(11) default NULL,
  PRIMARY KEY  (`fileUploadID`),
  KEY `FK203F7DCCC822F06` (`planID`),
  KEY `FK203F7DC3763EC0A` (`bugID`),
  CONSTRAINT `FK203F7DC3763EC0A` FOREIGN KEY (`bugID`) REFERENCES `elec_bug` (`bugID`),
  CONSTRAINT `FK203F7DCCC822F06` FOREIGN KEY (`planID`) REFERENCES `elec_plan` (`planID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_elecfileupload` */

/*Table structure for table `elec_equapment` */

DROP TABLE IF EXISTS `elec_equapment`;

CREATE TABLE `elec_equapment` (
  `equapmentID` int(11) NOT NULL,
  `jctID` varchar(255) default NULL,
  `devName` varchar(255) default NULL,
  `devType` varchar(255) default NULL,
  `quality` int(11) default NULL,
  `qunit` varchar(255) default NULL,
  `devExpense` double default NULL,
  `useUnit` varchar(255) default NULL,
  `configure` varchar(255) default NULL,
  `specType` varchar(255) default NULL,
  `trademark` varchar(255) default NULL,
  `devState` varchar(255) default NULL,
  `produceHome` varchar(255) default NULL,
  `produceArea` varchar(255) default NULL,
  `useness` varchar(255) default NULL,
  `overhaulPeriod` varchar(255) default NULL,
  `opunit` varchar(255) default NULL,
  `useDate` date default NULL,
  `planDate` date default NULL,
  `adjustPeriod` varchar(255) default NULL,
  `apunit` varchar(255) default NULL,
  `runDescribe` varchar(255) default NULL,
  `comment` varchar(255) default NULL,
  PRIMARY KEY  (`equapmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_equapment` */

insert  into `elec_equapment`(`equapmentID`,`jctID`,`devName`,`devType`,`quality`,`qunit`,`devExpense`,`useUnit`,`configure`,`specType`,`trademark`,`devState`,`produceHome`,`produceArea`,`useness`,`overhaulPeriod`,`opunit`,`useDate`,`planDate`,`adjustPeriod`,`apunit`,`runDescribe`,`comment`) values (1,'4','usb电脑连接接口','2',1000,'个',122,'人民币','usb电脑连接接口','USB-2259','USB','1','usb电脑连接接口','usb电脑连接接口','usb电脑连接接口','5','日','2014-05-04',NULL,'1','月','ceshi shuju ','没问题吗 ？？？？？？？？？？'),(2,'1','笔记本电脑','2',1,'本',5600,'人民币','笔记本电脑购买','AD04','华硕','1','北京华硕','北京市','自己使用','3','日','2014-05-04','2014-05-03','1','月',NULL,NULL),(3,'4','Iphone4','3',1,'个',3600,'人民币','苹果电脑','拼过四代','Apple','1','郑州富士康','郑州市','耍酷','5','日','2014-05-04','2014-05-03','1','月',NULL,NULL),(4,'1','word2007','5',1,'份',200,'人民币','office','word2007','office','1','微软','中国','编写word文档','5','日','2014-05-04','2014-05-03','1','月',NULL,NULL),(5,'1','电视机','6',100,'台',8000,'人民币','中关村电视机','IT-5525','IT','1','中关村','北京市','销售','5','日','2014-05-04','2014-05-03','1','月',NULL,NULL),(6,'1','office','5',1,'台',234,'人民币','officeofficeofficeoffice','office','office','1','office','office','office','5','日','2014-05-04','2014-05-03','1','月',NULL,NULL),(7,'3','联想','3',1,'台',345,'人民币','联想联想联想联想联想','lenovon-i7','联想','1','联想','联想','联想','5','周','2014-05-04','2014-05-03','1','月',NULL,NULL),(8,'3','戴尔','3',1,'台',4567,'人民币',NULL,'戴尔678','戴尔','1','戴尔','戴尔','戴尔','6','月','2014-05-04','2014-05-03','2','月',NULL,NULL),(9,'4','东芝','3',1,'台',5678,'人民币','东芝东芝东芝东芝','东芝4567','东芝','1','东芝','东芝','东芝','5','月','2014-05-04','2014-05-03','1','月',NULL,NULL),(10,'3','西部数据','3',1,'台',480,'人民币','西部数据西部数据西部数据西部数据西部数据','西部数据123','西部数据','1','西部数据','西部数据','西部数据','4','月','2014-05-04','2014-05-03','1','月',NULL,NULL),(11,'4','避雷针','4',1,'个',234,'人民币','避雷针避雷针避雷针避雷针避雷针','避雷针5555','避雷针','1','避雷针','避雷针','避雷针','5','月','2014-05-04','2014-05-03','2','月',NULL,NULL),(12,'1','笔记本电脑','2',1,'本',5600,'人民币','笔记本电脑购买','AD04','华硕','1','北京华硕','北京市','自己使用','3','日','2014-05-04','2014-05-03','1','月',NULL,NULL);

/*Table structure for table `elec_exportfields` */

DROP TABLE IF EXISTS `elec_exportfields`;

CREATE TABLE `elec_exportfields` (
  `belongTo` varchar(255) NOT NULL,
  `expNameList` varchar(255) default NULL,
  `expFieldName` varchar(255) default NULL,
  `noExpNameList` varchar(255) default NULL,
  `noExpFieldName` varchar(255) default NULL,
  PRIMARY KEY  (`belongTo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_exportfields` */

insert  into `elec_exportfields`(`belongTo`,`expNameList`,`expFieldName`,`noExpNameList`,`noExpFieldName`) values ('1-1','所属单位#设备类名称#设备类型#数量#数量单位#花费#金钱单元#配置#规格型号#品牌#设备状况#生产厂家#生产地#用途#检修周期#检修单元#使用日期#计划日期#调整周期#调整单元#运行描述#备注','jctID#devName#devType#quality#qunit#devExpense#useUnit#configure#specType#trademark#devState#produceHome#produceArea#useness#overhaulPeriod#opunit#useDate#planDate#adjustPeriod#apunit#runDescribe#comment','',''),('1-2','设备ID#用户单位#设备名称#设备类型#开始日期#是否校准#备注#记录','equapmentID#jctID#devName#devType#startDate#isHaving#comment#record','使用日期#校准单元#校准周期','useDate#apunit#adjustPeriod'),('1-2-2','设备ID#用户单位#设备名称#校准周期#检修单元#使用日期#设备类型#开始日期#是否校准#备注#记录','equapmentID#jctID#devName#overhaulPeriod#opunit#useDate#devType#startDate#isHaving#comment#record',NULL,NULL),('1-3','设备类型#设备名称#品牌#规格型号#厂家#数量#单位#用途#地产#金额#使用单元#所属单位#计划时间#校准周期#校准单位#检修周期#检修单位#配置','devType#devName#trademark#specType#produceHome#quality#qunit#useness#produceArea#devExpense#useUnit#jctID#planDate#adjustPeriod#apunit#overhaulPeriod#opunit#configure','',''),('3-1','所属单位#建筑名称#建筑类型#建筑层数#建筑面积#始建时间#扩建时间#扩建面积#大修时间#造价#使用时间#备注','jctID#buildName#buildType#buildLayer#buildArea#buildStartDate#extendBuildDate#extendBuildArea#dxDate#buildExpense#useDate#comment','',''),('4-1','所属单位#站点名称#站点代号#开始使用时间#安装地点#生产厂家#通讯方式#站点类别#归属地#备注','jctID#stationName#stationCode#useStartDate#jcfrequency#produceHome#contactType#stationType#attributionGround#comment','',''),('4-2','站点名称#站点代号#所属单位#故障类型#故障时间#处理时间#故障原因#处理方法#备注#故障描述','elecStation.stationName#elecStation.stationCode#elecStation.jctID#bugType#occurDate#resolveDate#bugReason#resolveMethod#comment#bugDescribe','',''),('5-1','所属单位#用户姓名#登录名#密码#性别#出生日期#联系地址#电子邮箱#是否在职#入职时间#职位#手机','jctID#userName#logonName#logonPwd#sexID#birthday#address#email#isDuty#onDutyDate#postID#mobile','联系电话#离职时间#备注','contactTel#offDutyDate#remark'),('5-3','站点运行情况#设备运行情况#创建日期','stationRun#devRun#createDate','','');

/*Table structure for table `elec_plan` */

DROP TABLE IF EXISTS `elec_plan`;

CREATE TABLE `elec_plan` (
  `planID` int(11) NOT NULL,
  `jctID` varchar(255) default NULL,
  `occurDate` date default NULL,
  `mainContent` varchar(255) default NULL,
  `comment` varchar(255) default NULL,
  PRIMARY KEY  (`planID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_plan` */

insert  into `elec_plan`(`planID`,`jctID`,`occurDate`,`mainContent`,`comment`) values (1,'1','2014-05-30','北京站点定时监测电机状况\r\n','添加电机维护的计划'),(2,'1','2014-05-30','北京站点基本信息的修改','北京站点基本信息的修改'),(3,'4','2014-05-30','信阳市电机维护计划','信阳市电机维护计划'),(4,'2','2014-05-30','上海维护计划','上海维护计划'),(5,'3','2014-05-30','深圳维护计划','深圳维护计划'),(6,'4','2014-06-30','信阳市第二次维护计划监测','信阳市第二次维护计划监测'),(7,'2','2014-06-30','上海市第二次维护计划监测','上海市第二次维护计划监测'),(8,'3','2014-06-30','深圳市第二次维护计划监测','深圳市第二次维护计划监测'),(9,'1','2014-06-30','北京第二次维护计划监测','北京第二次维护计划监测'),(12,'1','2014-05-30','信阳市五月计划','信阳市五月计划'),(13,'1','2014-05-06','2014/5/2','2014/5/2'),(14,'1','2014-05-06','HEHEHEHEHEHE','HEEHEHEHEHEHEHEH');

/*Table structure for table `elec_popedom` */

DROP TABLE IF EXISTS `elec_popedom`;

CREATE TABLE `elec_popedom` (
  `mid` varchar(255) NOT NULL,
  `pid` varchar(255) NOT NULL,
  `name` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `icon` varchar(255) default NULL,
  `target` varchar(255) default NULL,
  `isParent` bit(1) default NULL,
  `isMenu` bit(1) default NULL,
  PRIMARY KEY  (`mid`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_popedom` */

insert  into `elec_popedom`(`mid`,`pid`,`name`,`url`,`icon`,`target`,`isParent`,`isMenu`) values ('aa','0','技术设施维护管理','','../images/MenuIcon/jishusheshiweihuguanli.gif','','',''),('ab','aa','仪器设备管理','../equapment/elecEquapmentAction_home.do','../images/MenuIcon/yiqishebeiguanli.gif','mainFrame','\0',''),('ac','aa','设备校准检修','../equapment/elecAdjustAction_home.do','../images/MenuIcon/shebeijiaozhunjianxiu.gif','mainFrame','\0',''),('ad','aa','设备购置计划','../equapment/elecDevPlanAction_home.do','../images/MenuIcon/shebeigouzhijihua.gif','mainFrame','\0',''),('ae','0','技术资料图纸管理','','../images/MenuIcon/jishuziliaotuzhiguanli.gif','','',''),('af','ae','资料图纸管理','../dataChart/elecDataChartAction_home.do','../images/MenuIcon/ziliaotuzhiguanli.gif','mainFrame','\0',''),('ag','0','站点设备运行管理','','../images/MenuIcon/zhuandianshebeiyunxingguanli.gif','','',''),('ah','ag','站点基本信息','../station/elecStationAction_home.do','../images/MenuIcon/zhandianjibenxinxi.gif','mainFrame','\0',''),('ai','ag','运行情况','../station/elecBugAction_home.do','../images/MenuIcon/yunxingqingkuang.gif','mainFrame','\0',''),('aj','ag','维护情况','../station/elecPlanAction_home.do','../images/MenuIcon/weihuqingkuang.gif','mainFrame','\0',''),('ak','0','监测台建筑管理','','../images/MenuIcon/jiancetaijianzhuguanli.gif','','',''),('al','ak','监测台建筑管理','../building/elecBuildingAction_home.do','../images/MenuIcon/jiancetaijianzhu.gif','mainFrame','\0',''),('am','0','系统管理','','../images/MenuIcon/xitongguanli.gif','','',''),('an','am','用户管理','../system/elecUserAction_home.do','../images/MenuIcon/yonghuguanli.gif','mainFrame','\0',''),('ao','am','角色管理','../system/elecRoleAction_home.do','../images/MenuIcon/jueseguanli.gif','mainFrame','\0',''),('ap','am','运行监控','../system/elecCommonMsgAction_home.do','../images/MenuIcon/daibanshiyi.gif','mainFrame','\0',''),('aq','am','数据字典维护','../system/elecSystemDDLAction_home.do','../images/MenuIcon/shujuzidianguanli.gif','mainFrame','\0',''),('ar','0','审批流转','','../images/MenuIcon/shenpiliuzhuanguanli.gif','','',''),('as','ar','审批流程管理','../workflow/elecProcessDefinitionAction_home.do','../images/MenuIcon/shenpiliuchengguanli.gif','mainFrame','\0',''),('at','ar','申请模板管理','../workflow/elecApplicationTemplateAction_home.do','../images/MenuIcon/shenqingmobanguanli.gif','mainFrame','\0',''),('au','ar','起草申请','../workflow/elecApplicationFlowAction_home.do','../images/MenuIcon/qicaoshenqing.gif','mainFrame','\0',''),('av','ar','待我审批','../workflow/elecApplicationFlowAction_myTaskHome.do','../images/MenuIcon/daiwoshenpi.gif','mainFrame','\0',''),('aw','ar','我的申请查询','../workflow/elecApplicationFlowAction_myApplicationHome.do','../images/MenuIcon/wodeshenqingchaxun.gif','mainFrame','\0',''),('ba','0','系统登录','','','','','\0'),('bb','ba','首页显示','/system/elecMenuAction_menuHome.do','','','\0','\0'),('bc','ba','标题','/system/elecMenuAction_title.do','','','\0','\0'),('bd','ba','菜单','/system/elecMenuAction_left.do','','','\0','\0'),('be','ba','加载左侧树型结构','/system/elecMenuAction_showMenu.do','','','\0','\0'),('bf','ba','改变框架','../system/elecMenuAction_change.do','','','\0','\0'),('bg','ba','加载主显示页面','../system/elecMenuAction_loading.do','','','\0','\0'),('bh','ba','站点运行','../system/elecMenuAction_alermStation.do','','','\0','\0'),('bi','ba','设备运行','../system/elecMenuAction_alermDevice.do','','','\0','\0'),('bj','ba','重新登录','../system/elecMenuAction_logout.do','','','\0','\0'),('ca','0','运行监控','','','','','\0'),('cb','ca','保存','/system/elecCommonMsgAction_save.do','','','\0','\0'),('cc','ca','ajax进度条','/system/elecCommonMsgAction_progressBar.do','','','\0','\0'),('da','0','导出设置','','','','','\0'),('db','da','导出设置设置','/system/elecExportFieldsAction_setExportExcel.do','','','\0','\0'),('dc','da','导出设置保存','/system/elecExportFieldsAction_saveSetExportExcel.do','','','\0','\0'),('ea','0','数据字典','','','','','\0'),('eb','ea','编辑','/system/elecSystemDDLAction_edit.do','','','\0','\0'),('ec','ea','保存','/system/elecSystemDDLAction_save.do','','','\0','\0'),('fa','0','用户管理','','','','','\0'),('fb','fa','新增','/system/elecUserAction_add.do','','','\0','\0'),('fc','fa','保存','/system/elecUserAction_save.do','','','\0','\0'),('fd','fa','编辑','/system/elecUserAction_edit.do','','','\0','\0'),('fe','fa','删除','/system/elecUserAction_delete.do','','','\0','\0'),('ff','fa','验证登录名','/system/elecUserAction_checkUser.do','','','\0','\0'),('fg','fa','导出excel','/system/elecUserAction_exportExcel.do','','','\0','\0'),('fh','fa','excel导入页面','/system/elecUserAction_importPage.do','','','\0','\0'),('fi','fa','excel导入','/system/elecUserAction_importData.do','','','\0','\0'),('fj','fa','人员统计(单位)','/system/elecUserAction_chartUser.do','','','\0','\0'),('fk','fa','人员统计(性别)','/system/elecUserAction_chartUserFCF.do','','','\0','\0'),('fl','fa','联动查询单位名称','/system/elecUserAction_findJctUnit.do','','','\0','\0'),('ga','0','角色管理','','','','','\0'),('gb','ga','编辑','/system/elecRoleAction_edit.do','','','\0','\0'),('gc','ga','保存','/system/elecRoleAction_save.do','','','\0','\0'),('ha','0','申请流程管理','','','','','\0'),('hb','ha','部署流程定义','/workflow/elecProcessDefinitionAction_add.do','','','\0','\0'),('hc','ha','保存','/workflow/elecProcessDefinitionAction_save.do','','','\0','\0'),('hd','ha','查看流程图','/workflow/elecProcessDefinitionAction_downloadProcessImage.do','','','\0','\0'),('he','ha','删除流程定义','/workflow/elecProcessDefinitionAction_delete.do','','','\0','\0'),('ia','0','申请模板管理','','','','','\0'),('ib','ia','新增','/workflow/elecApplicationTemplateAction_add.do','','','\0','\0'),('ic','ia','新增保存','/workflow/elecApplicationTemplateAction_save.do','','','\0','\0'),('id','ia','编辑','/workflow/elecApplicationTemplateAction_edit.do','','','\0','\0'),('ie','ia','编辑保存','/workflow/elecApplicationTemplateAction_update.do','','','\0','\0'),('if','ia','删除','/workflow/elecApplicationTemplateAction_delete.do','','','\0','\0'),('ig','ia','下载','/workflow/elecApplicationTemplateAction_download.do','','','\0','\0'),('ja','0','申请流程管理','','','','','\0'),('jb','ja','提交申请页面','/workflow/elecApplicationFlowAction_submitApplication.do','','','\0','\0'),('jc','ja','提交申请','/workflow/elecApplicationFlowAction_saveApplication.do','','','\0','\0'),('jd','ja','我的申请查询首页','/workflow/elecApplicationFlowAction_myApplicationHome.do','','','\0','\0'),('je','ja','待我审批首页','/workflow/elecApplicationFlowAction_myTaskHome.do','','','\0','\0'),('jf','ja','跳转审批处理页面','/workflow/elecApplicationFlowAction_flowApprove.do','','','\0','\0'),('jg','ja','下载','/workflow/elecApplicationFlowAction_download.do','','','\0','\0'),('jh','ja','审核','/workflow/elecApplicationFlowAction_approve.do','','','\0','\0'),('ji','ja','审核历史','/workflow/elecApplicationFlowAction_approvedHistory.do','','','\0','\0'),('jj','ja','查看流程图','/workflow/elecApplicationFlowAction_approvedHistoryPic.do','','','\0','\0'),('jk','ja','查看流程执行位置图片','/workflow/elecApplicationFlowAction_processImage.do','','','\0','\0');

/*Table structure for table `elec_repair` */

DROP TABLE IF EXISTS `elec_repair`;

CREATE TABLE `elec_repair` (
  `repairID` int(11) NOT NULL,
  `equapmentID` int(11) default NULL,
  `jctID` varchar(255) default NULL,
  `devName` varchar(255) default NULL,
  `overhaulPeriod` varchar(255) default NULL,
  `opunit` varchar(255) default NULL,
  `useDate` date default NULL,
  `devType` varchar(255) default NULL,
  `startDate` date default NULL,
  `isHaving` varchar(255) default NULL,
  `comment` varchar(255) default NULL,
  `record` varchar(255) default NULL,
  PRIMARY KEY  (`repairID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_repair` */

insert  into `elec_repair`(`repairID`,`equapmentID`,`jctID`,`devName`,`overhaulPeriod`,`opunit`,`useDate`,`devType`,`startDate`,`isHaving`,`comment`,`record`) values (5,10,'3','西部数据','4','月','2014-05-04','3','2014-05-05','2','111','555'),(6,1,'4','usb电脑连接接口','5','日','2014-05-04','2','2014-05-05','2','好好地活下去吧','非常'),(7,2,'1','笔记本电脑','3','日','2014-05-04','2','2014-05-05','2','好好地活下去吧','非常'),(8,3,'4','Iphone4','5','日','2014-05-04','3','2014-05-05','2','好好地活下去吧','非常'),(9,4,'1','word2007','5','日','2014-05-04','5','2014-05-05','2','好好地活下去吧','非常'),(10,5,'1','电视机','5','日','2014-05-04','6','2014-05-05','2','好好地活下去吧','非常'),(11,6,'1','office','5','日','2014-05-04','5','2014-05-05','2','好好地活下去吧','非常'),(13,8,'3','戴尔','6','月','2014-05-04','3','2014-05-05','2','好好地活下去吧','非常'),(14,9,'4','东芝','5','月','2014-05-04','3','2014-05-05','2','好好地活下去吧','非常'),(15,10,'3','西部数据','4','月','2014-05-04','3','2014-05-05','2','好好地活下去吧','非常'),(16,11,'4','避雷针','5','月','2014-05-04','4','2014-05-05','2','好好地活下去吧','非常'),(17,12,'1','笔记本电脑','3','日','2014-05-04','2','2014-05-05','2','好好地活下去吧','非常'),(18,3,NULL,NULL,NULL,NULL,NULL,NULL,'2014-05-05','0','日子','我该怎么办');

/*Table structure for table `elec_role` */

DROP TABLE IF EXISTS `elec_role`;

CREATE TABLE `elec_role` (
  `roleID` varchar(255) NOT NULL,
  `roleName` varchar(255) default NULL,
  PRIMARY KEY  (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_role` */

insert  into `elec_role`(`roleID`,`roleName`) values ('1','系统管理员'),('2','高级管理员'),('3','中级管理员'),('4','业务用户'),('5','一般用户'),('6','普通用户');

/*Table structure for table `elec_role_popedom` */

DROP TABLE IF EXISTS `elec_role_popedom`;

CREATE TABLE `elec_role_popedom` (
  `roleID` varchar(255) NOT NULL,
  `mid` varchar(255) NOT NULL,
  `pid` varchar(255) NOT NULL,
  PRIMARY KEY  (`roleID`,`mid`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_role_popedom` */

insert  into `elec_role_popedom`(`roleID`,`mid`,`pid`) values ('1','aa','0'),('1','ab','aa'),('1','ac','aa'),('1','ad','aa'),('1','ae','0'),('1','af','ae'),('1','ag','0'),('1','ah','ag'),('1','ai','ag'),('1','aj','ag'),('1','ak','0'),('1','al','ak'),('1','am','0'),('1','an','am'),('1','ao','am'),('1','ap','am'),('1','aq','am'),('1','ar','0'),('1','as','ar'),('1','at','ar'),('1','au','ar'),('1','av','ar'),('1','aw','ar'),('1','ba','0'),('1','bb','ba'),('1','bc','ba'),('1','bd','ba'),('1','be','ba'),('1','bf','ba'),('1','bg','ba'),('1','bh','ba'),('1','bi','ba'),('1','bj','ba'),('1','ca','0'),('1','cb','ca'),('1','cc','ca'),('1','da','0'),('1','db','da'),('1','dc','da'),('1','ea','0'),('1','eb','ea'),('1','ec','ea'),('1','fa','0'),('1','fb','fa'),('1','fc','fa'),('1','fd','fa'),('1','fe','fa'),('1','ff','fa'),('1','fg','fa'),('1','fh','fa'),('1','fi','fa'),('1','fj','fa'),('1','fk','fa'),('1','fl','fa'),('1','ga','0'),('1','gb','ga'),('1','gc','ga'),('1','ha','0'),('1','hb','ha'),('1','hc','ha'),('1','hd','ha'),('1','he','ha'),('1','ia','0'),('1','ib','ia'),('1','ic','ia'),('1','id','ia'),('1','ie','ia'),('1','if','ia'),('1','ig','ia'),('1','ja','0'),('1','jb','ja'),('1','jc','ja'),('1','jd','ja'),('1','je','ja'),('1','jf','ja'),('1','jg','ja'),('1','jh','ja'),('1','ji','ja'),('1','jj','ja'),('1','jk','ja'),('6','am','0'),('6','an','am'),('6','ao','am'),('6','ap','am'),('6','ar','0'),('6','at','ar'),('6','au','ar'),('6','av','ar'),('6','aw','ar'),('6','ba','0'),('6','bb','ba'),('6','bc','ba'),('6','bd','ba'),('6','be','ba'),('6','bf','ba'),('6','bg','ba'),('6','bh','ba'),('6','bi','ba'),('6','bj','ba'),('6','ca','0'),('6','cb','ca'),('6','cc','ca'),('6','da','0'),('6','db','da'),('6','dc','da'),('6','ia','0'),('6','ib','ia'),('6','ic','ia'),('6','id','ia'),('6','ie','ia'),('6','if','ia'),('6','ig','ia'),('6','ja','0'),('6','jb','ja'),('6','jc','ja'),('6','jd','ja'),('6','je','ja'),('6','jf','ja'),('6','jg','ja'),('6','jh','ja'),('6','ji','ja'),('6','jj','ja'),('6','jk','ja');

/*Table structure for table `elec_station` */

DROP TABLE IF EXISTS `elec_station`;

CREATE TABLE `elec_station` (
  `stationID` int(11) NOT NULL,
  `jctID` varchar(255) default NULL,
  `stationName` varchar(255) default NULL,
  `stationCode` varchar(255) default NULL,
  `useStartDate` date default NULL,
  `jcfrequency` varchar(255) default NULL,
  `produceHome` varchar(255) default NULL,
  `contactType` varchar(255) default NULL,
  `stationType` varchar(255) default NULL,
  `attributionGround` varchar(255) default NULL,
  `comment` varchar(255) default NULL,
  PRIMARY KEY  (`stationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_station` */

insert  into `elec_station`(`stationID`,`jctID`,`stationName`,`stationCode`,`useStartDate`,`jcfrequency`,`produceHome`,`contactType`,`stationType`,`attributionGround`,`comment`) values (1,'1','电机','1001','2014-05-30','河南工业大学','河南省郑州市','18639012025','1','河南省','站点信息添加数据'),(2,'4','电机','1002','2014-05-30','河南农业大学','河南省郑州市','18639012025','2','河南省','测试数据农业大学'),(3,'2','电机','1003','2014-05-30','上海浦东','上海市','18639012025','3','上海市','上海电站测试点'),(4,'3','电机','1004','2014-05-30','广东','广东深圳','13939735338','1','广东省','广东省测试数据'),(5,'1','电机','1005','2014-05-30','北京传智播客','itcast','13938481120','1','北京市','北京市培训机构'),(6,'1','电机','1006','2014-05-30','北京回龙观','北京豫西','18639012025','1','北京市','北京市测试点'),(7,'4','电机','1007','2014-05-30','信阳博爱医院','信阳博爱医院','13938481120','2','河南省信阳市','河南省信阳市测试点'),(8,'4','电机','1008','2014-05-30','河南省','信阳协和医院','18639012025','2','河南省信阳市','河南省信阳市颐和医院'),(10,'2','电机','1010','2014-05-30','上海市','上海市','13939735338','2','上海市','上海市第一呃呃呃');

/*Table structure for table `elec_systemddl` */

DROP TABLE IF EXISTS `elec_systemddl`;

CREATE TABLE `elec_systemddl` (
  `seqID` int(11) NOT NULL,
  `keyword` varchar(255) default NULL,
  `ddlCode` int(11) default NULL,
  `ddlName` varchar(255) default NULL,
  PRIMARY KEY  (`seqID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_systemddl` */

insert  into `elec_systemddl`(`seqID`,`keyword`,`ddlCode`,`ddlName`) values (1,'性别',1,'男'),(2,'性别',2,'女'),(3,'是否在职',1,'是'),(4,'是否在职',2,'否'),(14,'审核状态',1,'审核中'),(15,'审核状态',2,'审核不通过'),(16,'审核状态',3,'审核通过'),(17,'图纸类别',1,'国内图书'),(18,'图纸类别',2,'国外图书'),(54,'上海',1,'上海浦东电力公司'),(55,'上海',2,'上海闸北电力公司'),(56,'上海',3,'上海徐汇电力公司'),(57,'深圳',1,'深圳福田电力公司'),(58,'深圳',2,'深圳龙岗电力公司'),(59,'深圳',3,'深圳南山电力公司'),(60,'职位',1,'总经理'),(61,'职位',2,'部门经理'),(62,'职位',3,'员工'),(63,'职位',4,'系统管理员'),(68,'所属单位',1,'北京'),(69,'所属单位',2,'上海'),(70,'所属单位',3,'深圳'),(71,'所属单位',4,'信阳'),(72,'北京',1,'北京昌平电力公司'),(73,'北京',2,'北京海淀电力公司'),(74,'北京',3,'北京西城电力公司'),(75,'北京',4,'北京传智播客培训机构'),(76,'建筑类型',1,'基建'),(77,'建筑类型',2,'基改'),(78,'建筑类型',3,'生活用房'),(79,'建筑类型',4,'道路'),(84,'站点类别',1,'国内'),(85,'站点类别',2,'国内遥控站'),(86,'站点类别',3,'国内采集点'),(87,'站点类别',4,'国外'),(88,'站点类别',5,'海外遥控站'),(89,'故障类型',1,'工控机'),(90,'故障类型',2,'接收机'),(91,'故障类型',3,'通讯'),(92,'故障类型',4,'供电'),(93,'故障类型',5,'电机'),(94,'故障类型',6,'测量板卡'),(95,'故障类型',7,'设备'),(96,'故障类型',8,'网络'),(97,'设备类型',1,'电力设备'),(98,'设备类型',2,'电机设备'),(99,'设备类型',3,'通讯设备'),(100,'设备类型',4,'防雷设备'),(101,'设备类型',5,'办公设备'),(102,'设备类型',6,'电视机房设备'),(103,'设备类型',7,'发电机房设备'),(104,'设备状态',1,'正常'),(105,'设备状态',2,'检修'),(106,'设备状态',3,'维修'),(108,'校准状态',1,'未校准'),(109,'校准状态',2,'已校准'),(110,'检修状态',1,'未检修'),(111,'检修状态',2,'已检修');

/*Table structure for table `elec_text` */

DROP TABLE IF EXISTS `elec_text`;

CREATE TABLE `elec_text` (
  `textID` varchar(255) NOT NULL,
  `textName` varchar(255) default NULL,
  `textDate` date default NULL,
  `textRemark` varchar(255) default NULL,
  PRIMARY KEY  (`textID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_text` */

insert  into `elec_text`(`textID`,`textName`,`textDate`,`textRemark`) values ('297ed2a2457eef2a01457ef0fb2a0002','111','2014-04-20','222'),('297ed2a2457f0a1501457f1d38060001','','2014-04-20',''),('297ed2a2457f0a1501457f242f6d0002','','2014-04-20','');

/*Table structure for table `elec_user` */

DROP TABLE IF EXISTS `elec_user`;

CREATE TABLE `elec_user` (
  `userID` varchar(255) NOT NULL,
  `jctID` varchar(255) default NULL,
  `jctUnitID` varchar(255) default NULL,
  `userName` varchar(255) default NULL,
  `logonName` varchar(255) default NULL,
  `logonPwd` varchar(255) default NULL,
  `sexID` varchar(255) default NULL,
  `birthday` date default NULL,
  `address` varchar(255) default NULL,
  `contactTel` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `mobile` varchar(255) default NULL,
  `isDuty` varchar(255) default NULL,
  `postID` varchar(255) default NULL,
  `onDutyDate` date default NULL,
  `offDutyDate` date default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_user` */

insert  into `elec_user`(`userID`,`jctID`,`jctUnitID`,`userName`,`logonName`,`logonPwd`,`sexID`,`birthday`,`address`,`contactTel`,`email`,`mobile`,`isDuty`,`postID`,`onDutyDate`,`offDutyDate`,`remark`) values ('40283f81458757b7014587588fa20001','3','1','010','010','202CB962AC59075B964B07152D234B70','2',NULL,'','','','','1','3','2014-04-22',NULL,''),('402881e43d8b1e28013d8b8ae5a10001','1','jctUnitID','超级管理员','admin','202CB962AC59075B964B07152D234B70','1',NULL,'','','','','1','4','2014-04-21','2014-04-21',''),('8aa50bc745837e920145838045430001','1','1','甘亮','gl','202CB962AC59075B964B07152D234B70','1',NULL,'','','','','1','1','2014-04-21',NULL,''),('8aa50bc745837e9201458384d22f0002','1','1','001','001','202CB962AC59075B964B07152D234B70','1','2014-04-21','','','','','1','3','2014-04-21',NULL,''),('8aa50bc7458399880145839fe3420001','1','1','003','003','202CB962AC59075B964B07152D234B70','1',NULL,'','','','13939735338','1','3','2014-04-21','2014-04-21',''),('8aa50bc74583a0b1014583a1cbae0001','3','1','004','004','202CB962AC59075B964B07152D234B70','1',NULL,'','','','18639012025','1','3','2014-04-21',NULL,''),('8aa50bc74583a0b1014583a64b450002','2','1','002','002','202CB962AC59075B964B07152D234B70','2',NULL,'','','','15652353061','1','3','2014-04-21',NULL,''),('8aa50bc74583a0b1014583c7583d0003','2','1','005','005','202CB962AC59075B964B07152D234B70','2',NULL,'','','','18639012025','1','3','2014-04-21',NULL,''),('8aa50bc74583a0b1014583c7bc0f0004','2','1','006','006','202CB962AC59075B964B07152D234B70','2',NULL,'','','','18639012025','1','3','2014-04-21',NULL,''),('8aa50bc74583a0b1014583c8db6a0007','3','1','009','009','202CB962AC59075B964B07152D234B70','2',NULL,'','','','18639012025','1','3','2014-04-21',NULL,''),('8aa50bc74584be1a014584d8c7870001','1','1','007','007','202CB962AC59075B964B07152D234B70','2',NULL,'','','','','1','3','2014-04-21',NULL,''),('8aa50bc74584be1a014584d915aa0002','1','1','008','008','202CB962AC59075B964B07152D234B70','2',NULL,'','','','','1','3','2014-04-21',NULL,'');

/*Table structure for table `elec_user_role` */

DROP TABLE IF EXISTS `elec_user_role`;

CREATE TABLE `elec_user_role` (
  `userID` varchar(255) NOT NULL,
  `roleID` varchar(255) NOT NULL,
  PRIMARY KEY  (`roleID`,`userID`),
  KEY `FK14CB98303172B4CE` (`roleID`),
  KEY `FK14CB983036C80A38` (`userID`),
  CONSTRAINT `FK14CB98303172B4CE` FOREIGN KEY (`roleID`) REFERENCES `elec_role` (`roleID`),
  CONSTRAINT `FK14CB983036C80A38` FOREIGN KEY (`userID`) REFERENCES `elec_user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `elec_user_role` */

insert  into `elec_user_role`(`userID`,`roleID`) values ('402881e43d8b1e28013d8b8ae5a10001','1'),('8aa50bc745837e920145838045430001','6');

/*Table structure for table `jbpm4_deployment` */

DROP TABLE IF EXISTS `jbpm4_deployment`;

CREATE TABLE `jbpm4_deployment` (
  `DBID_` bigint(20) NOT NULL,
  `NAME_` longtext,
  `TIMESTAMP_` bigint(20) default NULL,
  `STATE_` varchar(255) default NULL,
  PRIMARY KEY  (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_deployment` */

insert  into `jbpm4_deployment`(`DBID_`,`NAME_`,`TIMESTAMP_`,`STATE_`) values (1,NULL,0,'active'),(8,NULL,0,'active');

/*Table structure for table `jbpm4_deployprop` */

DROP TABLE IF EXISTS `jbpm4_deployprop`;

CREATE TABLE `jbpm4_deployprop` (
  `DBID_` bigint(20) NOT NULL,
  `DEPLOYMENT_` bigint(20) default NULL,
  `OBJNAME_` varchar(255) default NULL,
  `KEY_` varchar(255) default NULL,
  `STRINGVAL_` varchar(255) default NULL,
  `LONGVAL_` bigint(20) default NULL,
  PRIMARY KEY  (`DBID_`),
  KEY `FK_DEPLPROP_DEPL` (`DEPLOYMENT_`),
  KEY `IDX_DEPLPROP_DEPL` (`DEPLOYMENT_`),
  CONSTRAINT `FK_DEPLPROP_DEPL` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_deployprop` */

insert  into `jbpm4_deployprop`(`DBID_`,`DEPLOYMENT_`,`OBJNAME_`,`KEY_`,`STRINGVAL_`,`LONGVAL_`) values (4,1,'设备费用报销','langid','jpdl-4.4',NULL),(5,1,'设备费用报销','pdid','设备费用报销-1',NULL),(6,1,'设备费用报销','pdkey','设备费用报销',NULL),(7,1,'设备费用报销','pdversion',NULL,1),(11,8,'设备购置计划','langid','jpdl-4.4',NULL),(12,8,'设备购置计划','pdid','设备购置计划-1',NULL),(13,8,'设备购置计划','pdkey','设备购置计划',NULL),(14,8,'设备购置计划','pdversion',NULL,1);

/*Table structure for table `jbpm4_execution` */

DROP TABLE IF EXISTS `jbpm4_execution`;

CREATE TABLE `jbpm4_execution` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ACTIVITYNAME_` varchar(255) default NULL,
  `PROCDEFID_` varchar(255) default NULL,
  `HASVARS_` bit(1) default NULL,
  `NAME_` varchar(255) default NULL,
  `KEY_` varchar(255) default NULL,
  `ID_` varchar(255) default NULL,
  `STATE_` varchar(255) default NULL,
  `SUSPHISTSTATE_` varchar(255) default NULL,
  `PRIORITY_` int(11) default NULL,
  `HISACTINST_` bigint(20) default NULL,
  `PARENT_` bigint(20) default NULL,
  `INSTANCE_` bigint(20) default NULL,
  `SUPEREXEC_` bigint(20) default NULL,
  `SUBPROCINST_` bigint(20) default NULL,
  `PARENT_IDX_` int(11) default NULL,
  PRIMARY KEY  (`DBID_`),
  UNIQUE KEY `ID_` (`ID_`),
  KEY `FK_EXEC_SUBPI` (`SUBPROCINST_`),
  KEY `FK_EXEC_INSTANCE` (`INSTANCE_`),
  KEY `FK_EXEC_SUPEREXEC` (`SUPEREXEC_`),
  KEY `FK_EXEC_PARENT` (`PARENT_`),
  KEY `IDX_EXEC_SUBPI` (`SUBPROCINST_`),
  KEY `IDX_EXEC_PARENT` (`PARENT_`),
  KEY `IDX_EXEC_SUPEREXEC` (`SUPEREXEC_`),
  KEY `IDX_EXEC_INSTANCE` (`INSTANCE_`),
  CONSTRAINT `FK_EXEC_INSTANCE` FOREIGN KEY (`INSTANCE_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_SUBPI` FOREIGN KEY (`SUBPROCINST_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_SUPEREXEC` FOREIGN KEY (`SUPEREXEC_`) REFERENCES `jbpm4_execution` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_execution` */

/*Table structure for table `jbpm4_hist_actinst` */

DROP TABLE IF EXISTS `jbpm4_hist_actinst`;

CREATE TABLE `jbpm4_hist_actinst` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `HPROCI_` bigint(20) default NULL,
  `TYPE_` varchar(255) default NULL,
  `EXECUTION_` varchar(255) default NULL,
  `ACTIVITY_NAME_` varchar(255) default NULL,
  `START_` datetime default NULL,
  `END_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `TRANSITION_` varchar(255) default NULL,
  `NEXTIDX_` int(11) default NULL,
  `HTASK_` bigint(20) default NULL,
  PRIMARY KEY  (`DBID_`),
  KEY `FK_HACTI_HPROCI` (`HPROCI_`),
  KEY `FK_HTI_HTASK` (`HTASK_`),
  KEY `IDX_HTI_HTASK` (`HTASK_`),
  KEY `IDX_HACTI_HPROCI` (`HPROCI_`),
  CONSTRAINT `FK_HACTI_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HTI_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_hist_actinst` */

/*Table structure for table `jbpm4_hist_detail` */

DROP TABLE IF EXISTS `jbpm4_hist_detail`;

CREATE TABLE `jbpm4_hist_detail` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `USERID_` varchar(255) default NULL,
  `TIME_` datetime default NULL,
  `HPROCI_` bigint(20) default NULL,
  `HPROCIIDX_` int(11) default NULL,
  `HACTI_` bigint(20) default NULL,
  `HACTIIDX_` int(11) default NULL,
  `HTASK_` bigint(20) default NULL,
  `HTASKIDX_` int(11) default NULL,
  `HVAR_` bigint(20) default NULL,
  `HVARIDX_` int(11) default NULL,
  `MESSAGE_` longtext,
  `OLD_STR_` varchar(255) default NULL,
  `NEW_STR_` varchar(255) default NULL,
  `OLD_INT_` int(11) default NULL,
  `NEW_INT_` int(11) default NULL,
  `OLD_TIME_` datetime default NULL,
  `NEW_TIME_` datetime default NULL,
  `PARENT_` bigint(20) default NULL,
  `PARENT_IDX_` int(11) default NULL,
  PRIMARY KEY  (`DBID_`),
  KEY `FK_HDETAIL_HVAR` (`HVAR_`),
  KEY `FK_HDETAIL_HPROCI` (`HPROCI_`),
  KEY `FK_HDETAIL_HTASK` (`HTASK_`),
  KEY `FK_HDETAIL_HACTI` (`HACTI_`),
  KEY `IDX_HDET_HVAR` (`HVAR_`),
  KEY `IDX_HDET_HACTI` (`HACTI_`),
  KEY `IDX_HDET_HTASK` (`HTASK_`),
  KEY `IDX_HDET_HPROCI` (`HPROCI_`),
  CONSTRAINT `FK_HDETAIL_HACTI` FOREIGN KEY (`HACTI_`) REFERENCES `jbpm4_hist_actinst` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HVAR` FOREIGN KEY (`HVAR_`) REFERENCES `jbpm4_hist_var` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_hist_detail` */

/*Table structure for table `jbpm4_hist_procinst` */

DROP TABLE IF EXISTS `jbpm4_hist_procinst`;

CREATE TABLE `jbpm4_hist_procinst` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) default NULL,
  `PROCDEFID_` varchar(255) default NULL,
  `KEY_` varchar(255) default NULL,
  `START_` datetime default NULL,
  `END_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `STATE_` varchar(255) default NULL,
  `ENDACTIVITY_` varchar(255) default NULL,
  `NEXTIDX_` int(11) default NULL,
  PRIMARY KEY  (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_hist_procinst` */

/*Table structure for table `jbpm4_hist_task` */

DROP TABLE IF EXISTS `jbpm4_hist_task`;

CREATE TABLE `jbpm4_hist_task` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `EXECUTION_` varchar(255) default NULL,
  `OUTCOME_` varchar(255) default NULL,
  `ASSIGNEE_` varchar(255) default NULL,
  `PRIORITY_` int(11) default NULL,
  `STATE_` varchar(255) default NULL,
  `CREATE_` datetime default NULL,
  `END_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `NEXTIDX_` int(11) default NULL,
  `SUPERTASK_` bigint(20) default NULL,
  PRIMARY KEY  (`DBID_`),
  KEY `FK_HSUPERT_SUB` (`SUPERTASK_`),
  KEY `IDX_HSUPERT_SUB` (`SUPERTASK_`),
  CONSTRAINT `FK_HSUPERT_SUB` FOREIGN KEY (`SUPERTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_hist_task` */

/*Table structure for table `jbpm4_hist_var` */

DROP TABLE IF EXISTS `jbpm4_hist_var`;

CREATE TABLE `jbpm4_hist_var` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `PROCINSTID_` varchar(255) default NULL,
  `EXECUTIONID_` varchar(255) default NULL,
  `VARNAME_` varchar(255) default NULL,
  `VALUE_` varchar(255) default NULL,
  `HPROCI_` bigint(20) default NULL,
  `HTASK_` bigint(20) default NULL,
  PRIMARY KEY  (`DBID_`),
  KEY `FK_HVAR_HPROCI` (`HPROCI_`),
  KEY `FK_HVAR_HTASK` (`HTASK_`),
  KEY `IDX_HVAR_HTASK` (`HTASK_`),
  KEY `IDX_HVAR_HPROCI` (`HPROCI_`),
  CONSTRAINT `FK_HVAR_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HVAR_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_hist_var` */

/*Table structure for table `jbpm4_id_group` */

DROP TABLE IF EXISTS `jbpm4_id_group`;

CREATE TABLE `jbpm4_id_group` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) default NULL,
  `NAME_` varchar(255) default NULL,
  `TYPE_` varchar(255) default NULL,
  `PARENT_` bigint(20) default NULL,
  PRIMARY KEY  (`DBID_`),
  KEY `FK_GROUP_PARENT` (`PARENT_`),
  KEY `IDX_GROUP_PARENT` (`PARENT_`),
  CONSTRAINT `FK_GROUP_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm4_id_group` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_id_group` */

/*Table structure for table `jbpm4_id_membership` */

DROP TABLE IF EXISTS `jbpm4_id_membership`;

CREATE TABLE `jbpm4_id_membership` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `USER_` bigint(20) default NULL,
  `GROUP_` bigint(20) default NULL,
  `NAME_` varchar(255) default NULL,
  PRIMARY KEY  (`DBID_`),
  KEY `FK_MEM_GROUP` (`GROUP_`),
  KEY `FK_MEM_USER` (`USER_`),
  KEY `IDX_MEM_GROUP` (`GROUP_`),
  KEY `IDX_MEM_USER` (`USER_`),
  CONSTRAINT `FK_MEM_GROUP` FOREIGN KEY (`GROUP_`) REFERENCES `jbpm4_id_group` (`DBID_`),
  CONSTRAINT `FK_MEM_USER` FOREIGN KEY (`USER_`) REFERENCES `jbpm4_id_user` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_id_membership` */

/*Table structure for table `jbpm4_id_user` */

DROP TABLE IF EXISTS `jbpm4_id_user`;

CREATE TABLE `jbpm4_id_user` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) default NULL,
  `PASSWORD_` varchar(255) default NULL,
  `GIVENNAME_` varchar(255) default NULL,
  `FAMILYNAME_` varchar(255) default NULL,
  `BUSINESSEMAIL_` varchar(255) default NULL,
  PRIMARY KEY  (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_id_user` */

/*Table structure for table `jbpm4_job` */

DROP TABLE IF EXISTS `jbpm4_job`;

CREATE TABLE `jbpm4_job` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `DUEDATE_` datetime default NULL,
  `STATE_` varchar(255) default NULL,
  `ISEXCLUSIVE_` bit(1) default NULL,
  `LOCKOWNER_` varchar(255) default NULL,
  `LOCKEXPTIME_` datetime default NULL,
  `EXCEPTION_` longtext,
  `RETRIES_` int(11) default NULL,
  `PROCESSINSTANCE_` bigint(20) default NULL,
  `EXECUTION_` bigint(20) default NULL,
  `CFG_` bigint(20) default NULL,
  `SIGNAL_` varchar(255) default NULL,
  `EVENT_` varchar(255) default NULL,
  `REPEAT_` varchar(255) default NULL,
  PRIMARY KEY  (`DBID_`),
  KEY `FK_JOB_CFG` (`CFG_`),
  KEY `IDX_JOBRETRIES` (`RETRIES_`),
  KEY `IDX_JOBDUEDATE` (`DUEDATE_`),
  KEY `IDX_JOBLOCKEXP` (`LOCKEXPTIME_`),
  KEY `IDX_JOB_CFG` (`CFG_`),
  KEY `IDX_JOB_EXE` (`EXECUTION_`),
  KEY `IDX_JOB_PRINST` (`PROCESSINSTANCE_`),
  CONSTRAINT `FK_JOB_CFG` FOREIGN KEY (`CFG_`) REFERENCES `jbpm4_lob` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_job` */

/*Table structure for table `jbpm4_lob` */

DROP TABLE IF EXISTS `jbpm4_lob`;

CREATE TABLE `jbpm4_lob` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `BLOB_VALUE_` longblob,
  `DEPLOYMENT_` bigint(20) default NULL,
  `NAME_` longtext,
  PRIMARY KEY  (`DBID_`),
  KEY `FK_LOB_DEPLOYMENT` (`DEPLOYMENT_`),
  KEY `IDX_LOB_DEPLOYMENT` (`DEPLOYMENT_`),
  CONSTRAINT `FK_LOB_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_lob` */

insert  into `jbpm4_lob`(`DBID_`,`DBVERSION_`,`BLOB_VALUE_`,`DEPLOYMENT_`,`NAME_`) values (2,0,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0g]po\0\01jIDATx���}pS����?�_���l�ۤ۝[��ewvK��w���&ݹwӤMӦw۴i�n҄4�[��!N\ZH�b\Z���Lx��1*��6�@��5~��\rc[��Oz����H������g��HG�K���ћ�d\n\0\0Xҟ�>\0\0\0��\0���4\0\0E�\0�(\"\r\0�Ei\0\0,�H\0`QD\Z\0\0�\"�\0\0X�\0���4\0\0E�\0�(\"\r\0�Ei\0\0,�H\0`QD\Z\0\0�\"�\0\0X�\0���4\0\0E�\0�(\"\r\0�Ei\0\0,�H\0`QD\Z\0\0�\"�\0\0X�\0���4\0\0E�\0�(\"\r\0�Ei\0\0,�H\0`QD\Z\0\0�\"�\0\0X������I�EjYY���D\ZsJ�Y\Z<666:::222<<<G�E���&+�j\0�D�1G\"y�r�4xGM��\r����������O\\���?.CN�YY(�s����o``@V�MH5\0\"�Ⱥ�<\rn}��ܛ��d޿���/��AفU����0�,CN�YY(�\n�Z��G.uuR\r���4�Kz||���˞=9����e�_y��3]��6�!+�j��l�ƞ���n�U�NdWt\Z�Kid�*������Ȋ��{߳�-(}ȸ��C6�\rW��;���eW�C:\r�\r�4�%R��^�S���G^\\�=��L��l(�?��<�?���;44D���FVD\n-A�B?�����3�Z��ѳϬ�C:}�BkOO��D\ZY�^��[��ϲБN?��my��N�|Zv�^����@�i�Of��/_~}�/�{���S��/t�y�����d�/�������*䊘Lp*\"\r����ʕ+���{(�t�)61���=�w��Ǝ�����\"&�\0��H�dj\Z=<<\\�eя�}�g��;v�g���^�9v>tv,t\"tz\\\r��|xɹ��\n����q�Bh�������x���-�|���n�\"&�\0��H�d���@���_Z�������\Zr�s$�S�	/WKFNw^>�yu�׿<�N���\'˿��x���]���4\0�\"�0Sd\Z����,�W׺�u�!<>������	u��`��\n��uZCK>�\Z�Y�Bx�:��{����}�---L�8����Ǯr~{��+o=�{�L_�Y5z�q�WN�%5gB#��/|:�f������ȥ�\\�w����w555^�xQ�N}K�o\0&#�0��rtt��/�������x���������#�p�,<����\n��5���Dgx��\n�M��h�p������\\__������J�4\0�!�0S0������^�㉺�w��w��F�:�Y(?wև���i��M���꒨�����ާ�;r��瓫�+������Ɉ4̤^����{�\'�>���o�o;t~[���Z�����:qhz�۲rxu�:���j�5e������<��3g��թ��u��\0`2\"\r3I)���:;;�z���J�ޒ�\r��>Ѣ�n	���m���Keyh�Z�m�l�e�lh��\n�N����?��hnn���+%�\0��H�Lё~�i������}������-���g߬nyS����f�Z8���K[ތޏ���i�D���j\"\r���4���݋?������l�.n�J�tW�z��<oV���Ӆ�Z����^gz�7���w-�V\"}��)\"\r���4���w���5��]=S��E�Ğ~�Z=�}���sݑ|��Z!2ފ:���ާ�#�\0��H�L�H?�{������մ~��c��/�\Z���~���8���\"�^Z�/������ȧ�\"�/~��>v�]���n�o�`��K�����%�\0�H�L��`��7�\'?]}���KUW��dz4E��ziUSd�Ϊ7��E(W��J-9м��\'��z����|��i�)�e&>���9_|��;�\r���:=>��о�^\Zwv��B�.�%���ܸk׻G���L\08���\"_���W���������Nc0�6>���g×N/T�`#4BK�7��\ruih\'��/��+++����ZP\0F�a��?ظx�bc����$5����Ώ����W������/9}����rza�?Z�����8����?�\0�`D\Zf���������Xr߳��n��3v�w�|���^��B?�������B?��M_:v�\'�fh�rh��s�Mo������Y�gϞ�G��*8���dF{�ʕ@ �����ظ��ۏ���k�L �6��5z��o[^��;v�4Zv.W!W$W�4\Z�#i�,z2�����ꖼ��g�ܞ��fT�g�ܱ�ضm۾}�d��s��\0��H�|j2=00�������=Z)q�����[�̡\'�dC�\\v�}�[{��=|���Vv.W�4\Z��i�OM�/_�������v���C���g?[P��L#-�Ȇ���o��g�ٕ�Pv+;��`\Z\r���4�Bf����###���.\\hjj����x�����l�+o=|��q�eYMV�M�w<�m�6�C�NdW�C٭�\\��i4\0#��\n�ݪ�c\r\r\r���HVe�{���}�W���Or���%��-�o����:�����frB��B�HV��d岷��رc߾}���Dv%;�ݪ�]1��`D\Z��i�����577���8p`Ϟ=�+��[��E+��{�|��\'�����!\'�,��d���2ɳ�,�Ȇ���DvE���FE:=22���������\Z�=*ݭ��ܵkWEE����w��&\'�,��dYMV�MdC�\\v\"���\0\\�H#�T����/_�<00������������T__�ȑ�z��Q�,��dYMV�MdC�\\v�^���\0܀H#�T�\'&&�\\�2<<��/^���2?>s�Lsة0uZ�E���&+�&��l.;��\0܃Hc�ĤZ��}}}===]]]�qd�\\$+�j��ki̩H����FGGGFF��Cqd�\\$+�j��kiw��ɉ��f�r:;L�<z�J��I�Ej������DG:�Bc;LvQ������0��W\0�!�n�H�j&Lx�]�3#O��h�@`f�\08���t��6�� ���6�6�T;��i\0�G��*�HϤ#�\Z/1�I����#�\0�H�R�)i:O8���tʧ��?��L���������\0����]%{\n:Y��\'�)�ib�S�M)))���	/\0�\"�v5�H\'\\�`e�R>�=f�i���D��]�i�p\Z��x���{���4\0�#�6?yM���\'����r�)�0��L��񴴴<\0�\r�v�dOJG/L�Q���3Og&]^^��А�o\0�@�a	D\Z\0�iX��xD\Z�PQQQ[[��(\0�Z�4,�*L�Q\0��iX��xD\Z�@� ��%x����J�G\0�B�a	\r\r\r��序\0��H��4\0�#Ұ\"\r\0�4,���q�֭��\0��H��~II��\0\0k!Ұ\"\r\0�4,�H@<\"\rKhoo/..�}\0`-D\Z��\\�2磊��t\0X��f�6m�.����KKKu\0X��f�.]���U�^�b�����~��\0K �Я��PEz˖-<�\r\0D\Z�544,_�\\E���V��\0�UiXB~~�D���`bbB��\0�UiX�޽{%һw��} \0`!D\Z� ���ܡ�!�\0B�\0�(\"\r\0�Ei\0\0,�H\0`QD\Z\0\0�\"�\0\0X�v��ɩ��۞+�[��BƟ.Zǘ�X�_.7�c�5��FƂ��d\0G��ox��G�Y\\�=i�?ܰ��5���XD�i<�}�xTBn�+[��nO�d�/�N1f9ԍ�Ҟ�\'\'>������&\'u��\0��H;�t��\ZU��_���\ZО4g���{_ۧn�;��oxL�C\0��i�P���ݚ�S��!k�ʂ̭�O0�v�a�*�4C{��6\ZZ�%�����@\0�(D�	.���H��>��X�է��/$��[{u?\08�v�D��k�jo����mu�Io�\0�A�mod,��p�SL����3�]`2\r�D�����j��R�����}�l{��\0� Ҷ��\nC^E��D1�9�&�ŭ+�t?(\08��=��\Z���\n�30&�ż%�\n\0A�mo�04wjOC�z��\0� Ҷ���o��� �\0LD�mOEZ{�j��C���Ci�#Җ\ZD\Z�����iK\r\"\r�DD������`\"\"m{D�R�H0��=�Dz��ьWNg�)���7\"\r�����Y0�)�oF!W��\"\r�����i�tL#���0�	w�~}��f\"\r ���i�tL)\r2���d�&�j3��lD���i�t�R�%�3锳s�H0��=+D:�g�S>ݝ�if�\0�H۞�HGO�S���H���`wD���G:���ObD=�\"㧻��l�i4�`.\"m{���A8�	���\'�\0��H۞�\"]�d��\\\'e���,��F �\0�E�mO{��=)�0YG\r���,��4\0g#Ҷ�=Ҍ�A���H���� �\0LD�m�H[ji\0&\"ҶG�-5�4\0i�#Җ\ZD\Z�����iK\r\"\r�DD������`\"\"m{D�R�H0���yK<R��A�}b�Pw��\0� Ҷ� �\\�P}�K{���3�k��~P\0p\"m{�]�O°����>1����b��-�\0�H��ڪS�{_ۧ=Q�����X���~P\0p\"m{�%{t��{D{�\\>n�+��b�6�\n\0A������6�ts��J�yl<�{a��屠�G\0� �NP�ګ&�G��jo�;Gg`L��{m�)�\0�A�⇿�/����y�{�G�`p�\n���ON�~(\0p\"�#cA�Y��˶4��w�=C�Ъ�2�>�=���\0�Q��s��oYQ�>�����z�al���g��6��Ы�!\0�i����\\	��ش�R/�Vǫ����/�9���-C�6b\r ���LNNUo�B�~��f{�ُ�v�{\'x\Z@�ig�l��/�x�s6�5�K�߰�a���UD\Z\0\0�\"�\0\0X�\0���4\0\0E��NNNNʋ�O$\\9Z�ג�\n�ur�<���Rn\00F��(a�v+�Hgp]Si48��\r���ȉ4\0���\"�2ŗrj��6��d{�Y�p�4�bHV��?Ҍtyyy�u\0�U���r:h�݄\'��1Y���x�l��������&�!\0 �H�@I8�L8݌^?�D�}�yES3�t��n��Ii��%�\0\0\0D:]��j��d�L��ԥ�1�2�H\'��`�?�?`\"\r\01��L\r61��N%��f����t��\'68��p�\0\0(Dz2�t��	w�N�S^W�N����Lr��5�!\0@!�3�Y��1�U�T8�>\r/�~��{\"z[��H�yʣMy\0\0\0\"=3�eJ?-�2&�ƑN����w������9Ȕ�]�C58\0\0@��;�L�cj��|�����C�+J�gA��B�`6�4��H@\"\r� �\0�H�*�4\0� Ұ\n\"\r\01�4��H@\"\r� �\0�H�*�4\0� Ұ\n\"\r\01�4��H@\"\r� �\0�H�*�4\0� Ұ\n\"\r\01�4��H@\"\r� �\0�H�*�4\0� ��l�ʕ1�y���H�A�%ih�iӦ�Bo߾���T�A�%ihv�ҥ��\\U�+V�_�����>(\0�\"\r�\nU��l��s�\0A��_CC����U�kkku\0X��%���K�\n\n&&&t\0X��%�ݻW\"�{�n�\0B�a	2����\Z\Z�} \0`!D\Z\0\0�\"�\0\0X�\0���4\0\0E�\0�(\"\r\0�Ei�����y��򺅫*d��u�ǂ�r�m+��t�72�}�p,\"�}�cOo=z���\rs������A��?\0\"��9웷ģ�qK^��mu{\Z� �0xyt�a�P��K{ND���أ�+�����8\0�,D��$��֨T��ʮ�ր���j4w���>u�����}�c�\0��H۞*����T��^,��X�\Zdn�|\Z�Y���y�T�%�C����\ZP�8<�����\0� �6v�DUa]��bȨ>�%0�=R�ګ���	����\'��\\�W{���t[�z�[���i�\Z�I������7�]`2\r`���]���ՌM{�1�7�r�,�^��1����]-�J�WѠ�I���α6�kn]Q��1����]����M���1�k�-��~�\0�=\"mW7�|����cP{��C�]@�c��i�R_qŷ~Zsi\0� �v�\"��F��C�;�#\0l�H���� �\0LA��H[yi\0� �vez�.\\���	W������Bd��qRL�j)�%�\0�#�v5�H\'X�ne��+��_��u9�`qDڮL�t�Kc26�HwԠ�	wn�[������H�,\"mWVx�;Y�e/a�����t��o��E\'�\0��Hە)�N8�L8݌^?�D�}�yED:z�	�M��$����B��E��ʬH�<��tj�f�2�t�\r\r�1���H�2\"mWs3�N>��ys�4w_h��\Z�%�\0l�H��Ϥg\Z�4��3�t:=��g�i4�`MDڮt�&}9j�i<cN\'��jm��k1����D\Z�-i������\ZG:aV�/��I�c0�\"a�S��H�,\"mWs阆��:e��8Y�g:5��r��_�H�,\"mW|w���`\n\"mWD�ʃH0��+\"m�A���H���� �\0LA��H[yi\0� �vE��<�4\0Si����#h��$F�P����\0�#�v� �\\2P}�K{��C�k��~�\0�=\"mW�]�OJ����� 1bƑs�r��_�E�c��i�Z[uJJp�k��7�3�n���f�ǫ�1����]���|������YbD�[����y�M�c��i��7{%?�\\�=K���x�\'wʼ%��cA�\0�G�m���WM�����\'�����z_�ڪS�\0��H���_�p��7���?\\��B��哓�\0�H���XP}k��-\r��r�9�*�̤�u�~\\\0p\"m{���[V��殩<�=W.[j��Yn��/��~D\0p\"�#W���?6���K���*�������P��!*1�`.\"���S�ۤ�*j����;�~��C0�v�D�1�\"��<���fq���o:���V\0��H\0`QD\Z\0\0�\"�\0\0X�\0���4\0\0E��]999)/�?�p�hגp\'jaN��W�Z�m�\\D\Z&K��m��_IX��N��T�̧�z�����$:i\0s�H�d�����ƟM�a�f�׀�A�L�+%�\0��F\n���qw#\'b��pe�H�<��%�D�lhh��R�<\00�F\n�(��6�v	�7�g�G�,��f�� \'<Oyyyi\0s�H�H��\Z\'*a��LI��f�Gb|�)� H���u�)u:\0&\"�H!a��Ǭc�dg3�t��B�\'��b�\r\r�)�����\0�G��Bf�Ny:fWiF:�\n1�+M�c��,lhh(,,�)u�C\0�i����t���WHVЄiL��k\Z|����QSj\"\r`�i�_��e����鄥7Xh����o4��\0�l �Ȯt�������<�=$\\-a����Pf�2���V��iX��---���\r\r\r��ciX�#-FGG��˙R�\"\rK�i���\0��H�l�)��\0��H��i�)5\0si�\'�O)��U�t�	�R0��~�@@\"]PP��@L��Ե�����i��HO������===���]i���H+���EEE^�W��\0�%\"\r�i111QYYɔ\Z@�4�sv���\02@���\"=Ŕ\Z��i��H+L���HC?WEz�)5��i��H+L��D���;#=uuJ]XX(��},\0��HC?�FZ���)..�ZK�u\0k!����V�^oQQQdJ}��ō7����=*\0zi�G���)��~�������2�@\'\"\r��t4�R�����wʉ���G@\"\r����%HEEE��FGGe�s�t�\'��\"�����K�JJJt�%����DY�r%Oz�E�����v�Z�=������>}Z�qЀHC?\"-�\rRSSSUU%���Zn��^�qЀHC?\"\r\0	i�G� !\"\r��4\0$D������4�#�\0���~D\Z\0\"�ЏHONN�<��\\y��U2�t�:F�cA~��h���l:��33i���H�\r�=���5�K���1����u߱�9�4�sm�=�}�xTZn�+[��nO�d�/�N1��F{iωȓ{t�s�u����``ֈ42!M58k�r<FZ��Xi�*���jh\rhO�3Fs�཯�S7읿��7<���f�H#Ƒ�I%fo.��*�L��T��6�\r�X�Wdn�|\Z�F�1c�ʦ�4f���ͲNii���jI��>Uhi���9u4��K	Oo=��2G��.eA���a�NҟF���Y^^^>�c����#*��h/��G��.�KHn���^�w;�!\"�vD:��	#��t��\"���s�^�\rs�X��N=��n2D�]-YqS�[�`0Q&�	���܎w������-�]`2\r[\"�n�lNl��H��w�������jb��^����|��:�w>�	\"�v3�t���8�E�\'ҋ<�`�U4hO�{�;���6�uE��;��v�f��6O��tʙ�{\"��m�7u�����m>o�G��d�H#�E�4_��Oo��\'ۭ{\"}��7K0�;���UC�@��d�Hcf=�s���$�\\qO��7a�D\ZH��~n���h�m��]��d�HC?\"� �@BD\Z�i�\"�ЏHg6.\\���	W�fp-	w�.���WK�-��;i�G�ӯ���G� �Ɨ\Zt=a���$ҀB���N?�)/�I݌\"���3�k ��^)�bi�WSS#���p�A��t�q�Ӽ\n�0\'�U���4`�HC���*����} Y7�H\'����.z�������ɒ�l���n\"\rD#�ЏH�(�)OǴ� ��D:�?�͞c�1��bi�G�gi�p�?g5��хN�dg�4���~Dz�Q4>���)�h0�N��tz)��D\Z� �ЏH�(��3�m�����ɒ�f��ݓ�`��bi�G�3vʋb�l鄥7X��L� �i���i�G�M�tL�bj���\Z4~���N�N:WA��BD\Z�iFV��}i�G�D\ZH�HC?\"� �@BD\Z�i�\"�ЏH3�4���~���%�EsǠ�n�j��]��d�HC?�DzA~�Ԣ�t��n�j�m~���w>�	\"\r�*++%�^�W��d�w��`��>��[�G���m>��w>�	\"\r����%�\r\r\r�$��V��`���>��r�X��Nn�E��	G\"���=�>�=(��أ���#���qK^���;O���Li��H�;�W����5��冱�On�yK<�ǂ��y D\Z��*����j2}�\\���9{t�����V��}�\"���U�?��~)�\r?�̓�������*�v^�_>9��.2E����\"=2T�Ś�lKCk@{Ϝ7d�\n-3�s݃��p sD\Z��-���5xˊ2���5���W�IcK�_=�-�m��^�w50+D\Z��0�b�J���ǦՔz�:^���h�|i�	�^n�7sh8\0��~����8�&�V]QC���p�{\'x\Z�@���k#�HNʎ�y��y6��%�oؿ鰏O[�I�4�sy� \"\r��4\0$D������4�#�\0���~[�n%�\0�HC��������} \0`-D\Z��rSTTT�>\n\0�i�G�#���JKK�����},\0�#�ЏH������������f���*�4��^�e�g�W�K���B���Z�1\0� \"\r�tE:\'ӏ\'^OO�������@`���i藥HG*�f��x&=::�{�n�@��y~\0�4�K\'�3-ht�\rv�k\Z][[+y�����\0�;\"\r�����&�t���joo/**���\Z\Z��U\0p\"\r�RF:YqS�T�`0Q��HK��n�Z\\\\���i��8��~̤V6�&ƹ����\'&&�^oaaacc����xD\Z�e#��3f�\0g�薖�see����;�lD\Z�ei&�l�d�L�3󞑞�O��\"\r���V�L7�פ�ӛ����L�e�\\TT$��Y�\n��i藍�I\',z�����I���466z�^�>�,i�WPP Et�s�������[�n��U\0LA���\"-U����BK�u\0� �����),,����} \0��HC?�FZ}�j���|�\n@6i�g�H�і��z<��������4��W�\'&&���d��ܬ�X\08��~6�tcc��D��W�D\Z��\"ҝ��%%%|�\n�\\\"��i�ʕ1_3RTT���b����޽[�ܯ[���4tڴiSt��o�^ZZ���>���V&�555��i�t�ҥ��\\U輼����[g�*G\"�犊\n>^@\"\r�\nU�=�E��\Z\ZںukIIIgg��c�jD\Z�544�HoڴI��vMLLx�ނ����F�G\0SD\ZV�|�r���/���sM���2������U\0,�HC���|��1]�����xJKK-�10\0nC�����[�j��@�����Y&�---s�\0`�Hýjkk%�^�W��\0@bD\Zn���^\\\\\\QQ�ׇ�2\"\rw�*���K��Ӻ�\0R �p��[XX��Р�@\0 -D\Z�M&a�U�����W��a\0l�HC��?�������8�P.R�̨٧O�޸qc$Ɓ@���ӓ�_\0��HcNE�,\r<w�����}��\rj�ٳ��z�FFF$�W�\\Q�N3�R⼼����wߕ��x\0[#Ҙ#�<K�n�\\���,�n�㟸�����}������wWG��А[j�2��^xA}ɨ�X�z������\0���\\Py���\\y�_�����x�Ͼ��W�(�Ʒ<<\"CN�YY�.��d�ݯ�����ꘫ��k׮�����˗���Z~Y\00�F֩Bw�<����)4W���O}��\r�?|�u��g�.�F[[h�O��c%�d�H�����տ���T�ty||<�ӥ��9��_��7r�5\"��R��`��\'��F���k?W��?k^h�s�q�MV��l�s_7�����R�t����W����_޼y�\r<ϯ����B��>\0��FE\n���}^B��wTH�����~�I��ɿ�W����1�V/E�Թ��������J��~����ֈ4�E��*U�׾���g�δ�j��=[���N���&�4\08�FVD^�~憛%�������Z�q��w�^����UU�i\0n@��R���Ѽ� Y͹�76&Lo��U��_��k�[\r��),J��pSS�M_	��֯�in���\Z�k��� �\0�H�|j\Z�g�\Z	���|GUu��<)=�|�#��?{�M���:�x��%�l�E������\Z\Z�r�\n�i\0�D�a>��%�\\����\'�#��m�U�ip�!3�ᦓ1�n{�)�!��������w��O����dD\Z&S����}]fɒ��N��;=���N��j��+�8��Eo>x������E���K>����s``��4\0G\"�0��R���m��G�O����4����?�����8���������4��0D\Z&S�u?�ɿ��cS��.PW�Y��ݳ4oF�Vÿs�l;��ں�7�4}񵟫�9,�鮮���!�6oݿ=\0��H�dRʳ����IƟ}�{���������GZf�1�Qo�Q�ƙӧ;::\"�x����LD\Z&���*�H���;.��\Z�v�q��H}w�L����^�3���;\\y��ey骂����3�rպ{\00�����U�m����=�����\'�#�B�q��,zW���� �����~?/Kp$\"\r3I#������^\"]|�g�|3zx���#}��Uѻ��\0T��;������շ�i\0NB�a��H7��z��e��w��{ǈ4\0\'!�0St���n�LZ}If��Mѻ�<�M�8���T�#o�yMz6o;_��]����z<�}&D\Z��i�IE�䁃�#X���Ǿ:2���<���[��w�|�Hp0\"\r3�Hz�����Ț���7g�e&��ʢw�f䋯�\\Ue%o�`D\ZfR��^��������������/|�k3*��Ǟ\n�X��//�-��Y������\0#�0Y0�^�~��������PM�ww��w����x��e��)z���l����L\08������?^�r���㩿�������_�B�k箜�nKY��D�XC̶��B��]G�mnn�kA8���T�G������O|��m��/����>���ێ�)\n^H����[Ɗ��L���5F�8���\"/Kw_��~�9�֯76�wZ�PSSU�j����.5���J6/\\H���97���DVUe�L�����i\0�C�a2)��L�<tX=����������Re5��0����?}S=ѽ��#���Ǐ�4���3�\\7��0D\Z�^�����V渇J���c�󷇛ϧS��\'W��bl�+]U �V�FG���3i\0�D�a��dzhh���{��Tu:禯t�?0�BwT{�~qA��POt��~�y��h��\0��H#+�+ӣ��]]]��������>�W~��p��t�<x�QVV�{�37FZ�_Lv.W���\0��H#+�dZ=�:;;�UU���U���%��/���^s�ܹ�6�B�HVP��Vo��Q�.��Pvy��Hp$\"�l�������|��g>���Z}��uޗ�����e�,CN�YY(�ud���_TUV�\\Qh\0�B��E1����jmm=Q__��`��w=��\'���\\����e�/r+w�Ro;~�xss�l.;��\0\\�H#��;=00������&�����C5��ҷ׼*1�9�������kk�<�	�l(��N(4\0� �ȺH�GGG������d6�R}��i	��cQ��HVPy�MdC�\\vB����\\P����}c��H$����V���\"ge�\\$+�<�	�l.;��\0\\�Hc�L�ŤZ����/\r��\nS�e�\\$+�j1y��\0\\�HcNE�z||\\�Z�Y(+�j��;ihI��*�1d�\\��!�\0܉HC��$t\0h��a�C�M\0\0\0\0IEND�B`�',1,'deviceFee.png'),(3,0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<process name=\"设备费用报销\" xmlns=\"http://jbpm.org/4.4/jpdl\">\r\n   <start g=\"193,29,48,48\" name=\"开始\">\r\n      <transition g=\"-71,-17\" name=\"to 提交申请\" to=\"提交申请\"/>\r\n   </start>\r\n   <end g=\"193,385,48,48\" name=\"结束\"/>\r\n   <task assignee=\"#{application.elecUser.logonName}\" g=\"144,109,147,63\" name=\"提交申请\">\r\n      <transition g=\"-119,-17\" name=\"to 审批【部门经理】\" to=\"审批【部门经理】\"/>\r\n   </task>\r\n   <task assignee=\"#{departmentManager}\" g=\"141,204,152,59\" name=\"审批【部门经理】\">\r\n      <transition g=\"-107,-17\" name=\"to 审批【总经理】\" to=\"审批【总经理】\"/>\n      <transition name=\"to 结束\" to=\"结束\" g=\"-47,-17\"/>\r\n   </task>\r\n   <task assignee=\"#{generalManager}\" g=\"287,297,139,58\" name=\"审批【总经理】\">\r\n      <transition g=\"-47,-17\" name=\"to 结束\" to=\"结束\"/>\r\n   </task>\r\n</process>',1,'deviceFee.jpdl.xml'),(9,0,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<process name=\"设备购置计划\" xmlns=\"http://jbpm.org/4.4/jpdl\">\n   <start name=\"开始\" g=\"193,29,48,48\">\n      <transition name=\"to 提交申请\" to=\"提交申请\" g=\"-71,-17\"/>\n   </start>\n   <end name=\"结束\" g=\"193,385,48,48\"/>\n   <task name=\"提交申请\" g=\"144,109,147,63\" assignee=\"#{application.elecUser.logonName}\">\n      <transition name=\"to 审批【部门经理】\" to=\"审批【部门经理】\" g=\"-119,-17\"/>\n   </task>\n   <task name=\"审批【部门经理】\" g=\"141,204,152,59\" assignee=\"#{departmentManager}\">\n      <transition name=\"to 审批【总经理】\" to=\"审批【总经理】\" g=\"-107,-17\"/>\n   </task>\n   <task name=\"审批【总经理】\" g=\"148,295,139,58\" assignee=\"#{generalManager}\">\n      <transition name=\"to 结束\" to=\"结束\" g=\"-47,-17\"/>\n   </task>\r\n</process>',8,'devicePlan.jpdl.xml'),(10,0,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0g]po\0\0-CIDATx���T�����=�濴�mm�m��[����٭����m�M��ަI���w�����&MLc~5F-I�=d5�\Z�$E*��\"QQ@�����������|q2������<�~���3��f�y�_��%\0\0`���}\0\0\0 6\"\r\0���4\0\0�\"�\0\0�H\0`(\"\r\0���4\0\0�\"�\0\0�H\0`(\"\r\0���4\0\0�\"�\0\0�H\0`(\"\r\0���4\0\0�\"�\0\0�H\0`(\"\r\0���4\0\0�\"�\0\0�H\0`(\"\r\0���4\0\0�\"�\0\0�H\0`(\"\r\0���4\0\0�\"�\0\0�H\0`(\"\r\0���4\0\0�\"�\0\0�H\0`(\"\r\r����\Z����␋����x@\"���,\r��|���Q�L�H&�4�L��&\"���ŋ����Z��g��w����x�S����Oː�)�{`Uwww__�L�MH5�D�1����?зj�����Ӆ��#�~��/\n�-?����`�9!�ʙr�L�i�6?v������THAD\Z�Kzttthh(ww�#7=�x�k�ml?��o�2A��d���i����Ȯ�4�A�1�T�GFF|>��?ͻ��/g�?b���!�ȆK������===�+�!��\n�4�K��m]�g�����2��Ħ�Z\r�P6�?����XWW���\0��\n�4�E��T)�s+okn�Z��h>���ۥ�g�6wvv�i\0��HcZ��}>_F�Oe|��u��Wn�Ⱦ[:-�iٹz~Z��\n\0ӅH�~��\Z\Zzk׋�>���W^�����>]��[ZZzzz�*�XLp+\"\r�����ŋ����H��ɾRll�#{8�\ru���}}}rE,������2zpp0�`����9��\Z9�9�$�K���	|;88=��\\t&xNSW`�L>�9�&6�?z���3�\\<;��Q�����!W�b\Z�[i�lb����o���`�P�GaC�m���o}���9��mC\'�.O�x��Ĝз�ۇ�|���عs��XLp+\"\r;���e��{����}���|=�N�N��g�k\'&���4���l`|<94�lp�j~a��ӧO���bD\ZvRo����K{�G���ص����)5����%��9#xfw�tpf�����oC��o���.���o�Y__w��y�:�v,�?=\0،H�NR�������K��޼����um�q��c�G��=r汶�\'&\\�S��W\'ڂӂ�\\>Q����K�θ��������ɕi\0�C�a\'�����:;;�y�oWo���_���~\r�\Zu�%t�|�Q<�FN��[Ԝ�V��	;S&���={�C��G�N�T�Z�O\06#Ұ�zB�������R��g��n=pf�A��#p�w�A�u��ę[drp��H}��Ĵ�L9Sv~�k������Q�N=-���\0�i�IJ900���v瓟)=��ϳIFE��ĉ��ۂ��>y��8G�Yq:�y�ķ���	{����\'?SQ����A�N��Hp\"\r;�G���콧6�=������oO�-?����ub��\r�oՙ�/_zzC�~dNI�z���}�D\Z��i�)�|�`�ˁ���8Q��*��]U덗�Q]�NO�r��/�{b�Ķ6}����H�8q�Hp+\"\r;�\"}�3�r��#��Ѓ�V�Ǻ�y>~�;4a���Ԅ��vb��|�3�i\0�F�a�P�N���w���6��c�ϱ>?l��J�wp7\"\r;�\"�h�θ1��W5�wa�N������i;k�/�#���7-Z�***�4\0#ҰS�-X�����On��Pv��J&F}��˗�Շ&��}���B���\'e�}\r�~zV�Η����[�\0����Bf��x~��������\0:�ɠ���\n���Q�N|Ph�Er����i7����C��a&\0\\�H�N���z��7<p�K�}��i���Ƈ�Ӂq���g���s&6���\rui`\'>���d祥�555|,(\0#ҰS�l�?����C�7JMC�z��������Ay2�?(�眼|���\\9qf�?Z�J����m�����l\0p1\"\r;��UeGG��ӧ�ܾ���\\^��9��5z�s�L��Ѧ�ב��Qu�)�u�i�ґ3����M���8M���}����.ܽ{��Ç�W�\0܍H�f���x�boo�s���ꖬ��c��in���\\�h>��+�.Y���۷�2Zv.W!W$W�2\Z�+i�,|1��x�������V���g\'U��V޾��nݺuϞ=�[�9�h\0�F�a?�����kmmmhh�8\\*q��tŉMSYC��Ȇ���d��M%%%����[ٹ\\�h\0.F�a?��\Z\Z���iii9~��������翜���d#-�Ȇ���-[v��-���ne�r,���ƴ����������:{�l}}��5��ه3nz`���6=��~���2A��d�d��g�n�*khى�Jv(����U���bD\Z�BV���X����UY�VVV�y�4kӣ��g�G�?���_�[~Ļ��rB��3�\"� �dr��۷o߳g�l.;�]�e��mW,����t	�,|[ZZ\Z\Z\Z�����۷{�������e����x�S����Oː�)Ʉ��BɳL�MdC�\\v\"���\0R��4\nu���������z<����ÇKwKKKw��Y\\\\,%~��w��	�VΔ�d�L�ɲ�l(��NdW\Z@� Ҙ^�ӣ��CCC}}}�Ν;}�t}}}MM͡C����_QQ�/�|+g�E2A��d�D6��e\'�yh\n\r iL;�鱱��/���Jqϟ?��ze}����t\"H��3�\"� �d�l\"��\n\r ui̐�T˲����������-��)��F��,\"�J��������D�3�\"� ��3��E�SKZZZ�D8����0����T��?�\\��g\0)�H���H�<Ӛ��]��~���%�W����T�H�j�Lx�]%�\"���pYYY������\0�툴S%�X��V�n�Ŷ��ɴ�H@4\"�TS���J:t��9�+鄫�hD\Z\0�iG��$M��$�N�pw�\\I�Z�������\0 i���t��/����H\'ܛ�����zc^\0)�H;�d#s��d�		�f�e�%\"\r\0�i��+��ޕ����{��D\Z\0�i�^�&�j���{N�τ{���J:77�����\0��H��xJ����}Mf��J������6�\0R���4\0D#�0��hD\ZF(..����}\0`\"\r#��>\n\00���4\0D#�0��hD\ZF���(--�}\0`\"\r#����>\n\00���4\0D#�0��hD\ZF���ۼy��\0\0�i�������>\n\00���4\0D#�0��hD\ZF8w�ܺu�t\0��HC�e˖�}��իu\0�HC�����Bo۶-??_�A��44�p�Bzz�*�ҥK����^��\0#i�j�*邂��\"\r�jkk�,Y�\"]UU��p\0�D\ZF��̔Hgee����>\00��JJJ$һv��} \0`\"\r#�:==}``@��\0�A�4\0\0�\"�\0\0�H\0`(\"\r\0���4\0\0�\"�\0\0�H�����G[^*����XƧ�e\\���Y$��\'��Uz|#~�72\0�#�.�=8����W/�ў4׏����������v��JϬ��*!7g.�Z���#=����K�+����c�\'�z<�����q�7<\07\"��!�x\"��*�m��m�՞4w����yk��_�o�t��\0p\"��в�[YzB{�Rg��Z=� kk��\0�E�]\"�ң\n-��ޭT�ͽ�)�g7�}G\0�*D�\r���T$֖7j/Vj������5�]��\0܃H��z����K��*�Ǣ���Ao�w\0�A��7�Wk8^)�w�����Gβ�`\"�x�5^���^)�#�T�m�x[��;\0� Ҏ7?7���Z�b�{�En�[��S\0p	\"�x�S5xQ�	��wDn�Ysu�)\0��v��_�(ahh�מ(���\0�w\n\0.A�O}���i� �\0lD�OEZ{�j��C���Ki�#�F\r\"\r�FD��Q�H��v<\"m� �\0lD��H5�4\0i�3$�s��\r�g=9�&<?��i\0ND���H\',w�I�\\]��~�4\0�\"Ҏ�=����f̄��U��5��D\Z�t Ҏ�=����p�G��mo��J\Z��i�3\'��+�Х��X���ε\"\r�FD��L�t�H\'|�;�Ӭ���v<�_\'���N�7\"\r�鈴�i�tD#�Ķ�z�E�wG�٨e4�`/\"�x�F�\"���z���i\0�C�ϨH�:޴�sF:����	D\Z�����i�t���ό�Q��&�\ng%\r�݈��i�4#|i\06\"ҎG��\ZD\Z�����i��`#\"�xDڨA�؈H;�6ji\06\"ҎG��\ZD\Z�����i��`#\"�xDڨA�؈H;ެ��R���~�}b�P7��;\0� Ҏ7\'�H�P~�]{�C����rt�)\0��v�{��0�-o��\'ơ�.�-f/.�}�\0�D��^/;!a��f��D1m���b~n��;\0� Ҏ���/a���lo�O{�R|ܜQ(�Ŏc-��\0\\�H��o�H~���J��x��Gn�Ys�F���\0\\�H�AMs�ZLj��ު�m�#�uݯ���}w\0�D�%���^)��/l�A�=���ˋ��?\'�h|\\�]��i�����{�f/.�m��ޭ���V���tSG��;\0W!���i�yi�z������\n��ʫ��y��.�w\0nC�]�w�?/��i��^���g��c4������z-��ۈ54��@��f|�R��)��\Zj�Ǹ���]��1��0M��;I6\n�x��V���W/ȹ�޼J�0��4\0\0�\"�\0\0�H\0`(\"\r\0�����IKKKxQ􉘓�%-IN�I���`§%�\0`�HO���٭)Gz\n�u)�G_��uY9��+A���u��Kyi�����x{�8?��I�����$颢��s\0 ��I���uwc��W�xً�f�%���Wg�w@2Gs�\0�\"=	S�H̅f��f�������]�|���sۘ?H�H[�,�\0\0!�ɊW��d��X�.�+���IE:ކs���H���4\0D ғ`�����b�{)��u\n����dw~\"f�cΟ��;\0\0�B�\'aj�Nx:殒	��B���q�>���h-v\0P��$L-��X�*z)s��o?I�=���a��<��&<\0\0\0����2%��d�U�H��j�E�;Ix�CDd.ޡZ\0\0 �HϜd���NX�x���d�!�%�� �g!�\0p%�4LA� ��)�4\0D �0��D\Z� �\0�H�D\Z\0\"i��H@\"\rSi\0�@�a\n\"\r\0�4LA� ��)�4\0D �0��D\Z� �\0�H�D\Z\0\"i��H@\"\rSi\0�@��ٲe�\"����իu\0�HC�����Bo۶-??_�A��44�p�Bzz�*�ҥK����^��\0#i�j�*邂��\"\r�jkk�,Y�\"]UU��p\0�D\ZF��̔Hgee����>\00��JJJ$һv��} \0`\"\r#�:==}``@��\0�A�4\0\0�\"�\0\0�H\0`(\"\r\0���4\0\0�\"�\0\0�H�����G[^*����XƧ�e�>�d������y�߈_�m����{t�<����r�7,��}��z��u��\0\\�H�Dn�g��\\Ռ�3\nm��]����~���%��C�n_�},�X�U�g�TT=>��~\0�]���I��?�Rq�k;k�{�7,�FCk��5{����7J�Gt�#\0��v<UhYɭ,=��X);da��h��5�i\0v!�Ζ[�Q��HhU����^��ó��_\0p	\"�`�{|�\nk��\'�!��d���$�HMs��{\07 ������qb�Ƣ���Ao��\0n@���7�W�6^)f������7��e1\r�Ji�*����,1\"�#�T�M�x[���\0�#�N5?7P���Z�MbD�w���Ms��B��\0�G��J}�/�6p����M3ka���\0�#�Nu��\r��ڛĈ����#\0�H;���+>���A�؂H;����\Z1bu�辏\0p<\"�TD��A�؂H;�6yi\0� �Ne{��Ν���1\'�K�Z���37J	��p[\"\r@;\"�TW��٭)Gz\nוL�����,��H0�v*[\"��҈�M*���h̝[��b~2i\0�\"�Ne�����/{1�l�DN��$,:�`2\"�T�D:�B3�r3|~��x�L������6�/��?���v*�\"��tD���i�͛B��mh1���\"\r�dDکff%��z4a�,��I�6������Hp\"�T3���l��\\�N6���8z�	��D\Z����S�zNz(l�i�bN&��jm��k���şD\Z�#i������ZG:fV�/��I�c��\"f���H0�v���tD�\"j��|���]�GK8!�G �\0�E�����6yi\0� �NE�MD\Z�-��Si��`\"�TD��A�؂H;�6yi\0� �NE�MD\Z�-��S�Z�+hh��$F�P����\0�#�N5\'�H2P~�]{��Cn���辏\0p<\"�T���#%X[ި=H��q��Kn�ًt�G\08�v���NH	�٣�I���hk��4�s+t�G\08�v���~)�U�g{;|ڳ�7g�M��X���\0�#�v�%�_o<�=K��x��Gn�Ys�F��� \0�H;XMs�ZLj��\'���������N�w\0p\"�l��i�$��6�����Xn�9�E���\0\\�H;�oįދ5{qAms��P��5�*����:�u�/\0��v<O{��K�sW��О�U^�(��5g�t�#\0��v�E���ۦՒz��j����������c��2�O%��\0�E�]b|�R��)�\n�\Zjyǰ}D��W�w��؎H��t���w~ny��q������ͫ��n+\0ӄH\0`(\"\r\0���4\0\0�\"�\0\0�H�%---�E�\'bNgq-1w��L����§%�\0`�Hk3r1�6�HǛ`���]��d��\0��̺^�+�K����EW��@��ż��#]TT�p\0�\"m�+\\2Zw7�	�\'ya���x1L9Ҭ� ���Joi]����\'��3�#���x+�胴Xvi\0�\Z\"m\'��{��Jx��\'�sB�W��1s=�zW�o�\0�KD�v�_�M�Ù��5b�W�#�lp�ͮ�!�\0�H�lj�Nx:殒	��5��O2=�>���h\"\r\0S@�m6+阻\nM�W�xɌyT��jq������H��i�E�+��$���ȳu�c����dV��O�0�@\0�B�̲͒8��	�h��uA��Ŭu�9�\\E\0R��)�4\0D �0��D\Z� �\0�H�D\Z\0\"i��H@\"\rSi\0�@�a\n\"\r\0�4LA� ��)�4\0D �0��D\Z� �\0�H�D\Z\0\"i��H@\"\rSi\0�@�a\n\"\r\0�44[�lY��^�z��\0#ih���^�m۶����>(\00��f.\\HOOW�^�tivv����}P\0`\"\r�V�Z�\"]PP�c�\0B��_mm�%KT����t\0��H����鬬���1��\0� �0BII�Dz׮]�\0B�aY@����>\00�\0�PD\Z\0\0Ci\0\0E�\00�\0�PD\Z\0\0C�0>~i�і����./���kɏ9�E�K{\"�`^��7��}cH!D��G��|��9�S�q�����~�7,��@��,��3ka�J�����V��HFO�h�#ɡ~i��>z�ǳ_*��}p;\"�Nҏ\'���������^�s�hhퟷf�����FI����\Z��iwR��������!k����YO�>Dڅr+=����=s�m�UO%<�����ki�9��S�X[ި�d��\'��/!�U�4w����v�@���hoX*�E[�Ճ޺ov\0�D�]�7�Wk;^)63��߯�8r��4\0�iW)�񪅝�z��x�\n��/�V����BD�U����Q\\�=]�3�=�\"��[�����v�i��{&G[���g-��}�p!\"�*׿�Q���گ=])5��\0t��\0\\�H���$,>��Hp\"�**�ڣ�jC��u��\0\\�H�\n�&�\0܄H�\n�&�\0܄H�����;wn�OĜ��Zb�D�97J�+\n��p[\"\r�@D�U�0�1#�mS��E�/��z�$[�$�\0�H�ʕG:���T����`�\rD[�+%�\0��H������K��UX�9ޮ���@�8\Z�v�+�t��mt��營��������x+�胴Xvi\0B�]ŖH\'<�f��&�$� ��z��c�+\"\r�Y�����J:�5�-]/t���Hp(\"�*3���l�-����L��#�2�Hp\n\"�*Z��\n[��+h�d&���k�x,�b �\0��H���Ww���:�1Koqf2+i��\'yD\Z������@�#:Q�u��к���b�:ޜd��H0\r�v>�[� �\0�	�v\"M��	�v\"M��	�v\"M��	�v\"M��	�v�Ys�\r��ڻ�RC��u��\0\\�H�ʜ�\"�E��v��J�!�������v�{��`�-o�ޭ�����w>{q���iWy��cޚ=�ӕ:c��j���ϭ�}�p!\"�*M�����v���+E����;�q�E���������F�4��j�W*��x�=ka�Ј_�-������4w�����.�\rs�h�Q��~����;i��O{�׿����o����./���̢�q�79\0�\"�.���b�^\\P�ܫ�g���V���tSG���kiw��߼�P�we�	�Us�(��G��w[s�K�M\r�͈�k�.���6��ԋ�V�,������WwS��!��0݈����_*>�\"�V]QC�ɏ�_�����<4�@��OrRx�;?��<_ɸzA�����Uzx��C�\00�\0�PD\Z\0\0Ci\0\0E�1iii�ZO\0$�Hc*�#����,\08�Ƥ�*�d���rQQ��G	\0�G�S�d׵ᅶ���Ѭ� �NuS�ttkcF:��+<\0p=\"���7a/���2��+G�S]�5qZ7u�w���˓>z\0p5\"��&���u�>����feeM���Ոt���J:���Nf�M� \Z�F��I>\'�ބ���-��hD\Z���1�o�s�έ[�nڎ\Z\0�H�^�7\'\'G�Q\0�Y�4�@� \Z���4\0D#�0B]]��͛u\0��H������\r\0�@�a\"\r\0ш4�@� \Z��ʂt\0��H�D\Z\0�i�H@4\"\r#i\0�F�a������Z�G\0f!�0��hD\ZF �\0�H��7o����}\0`\"\r��-[��W�^���\0�D\Z:���z۶m����\n\0LA��Ӆ���U�322����^��\0Sih�j�*��z�Ǻ ��f���K�,�H���UUU�>\00��~��������t\0�HC���YLo۶M��\0�Y�4��������t\0��H\0`(\"\r\0���4\0\0�\"�\0\0�HC��8t\0hF���j�_��~����h9S.Rsh6��D�1�By������ԽW��ͷ�֬WC�=u�PoW����x�\n6����4fH(����oo\\��^;���\\y\\wy�}���k���Ļ��u``@�-�&�\0R\r��LPy���Zy�\r������x�_{�۷g��ǹ>&CNȷr��T���]�����3:պ&\0�vD\Z�N����e����Z���=������ѷr�N��=--�<-g�ɓ	�Zg|�;��?���T����i\0��Hcz�B�}��{��v�5_���oz���϶L�9�8�\"�dy-�����ޛ�������O��t\Z@* ҘF�B/�o_��.��{�e��9j�{����������mkk����\0R��tQ��{�Lz�O�}���d���S�~�3�齹�t\Z@� Ҙ�硟��&�k�~<z���\n�ƨ׻����g�#e�t\Z@* ҘR����9ߕ����?��b����pY�5w�b��w����c�V��9y��>��ovx˷\Z�������Z��ƈ4\0W\"Ұ�ZF�^�R�����ZV��ǏK�C������u�_w��;z�ֽ�����˜�_L�z�/^d1\r���4�>���n�����o�[�RZ�����?���\'�Qo�:VS#{��|6�z��\0lF�a3�����[�J���xl��)|x��+�B���o����y�Ѻ���-��w�z<������>�\0\\�H�fRJY�f��O���>6x�xĐ�&Yh5d-��=�_���7t����Յ/��4\0�!Ұ�z������t��;y��ս�U��սUU�eL��jxw�m\'�SU}��<Y�/��+�+e1���>00�^���\0;i�LJy����?����:���(/��|�eE����9�4�<���\Zz�[�O\0v\"Ұ���?��P\"�ʷo?�kg`�ܥơU��gwOv,����wvry��n�����<���>�\\��\0�D�a\'��tٚ��5?��3[���w���\n�ƙ���]e����XG��z�<-\r���4�$����l���{<�aC����/���//ߕ��\"}������ѡ>}�Hp\"\r;ED�᭷��F:|W��v�Hp\"\r;�Gz��D����Lm����U��n\"\r�ň4�\"z�X�s�W�±3���U�?��\'��gB�����T���ۯނu��x��ؗ�߂��_N�D<���s;v�ނE�����T�{��?������o�ڇ��),߉Z�/��+e���p��i�I�Kz�������\n|F��}}��ߙT��>�L�ƪ.xYպ{������|�[�\0�����~��r�k|2���:���nO�v����}���u��w�T�`#�����χ�\0p1\"\r�����x�b{k�3_���4�W���/X���cgڍ�&,t`!~�6b����t��Ç744�\0܊H�f*Ҿ��?��U��S��j�{�G�K���z�wd�}��C+W����G��%c���,��_5F�����BOKw\\��|�9�o��GwZ�@}}Y�\nY���N5��Gr��g������E�#���T���u�4\0�!Ұ��R-������Tz����Q�7f�\'�TY�8F��_������sre}��QYF�����&�\0\\�H�~����QY��\Z�@�f�v����`}��t�1x����G�-��+�˳������2�&\r���4�ZLttt���W�N��[�{�M�Э���>\'T�}�����^��<�l4�h\0�C�1-�3����}}}�����g�tC�ud����<:X<�<�����b�|��B�׋���*x6\Z�[iL��Vz������)+O�����������yk�HSSt��L�H&��C�{o��\r/��Pvz��Hp%\"����Ɔ�?��������Z}�z�u�7�����d�,CNȷr�\\���:���JK��(4��B�1�\":������|��&y֊��|�s_��>i�������Kw�T/;z�hCC�l.;��\0R���\n�t___GGGKK������,��߲��Аo��X:���`�ʳZ@ˆ���BHD\Z�.����၁���nY\r�T7�<)>\Zt$�:G.�	*ϲ�l(��N(4�A�1T�������R���*nnn�z��0�)��g����e\'\Z@� Ҙ!�A������H�;�ڃ�i9S.�	2-\"�\Z@� ҘQ�U�VΔ	2�<HMD\Z\Z�R-�~�\nv9S.Rs�3��D���x��\04��e-oZ�l�y\0\0\0\0IEND�B`�',8,'devicePlan.png');

/*Table structure for table `jbpm4_participation` */

DROP TABLE IF EXISTS `jbpm4_participation`;

CREATE TABLE `jbpm4_participation` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `GROUPID_` varchar(255) default NULL,
  `USERID_` varchar(255) default NULL,
  `TYPE_` varchar(255) default NULL,
  `TASK_` bigint(20) default NULL,
  `SWIMLANE_` bigint(20) default NULL,
  PRIMARY KEY  (`DBID_`),
  KEY `FK_PART_SWIMLANE` (`SWIMLANE_`),
  KEY `FK_PART_TASK` (`TASK_`),
  KEY `IDX_PART_TASK` (`TASK_`),
  CONSTRAINT `FK_PART_SWIMLANE` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm4_swimlane` (`DBID_`),
  CONSTRAINT `FK_PART_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm4_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_participation` */

/*Table structure for table `jbpm4_property` */

DROP TABLE IF EXISTS `jbpm4_property`;

CREATE TABLE `jbpm4_property` (
  `KEY_` varchar(255) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `VALUE_` varchar(255) default NULL,
  PRIMARY KEY  (`KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_property` */

insert  into `jbpm4_property`(`KEY_`,`VERSION_`,`VALUE_`) values ('next.dbid',1,'10001');

/*Table structure for table `jbpm4_swimlane` */

DROP TABLE IF EXISTS `jbpm4_swimlane`;

CREATE TABLE `jbpm4_swimlane` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) default NULL,
  `ASSIGNEE_` varchar(255) default NULL,
  `EXECUTION_` bigint(20) default NULL,
  PRIMARY KEY  (`DBID_`),
  KEY `FK_SWIMLANE_EXEC` (`EXECUTION_`),
  KEY `IDX_SWIMLANE_EXEC` (`EXECUTION_`),
  CONSTRAINT `FK_SWIMLANE_EXEC` FOREIGN KEY (`EXECUTION_`) REFERENCES `jbpm4_execution` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_swimlane` */

/*Table structure for table `jbpm4_task` */

DROP TABLE IF EXISTS `jbpm4_task`;

CREATE TABLE `jbpm4_task` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) default NULL,
  `DESCR_` longtext,
  `STATE_` varchar(255) default NULL,
  `SUSPHISTSTATE_` varchar(255) default NULL,
  `ASSIGNEE_` varchar(255) default NULL,
  `FORM_` varchar(255) default NULL,
  `PRIORITY_` int(11) default NULL,
  `CREATE_` datetime default NULL,
  `DUEDATE_` datetime default NULL,
  `PROGRESS_` int(11) default NULL,
  `SIGNALLING_` bit(1) default NULL,
  `EXECUTION_ID_` varchar(255) default NULL,
  `ACTIVITY_NAME_` varchar(255) default NULL,
  `HASVARS_` bit(1) default NULL,
  `SUPERTASK_` bigint(20) default NULL,
  `EXECUTION_` bigint(20) default NULL,
  `PROCINST_` bigint(20) default NULL,
  `SWIMLANE_` bigint(20) default NULL,
  `TASKDEFNAME_` varchar(255) default NULL,
  PRIMARY KEY  (`DBID_`),
  KEY `FK_TASK_SWIML` (`SWIMLANE_`),
  KEY `FK_TASK_SUPERTASK` (`SUPERTASK_`),
  KEY `IDX_TASK_SUPERTASK` (`SUPERTASK_`),
  CONSTRAINT `FK_TASK_SUPERTASK` FOREIGN KEY (`SUPERTASK_`) REFERENCES `jbpm4_task` (`DBID_`),
  CONSTRAINT `FK_TASK_SWIML` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm4_swimlane` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_task` */

/*Table structure for table `jbpm4_variable` */

DROP TABLE IF EXISTS `jbpm4_variable`;

CREATE TABLE `jbpm4_variable` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `KEY_` varchar(255) default NULL,
  `CONVERTER_` varchar(255) default NULL,
  `HIST_` bit(1) default NULL,
  `EXECUTION_` bigint(20) default NULL,
  `TASK_` bigint(20) default NULL,
  `LOB_` bigint(20) default NULL,
  `DATE_VALUE_` datetime default NULL,
  `DOUBLE_VALUE_` double default NULL,
  `CLASSNAME_` varchar(255) default NULL,
  `LONG_VALUE_` bigint(20) default NULL,
  `STRING_VALUE_` varchar(255) default NULL,
  `TEXT_VALUE_` longtext,
  `EXESYS_` bigint(20) default NULL,
  PRIMARY KEY  (`DBID_`),
  KEY `FK_VAR_EXESYS` (`EXESYS_`),
  KEY `FK_VAR_LOB` (`LOB_`),
  KEY `FK_VAR_TASK` (`TASK_`),
  KEY `FK_VAR_EXECUTION` (`EXECUTION_`),
  KEY `IDX_VAR_EXESYS` (`EXESYS_`),
  KEY `IDX_VAR_TASK` (`TASK_`),
  KEY `IDX_VAR_EXECUTION` (`EXECUTION_`),
  KEY `IDX_VAR_LOB` (`LOB_`),
  CONSTRAINT `FK_VAR_EXECUTION` FOREIGN KEY (`EXECUTION_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_VAR_EXESYS` FOREIGN KEY (`EXESYS_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_VAR_LOB` FOREIGN KEY (`LOB_`) REFERENCES `jbpm4_lob` (`DBID_`),
  CONSTRAINT `FK_VAR_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm4_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbpm4_variable` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
