/*
SQLyog v10.2 
MySQL - 5.6.19 : Database - asme
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`asme` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `asme`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2',2,'source',NULL,'eyJyZXNvdXJjZUlkIjoiMSIsInByb3BlcnRpZXMiOnsicHJvY2Vzc19pZCI6InByb2Nlc3MiLCJu\r\nYW1lIjoiIiwiZG9jdW1lbnRhdGlvbiI6IiIsInByb2Nlc3NfYXV0aG9yIjoiIiwicHJvY2Vzc192\r\nZXJzaW9uIjoiIiwicHJvY2Vzc19uYW1lc3BhY2UiOiJodHRwOi8vd3d3LmFjdGl2aXRpLm9yZy9w\r\ncm9jZXNzZGVmIiwiZXhlY3V0aW9ubGlzdGVuZXJzIjoiIiwiZXZlbnRsaXN0ZW5lcnMiOiIiLCJz\r\naWduYWxkZWZpbml0aW9ucyI6IiIsIm1lc3NhZ2VkZWZpbml0aW9ucyI6IiJ9LCJzdGVuY2lsIjp7\r\nImlkIjoiQlBNTkRpYWdyYW0ifSwiY2hpbGRTaGFwZXMiOltdLCJib3VuZHMiOnsibG93ZXJSaWdo\r\ndCI6eyJ4IjoxMjAwLCJ5IjoxMDUwfSwidXBwZXJMZWZ0Ijp7IngiOjAsInkiOjB9fSwic3RlbmNp\r\nbHNldCI6eyJ1cmwiOiJzdGVuY2lsc2V0cy9icG1uMi4wL2JwbW4yLjAuanNvbiIsIm5hbWVzcGFj\r\nZSI6Imh0dHA6Ly9iM21uLm9yZy9zdGVuY2lsc2V0L2JwbW4yLjAjIn0sInNzZXh0ZW5zaW9ucyI6\r\nW119',NULL),('2501',2,'source-extra',NULL,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0b\0\0\0\0\08‰x!\0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€è\0\0u0\0\0ê`\0\0:˜\0\0pœºQ<\0\0\0gAMA\0\0±Ž|ûQ“\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0 \0IDATxÚìÝ\rœ•U8ðçÎ\03$*&%%¹¶‹/••¥•­³é®î¦«•È ¥¸«Ymù’f¹eê¶ý5|A³¶kÃU‚IIkµ…¢v,m)_K*-ML\nPRT„A˜¹ÿó»ó\\¸\\f`€™afî÷ûùœÏ}yî½s9œ{žs~ÏyÉ2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0È\n²\0\0h¦NÚ¸fÍš¦b±xP}}ýŒ™3g.–+\0ÀP0L\0\0AssóøtÓ”ÒámmmG¤Û±ñ|{{{´W.’C\0ÀP \0ì0“&M: P(•Ò‘Åbñ9\0u1\0@¿™8qâ¨B¡pH}}ýáÅbñÔôÔ˜x>Ý›uéXkº{~{dzîSr\r\0Jb\0€>5qâÄ±uuuM…Báä¬sêQcx	ËÓóóÓãyõõõó+×‚inn6B\0rb\0€^7yòä	ÅbñøtwRJªÚSš#_:::Zo¼ñÆ•r\0¨1\0Àv‹]ŽV¯^}D¡PˆÀKìv4®âp[L5êèèøa}}ýÜo~ó›÷Ë1\0 V	Ä\0\0Û$¦Õ××¿7Ý=,v9*\n‡¥ÔšžûáºuëæßxãKå\0€@\0°š›››*v8:°¢-±.¥»SŠEvç´´´,[\0\0›ˆ\0º5uêÔÑmmmÇ¥»‡¥Á—qå…vÓíŠB¡pGº{{}}ýìÊ…v\0èš@\0°‘æææñÅb±9F¾´µµ’žªœrôp:Öšn¸lÙ²›Z[[×É1\0€žˆ€\ZíFÀ%ŸrÔœž\ZŸî—G ¥5¥ÛSºuöìÙwË1\0€m\'\05¨rÊÑêÕ«+\n£ËSŽ²Î]ŽnIçÕ××Ï7å\0 ÷Ä\0@ènÊQ>úeQºÁ—ÆÆÆ3fÌh“c\0\0½O \0†¨¦¦¦acÇŽ=4î¦4)¥	SŽ\"Ð;Í‹\0L²HŽ\0ô=\0Bb½—|ªÑ‘Y¾ËQÅá˜b4?¥Ûo™1cÆ\n9\0Ð¿b\0`‹)Géæ¨”&å‹îVîrô`J-)µ.]ºô»\0ìX1\00Èt5å¨âpiÊQÖ|™kÊ\0ÀÀ\"\0ƒÀ¦-J©5kihhhµÐ.\0ÀÀ%\0Ô¦-Hi^±XœÛÒÒ²@n\01\00@Ä¨—|[é¦¬‹)Gåí¥ÓýVSŽ\0\0\'\0Ø¦N:º­­í¸t÷°|êÑèŠÃ‹Rš›RKccãSŽ\0\0?\0èg1å¨X,6Çz/ù˜Ò”£ô8v4jMéöý2kÖ¬å\0ÀÐ\"\0}¬bÊQL7Š5_Æ\n…òáõSŽêëëçÏœ9s±\0ºb\0 L™2e\\{{ûù¨—˜zT¹Ðî¢Ì”#\0€š$\0½dÒ¤I±³QŒx9¬½½ýÐ8Ï‹ÅòáÒ.G¦\0Ô6\0ØF1åhÍš5MÅb1¦5¥4¾âpŒr™ŸRKf—#\0\0r1\0°b¡Ý,ß^º­­-n«§µ\n…–†††VSŽ\0\0¨&\0[pâ‰\'ØÑÑë¼ÄÈ—	U‡KSŽŠÅâÜ–––r\0€Íˆ€*\'NU__T±X<²P(×ÑÑ1¦âpŒriÍL9\0`Ä\0@Ö9å¨X,îž/¸ÛX±Åtl)=ß”#\0\0¶—@\05©©©iØØ±cí¥‹ÅbL;Ú\'Ý/Ÿ×¥çîO·-uuuw,Y²dAkkë:¹\0Àöˆ fLž<yL±Xl*O9JO©Ø^zq¬ó’nXWW7öìÙËå\0\0½M €!mÒ¤IäSÞY,É6žr´0Ý¿5=?géÒ¥÷õ\0@_ˆ`H‰)G{ì±ÇQ1å(=Œ\0Ì>U/‰n+‹ó—-[v·à\0\0ýI €AoêÔ©£×¬Yst±X<6=<4¥±‡—\n…ùéö¶”æÎš5Ë”#\0\0v\0¥æææƒÒMìrtX[[Û¡•ç´Xh·®®.Ö{¹­¡¡án»\00PÄ\00(Ä¨—¶¶¶#ÒÝÃ³Î\0Ì¸ŠÃ+cªQ¡P˜W__ëÌ™3Ë1\0\0\"\0¬æææñYç:/“ÚÚÚJí–‹Å£^n1cÆ\n9\0À@\'À€íŽ;6¦5¥4)¥	U/y0¶˜®««›×ØØØjÊ\0\0ƒ@\0;ÔÔ©SW¯^}\\¾ËQL=ªœr–Ö”Zêëëç›r\0À`\'@¿«žrT(\Z+/J©5=×ÒÐÐ`Ô\0\0CŠ@\0ýbÒ¤Ip)_²§­Ë:G½ÜžŽÏž5kÖƒr\0€¡J €>SŽÖ¬YÓT,#ðÒ”ÒøŠÃm…Bá–tlž)G\0\0Ô\0zM>å¨)ëœr·M9Š/|ill\\`Ê\0\0µH €íR1å(Û=¤âPi¡Ý¼D\0&Y$·\0\0¨u1\0l•-L9Š)FóSº½±±ñ–3f¬c\0\0°@\0[´…)G±¸nKJ­K—.½£µµu\0€®	Ä\0Ð¥-M9Ê:ƒ/sM9\0€žˆ $¦­^½ú¸B¡—¦lã)G‹RjMÇZ\Z\Z\ZZ-´\0\0ÛF  †åSŽbÔKL9Š0•SŽ¤4¯X,ÎmiiY ·\0\0`û	Ä\0Ôõ—,_ï%¥	‡ÛÊÛK§û­¦\0@ïˆâ¦N:º­­í¸t÷°|êÑèŠÃ‹Rš›RKccãSŽ\0\0 o	Ä\0A1å¨X,6Çz/ù˜Ò”£ô¸¼Ðîí1úeÖ¬YÊ-\0\0è?1\0C@Å”£˜nk¾Œ/\n¥cÅbqE]ÒÝÛo™1cÆ\n9\0\0;†@À 5eÊ”qíííGä£^bêQåB»‹Êë½Œ9Ò”#\0\0 b\0‘I“&ÅÎF1âå°öööC£/‹q¨<å¨%¥¹Ú\0€I `\0‹)G«W¯>\"Ý=¼P(Ä¨—ñ‡§4?õr‹Q/B{¤´L6\0\0µD `€™<yò˜b±x|º{ìêÕ«©ÚåhAJ¥í¥—.]zGkkë:9Æ\0wqJ_NiIÇ:RšÅ^6\0µB `\0hnn>(ë\\d÷Øb±x`¹~Îw9*m/R«)GB—¤´[7ÇžOiY\0Ô€`âÄ‰£†\rvD±X<6ëÀŒ­8¼4¥;\n…ÂÌ†††¹¦1HÝšÒÞ)u7jk\\J‡læ8\0À$ÐO&Ož<¡££ãˆºººõrhJ•»ÝRkznÎ²eËî6åˆ!àèü6ÊyŒˆ©žšt{J‹RZ+«\0€Z\"Ð‡ò]ŽÞY,Ž)Gé~–ïrÓŽæwtt|§®®nþ¬Y³”[Ô€³Î5cÂô”F¤tl\0j‰@@/š8qâØººº¦|ÔKìv4&žÏ0+ÒmL×øNºm5kÖr9F\r¹.¥›+ß’ÒžYçB¾\0\05C `;577O7¥]ŽRŠEwË£^’…éþüXïeÙ²e÷›rDŠ‘/\'wñ|¬t½ì\0j‰@ÀVš:ujãªU«Q/éaŒz™Pq8-s…Â¼b±xÇìÙ³ï–cÔ¸Ø¢ú±¬sáÞ\'ªŽ\rÏ,Ö\0Ô€ˆQ/…B!Ø=¶­­-‚0›ìríŽ92v9Z!Ç äþ”nKé“YçÚ0ã«Ž¿[\0µF  ùB»1uâÈ”©˜nJ»¥ã?\\²dÉ|SŽ KVÜÿLJ¿­:~SÖ¹hï²\n\0¨1\0¹˜r´zõêã\n…B^š²¯Þ·¥´ ¥–”æÎž={‘ƒ­òÛ.ž;^¶\0\0µF ¨iùB»1êeR[[[Œ€i¬8¼8¥ùÅbqÞÈ‘#o™1cF›ƒ^»&-‘\r\0@-ˆjJŒz‰€KÖ9âeR¶ñB»!F½ÌK©uéÒ¥w˜rÛmTÖ¹£Xõˆ˜XÄ7‚±¥ûÑ²	\0¨1À7uêÔÑmmmÇ¥»‡åSFWŽQ.­Yç”£VSŽ ×œŸuZb{êø]ÅÖ¿OéÒ”>‘Òì”>›Ò_Ê*\0 –Ä\0CRL9*‹Í±ÞK>¦4å(=ÎòNa,´ÛÒÐÐÐjÊô‰R:)¿¿¤‹Ûï¥ôãÌöÕ\0@ˆ†„Š)G1Ý(Ö|Ÿ]²¼£×šÒíé¹Ù³fÍzPŽA¿ø\\J¿NiUÅsoLiÿ¬sÛ÷«3\0 ÆÄ\0ƒÖ”)SÆµ··‘z‰©G•í¶¥ço‰…vëëëçÏœ9s±ƒ~·_J “?Ž©I×¥trþ8Öy^6\0µD T&Mš;Åˆ—ÃÚÛÛz¬X,–/Š/|ill\\`Êìp±@oüÇts|ç”Î“M\0@-ˆ´˜r´fÍš¦b±SŽšR\Z_q8:xwDà%0Ú…¥-O±o,Ì»$µ§´SJ÷æ¯™‘ÒWe\0PKb€\'ÚÍòí¥ÛÚÚâ¶rÊQL1šŸÒí·Ì˜1c…ƒéÉü6FÅ¼!¥½Rz¬ê5geÁ\Z\0€š!SŽŽÌ:×”¨‹ë–¶—^ºté­­­÷„Ááó)KéÝ)ý.¥û*ŽÅ¾#‹\0€Z#ì=˜r´ ë¾Ì5å¥=Sº*ë\\ 7Ü˜Ò”ª×ÄŽJûÉ*\0 –Ä\0ý¦¼ËQÖõ”£E)µ\n…–†††VíÂ ·¤êñ•]¼æpÙ\0Ô\Z OMž<yB±XlÎ*v9ª8£^æ¥ãs[ZZÈ-Òîéâ¹%²\0¨51@¯Š)Gmmm±ÆKL9:ªX,Ž¯8ÜV(nŠ]ŽÒýVSŽ`H‹:àW)-¬zþÎ”^È¬\0Ô(`»•§\n…#ÛÚÚŽË6r47¥–ÆÆÆ¦AÍˆ5žö®z.ÖŒùBJ³d\0P«b€mÒÕ”£ô8E ¥5¥Û…ÂìY³f=(·€äÀ”nÍ:·Ÿ\0¨Y1@lnÊQº¿¢P(Ü’îÞÞØØxËŒ3VÈ1 ÊØ¬st\0@Mˆºµ¥)G1â%Ö{9r¤)G@W\"ðò¾”&¤ô³ü¶R]Þù¥¬\0j…@°‘I“&R(ŽÊ6r´.ëœrë>ÌµÐ.ÐÇg£èþ5¥¨Ož©8A˜áù-\0@Íˆ\ZSŽÖ¬YÓT,£³Ô”ÒøŠÃË…ÂütlNccã|SŽ€­´2¥O¦taÖ¹>Ì—SºE¶\0\0µL jPssóø¬3è2©­­-n×O9*‹÷\n…[ÓímË–-»»µµu¶SÔ#1Òîü”FfvM\0j˜@Ô€¦¦¦acÇŽiMYç4Êu\ZÚŠÅâ-…Ba^}}ý­3gÎ\\,Ç€>rIJïOi¿”~-;\0€Z$CTL9Z½zõq±ÐnzxDJãÊÇb—£t3£®®n^CCC«…v>ò’”~_õÜWSúP&\0Ô(BbÊQ±XlÎw9ŠEw+w9z8¥ù1ò¥±±±Õz/@?øY7Ïÿ‡¬\0j•@b1ê%¸˜ôÔøt¿|8ÖdXÒm1õ¨¥¥e¡v=RZÖÅó¯HéqÙ\0Ôd¦L™2®½½=¦\Z–O=\Zo/J»utt|§®®nþ¬Y³–Ë1`\0øaJ\'dOGúË¬s­˜˜6ù²\0¨1ÐÇÊÓ…ZZZ.ÝÞÏˆ‘/ííí‡–»ùè—Ó±¹uuus–,Y²À.GÀ\0t@Ö9éCÏý6ë\\?æM²\0¨%1Ð‡&OžüÞb±x}0éq fâÄ‰£†\rvDzo,´{tJã*¦…˜r4\'0¦Ôn)Ý™uN“,ûeÕkêR:QV\0µD úÀäÉ“Ç‹ÅËRšÚÓ÷Lœ8ql}}ýQéîá)•Þ;¦âpL1º5¥ŸÙb\Z$žÎ:§•í“u.\Z^vrJ×É&\0 ÖÄ@/›<yrQ®Í6lÝ‘R]sssqöìÙë‡µ455\r;vlL3ŠÀK¬ùrPÕo2Fº´¦Ïš×ÑÑÑzã7®”»À23¥óSºDV\0\0µD zIL\'ª¯¯¿¤X,~8ê…”FdCïKb—£U«VZWWSŽb—£qÑ–Ò)ýÐ.GÀ;\"ÍË6žšT-êÀ\'Rúºì\0j…@ô‚O<ñÀŽŽŽ›ÓÝññ¸X,®+\n#ª_×ÖÖöt]]]cÅSK³ÎàËm³gÌ˜Ñ&7!\"¶¥Ž©I1âïž”vIé1Ù\0Ô:ØN“\'O¾¤££ãÜü÷”ÆB¡ÐÝo+‚0±FÂÜ”®[ºtéýv9†¨—d£abg¤X¸7ÖŒùxJ_­zÝÓ²\n\0¨%1°&Ož<¡££cV±X<0jmÖhÙ¬Ù³g¿Zî5àK)í^õ\\Œ<ªê¹Ø »\0€Z!Û ¹¹ùÜb±xq¡PxQzXL)á.g\0Ö;>¿Ý-¿‘/1=é›)]qìM²\n\0¨%1°¦L™rÈºuë~RõÛ)È€nUN=z6¥ÏUû¾,\0jI,€žkoo¿l3ë¿ôHlc-\'\ZöY\0\0Ô2#bØ!.\\xüÚµkÏ\\½zõþ)îèè£Jž|òÉlÁ‚YúîÙèÑ£³ôÝ³ôÝK·ííí±+Réñ–üà?èõ`L¡P(644üyØ°a·§ï3ýïxÇJÚŽ÷ýïÿÀvÚéŒb±xd*cÓ­\0x/”õ‘#G®LùúÛTæ¯0aÂ×Ós½¸íŒØšúdYÁöúÑ~ôÆÆÆÆ3ÓyöˆTŸî¡>­ú^Û’õ›, ?=üðÃ“–/_þ¥µk×î6vìØl×]wÍvÞyç¬®nhµ¥žyæ™R°fÅŠÙºuëJ·ñ8ž?úè£ûäoF\0håÊ•Ù³Ï>›-]ºtm{{ûoS£¥ùÈ#\\¨äõ¿yóæMH†o¦Fäþ{î¹çˆ¡ZÖw„Ê²¾lÙ²,5ÐŸ3fÌÇ÷Þ{ï/Ê)*½”ý]J³²ÎÑ¸‘\"H³ÙÑ1ÍÍÍ¥›SºxöìÙÉÊÚ­OGŽÙ’îî›êÓáêÓÚ¬ïµm€¡D †~óÈ#\\õøãŸñÊW¾²ð²—½,®rÈ”>ô§?ý)[´hÑêÔP}ïa‡öm9ÒæÏŸDÊ÷[Æ?2•õ:e½ïËúc=–¥ºå¦W½êU“ŽpöÎ:·°¾.¥s+Oé®Í½Q †¨Oëëë¿»×^{Ôv@Û*\\J _<ôÐC—,Y²äŒý÷ß¿ðò—¿\\CªDƒõu¯{ÝÈt÷¿~ô£+Gú¯Ó0|øð_óš×ì”Êº L?•õ×¾öµÙÿøÇã}ôÑYrd@{²\"=!;ØR}:lØ°›8à€‘ÚhÛ\0CI½, ¯=ðÀ÷ÄO|yß}÷-ì²Ë.›oae¶ü÷?Ê–>øÝìé?Ü™­zúÑlXÃÎÙð‘»É¼í4bÄˆl·Ýv±dÉ’¿Ÿ2eÊ­7ÜpƒŽOŠáóõõõóR§açTÖ»t·=·$ûó£ÿ›-{è¶Ry_óÜŸ²†^’ÕØIngYu›~ûÛßî÷ÉO~ò×\\sÍ½re@Ø\'¥XëE)žÒíÑ—ŠŸBJcSZ›Ò¨”Vuõæô[jJ7‘n_¸pa«ì¬¹úôû¯yÍkvíªíP®OŸ|x^öÄo¿—=ýø‚ì…UË³Æ÷Ìê†5È@m€ÍˆúÜªU«nˆéH]5¤Ö½ð|¶è®¯fO=vG¶võSÙÚ¶ÙÊ\'“ýáž¯g«žzDæõ‚vÚ)Ûk¯½R{¶þ\Z¹ÑÇj]ÝU©¬w¤²Þe{ÕŠÇ²?Ü}möôâŸ¯/ïÏ,¹?{ìî¯fkV.“½SÖ³§žzjz±X´ýŽ÷)½$¥³ÎéHaBEÚ7¿}cJ»Ë.*¥sÖçÓï¹Ø]¦\\ŸF\ZuiÔ©+ÿ,[ôó/—.ð m0 û\r²€¾ôë_ÿzÒ/¼ð’JÚ•gþxW©ñÔ•%CïxÅ+^1jøðáûþà?8DnôØ)5_ŸòúÅÝ½&ÊtGû›<ß¾vuöÔcvôí\rQ×´··zä‘GÎ—;Ü‡Rú¿”îÏ6,Êûé§)Å(sSú³ì¢²>6lØÇ7zkëÓukžÍžz|LÔ¶ÐbèS«W¯>5vGên^÷êgïþ½ÏþQö¢=öØãÙtó9Ñ7RÏK_úÒ%›[Ã Myï¯²»lL”0¨ëÓ\'·µ>mSŸjÛ\0p†nÓ§Ö¬Yó†Øf²;]]Í*+vØø¤7í¾ûîã/^ü9ÑgšRova£Í–÷öµr°—ÄT†eË–ý¥œ0Ê}b½˜Êµ{þ”unm\rÕþ&Õ§/ßæúTûAÛ`€ˆ¡O­^½z·wÞYF\0£F\ZY,_\'\'úÌA£GV§Œ²kSY­sàøÇ¬s˜·É\nzZŸî²Ë.~ÃhÛ\0C–N}ª£££PWgÜ@ÿ?Ø)­ï4*ë§¬§†¹Œ8®”l¥õ)Ú6À®¿d;ÒðÆî§-Õ)ƒR†5ì²™cFŽ¨O¨1ìP»Œ}]VW?¢Ëc;ïñZÄ2úåu{l×=”A\0ÛYŸ\nuÙÎ/Ý_0 	Ä°Cí´û«³ïuè&ÏopŒbH³÷;²íöªMžßõeoÈF;Xlg}ºû«šb\0ðbØáºÚÝ #=W,vÈj£¼¯[#c\0z£>ÝÌnJ\00PÄ°ÃDcéÉ‡¿Ÿ=õ‡Ÿnr¬ý…•Ùî¾6k{ö2Š!!Êô9+[ýÌã›{î‰_eK~ýíÒk\0Ø¼µm+²Å¿˜Ùe}úÔcwdË~û=\04»&±C¬zúÑlÙC·fkV.ëö5ÑÀzì®¯”†ÇPc¬žùÓ½Ù“ÏËÖ½ðüf_óüò‡²1ñ·›]K –­øãÝÙòG~°Ùúôé?ü4[ùÄ¯³=&“\ZóW2\r€G †~U\Zó»¹¥†TO¦Åkž|d~iÄÀžûŸ5ŒÚC&2hÄ—%¿ùN¶òÉßôèõÑ±Xú›[J¯»ï±›Ý –¬]ýT¶ä×7—.äôèõ1jæþëKkp½ôÕo\'F\0S“èW1ÝèéÅ?ßêõ_Úž[’-úÙMÝ`Pùýÿ]Ýã L¥•ËÊ~ÿÓ«d @ÖÔ~tÁz„©£\rÿpÏ×d\"\0Š@ýÛ˜Z»z›ßÁ›Ž.æƒ¡XÞ­o\0×‡éÜ¿=u¢Ñ¡L:u´\\€ž15‰~µ×›Þ¿]»!™ªÁ`ò‡ž+`;\n…G‹Åb¶ÿþûåF\r7VÓ¹{êÓBÁuGèk“\'O>ª­­í®»îº‹N>ùä‹åláÜ&èïÆÔŠá.Á¶:á„Ž>|øW?üð¬µµõÓ_|ñŸ.¼ðÂkåLí‰@Šúv}=lØ°›8âˆ¨¯/¼æškVäñ÷\0\0 \0IDAT#™&g {.\0\0®QßÐÐðßgžyæˆ“N:)K·u?þø—/¸à‚Ú_§)¥1[xÍ„”Ê‘‚í½Èµ5ïoTZ€]_1â»guVc^_~ñ‹_\\zÍ5×œ·ƒ¾ÒY=¨?‘Òùý£óz·1¯ï«¯¸ï9\"]9}ªªÞ> ¥±ÝüÝÿNi”RCˆ\0T£¾±±ñÖhÔ¿á\ro(=÷º×½.;ãŒ3ê/^|íyç÷¾>þ\nÃª\ZÑKS:µ‹×TÚ§â5Ó³ÎÀLøFJãª^›óûñwŽÊ÷‡ä÷ÿ/¿_6:oøwå²ª×ôk}AóT_¨ª¯÷Þ{ï¥W^yåÙýð5ÆW=^QQ‡ÆªÇá¯ò×…ÓóÛ¶”>ÞEýõô—òû÷§Ôš×ã‹ó¿}Õ{NéælCp¾Raì<B‰@\00 Ä\Z·yæ™\råF}Ùk^óšÒÈ˜\'žxâéö=}ø5âjfJšòA–E#(ò?ÙÆW\\£Á½<o”GCûÁŠc‹«>?ÿsÞ ÏÜü³Íß{LJª:“²Î MµÆü3\0ú½¾Îƒ0o|ãë»¨¯<ðÀå_|ñÉ}üU¦V¥ƒ³ÎÀK¹ÎþdEý96nl^Ï•×ÝåÝ@–æ÷+G­D}üH~ÿ¨¼îŽ`JÚ[ó÷Tñúè|%Û0Â¦2Îo¯ÍŒh¬y5±FÌœ9sY´hÑéÏ>ûlÓ“O>ùÒçŸ¾qÍš5uÃ†\rë5jÔ/~ñ‹ÿ”nR__ÉÇ?þñ‡\0èÿFýðáÃ¿óÑ~tD\\QíJ<ŸŽ×_qÅ³O=õÔI_ûÚ×¾Ý_%†©ÏÎ:¯jfy£ùÀü¹,opOÎÛÑ>>¥Ãò†ù˜nÚVÑx_˜mÊ|0¿ÿáü6\ZýÑY9;ï@| ¥‹*ÞÿÙüï•ß–E‡ FÄÄÈ˜²@\0}V_Çš0çœsNãæêë³Ï>»núôéÿyÁÔæ3ŸùÏ>ú:8™Qñø/òúûîüñ¢<…åùý¨¯ïÈïOÊëørýõñRšXñÜ×òÛ)y]»¼âóÇg–;*¾Ã\rù÷jÌ?£è‰ÀzkžjÊ”)SÆ­[·î¸B¡pXžßcó¼ŽsÚÒb±x:vgêÏž9sæâZÈ“!ˆ¹úê«Ïâ‰\'>úãÿx÷ýöÛ¯ð¶·½-{Å+^‘½øÅ/Î\Z³¶¶¶ºçž{®ññÇß{áÂ…{ß{ï½\'{î¹Këêê¦%W©f ïåón6SWZSãØW\\Ñræ™g6§sýœ^þ:ÿžu®1ðpÞ¸Þ¿\" Í_“å\rÈòöÔºü~\\%=.Û0½)\Zég¦ô‘¼Q>6¶”7·æÃSšŸ¿§ú\nry}ß§\"à¯‹«µ³•\" ¿êë-a*ëë<síg?ûÙì“Ÿüd_c¢>Ž`ômùãqy=üòzö¢üØºŠ@Ìò¼>›\ZótnEfŸ<“?7,¯ÓÇæ·q^ˆiNåùæ?F=žŸÿ­Ï¤tEþ÷jÎäÉ“ã|ø/ííío/\n\r]¼$ò||:ùy\\zÝeÍÍÍ­éñ×gÍšuƒ@Ì óùÏþõO>ùä÷/^<&ýG–\"²õõõ›þ¯76–ÒK^ò’,†@ŸtÒI±¸Ôž---W¦ÆÝ9uuuG¥ŠãWª\\\0è»F}¬	ón©Q_Œ¹üòË[N;í´w_{íµßíå¯˜…Ù†)IÑ@lí&H’å\rý]³\rëµÜ’ßFp%7ïÊ6Œ •?¿(Í!\rû¦.¾GŸcJ?Ë:¯ÊÆœ˜Ît·Òôw}]^˜wkêëÆ\\qÅ_ûÄ\'>±úÒK/Õ_mLEõè‚Š:v|ÕkÍ&Q—Æ…÷˜Ž4#?Ó˜\"°SÁòpžbÔÌŠ¼oÍ?sBþ¾¦Š¿qžbúl9`Óšb\r±Kk©¬¤>xäÉ—ŠÅâQÛðö¦ô¾¦ô§···Ÿrã7><óhÈb®ºêªÏ.\\¸ðãÇsLýßÿýßw€Ùœ¨TR*Ì›7oÜœ9sîKÍÙé3¿¨ê€ÞoÔçA˜MÖ„éIãþÜsÏiJ7zê©Í}0Mé¨¼!PÞønêâ5qåóÚüøÕyãÿãU¯©¼¢¯‹\0Ï3Ù†£¹<Û0T¾1oôgyÃÿËYçº‹*>/®°–-^§$ýQ_ç»Ù\rß–úúœsÎ)\\yå•×Ÿ}öÙ…éÓ§³—¿^åŽG{eÜfF†ñÎ¼Þ½!ÛtáÜå[¨SËglþwšºøYç€aµTV&MšÔ\\(¾P,w/?}ò8 ;øàƒ³}öÙ\'=zt¶óÎ;g«V­ÊV¬X‘-Z´(ûùÏžÝ{ï½ÙÚµkËo;4½ï¾É“\'p(ŽŽR‹õ^{íµ>üðÃçGÃìè£Þê L¥#<2†Ï\rOáªôyWý@ïÉæÝ¦ Leã>5êã\\=û¤“N:¶¿ÞNy\0$FžÄðô}Òšm:¯?Ž’Òw*ž«lponÛëhðïš7à£Ã#eâJm¬Q³¬‹Æym˜EYç\Z3eëú¼¾înaÞ­©¯ÓûëŸzê©ëN?ýôã{ù+–GªÜ×©‹óº²º~ŒÑŠ§eÖ\0ëÎ˜-üº?–ß¿¿ß­fvJš4iÒÑ…Báúr&úãÑ/Ÿ>}zö‰O|\"û›¿ù›ÒR!„	/zÑ‹²—½ìeÙ[ßúÖ(1³%«êÇJŸu}*ƒ§µ¼\Z2˜Ï}îsüâ¿¸ðÓŸþtáÕ¯~u¯|æ^{í•]xá…ÃV¯^ýïùÈG>¨\Z€ÞiÔçkÂls¦,F²žsÎ9ÃÓÝoE°¿fSJïMém)™uHŽÈ6½òYÝÐ/¯P¹øã¸lÓm¬£a>:ï´æŸSnàW[õw*õFÄ\0}Z_—×„é¥úzØš5kf÷r0æ±¼Î>(¯W£¾Ÿu¸uñú5Uã}‡T<_q?>+ìûTÔ½åµfâ}§W}VyÍ°Ê:?¦1ÅØCz§¤|$ÌÍy”,—\\rI,Ô[Z\n¤\'b¤L¼>Þ›²b±xm*‹ïJù5$1]tÑ~<òÈ§cÏúžþ\'÷T|ÞÇ>ö±aÏ?ÿüé?‚ê\0¶ÝÖ,ÌÛSù4¥ÉÑiè…üXÖ‰¡Ðw¦4/ë\\Tw~~ls¢¡}Q~[’”w‡ˆÆé\'²Î`M‘¿½â}ßÉÿ±ède°\':\ryƒXEÇà¢ªŽ@¯××=]˜wkêëØý®­­í›§vÚ?öVw0Û0j1‚2òû_Ë6ÉõrÉw­¨Ÿ›òçäõm\\ŽÊëÜ¸© §äõmÔÍGç¯Y”×ëQ·åõw<?+?OÄû#øÒœŸb1á/æ¯9ÛtíšA-Ö„©««ûBù<õWõWÑGß(˜²5â}ñþ(/eÅbñKC©?>$æ«­^½úÇsÌ°Þ\Z	S-FÆ¤Šhä-IÖÑ\0¶¡Q_½0oÌ\rÿà7t\ZÃ˜ÇŽ»þqÌ#ÿçþçM^÷Å/~±´b4Ö>ö±5^vÙe7§†Ú»fÍš5·þëª\Zõ1\\:®ˆþ}Åñy#ýŸóFü¸¼±¯+ª_Èæçä—ð|Þˆ÷½1o¬Çz2±Íiy›mzÞhÏ:GÛ|=ë\\?&ŽÅÂw(e@oÕ×ÕóvW__zé¥¥þR¥|0»øâ‹»¬³ó5c†Ç\Z_\'Ÿ|ò»®»îºÛz¹Žîn¤`[¶aÄLy”aüƒÊç‹¯dSDçéþ<@SÞoT^7OÈ6¬~Q˜¹8¯§oÉ?÷ˆŠ K9Xó`ÖõHA«P(\\[žŽ#aÒÿïúéGÛ*¦-Åt¥È<þøãñTLSŠsâÛ‡Bž\rú1©Ñ5µ½½}ÏXÓ¥/Åçï´ÓN{\rµ!Q\0ÐÏA˜¦#Å0ä÷¿ÿýÙK_úÒ^ÿ¥/}i£Çßþö·K¯-6lXvÌ1Ç”‚0eyã¾±¾¾þÛ½8Mi~Öõt¡r£>‚*ïÊ6LCz_E;(dWSgäú/äÇ¢ð±<ÅÖ¦±ukÖ¹;RK~yþÞåùëcìÏå‚ÅùócòN‚ ÐÛA˜ÕõutŒ÷ÜsÏ^ëzTûÂ¾°þ~¬÷ñ¦7½)›:uêú:»¼ÆWº{s/¯ñuiE}Ü•¨[\'Vk*ƒösóºzF^ç®Ë6¡ôkˆ]”×Ï‘®ª8¾°êqkÅg^”§ÙC©¼ÄÕÅbñˆòÿu”‘í\rÂTc>ò‘T®sèPé…©Iÿ–þ3\nÃ‡ïó?tòÉ\'7¦\nè‚Zªˆ›››??®¦¦¦šZí›Ú¤¼Cßüò…yoënaÞ¿þë¿Î\Z\Z\ZJ\r®²Gy$»ûîÎšãJØwÞYº\Z[6jÔ¨ìÝï~÷&ŸWnÏ;ï¼‘©]Ð[kÆ,Î6,”ÛíÝZ3\Züæ„›ò†{Yõš4+ó¿Wî0\\žmØz`»ëëX˜÷ì³ÏÙÕÂ¼±ëMdvÛm·\rØÒ¥Ùm·mÔòÍo~3ûóŸÿ¼þñk_ûÚìÙgŸÍÞñŽwlR_—×øêÅ`Œu³úÿÜÿ/å;±kñ¶NGêN|^,à[V,O\ny>¨1S¦L·jÕª—õÖœÅ-‰Èm¡Pxy¾/z­øL*ì7ï±ÇÏ¤íMQ9Oœ8qÔ`øâ·ß~{öãÿx«ß·`Á‚ìw¿ûÝ&Ï¯\\¹é‚ç7ÞxcöÐCmöóâ³fÎœ™=ñÄÙºuŸþð‡?¨ù`y;vìŸÓïüúÁPÞçÎ»I¹êÎ“O>Yzý¶øÚ×¾–½ðÂ[|Ío~ó›Òý_üâÊ¹z}£¾¼&Lw=Æ•®ÓN;-Fž®®½½=ûêW¿ZºÿŸÿùŸÕÁ°9å”S²ÆÆÆnÏ×y0¦¥—ÖŒ¨è¦©S§öÊ\"°=]˜÷Œ3ÎØ¨íÑÑÑ‘µ´´”¦FúÞ÷¾·þXŒ€‰öÇ>ð¬«çå5¾Òyg¶úzðµ£?žÞ×T>—G ¦/uÔQ•åçÐ¡ÐÔ˜qãÆ}ðõ¯}ýölS½µ>øàaéïPk¿ÌB¡ð¢”Þ“~hÿ“þýKÒó†øöVÅß[/Þ0ñío{6gÎœõcoúêÀJ9Åë\"šâ*l>q#1þä“O.Tî¸ãŽR‡6:¦^xaé~ebŽlˆç#tþùçg_þò—³Ô¡Éî½÷Þõ¯KÅ6nH»¤ôÞ¼¼/J•ý7by/—µòŽ(ÿÑø‰`H?¢üEy-‹ÅÇÿ÷ÿ7»õÖ[K¯ýîw¿»¾<þÛ¿ý[ö£ý¨ËßRˆrytBw¯yàÖ_9ûì³×nN:é¤R#Ú«÷ó…yoéÉÂ¼±ÎÛ>ûìSª/+ëé+¯¼2ûÓŸþ´Q£ÿå/yöæ7¿y³Ÿ—¯Ó¾{K/ï¦DÏ:‡FBÿøß¶¶¶gÓoî§)]”~w‡nK{ekæ1ï|ç;7ª¯×®][ª¯?ýéO—éeñšES¹æW7õuãˆ#æ¨¯W8›cáùR=å¦rºpoŠ2W<~°gô >9¦†ý?pÀýú7ÓßkøÉO~òÎtwZ\rÿ@c¡¤)évJªø×¤èœÔX¿qÉ’%·¶¶¶îÐá€?øÁ²eË–ex`éqDeË#\0.¿üòRð#†³‡_þò—ë;‡q’xæ™g69IÄñººÎxe\\yMQi¨åøñãKQ]pÁ¥Înõ	+H²Ã;¬t\"Š×qÄ¥ïß+\"ºåFtŠðbá±©©ÌOMåýùTÞoLåý;;º¼G`1†Çªô‘æÏŸ_z>Ê4xvß}÷lùòåë×Ýˆ!Áÿýßÿ]Z‹#Œ7®”Ê¢œVŽx™={v¶ß~û­/ÿÐÙu×]×ÿž\"ÐãÜsÏ-uSÞ”n#Ÿåø„Î”?‡Ú©÷+×„ééÈÕÚE½\Zõm”©ô7KÀ¸-‹ `\\Yí‰×¾öµõÑ©HõÿìØV³¥¥åVÿ•ý&®®Æùue*/·¤ò23ÕwÜxã+e\rôº*ð–Héwwaª?W¥ßÝÿeÓLê3gÎ\\¼¹ LõÂ¼[rì±Çf÷Ýw_©=ûüóÏ—ž‹A•^ößÿÒ™w½ë][ü¼|Í˜¥ú:¦•ž ¾màôø°ò‹·td{Åçÿìg?+?Œ¿{¹@Ì²bÅŠWV¯ÐÝ×¢C±fÍš}ý.×‹-5OL?ÐÇŽ­¤äW\Z\ZZgÌ˜ÑÖß_&:{ñ#­žƒ\ZbzP9ÞúÖ·nt<:1R 4üãKÒÍDÆ•ÿA”èüÅ_üEiôÀßýÝß•‚0ñ\\tzËA–ððÃ—FÁÄ	*:§&LÈ~õ«_•:¯!::;•OH©¼?5yòäï§Ç×Eyïï/åüšk®‰«Î¥€Ì‡?üáR òßøFéøOúÓÒ®J1’kÊ”)=þÿðÿ°þ~ü¢þ+o#ÁŸW½êUëËr€¢ñß%žïñôÓOo49Öóøú×¿¾Ñ¼r†f½ßÝÂ¼[W¼\"pÆßÿþ÷¥ç*ƒ0 ‰º;á=uàŽ8ï¼ó²iÓ¦	Æì\0©lÄ‰7®®¾7£WäA™–ÕNèm>úh)8XzÏš5«T?G;¡ZŒ¼ºô ƒÚèùbG}£·F´SÊïj1U4›Ý/¿æmo{[¶ï¾û–¦“–;àÑ†yå+_©ðn±àÖáy*]L¿½‡Óï°5ýþæ¥ÔšÊêòª Ìˆ­©¯Cìd÷ÿþßÿ[ÿ¸2çÿ§žz*;õÔS³žÎ^(¯ñ•êëÉ8I}=ðÛÀéñëË/Ø{ï½ûôÄ…ðÊÓû`ÏÐAˆIÿ+wPèkÖ¬‰æî1ôÏïqÑØzWúA¾+:f)~sBûµ@VjÀwµ–EJÊâê~O\"‚A’©2oÞ¼ÒpÊÈ~øá¥Ñ1Ý(‚;Ñ ‰NäW\\QzoXb+µXý=FÒÄzq,FÄk£A)\Z6q5`âÄ‰¥¿#n9äõ×ÊõúC…”Ý^óâTÖ›Ómsü_FY‰Q ]5¾ûJ4žãjÔsÏ=WZK£r-–˜^—Ú0ëoíˆ”é«r£,®r3¦¤\\´hQi„MtnK?üQ£J)\Zü1$5^ŠŸüä\'ë·³ŒÏú×ý×~Â(ë;®ÞOeí©.¾4¶¨ÞÚF}ˆù\"h#°¢~­4räÈìÄOÜêÏ|ík_;\"u\n×^{íœÔx¼1}ßXì6Ff,¯~m:Ö–:)K«Ÿ BêdT/œœ¶ôû_ª(ô((3:Ûpu5®Øk Œ0ÜxŽ5cŠsÔƒq‘&FÏvå†n(½>~qq(.ÌDÝü_ÿõ_YSSÓú‹Ñ)¯³£	âq´;b”o¬;õjÔûQÏ—§8G€§r”cy:iåE§ê×ÄtÒæ‡˜N\Z#£\0Nü;Œd˜bŠHúýŒÝš÷¤ß\\1ýÖö‰”ž\ZîÔFX•/KõõËÓÿÿ6Õ×q&.BþÏÿüÏ&õõ_þå_–R´·FyZé´iÓ¾•~KßÎëkh¸òÉ¾î—W}þ˜híÚµÃ»[¨¯¯ÄB®©àÅ™éB¿Á-Ú;‚\"ïyÏ{úíÆU¥·¼å-¥iAÕbôJYIâjt^c§Ž8‰”G³Äw~ßûÞ·Éû/»ì²R\' DC%:•±¦A¼?:ŸúÔ§Ö_A*—Ëïÿû¥‘0q<ŽÅ•‚h|E (¶þ‹FR¬eÓ_ßþö·™²Û7\"0ñ­o}«4U­¯EÃ|áÂ…¥Nˆà`\\mºë®»ÖïR\rü(wÛøˆ e”ó:J¥‘\nÑÑˆNòc=¶Ñkã;Äëc§„÷¾÷½¥¿ûÿøëßû•¯|e£q”õ¡[ï§zîÊfoK£>DYŽŽlõv¨©ÃP\njoëy?ý6†ç£k¦l!XÐåóÝ­sß·Ü™­>%e¶?­Ö–ëNOŽ/ÛL§«Ë`RÅ¿qi¼¦§ïë£`Ó‹²2Âp[E}u].¢\\Æ”Í‹/¾¸´¦Ñ.»ì²Ñ(Ü8ïG]Aî˜J\Ze<.E\0=‚Üå L¹þŽ¶CŒÒ6TlíÏh§ÄßŒQ,¡rñuÓIûF,Vš~ãÕ¾x<ªê·36ýv*+§¸_,Ù#¾ÒØªçºzßF¯Ù–Õ….*¶X,Ý¼*Êê¶Ö×!‚çq1³Z”÷~ô£Ûô™1­tüøñ©|NQ\nÞÚ²ºÛ“ÆÆíÈÆÁž_ƒ:“N`/¤ÊhDcb4Ãœ9sbª¯‘ßT:2y¤½PUÁÿþ ƒÚ»?¿lQ\"ÀC%£Á^)‚.1Í¨²Q;ÅH–ÍP~}4ªË\rÊ†wŒt˜>}zvæ™g–,1š&)Ñ°‰‘?ÕÓäâÊS\\‘Š«Q1š ÜÈŠ«LÑè©þô—è¸ßwß};UlWyBuÀFKÿGC¦¿‚Žq\"Š­ ãêjùêf4¶O?ýôR@(DÐdÚ´iëG­l‹h¤—ñø‰GÔ·q?‰e˜‰@KÑ\nÕ—xma”õ[ï§Îç7R=wáë^÷ºaÛº«aÔÃ±ðcÕß+¶ÚVÑÙMuûÚô9ßÊ¯°î”uqE-:SÑ©êâß;:ÑQ­«ŽS¹5n3_iB_ývLªÌË­yßf‚MY0ÚÞ)F›Œ0Œ&ŒÈbÔJlÙû·û·¥àJ´bzs¬ÿÛÊQ‰3fÌ(]°‰\0y´G^ÿú×—.äÄšHÑn‰ú63e1ý.¦vÄk\"@œ¨ãó»›nT‹ÓI£³£…*F@vìØ$pÒE\0¤»×õÊo®—UjÇoG]ñ§çž{nT–ë·§¾^½zõ&ÏÇ,‚m\rèÅh­?üá/¤ïw“1«\rœþ?:ÒÿK—1„©×—Á˜¸Yõ;ˆÙQR‡àÙ+VŒÙÜ*Ü½-NˆéDùçÔº¨~‘éÄvaO\Záq›®H7ócA¾”Oscî÷?ýÓ?ûóûF\'4æXGƒ¥:È#Qª—¯öGcå‹_übiMÊaoå@L\\YŠ«I1<N*Ñˆ‰Š&*œÊ†S¥òÂ¨1T3¦<ÅU§R|ÿý÷—ÞAšø¼ù—é·ü‰«s³gÏ®‰²ÛËå}m^Þ£õ­Šºêò>qâÄÕå*ý%\Z*1÷:DÇ¥z}4V.8½Õ\'ˆ|]¤rc·<\"&Råˆ˜C=´”\"H¹9°ÜÚ5”õÁWïÇ±T.ï½òÊ+¿›ÊDýÖ^iµbíŠ®F ÄU×X rkz©óÚž:”kÒg÷Ûš±[ÐË_þò±éoëi°§§Ç7ü)¿¿aïïªº¹ÏÝÜßëõFXœËo¾ùæ~a¸]èTGÆ¦Õí¸ØRY×Åh–¢D@#¦l~á_(uR£ÝqÕUW•Êz´b}»ÞÄãÌD02êÞh+Dð¥<\"¦¼^åˆ˜Á>t[EÞÆÝ¬ïF@v5…qyþ|åo®z”YW£Ö6	ZV¿¯«Qi©¿³tsë)¥:»\'míxM9Z´ ¥¯¤ÏŸkÄ\\qÅß;ë¬³†oËÈ˜¸ÓÕ(h‹ÇÐ­N\Zm›Ë.»¬-½¢5bvü¹?•ÉuqºÏ:/@Ö¥ûµÓýX0·4/?õËû4Ÿ_õ;ˆÙQ†¾0ušú3“Ggï«áßiGÞ-sŒQ´ZFŽ9?Uè+vØK\r—òby[Ôÿøÿ(-\"ÓbÚÐøÃRÃçCúÐúÏ+w`ãsã„W”BŒøà?¸Ñv¿!FD‡4†\ZÇ•…X§¢,‚=‘¢á\r©Ê+WH/¤“K{*æ1mxÞ÷ì¶¼oÍ\"¸½asÁ•¸zçw–‚Û#Ö éjDLt\nÊ¿…Í‰\0ft\0Êbê”r_õþ×¾öµïzê©ÿøùÏþ–³Ï>{øÖ\\iÝí*×\Zˆ«­å­P£ŽŽŽkŒ\"è©ûï¿ÿ…Ë/¿|mzo¿.Ô›¯y²x3/yp(Ž‰\'ŽMÿG]uíIç0¯g7jÆÃ¸\rtÝ,*·!Êb4uLŠ6CtJ#(ëÖÅEšÊÎì9çœS\nÄDý#o£Qq¨\'#bótÒmyÿ¶Š›;ÒÿÓòTÆ¶8‰zfùÛÕk]¹¯—þ­Q©ÎHéë©\\Xù¢o}ë[óO8á„¸úê«oýèG?Ú°5õu´¢½Q‘¯ëHŒÑañÔÓE\\c”ÙW\\!³ãÅÔ8ñ6VÔÏ]žû›››§”1±È~ôuúJe›2Nï1;ÐªU«¾ûÀ¼ýàƒ®ï¯¿yï½÷þ9U,ókø‡Y—ÿoJé¶Øc ìz*ìÒÎ1!¦\rU.\\Z-:‘±°^åÎÑàˆF~4€¢‘»TN7ŠFP4†âªQ¼.¦$U6´â~Djcnx\\…ŠàNåÕª®\ZNv&ÐFT_\\yÑø,—±f^\r÷8W4·4\Z&ÊyYb¤V¬ëQ)®°–U6ê«Åo\"~så+bñ[ˆÏ‹ßX,cX9@CÈ·g.:ƒ§Þ`L4î¯¼òÊÛzºpoÔ¡1š°rZR4ê£ž,×é¿þõ¯Ke6F\"lI4\nÓß_“êì5êûFwkÇlf*Sù?wxg¿­0¬«†[»ÀçŽçˆh/D=#P\"x\"ÈÓG7ê1¤:1ÚðˆöDŒŠýÞ÷¾Wºîè°VNou7â³ÿú¯ÿºTïÆo£rDL\\uŽ`ÊF½îA<t[ÅwºåãÿøE~ëG/Dã¥>#ÑWÌ\0\0IDATïç•F¿¤óòM›2åÁ˜£¯¸âŠÿŽ-¬{zžNõëFõu´côUŒø*5 V®Ì¾ô¥/•ÖYìI}=}úôÕé7aëêoxž¶xîOeîöTäŽû±DDWëtö–øü\n·Äì@é„sã]wÝõ™SN9e§žn‹¶½~ö³Ÿ\rËd­UìõlMºëò-\'W¤ï•ˆÀ–ç?ÇÖ‘ÕŽê“Je&~ØÑè(o)yýõ×gŸùÌgJs¾Ëb!»èhFä?vL\nŒÙc=JëQÄI&\Z<ñ·+0Ñ)hhbôV¼\'\ZUÑ©ˆ†Yt”+w1@yï‰(WÑh/‰¯¸”¯l–E£¨«¢LÆèƒ­rá…ÝìŽ†V_ïj$Ly¸}L½+j>÷¹Ï­ýò| ´þ@LíìË+%¼ßA4î\'Ož|ìÕW_ýžcbKör>ÄôŽ¸D °rdL,äëllNoŸ6mZLG:I£~‡‹žZlg¸S¶a}­3Âp[í³Ï>ëëÀ¨G#àì7½éM¥ú°²¾ŽiAÌŽõèÊë¶„Ø ÚÝ­ïõèâ½´)OYŠ“\"(SÙ~ÌÓIéùè…˜²qSºõ¬Y³z<ò.¯¯ßuÕUWÝÜ“`Ìu×]·~ƒ€r›8‚‘QOG»º ‰Ñçqafsëèåõõ©žŸúzpûS½sKú?ŸwcDSüÇ”ÇÞÁè¸˜WaÐ÷Çu fæÌ™‹O=õÔ_¥Îì“>Ä¤¿óLêˆ?2{öìE5ô{¼ Uä‹\Zo\ZH#ªEC¡²±PÞÎ±RlÍØ8ÙT®õ\r£ê“*w]*‹FNYêhty¼ü¹åÆRe€Èhå}[EÐ¯²Œ–Ëg<×ÕºEåÝ2ºÁ•ÖÖÖÍþ½Øª½»áðåÀOeð§r\nR/JÍÀú¤ŽÀÜN8á1ì=uü\ZºkÜÇNWùnWëËx,zÊ)§dŸýìg³ƒ>8ûéOZ:£¬bJEwkäúÕ©qxbúû·ø/Ýáz|uu°(/ÎŽÄ”¢™btLJb¡Ûk¯½¶(/o¯5ç6wÕ¸<\r)F®Ä{b‡¥ÆÄB•ñ‰ÀOWª·Š5´æ-Hu÷×S›½­S¬òúú˜éÓ§7µ›GvW_G§8Êty\ZR”ÓˆÓÜ¢ÞŽòWžb\Zå6Ö÷ŠÑ]]öÊkÂ¤úzò\r7Ü ¾dçþè§:ª5•…#\"[™÷E0=ê¶ŠÑWw…þø°Áþxþùç/¹.9ðÀwéëQ1_ùÊWžI\'Ý/ÖÒ/2òšØª»wêç¢¼÷w™Û\\¿ƒ-É¯´÷ùÏ~Îgœñ¢®\Z÷±öKtRËbêEì€ú¸]ë¢WéCìVsÌ1Çl²0àŽZ†®\r††[+¦^Ä:EP‰àK¹Ü–wIŠ«ÿQ^cŠRˆÑ1—^ziiâ[Þò–nƒÓÑ!Ñ2hŒ€K9ˆbÆÓPcûê®Çë+™NZ³>–ÊÉüo~ó›½²fF^_¿;ÕÉ7žyæ™#»ºØ£Æ#`X# Ž?þøõõqÐ¿üå/¯/cŒ‰iL—\\rÉFŸcM˜!sîþqéêtb\"èÖ›# #°}ë­ŠG¡PøÊPÈóúÁþX¸páƒûî»ï±õõõ»O˜0ax_ý›o¾yÑ=÷Ü³xéÒ¥ç.Z´¨ÃÏµgN:é¤‹ª·ufÇ‰¡É×_½-}•ueq¾~x¿ýö»÷ç?ÿùñ{ï½÷°Ê…ö¿óïdé»þqt2cqÇò(«]wÝµÔ±ŒF~4Èò~iMhð•ÅîH—]vÙ©cy|jT~O®ï8p@,ÂûÆÆÆž™D{-uö{t•u ×§1Í2v¬‹€±°pŒ|‰À`¤XãèÕ¯~uiÒÅU.Ï±fLLÍˆ©ÌÑ¡ˆ…r#Åã…òðÃ—ÖìŠ56\"à—aS?\"@å?^ÁöÆÄý”ÄßßGµÍãø¼j±IAŒ‚Œ5jN;í´Òß?~üúf1Ò&¦›F4¦lÇz6êû]·þôXÚÛõõþûï_ª¯ß“êâbª¯×÷#\0ùãÿxýh˜(1}?ýn×¿?F?øàƒë×¯‹×FyŠZåe\"xùå—·­[·î]êëÁßOu~Sº;>þ¯õ«_•ê°¨+·Wñ¦M›V¹cÒ©®üØPè‰ËõkÖ¬™üíoû¾ÔÀ‘N~½\\JÿÑ«ÒIpT:Qšï‚\0\0l¥ò°÷ÔøþÎYgÕWZ£q;ÊTŠÎç§>õ©žKï+Œ©½ò|ô¸²š>wMaâïÈí«VFÔF§2#íÉëÊª×ðÚœâTO•î	ÓIé¥úúØË.»ìæ³Ï>»ã ƒjŒú:FºTŠÑUÕusxÿûß_Ú–½,F3ÆÚ^±+SÔc$LaÔ×CÆ))Ý•Ò˜X3ýÿ–v‚Ûží¬#£eË`’•©?~ÚPé‰@LÌ›4iÒ?÷¹Ï}é’K.Ý›‹=ñÄk.ºè¢çRÃîÜ­Yð\n\0ØT¾;Ç±©qµ>“Î¯[|_,‚ÞÝëòáíÏ­]»6vGÒ¨§æ™NJ/Ö×ïš>}zcÚ\"Ó“ú:D€¼«×F}>oÕ/¼0I}=täýñ\n…ë#ÆðÐC•67Içùmš¦Á—XÀ¿\"£÷>8”úãuCå’~È³Ÿþù³Ï?ÿü¿ûÝïÚ{ã3}ôÑçÎ;ï¼mmmW¥ÿôüÄ\0 w\Z÷©~ljŒ·ÝsÏ=/lÏgÅt¤Ë/¿<\Zõ¶¨èƒú:F®¤úzí]wÝõìö|VLGŠ‘0É$õõÐýñtsZJ¥+12&õÍcAßÊ©E›U%ï«Â‹Åó‡Z¼n(ýcÒÚŒ•+W~ðâ‹/~îæ›o~º¼Íå6V:?õ©Oµ­Y³æ©P]ê§\0½Û¸iDW^yå÷ÝwßóÛò±0ï´iÓb·÷hÔô]}:Â\'\\uÕU…{ï½÷émùŒ	»#EPG}=tE<••÷åµ—¶3u±>üáÇÿi¡°”éG°‰]cLìrëÆUôãc°S†b|Èmé‘¸æææsæÌùÏ¹sçN8ýôÓwzÃÞ°KOßÏ=÷<þÕ¯~uÕ³Ï>ûL¡P˜˜\n“éH\0Ðbm€É“\'O¼üòË¿uÖYg=û¦7½©Ççë_þò—¥Ý‘¬	Ðoõõ	©Þm9óÌ3Ÿ8øàƒ_ÚÓ÷–GÂX¦6”ûã©/}mlkÏE`%va‹´îˆ5a†êò CroÝ|_ñw¤WÚ>4bÄˆ×L˜0áÉ·¿ýí»¿êU¯zi¬«vÇ–j{ôÑGÝyçO§FÝkÖ¬y<˜k—.]zƒ…y ï÷\'œpBl•úíÔ¸úÍo~ón[zOa¦M›VÞ¢Z£ ÿêë÷\\}õÕsÎ8ãŒÅ‡rÈ¸-½\'‚01&ß¢Z}]#òþøßF¼P(œžú×M[{¸#¥¯õþø°!^\0nJ77M™2eÜý÷ßü}÷Ý÷¶ôø ”öL)öÓZ“Ò“)-Léöxm^h\0€~’/Á˜9guÖò7¿ùÍcº{mlY=mÚ´Žä½†·ìú:‚17¥zø÷o}ë[÷ÞB}ýB{{ûdõumªìÇÖb±XîM©1¥¶”–§ôÿÛ» «êûàgwH_€JEã0êXkGct¢±™!PG­‰ŠÒØ´Óq:Ici¦¶cb,jt’à$\rø¨XãcGã+!±¾ª†‡¨,°Ëò\\`Y`ÙÛß¿çìps]Ã½»Ë½ŸÏÌ—sï¹ggàwÏ^îýÝóÿÿ4Úçñ\Záyï½÷¶ÆæÖ\"\0À|s?mÚ´Ï¥oZ¿ò•¯tœqÆïº2¦X©+ÞÌ]yß}÷=¢j\0ƒöz=õŽ;îøÑ¸ê¬³Î:¶¿×ë[n¹ekKKË•÷Üs×ëçóø»5+\00¤ËÞ{zz.¾ùæ›[^zé¥öòÇÒåíÅêHÓ4a\0ÿõzçÎ—Ìœ9óçŸ~Yåëu±:ÒåsæÌyPµàÝ4b\0€!#}ÓšVAºí¶ÛzñÅ[ûÞÔßtÓMïìØ±Ã’§\0Cèõ:\r7¹ýöÛ|î¹ç~Ý÷z]6\'Œ×ëÆõ¹È‡Êî§‘87íÅÏ¥y„\Z¢GÑˆ˜“\"çVìûRää²û-ö\0ƒðæ¾hÆŒœ5kÖZM€¡ûz]4cÆ^wÝu¿õ­omÓ„!|<²²ì~št÷ƒÅíaÅ6Íó‘,oØôe{äØ²ûÿ9¼Ô\\ÇOü§\"7G¾VÜ¾4’^Nèçß}Z¤|Y¬‹\"øý€Á{sßÔÔ4uÞ¼yG¥¦Œ7õ\0C÷õº¹¹ù\'mmm‡õôôüÈëuÃ;=òÃ,¿\0âÂ\"éóøñÅö«‘1Y>Qï«Y¾xÎÊ\"[ÊnwŸå;ê±Hõ:Yï³ÅvT$1:rpdbä±²ãŽ‰|82®ìä¸¯ø™¶ÈùÅÿ’ß\'\0Xi‚3f>{öìª0t•J¥·Ê·4¬aÅçë{³|(Ò‘µÅcŸ*>‹?Vñ3?‰ü{qûŠã’‘©‘Þz,TsŸ Ij¶¤‹¹‘y‘ãŠæ­âHõIÝ¼“ýNÀÀÓ„€ýF\Zn”š)éª—4Qó†,Ÿ/&}¶~\'rIäÊŠŸY—íjÐ¬.»®–é­×BÕã1§DÆOZ\Zr”š+ÃŠ“âøâ$¸8r}–_ù2©8IÒÕ2Ï?»-ò\\–QÛP\0\0\0èßæÈŸÃŸ->‡?^ìï»fLÅÏY|Fïûìþù,¿Šæœz.T=6bÞ(’¤qiiæå4ÿKùÐ¤òË¡Ò‰Ð^<Ñß,žô£²¼A“\'„¡I\0\0\0°g÷DÎòyWÓ!y¡x,]ñÇ‘ÊŽOÃ’^Îò+g~›åC<Vö3u©Þ‡&ýQö»“ðö\']9“VQJ¸Ô©KÍ›ŽlWÃf¼ß%\0\0\0xOçEî(û,Ý^öÙúÉÈòŠãù×Èß÷Ó1ßˆl­ç\"PÇÿ¶´ÌÕê½8.uãþ&Ë—É:Ëï\r\0\0\0¼oi±œÔPI8¤9^Ò1ší\Zm2¢âø4:åšÈ?f»VGJ«(Ý™åCšR“æûYÞÌ©+õÜˆùb–5z/éÉ?(Ë\'º6Ë‡&},2²j\0\0\0ÕæV½?²¨l_k–7d’4]HßÅ©i“Å¹±ìØíÅ6]5óé,Ÿ&¤½UM†ô„~4r[–¯=Þ\'5[–V›š0ç”=ù7gùX¶4F­oH“¡I\0\0@#Ksh®UöÂ¢Šû?,»Ýùyq;5mž­8öóe·Ó*Ku;OL=Î“žÐ4þ¬»bzáøvÅ¾tÙÓ+ö¥ûåóÊÜáw	\0\0¨siÊ†±»y,Í«yŸQc½òmö\\\0\04¼÷ðØ–,_¨óŸPSMMM½¡9(Æ ‹ç¡Gjª;j¼!Îõc”bÐÏõôÚ£\0°wÍòév÷^q\\äì=<¼O\Z1ÔÔðáÃÛ:;;=ôÐCcmÚ´iY–›Am¼òöÛo·Œ=Z#fuuue#FŒèP	\0Ø+Û´¢MZy¶rrÔ_DVDv(T‡Ë¨©–––y›6mRˆ!`ýúõkb3O%jfÞš5kÚ•aðmÞ¼95_Q	\0ø½}½ìö-‘aY¾1P\Z1ÔTww÷míííÛK¥’b®žuëÖ¥+5TŠÚˆsüÁŽŽŽ3c»Q5×š5kvöôôÜ¤\0ð{™YXvÿ‘ÈÈÈ÷”ªC#†šš8qâ«ñÁtþêÕ«{Ucð,[¶ì™ÞÞÞßNž<ùEÕ¨)S¦,ˆsý¥K—¾ \Zƒ\'^k²;w.=çœsžV\r\0xßÒ•/Wgyó¥Üù‘7”ªC#†šëîîž±bÅŠ­i¸\0¯³³ó­öööÓ{{{¿¬\Zµ•j¼víÚwtt¼¬\ZoË–-Y¼Ölëéé™¦\Z\0ðþßÊDVfùÄ½WäÀÌd½P5\Z1ÔÜyç·$> ^òúë¯oÒŒX©	³páÂ›šš®‰ça±ŠÔþ\\Z_¹xñâQ®>\Z@©	uß:lØ°¿˜8qâBýÚ6+ý±W]ƒÞÿ¿àÚ¹R²]óÂÜy¼\"+TFbÒ¤IO÷ôô|vÑ¢E«V­ÚhÎ˜šëY¶lÙóçÏµ¾6êÿ¨’Ü¹›¿|íµ×NX²dÉÍS{mmmÛ,XÐ™®„9÷ÜsïVØï½¼qãÆUÊÀ{éììl-\Zì»Ó#_+nÿKäãùnä\\e‚êhQÊ]wÝµ|úôéoÞ¼ù´Õ«W¾}ûöÖæææáÃBSSÓý{/_¾<›5kV6vìØìˆ#Ž²Ïôía¼qýõªU«¿ùæ›;ãÍIgì›>eÊ”ÿvö\rü¹~ÅWüäwÞùt<‡Æöâ\\ï1bÄaq® Bû|®§7ßÛÛÛÛW,Y²dÇÛo¿½¨§§çÒÉ“\'?«:°ÿ»êª«ÆÇkæ˜Q£F«\ZìIkkë›ñÿÁ/ï¾ûî§T£ª6ô³ï¿\"»mžzê©b“ò‹Å‹ÏSBØ3PièFl¦<ùä“§·µµ}&ò‰¸fdøPý;?ôÐCYGGGvë­·f—]vÙP/ñ–,_ZðŸLÌ;$ÎõÒ¹¾~ýúÏD&¨JÕìljjZ\\*•~·t®C}I«ÐÅkæN<ñÄÍködÝºuGfV„(c#íÊ\0ÕÑ¤°{3fÌÑÝÝ½µïþˆ#>0{öìn•€Úyê©§7nÜèñãÇŸ©\Zôç7¿ùÍ««V­ê˜T£jÒ¤¼G–VìO“ñ¤a`?ˆ\\ØßN:õú,Ÿcæ†¹sç^¯”°gæˆ=èîî>»üþ¶mÛ&¨\n\0ÔVZ…®µµõ¸M›6™g‹wéêêJsgEÈªùjäÊTÚÈŠ,_Â:5^®-¶3#§ENR*¨Øƒ´ÚPùýR©ôU€Ú*V¡›þÚk¯mÖŒ¡\\jÂ,\\¸psœnEÈª¹\'r\\q»½,}÷‹ü2³BTFìAooï”Š].»ì²ƒU\0j+­B—¾\0Y´hQiåÊ•oYq‘8þwþüùÛãýÙ_Y²ê¾y#Ë\'åMy%rU±ýxqŒFT‰	Ð`7¦M›v~¼éS¶+½ÝÒÒr~l¤B\0P[©óÄO|,>€ßÒÖÖvèÑGÝuÄGsÈ!‡knö}b½K«äuuuíÜ°aCëš5kZvìØ±\"ö}É•05qJ$\rÉ]Ü_™¹º¸Ÿ¾ˆÜ¢LP\Z1°¥Ré‚Š]}“[§IÌ4b\0`\0”¯B×ÚÚšV\\üdüý‘,ŸÇ‚ú–VÉ[Ï÷3™Uòj-MÐ›¤½›ÇGFþ^™ :4b &LH¿»›æ’´š’Õ“\0`àL™2eAlRþY5 ªº‹¤Éxçfù*I;#E~U3;r§RAuhÄ@?ÆŽ{v©T:¨Ÿ‡ÒLoÛ¶-\rOzD¥\0\0ØÏ­/¶éª˜3\"Š¬¬8æKYÞ¬ª@#úQ*•¾¸›‡š‹ÇÓð$\0\0êÁ·#ã\"—F–Eæ—=öNäJÕ£ŠaIìé˜R©”†\'}yöìÙ–Ô\0`66rk–OÐ›<™^qLZQé¥‚ê0Ý<T8òÈ#\'d»Ÿ¨,IÇ¶uëÖ?Q-\0\0ösíÙ®&L2³Ÿc>©LP=\Z1PùKÑÜ|é{Ò’þhjjºZµ\0\0¨3¯ö³¯]Y ŠŸ9•\0ÞeúÞT*•&Ã˜\0\0`õ¹È©ýì.òsåêÓˆ2—_~ù¤Ø²7Ç¦áIGuÔgU\r\0€ýØýY>!o¹4gÌ™Iz¡&|›ešššÎ|ŸÇŸ¬j\0\0Ô‘Ó#FžV\n¨\r(sÿý÷#6ß(ß7uêÔëcóõÈ\rsçÎ½^•\0\0¨cGG~ªP;\Z1\0\0\0-5^®Œ¤«½_*¶åš‹ÏŽ‹”\nö9b\0\0\0\Z[š÷ð¢ÈìÈ¨,oºôeXä‘áÊÕáŠ\0\0€ÆÖùZ–ÇOóÃ|/òˆ²@m¸\"\0\0€¤\'r~ä#Ó”jC#\0\0€r7FFFNQ\n¨>\0\0€Æ6¦Ÿ}wF&(\rTŸF\0\0@c{©ØU±ÿ;ÅöX%‚êÑˆ\0\0 y&{÷p¤“\"‰œ£<P\Z1\0\0\0$§F®­Ø·4ËWRªÄòÕ\0\0\0ëðÈsY¾bRŸEÇ¤/ðÿL© :4b\0\0\0\ZWGö»Ã‘Nˆ¼UvÿêÈe‚ê14	\0\0€Ý¹7òUe€êqE\0\0@ãJ+\"=‘ýîÐ¤Jã\"ë\"?P.Øw\Z1\0\0\0kU–Mšy5rHd¥²@íš\0\0Ð¸Ædù„½Ë‹íæÈ?·ËT‰+b\0\0\0\Z×w#£*ö\r‹œ_±/5lNU.Øw\Z1\0\0\0ë³Å¶ïª—´ŠR\ZžôŸ‘Ë;K© :4b\0\0\0è(»†\'}³â±\'•ªÃ1\0\0\0TzV	 64b\0\0\0\Z[\Z)1G`à~á\0\0\0h\\=‘²|‚Þ)‘û²üKûæâ3£«c Š\\\0\0À‘Ÿfù\nJ+Š}oEº•ªË1\0\0\0”[Yl?¨P]\Z1\0\0\0í„Hoä˜âþáéÊòÑë•\nöF\0\0@ãúNäîÈØlW£åäÈøÈ°Èñ‘ƒ²ü\n™—#”öF\0\0@ãúëb›\Z/Ë#×D^ˆ¬-î¯Ž¬T&¨“õ\0\0\0WÄ\0\0\0Ð÷%}š/æWeûÓ1*TF\0\0\0eùð¤s•jK#\0\0€™J\0Ã1\0\0\0\0Ä1°÷¾>uêTU\0\0€Š÷ÉJ\0{O#ü\'\0\0À\0Ñˆ÷6[	\0\0Àûf\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÖÿÚºˆ©A\0\0\0\0IEND®B`‚',NULL),('2507',1,'è¯·å‡æµç¨‹001.bpmn20.xml','2506','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"LeaveBill\" name=\"leaveBillProcess\" isExecutable=\"true\">\n    <startEvent id=\"sid-2F4297F0-7C71-43B0-A6E0-4DAF19994BF4\" name=\"å¼€å§‹\"></startEvent>\n    <userTask id=\"sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB\" name=\"å¯åŠ¨æµç¨‹\"></userTask>\n    <sequenceFlow id=\"sid-2FD8AD1A-FFB4-4990-B62D-A9E3178AABF0\" sourceRef=\"sid-2F4297F0-7C71-43B0-A6E0-4DAF19994BF4\" targetRef=\"sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB\"></sequenceFlow>\n    <userTask id=\"sid-3E13163B-3423-42F1-BE10-7E63417E9BD6\" name=\"éƒ¨é—¨å®¡æ‰¹\">\n      <extensionElements>\n        <activiti:executionListener event=\"start\" class=\"org.xiaojl.oa.listener.LeaveTaskListener\"></activiti:executionListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-92A26ED2-2EFD-4FEF-810C-5106EB076848\" sourceRef=\"sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB\" targetRef=\"sid-3E13163B-3423-42F1-BE10-7E63417E9BD6\"></sequenceFlow>\n    <exclusiveGateway id=\"sid-66322299-DA1E-462D-B51B-C930A0A1AC58\"></exclusiveGateway>\n    <userTask id=\"sid-2E3C0D13-4600-4BEF-95C1-8EC3474DBB40\" name=\"æ€»ç»ç†å®¡æ‰¹\">\n      <extensionElements>\n        <activiti:executionListener event=\"start\" class=\"org.xiaojl.oa.listener.LeaveTaskListener\"></activiti:executionListener>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway id=\"sid-95BE41AA-D5B8-4462-A944-2E6492B9454B\"></exclusiveGateway>\n    <endEvent id=\"sid-69C9F025-B4F1-4A00-8EFC-5210DD0D0AD0\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-1AB1C516-E76B-4C01-984D-256EA740D239\" sourceRef=\"sid-3E13163B-3423-42F1-BE10-7E63417E9BD6\" targetRef=\"sid-66322299-DA1E-462D-B51B-C930A0A1AC58\"></sequenceFlow>\n    <sequenceFlow id=\"sid-68FC44BD-34EE-499B-B894-82F43565E4DD\" name=\"å®¡æ‰¹ä¸é€šè¿‡\" sourceRef=\"sid-95BE41AA-D5B8-4462-A944-2E6492B9454B\" targetRef=\"sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB\"></sequenceFlow>\n    <sequenceFlow id=\"sid-1047C7E8-B671-4724-A291-1AD6638FB744\" name=\"å®¡æ‰¹é€šè¿‡\" sourceRef=\"sid-66322299-DA1E-462D-B51B-C930A0A1AC58\" targetRef=\"sid-2E3C0D13-4600-4BEF-95C1-8EC3474DBB40\"></sequenceFlow>\n    <sequenceFlow id=\"sid-04391DA8-1746-4DD6-9C46-3C99AADA6810\" name=\"å®¡æ‰¹é€šè¿‡\" sourceRef=\"sid-95BE41AA-D5B8-4462-A944-2E6492B9454B\" targetRef=\"sid-69C9F025-B4F1-4A00-8EFC-5210DD0D0AD0\"></sequenceFlow>\n    <sequenceFlow id=\"sid-86EA9C4D-0502-4B80-B276-F595FAD49BB8\" sourceRef=\"sid-2E3C0D13-4600-4BEF-95C1-8EC3474DBB40\" targetRef=\"sid-95BE41AA-D5B8-4462-A944-2E6492B9454B\"></sequenceFlow>\n    <sequenceFlow id=\"sid-7BD855B3-7C54-457A-9AC5-5C5EF3CB007E\" name=\"å®¡æ‰¹ä¸é€šè¿‡\" sourceRef=\"sid-66322299-DA1E-462D-B51B-C930A0A1AC58\" targetRef=\"sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_LeaveBill\">\n    <bpmndi:BPMNPlane bpmnElement=\"LeaveBill\" id=\"BPMNPlane_LeaveBill\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-2F4297F0-7C71-43B0-A6E0-4DAF19994BF4\" id=\"BPMNShape_sid-2F4297F0-7C71-43B0-A6E0-4DAF19994BF4\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.000000000000007\" x=\"47.31773093290908\" y=\"373.0680307215858\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB\" id=\"BPMNShape_sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"152.14860777548546\" y=\"348.0680307215858\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-3E13163B-3423-42F1-BE10-7E63417E9BD6\" id=\"BPMNShape_sid-3E13163B-3423-42F1-BE10-7E63417E9BD6\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"339.93842888190443\" y=\"348.0680307215857\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-66322299-DA1E-462D-B51B-C930A0A1AC58\" id=\"BPMNShape_sid-66322299-DA1E-462D-B51B-C930A0A1AC58\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"534.1889596715641\" y=\"368.06803072158584\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-2E3C0D13-4600-4BEF-95C1-8EC3474DBB40\" id=\"BPMNShape_sid-2E3C0D13-4600-4BEF-95C1-8EC3474DBB40\">\n        <omgdc:Bounds height=\"86.25231878160702\" width=\"139.24747039789952\" x=\"679.8768577638089\" y=\"348.0680307215858\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-95BE41AA-D5B8-4462-A944-2E6492B9454B\" id=\"BPMNShape_sid-95BE41AA-D5B8-4462-A944-2E6492B9454B\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"898.4087049021759\" y=\"368.0680307215858\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-69C9F025-B4F1-4A00-8EFC-5210DD0D0AD0\" id=\"BPMNShape_sid-69C9F025-B4F1-4A00-8EFC-5210DD0D0AD0\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"1044.0966029944207\" y=\"374.0680307215858\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1047C7E8-B671-4724-A291-1AD6638FB744\" id=\"BPMNEdge_sid-1047C7E8-B671-4724-A291-1AD6638FB744\">\n        <omgdi:waypoint x=\"573.4362368886183\" y=\"388.82075350453164\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"679.8768577638089\" y=\"390.25562693252914\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-04391DA8-1746-4DD6-9C46-3C99AADA6810\" id=\"BPMNEdge_sid-04391DA8-1746-4DD6-9C46-3C99AADA6810\">\n        <omgdi:waypoint x=\"937.9772040295741\" y=\"388.49953159418766\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1044.0966933241882\" y=\"388.11832212573125\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7BD855B3-7C54-457A-9AC5-5C5EF3CB007E\" id=\"BPMNEdge_sid-7BD855B3-7C54-457A-9AC5-5C5EF3CB007E\">\n        <omgdi:waypoint x=\"554.6889596715641\" y=\"368.56803072158584\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"554.6889596715641\" y=\"243.63070498348597\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"205.49220881456878\" y=\"348.0680307215858\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-86EA9C4D-0502-4B80-B276-F595FAD49BB8\" id=\"BPMNEdge_sid-86EA9C4D-0502-4B80-B276-F595FAD49BB8\">\n        <omgdi:waypoint x=\"819.1243281617084\" y=\"390.11488509020165\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"899.2140114402857\" y=\"388.8733372596956\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1AB1C516-E76B-4C01-984D-256EA740D239\" id=\"BPMNEdge_sid-1AB1C516-E76B-4C01-984D-256EA740D239\">\n        <omgdi:waypoint x=\"439.93842888190443\" y=\"388.0680307215858\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"534.1889596715641\" y=\"388.06803072158584\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2FD8AD1A-FFB4-4990-B62D-A9E3178AABF0\" id=\"BPMNEdge_sid-2FD8AD1A-FFB4-4990-B62D-A9E3178AABF0\">\n        <omgdi:waypoint x=\"77.31773093290909\" y=\"388.0680307215858\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"152.14860777548546\" y=\"388.0680307215858\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-92A26ED2-2EFD-4FEF-810C-5106EB076848\" id=\"BPMNEdge_sid-92A26ED2-2EFD-4FEF-810C-5106EB076848\">\n        <omgdi:waypoint x=\"252.14860777548546\" y=\"388.0680307215858\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"339.93842888190443\" y=\"388.0680307215857\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-68FC44BD-34EE-499B-B894-82F43565E4DD\" id=\"BPMNEdge_sid-68FC44BD-34EE-499B-B894-82F43565E4DD\">\n        <omgdi:waypoint x=\"918.9087049021759\" y=\"407.5680307215858\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"918.9087049021759\" y=\"477.32853343223934\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"202.14860777548546\" y=\"477.32853343223934\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"202.14860777548546\" y=\"428.0680307215858\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('2508',1,'è¯·å‡æµç¨‹001.LeaveBill.png','2506','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0:\0\0ç\0\0\0Yµ=ï\0\0.IDATxÚíÝœ\\ey0ðpSQñ~Ãh-õBýÔz­Õn­­¤’âÙ3g6›,Vî )²^PA%€¥­à\r«¢¥à%µ Ü¡\\PŠ(\n\n„K\"¤ˆ\n:ßóì7“oØì&›d/³³ÿÿï÷üf2³»Ù¼yç™ç}æ=çÌ™\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0À:<Ê(\0\0\0\03ZY–¯­ªêäZ­ÖÐì\0\0\0\0fœþþþÇÔjµÁ²,·×UUõîlt\0\0\0`Æ¨ªê%µZíŸ\"îŠ8=þüwñð&ùœF\0\0\0ÐñŠ¢xDY–µªª.¨Õj·FÅcÏ\Zùu\Z\0\0\0@Çª×ëÛÔjµDÜqvY–oïééÙ|¬¯×è\0\0\0\0:ÊÐÐÐ¦µZí­ÿ±2â˜²,·Ï÷jt\0\0\0\0¡¿¿ÿieY¾·V«Ýñ½ˆ¢(¶\\ŸŸ¡Ñ\0\0\0L«Z­ö†ˆ¯DÜ]–åI¯ØˆŸ¥Ñ\0\0\0L­¾¾¾ÇÕjµ}\"®‰øIÄþEQ<~c®F\0\0\00eêõúËjµÚ§s÷FÄ×\"z&òçkt\0\0\0\0“j``àQµZ­?â’ˆ_–eyXQÏ˜Œ¿K£\0\0\0˜EQ¼ V«}<bEÄUU5/Ûl2ÿN\0\0\0`Âd#£ªªjµÚw\"î,Ëò¨z½þü©úû5:\0\0\0€¶`Á‚­Ë²|­V»%â¿ã~ßÜ¹s9Õ¿‡F\0\0\0°ÁªªzS­V;µyrÑîëëûóéü}4:\0\0\0€õR¯×ŸXUÕ?­Õjÿ±çüùó·ê„ßM£\0\0\0—²,_UUÕçr÷FÜ~©··÷õö;jt\0\0\0\0cš7oÞ£kµÚnWDÜPUÕ{\"žÒ©¿¯F\0\0\0°†ªª^ql­VûUÄ7ãþñð&þ{kt\0\0\0\0Ã·(Ë²¨ªêÜZ­v[Ü~¸(ŠçÎ¤ƒF\0\0\0ÌrµZí9ÊæFÄyUUõfÓc†þ[4:\0\0\0`Ú¤^¯¿¥V«}£yxÊqeY¾h¦ÿ£4:\0\0\0`É‰–eyp­Vûyó£»ç	G»åß§Ñ\0\0\0³@­VûËˆ+ËrUÜ~¾^¯¿ºKÿ\Z\0\0\0ÐŠ¢xlUUïŒÅÿU?‹xW½^b7ÿ›5:\0\0\0 Ë”e¹}Ä	±è¿+nÿ#nÿvÎ¸4ìDÐè\0\0\0€.PÅ#b‘_¸(â–²,ß·Ïœmã Ñ\0\0\03XQÏ‹ÅýÇ\"îŒønÄÎñØf³u<4:\0\0\0`†\Z\ZÚ´,Ë#¾ûqû‰¢(^`d4:\0\0\0`Æ¨ªêé±_Ä/\".-ËráÀÀÀ£ŒÌÿ§Ñ\0\0\0®ªª¿ŽüW#îŽ81âåFet\Z\0\0\0ÐŠ¢x|UUûEü8ï×”e¹o__ßãŒÌÚit\0\0\0@g-Ô_ÞÜµqwUU§ôöö¾Ñ¨¬×øit\0\0\0ÀtÊólTUµ(é—åù7âþ¡ýýýO32ëO£\0\0\0¦I½^ÿÓªª>‹ó•y•¼’J^QÅÈl8\0\0\0˜B===›Çb|çªªÎŠÛ;âö£q»­‘™\Z\0\0\005ðgFqkÄ…U(ŠâFfÂÇY£\0\0\0&É&½½½oŽÅ÷iw•eyBÄö†eòht\0\0\0À+ŠâIeY‹îë\"®ªªêñØcÌäÓè\0\0\0€	R¯×_íÏ—e¹*n¿XUÕëŒÊÔÒè\0\0\0€0oÞ¼GWUµ8ØWFü<bÉÂ…Ÿld¦‡F\0\0\0l€²,_q|,¬ñz½þ–xx#3½4:\0\0\0`œ·ˆ…tq~Äòˆöõõ=ÛÈt\0\0\0X‡¢(ž[UÕ‡c}{Ä9ïèééÙÜÈt\0\0\0ÅÐÐÐ¦eYÎøVž·K‹¢ø3#ÓÙ4:\0\0\0 MQOÅò!7F\\±[<¶¥‘™4:\0\0\0 ôöö¾>É_Ž¸;â³¯4*3F\0\0\0³Öüùó·*Ër¯ˆ«c|mÜ000ð#3sit\0\0\00ëTUõÒXÿKs÷Æ©½½½cTºƒF\0\0\0³ÂÜ¹sYUÕ‚X_qsÄá,ØÚÈt\0\0\0ºZ½^~Y–GÅøÎ¸=3âmEQlfdº“F\0\0\0]\'±àqFÄŠªªŽ.ËòOŒL÷Óè\0\0\0 kEñŒXèþcóÐ”K\"úó#3{ht\0\0\0Ð\r‹Ûžªªþ=O.Z–å¿Fü£2kç‚F\0\0\03O^6µûçea#~TUÕÞy¹X#3»it\0\0\00£Ôëõ¿ˆÅìgš—†ýrUUeThÑè\0\0\0 ãE±eY–»Æ\"öû7Åý÷ÆcO52Œ¤Ñ\0\0@Ç*Ër»X¸±2bY½^ÿ‡¡¡¡McÑè\0\0\0 £ôôôl^UÕ.±`=;âöˆ#ëõú6F†ñÐè\0\0\0 #ôõõ=»ªªÄBuyÜ^·åàààF†õ¡Ñ\0\0ÀtÚ¤,Ë¿øz,PïŠøTQ/6,l(\0\0\0¦ÜÂ…Ÿ\\UÕ»cQz}Ä\"öèïïŒ‘acit\0\0\00eÊ²|mUU\'ÇíªX~!â5F…‰¤Ñ\0\0À¤Ê\Z±ø,Ëò‡q{]îä(ŠâIF†É Ñ\0\0À¤¨ªê%±èü§æ¹7N?ÿ]<¼‰‘a2it\0\0\00aŠ¢xDY–µæUSnŠÇžed˜*\Z\0\0\0l´z½¾M,0?qGÄÙeY¾½§§gs#ÃTÓè\0\0\0`ƒ\r\rm\Z‹Ê·FügÄÊˆcÊ²ÜÎÈ04:\0\0\0X/ýýýO+Ëò½± ¼)â{EQlidè\Z\0\0\0Œwù†ˆ¯DÜ]–åI¯0*tà<Õè\0\0\0`t}}}‹…ã>×Dü$bÿ¢(odèT\Z\0\0\0¬¡^¯¿,ŒŸÎÝ_‹è1*Ì\Z\0\0\0xT,û#.‰øeY–‡Eñ#ÃL¢Ñ\0\00ËEñ‚X~<bEÄUU5/ÛÌÈ0it\0\0\0ÌBÙÈ¨ªj§X~\'âÎ²,ª×ëÏ72Ìt\Z\0\0\0³È‚¶.Ëòý±¼%â¿ã~ßÜ¹sidè\Z\0\0\0³@UUoŠà©Í“‹þs__ßŸº‘F\0\0@—ª×ëO¬ªêÀˆŸÆâï\"öœ?þVF†n¦Ñ\0\0ÐeÊ²|UUUŸËÝqû¥ÞÞÞ×f\0\0€.0oÞ¼GÇo·ˆ+\"n¨ªê=O12Ì6\Z\0\0\03XUU/Œ86w¿ŠøfÜß!ÞÄÈ0[it\0\0\0Ì0ƒƒƒ[”eYTUun,ên‹ÛEñ\\#\Z\0\0\03i÷œˆes#â¼ªªz³éadàa¯\0\0€¶I½^K,Þ¾Ñ<<å¸²,_dX`t\Z\0\0\0(O$Z–åÁ±hûyó£»ç	G¬F\0\0@g-Òþ2âßÊ²\\·Ÿ¯×ë¯6*°^¯!\0\0€éTÅc«ªzg,Ð®ŠøYÄ»êõú¬?\0\0€iR–åö\'ÄÂì®¸ý¸ýÛ9.\rE£\0\0`\nEñˆXˆÕ#.Š¸¥,Ë÷Çí3L\0\0€)PÅóbö±ˆ;#¾±s<¶™‘‰¥Ñ\0\00I†††6-ËrÇˆoÇâkEÜ~¢(Š˜<\Z\0\0\0¬ªª§Çbë}¿ˆ¸´,Ë…220ù4:\0\0\0&HUU‹¬¯FÜqbÄË\nL-\0\0€PÅã«ªÚ/âÇ±Àº¦,Ë}ûúúgd`zht\0\0\0lØbêåÍ]wWUuJooï\ntÄkS£\0\0`<ò<UU-Š…Ôeyþ¸hÿÓŒt\0\0€u¨×ëZUÕ\'cµ2¯ ’WRÉ+ªè<\Z\0\0\0£èééÙ<L;WUuVÜÞ·Ûmt6\0\0€‡/’žqDÄ­V¡(ŠG˜1¯a\0\0`ÖÛ¤··÷Í±@:-â®²,OˆØÞ°ÀÌ£Ñ\0\0ÌZEQ<©,Ëƒbat]ÄUUU½3{¬‘™K£\0\0˜uêõú«c1ôù²,WÅí«ªzQî Ñ\0\0Ì\nóæÍ{tUU‹cteÄÏ#–,\\¸ðÉFº‹F\0\0ÐÕÊ²|QÄñ±øùUÄ7êõú[âáMŒt\'\0\0 ën‹2âüˆåìëë{¶‘î§Ñ\0@Gi4\Z›ßxã§^vÙe8çœs\Zgu–˜â8ûì³^xá¯\"Ì´ùSÅs«ªúp,tn8\'â===››ë¢Ûæ:\ZÈ§B®`†ÈBå¢‹.j¬X±¢ñÀˆiŠ•+W6.¸à‚{¢8xG§Ï™¡¡¡MË²œñ­<<%n—Eñgæºè¶¹ŽFò©ë˜òÓ…JÇœuÖY×vê\\)Šâ©± 9$âÆˆË#v‹Ç¶4×E·Íu4:O…\\À–[N½wNDAð`§Í‘ÞÞÞ×ÇBæËwG|6â•æºèÆ¹ŽFò©ëèy,¥7âŽ*:bÁ0þü­Ê²Ü+âêXÄ\\·<Á\\Ý6×Ñè@>r=\0³´XùÍÿÞÞ¸ñòÏ7~|ö‡#ïçcÞÄ»« ¨ªê¥±hù—æîS{{{ÿÆ\\7×¿ht Ÿ\n¹€®*Vî]µ¼qÍwoüÏ·~Xäcùœ7ò™]Ì;÷‘UU-ˆÅÊÅ7G¾`Á‚­Íus]ñ‹Fò©ëèÊbå–kB¥·þx™7òZÔëõç—eyT,RîŒÛ3#ÞVÅfæº¹®øE£ùTÈõ\0tu±ríyGY¬äsÞÈgNAŒX”Ì8#bEUUG—eù\'æº¹®øE£ùTÈõ\0Ìšbåš³†Æ,Vò9oä_EñŒXŒücóÐ”K\"úósÝ\\Wü¢Ñ|*äz\0+Š•i)²Y±žªªþ=O.Z–å¿FüsÝ\\Wü¢Ñ|*äz\0fu±’gJ«XÉç¼‘O~APUÕâXL\\4žÿÓ¼l|íþyYØˆÅ÷î—‹5×ÍuÅ/\ZÈ§B®@±qýÅÿ4f±’Ïy#ŸÜ‚ ··÷Í±¸/õzýecý_Æs_ó™æ¥a¿\\UÕ_™áæºâäS!× Xw-¿ºqÍwXsëi<–Ïy#Ÿ¼‚ ±ˆX™‰Œªª>Úþ|Q[–e¹k<÷ýˆ›âþ{ã±§šÙæºâäS!× XYKÜtÅ×(Vò1oâ“WTUõ”X@ÜÞjr4ãöG•e¹]Ü?¦ÙYV¯×ÿahhhS3Ú\\Wü¢Ñ|*äz\0+ëz£ºÿþÆõ—üËš[Oã±|ÎùÄÍól\\>¢É1eYþ¸Ù\09²^¯oc›ëŠ_4:O…\\\0ã,Vî]µ¼qÝÅŸ\Zó8Û|.¿Æ›ùÄ===›ç‰GGkr4ã†ÁÁÁ-Ì^s]ñ‹Fò©ë`¼ÅÊý÷7n¿þÜÆÎ|ß˜…J+òkòk}B31AY–__K“£¯4{ÍuÅ/\ZÈ§B®€q+ëú$Æ\'4“þð‡ãhr¬qRRÌuÅ/\ZÈ§B®€1Š•ñ|³¶Oh¼±oXüæ7¿iìºë®ÙÄø÷z½Þß¼¬ì@^I%n‡\">Ï·çåù;ò¤¤f°¹®øE£ùTÈõŒÓ0k‹•\r-TZá}ÃãÌ3ÏT˜ëŠ_f’šŽ…|*Ÿ\n¹¾³óu„|\rÌÞbE(Ìua®3oŽX±´y»£!‘O…ëåk\0ÅŠP˜ëæ:3¹hnËù	áJÅ³|*„\\/_(V„‚À\\7×™éEóºG>r=ò5€bEA€¹n®Ó‘vXGqÜzÞ1àò©r½|\r³Ûi§öÚO~ò“Ÿ?âˆ#nÚ{ï½»hÑ¢?äÉÍ,Xð‡=÷Üó¾÷½ï}7|ä#ùÂQGõgFK±¢ À\\7×™Ö¢y]E±O\nåS!äzùš¤¯¯ïÙeYîkðS#®¸7×ã÷EÜÏ}=n—ä×­q8î¸ã=ì°ÃVpÀüô§?Ý¸ì²Ë\ZË—/oÜwß}”·+V¬h\\yå•“O>¹‘_·dÉ’ÛÞóž÷hô+\nÌus)óæ9ë÷Éßú~=ò©ë‘¯™bUUíqV­V»¿ÙØOœß³Àèâøãùá‡¾òàƒnb<ôÐCñºêª«\Z‡zè8à€[Þõ®w½Äh*V˜ëæ:SR4ï¸ßw¯âY>r=ò5¥V«mqÆz47F‹‹Š¢xÑl:öØc|hÙ²eëÕàéÌ3Ïlì±Ç¿?ðÀ÷1ªŠæº¹NGÍõýÈ§B®G¾f•eY«ªêWíM‹¾¾¾ÆG?úÑÆ¹çžÛ¸ùæ›¿þõ¯‡×Ü¿ýío‡¸¸øâ‹K—.mô÷÷lvÜkwG8é¤“ŽØwß}ÿxÝu×5&Â/~ñ‹Æ>ûìóà’%K1e+\nÌus	µ®ÙMõÏA>r=ò5×äØ±V«=ØÞàøÒ—¾4|ºˆñXµjÕð×ç÷µ7<ªªZ<kõ¨£Ž:<›ãÄñÊŸ—ÍŽýöÛo/SW±¢ À\\7×™Ð¢y¢¶1û¤P>r=ò5ÓÛä¨µ79:è áÝ\"¿/OC1¢Ù1ûvv\r\r½xppðÁ‰ÚÉ1ÚÎŽÝvÛíw1¸/4…+\nÌus	)r[Eó&‹š·ëcä÷9á|*äzäk¦Až“£ýp•#Ž8bõá)*k9òÈ#GÆ2»Öã‡rÈò<\'ÇdÊsvì¹çž?5+\nÌus.šwl+~?ÑhÞŽ·xëûÏò©ë‘¯™bÍ+«¬ÞÉ±±MŽöfÇˆÍšAøÀ’%Kþøûßÿ¾1ÙÞýîwßçd(Šæº¹Î„ÍiQ³øm¬GñÜ^4·baÛóŽ—O…\\|ÍÔ59vj?\'Ç†®²¶ÃXÚÏÙ1kÖã|ðÍy	Ù©põÕW7öÚk¯Ÿ™ÎŠæº¹Îz«˜­^[ñ<Ú×f”¯w¸|*äzäk¦¦Ñ±z7GžHt2œrÊ)³kWG__ß³÷ÙgŸ‡6æ2²ëkï½÷þMƒdBWgEü•bEA`¾›ëæº×Á8‹æÖ£­xoÑ<²x¶-Z£CÈõ³JQÏˆõÊ?Æícåk&ó}?×ã­æ®‹»îºkRÖày5–—žíîõø!‡räg>ó™ÆT:ùä“ïÿÄ÷Ìö‰ß¶uè¬²,_«XQÌöùn®›ë^U¼®«x^ß¢¹ýï_9Ç\'…c``à	\ZB®Ÿô|½mæëÈÕ«\"Þyû)ò5“ñ¾ïÛúº£>zR×áK—.mot,éêÁ?øàƒxÙe—Mi£#“Y¼xñ&~­1\"Î­ã§XQÌ–ùn®›ë^cÍã-ZÇ*ž7ÝÀ¢¹Å1à5®øøÚ\Zò©ë7Nîä‘¯ïË×],J·—¯™È÷ýxìÔÖóçŸþ¤®Ã/¾øâößeYWþ{ìq×í·ß>¥Ž+Vä¶™&þ\ZuÇ¯ý XQÌ–ùn®›ë^U4¯­xþÙFÍûû0ñóè¦Ö\'Ícm­—O…\\?©9û”\rùš\r~ß?_ßz|¢OB:ÒòåËÛ[ºzðûûûß}÷Mi£#ÿ¾z½þ{ô‰ßÞñË-NŠÁl™ïæº¹îuðÿòþ|\"7Zñ¼1EóÈâÙ1àÓ;V¶Ï›fÃc §§gs!×OmÎÞvÛm”¯Ù˜9ñ»ÖŸ\'ê’²k»Ôlû.¥®üé0ŽÿtÑÅJg…9i®Ï¦â×¼œúxûÛßÞ*p—nä[ü¦£|2ø³æãciów}°YœÝñ«ˆ;òÓ¡ˆ#~qM,À·—G\\RUÕq{v³™ó­¸==âkñø—âöó\'FüsÄqñü\'âñÆýF÷Íc‰ãñâþÞq\\Øçåñâ6.ß÷çEìþÛ¸ýë¸ýËxüUõzýeñç—ÄýíâþóãñçäI.\\øä¾¾¾ÇÅý-·è’ÂùÚÑŽx­>bþüù[åkwÁ‚[ç94òu¯ã?×ö_ÄÜ]<Öý}3ìQe®ˆŒ»ûE¼»™O†\">÷?·ŸŠøtÄ\"¾qZnéøÎºòõ.»ìò‡Ì­Ûm·Ý;<_‹S½ïêFG$Š¦cGG$–tøÆœä—G’Þ±õÉÌt+Ë–-k<æ1Yïï{âŸØØm·ÝÖxü—¿üåðÙ„ÛË„>Ú×fÜpÃ\r¯}íkù&ÒxéK_ÚøÁ~Ðxë[ßšo.x³k|ó›ßl<ëYÏRtÁ|ŸŽ¹žs/OüÔþÿÓð¼Új«­\Z×\\sÍêçn»í¶á¯ÏÇ®¿þúáy˜‘_ûœç<§qâ‰\'®õïùÄ\'>±ÎßeÉ’%Ã÷sÎg®l=ž—\ZSüÎž¼?gÝgíß˜O?;ŸæïšM‚läÂ#Þ×ŸžgŽÇž—‹l.d“!þm¯ÌHooï›Mˆr÷wŽÛÞøÚ¾æBdfcÿ\\ŒäÉÿ²É‘ÍŽfÓããq{l<~B³)’Í‘‹øj.LšÍ“3šÍ”ó#.Žø~³ÙrM³ùrCÄÍ·7›3÷4›5¿øãLiÞŒ£X¾R£C¬o®Ÿ¦FB¾V/É9ñ£æëì·EÜqoÄÍ×çñó~Ý|mÞÖ<„ëgñû\\·W4ÎyùsóõñÍ¿/_‹ŸŽ?Ÿ¯Ãü½\"ŽÈß3þ|PóDùû/ÊO¾ö2ç¿s¬×X<—‡\Zì³ÓN;=a³Í6Û±ÓóµwßÎ~ßoÎs;:&ÚâÅ‹WNÇ9:\"Þiâ¯³Ð¶í§y¢š(J‡#q™l[M…¼ŸÍ‡Ö×¾êU¯\ZŽ|.’ýêÅÞ–[n™ÿÏc.èòßuÎ9çß¾ð…áÇ¾ò•¯GÞ¿÷Þ{‡_Œù5Ûl³Íð÷¶ßÏÈ¦I~ýO~ò‹¿>ß§r®_pÁÃséCúÐðüÉÆBü.Ã‘\r‘\r†Ÿþô§óÎ;¯ñš×¼f¸É–ó²ÕˆÈÈfà[Þò–5~~ëu³õÖ[7Þð†7ßÏ8í´Ó\ZÏ{ÞóÖx]äU°Z÷¿øÅ/®¾Ÿ¿ŸFÇìÉûmEê½s&ç˜ï\r)ž»þ˜ï™Ò¼YW£#~æ4:ÄzîÞûÃt4²—¯¥¸ÿŠ<çEsçÕ6Ùh‰×Ý“òü3Ù€™Æœ½Æabñû.x”|ÍD½ï;GÇ$Ùk¯½Î›ê«®\\qÅô÷÷Ÿiâ¯žd—FÒÜiŒBwZ\Z[l±Åðbn¬&Å©§žºúÏí‹½ŒVc\"¹#ïçÏ»çž{VM.Ú®¾úêÆ-·Ü²úgî¹çžÃßÛþ³òSóüþÃ?|øóW¼âÃÏüytÐðsù³òûW®\\iñ7ÃçûTÎõl¤eC¯õç3Î8cõ\\Ìy—ÏµkßÍñÝï~wÔŸ7²Ñ1²9‘Î¦JûkìÐC¾ÓM7­n\"¾ñonpäýl®´¾7_/y{ÜqÇitÌ‚¼¿ŸÈuIÂÑÎâ¿>Å³³øÏŒOóÌý=ÓU;‡®tákí¦¶+®­ãÒÎò5ô¾ïª+“dÑ¢Eï:é¤“šÊFÇ‰\'žx[×_·w|mŸäMk£#weä\'ÐÙLÈO¤[ÑZŒµˆyJ.î2ÚŸo-\n=öØÕµü;w]\\zé¥«kíÆøØÇ>6üØUW]5üç;î¸cuÓ$)ùXî\ZÉÇ¾ÿýïg³ìa•ÖÏTÌìù>Õs}Ns§R6\Zò~ÎçV£#o[¸Œœ“sš;‘ÆÓèÈFJkÇRëu‘‡gåýwÞyøïí÷ißÑñô§?}¸±’÷s÷GîQüÎŽ¼¿ŸÌU4o²–çÇS<¿2b¥¢¹3ŒvÉË˜SKG^òr&5:r—hûï›sóÈ#õk[91ßû¿ýío¯®=ò0ÂX„Nø{ÄL;äP®Ÿðœ}m¾¾búùšÉzßoîz\ZÎéy8õdZºtiûûGw¯ÇsKæàààozhêz»ï¾ûŠ<îÏÔŸNÛÑ1ÚïÓ*<rÁØþæŸÍ‘»@ò~Ûøóùüsîüøú×¿¾úçŒ,ZI>\"]tÑêèÈæŠ‚À\\Oä\\Éy³ýöÛ7>õ©O\r7)r.æ!Q/|á‡ŸÏ&E6>F\"5Þ£Íûü;[»GÿøÇZ0çŽŽläåýö¦`þžŠßYm]ŸÐ­«hž³Åsk;öNþ:¦hÞ¶ùxïÚ`3mGG+ç­Zµêa¨ŒöuÇsÌ\Z‡æã­]r­æô›Þô¦á¼›5Åë^÷ºáº¡ýÂÜ=—»O»éC¹~b­c‡|Í„­Ç›çˆjÄýášs2d~íïïoottÿz|ñâÅß‹ÂzJ:?üáÿ7þ/5¥;»Ñ‘É4ßðóM~äŽŽ<Çh_Ÿ\'	Ííµvíoø¹xÌEdžÐ1ŸÏ“Œæ§!ÙüÈkþœöŸ_—ßÂ	\'4ùÈG®>&‹ùû)Ìõ\r‰|É¦F6\'Z‡W<<%ï·_ÙÐFÇë_ÿú5vtä¼}ÛÛÞ¶úëò°”|\rä×´Îq3²IâÌû“ÂñÍë[<·þ>EsÉ+ÆŒcýŒitä{|6žúÔ§çÇ|ŸÏ?¿øÅ/nh´m~ Òúwå¼=äCVßÏr#v6Cò¹ÜùÑúºÏ}îs«wóe$‹í¦CåzùÚÐÏLUUÕj@dnš§œrJ{“ã¢Ù2°;í·ß~÷LÅ®Ž=÷Üó—yFqÓ¹ó­ÃHÚÏÇ1ÚvÌ,<Z\rŽ|<ŠÜ¶?§m›ÿhÅCÆ’;9² ™;wîð‚2OôØþ‰L{Ã¤uÒü¾üó>ðá+»äßŸÅ‡‚À\\_ŸÈ†ÙÈ¦F«(mÍïöû“ÙèÈOsëöÈæ`{££õ»Ýzë­æúì–ŸŽÜ–¼h=ŠæµÏGü=Žñ–O\'=ò½´÷ðÜõ6²!<§¹StNÛîVCºu¾®üÐd´\Z¢u¿õáIžø¼ÕÜn¦Ø\r‡Êõò53w=ÞjBä®Ž‰>)iþ¼ü¹m\'­ž=ëñE‹]úo|ãw“Ùä8ýôÓó„>ÿ½žÇ&+V¦©ÑÑ*F~’ÜþX«’\r‡,>šo–Ãoî­ÃXZçØÈç³˜Èû­mûy?·éçù7Ú­‹æ\'#¹Ã£½ÑÑÚ®jG‡¹¾±\'#Ùˆh«#çd~R8§íj>Òèh?™i{±óz´«,˜³°oÆ’¿[6>Fžü×\\ŸµÅsû	ïÚ‹àñÍsÖñ}.I(Ÿv\\£#·\\gNÌÃ[òÄäY£ä×´Ÿ£«už¥ü\0$›Ù­Üžy5ÿk5çŒ±££9”ëåkf®æU†yžÄ‰ºÔl®>øà‡íæ˜Uëñ<F\'’þªë®»nR¶uD‘þÛ¾¾¾•UU½Ð4îìb%W=ì°ÃV¿QgbäÉHÛOÚÚ¦Ù~¾Žü³àÈ7üÖ\'­O¢³a‘[R[Ÿ¨ç‰sËj«Ñ‘Ÿ¦,[¶luS£uIÙü=òkó„cí;:Z¿ÓÈ\'\ns}mÑ:<ç[ûÕVæ4wqdccäy=Ú¿¾½°n5øöÞ{ïµ6[óhM—Vã%/µÜ~^šV£ðˆ#ŽXãts}V¹-:‹Þ…sÖÿ„#¿oE³|:ÕŽ9Í+¯¬5<ðÀ5sÉç²~È:$ÏãÑÚ}Ñ:ì¥Õ,noh·ïÜkåòÜÑ‘ÏgÞï¦Cåzùš™½o¿¤qÖ~ÛìÈµTžÜ¹­Éqï¬\\—eYÛ}÷ÝW­X±bB›wÞyçý‹-ºÃ!+_¬d3¢ýÄ\\£-ìæ¬åSíÜÉÑj’ddÃbä›}ž!?ÉYdäcY@äÎ|lß}÷}Ø	½2²ÒÓÓ³ÆågæúdìfjÏÝÙÐËçò“‘Ïµ>ÉËc¿7¤Ñ‘ÑÚŽÝþiàT^MÈ\\ïŠâyc¶Í\ZùtR#w·µv¸eÞË1Z——y¨^«œ\'%Ï&p«&X[S¡=÷fíÒj`dC»uÅ¸n:äP®—¯™ùëñÖ‰I[;;6ô0–ü¾;9\Z³z=0ÍŽ‰ÚÙqã7þ:›ñŸö^S·»‹×›Ç\\7×™±ÅóDáÈ§ëŒ<œ5›ùáÇþûï¿z§g6²‰‡´,^¼xïËB^Qe¬“ˆ¶GîüÌŸŸçÊhÌ|NsGÇX;Lfò!‡r½|Mw¬ÇÛ›ynlÎænäñ^]%O<Ú~NŽëñf\')fÕé§Ÿ~÷Æœ 4Þt~T¯×óR²¦¬ÅŸÅæº¹Î¤ØØíË¶?Ë§S­óåá\'ÙŒX°`ÁÃžo¿Lkûù7òÐ×l äÎ»öÃ\\vÙe—Õ÷³©ÑÚm‘WvËÃU²1ÒºÜìœæ9:Z÷sG]·r(×Ë×tÏz<bU{£\"G}tãüóÏÞ­Ñ:¬%w·-_¾|8Ÿüñ‡58òpëñ‡w’¶Á<wppð¶+¯¼òžõip\\qÅ7Ç÷ý4O<êœ˜ëæ:SV<¯ï\'|Nd\'ŸN{äÉC[M‚<WÇ;ßùÎÕ»#Æúžñì’h;Þ¯ï†CåzùšîZ·_vvã\"ëñ±øÙðØu×]WuÔQ?¹ä’Kî¼ýöÛ‡ß0RÞæ9=¾÷½ïÝtÌ1Çü````yæÅÙ5ru‹?‹?Ìus)³¾Û™m–O…ëåkfÀz¼Ùðxp}\ZÖããÔ××÷ìàcÀNÈËÄÞßÄ¼½%bYÄ’ì<-ÅŠ‚\0sÝ\\§£‹çWFÜ±“!“O…\\ï#_3#×ã÷5×ã÷Y£X\ns]˜ëÝn‡fQ¼ÃZž_©h–O…ëåk\0ÅŠP˜ëæ:3ÅXŸÚþ,Ÿ\n!×Ë×\0Š¡ 0×Íuº¢xV4Ë§BÈõò5€bE(Ìus®(ž—*šåS!äzù\Z@±\"æº¹N7Èc¼s\\’P>B®ïø|\'—”¯ÅŠP˜ëÂ\\gÝž`äS!äúÎ×lt\0(V„‚À\\æ: Ÿ\n¹^£@±\"æº0×A>r=\Z\0ŠYi®›ë€|*äz4:\0+\nÌusO…\\F XQ¬(Ìua®ò©ë5:\0+BA`®säS!äz\0ÅŠP˜ëÂ\\ùTÈõht\0(V˜ëæ: Ÿ\n¹\0ÅŠ‚\0sÝ\\äS!×kt@±\"æº0×ùTÈõ\Z\0Š¡ 0×…¹ò©ëåz\0ÅŠ‚@A`®›ë€|*äz4:\0+\nÌusO…\\F€bEA`®sO…\\¯Ñ X\ns]˜ë Ÿ\n!×kt\0tœsÎ9ÇqçÄ}Q<hVšëæ: Ñ!4:Ðè\0Ø@^xáí+V¬ðfÜ±|ùò¯FAp­Yi®›ë€F‡Ðè@£`{î¹o;ÿüóÿ÷Î;ïü7äéût;~gŸ}ö/#ÞaVšëæ: Ñ!4:Ðè\0Ø±àØ1Þˆ.Ï­äù†4Óâ”SNidâž‰¿{3rÜ¯µð3×gA˜ë Ñ!4:Ðè\0`I{Y&îžžžÍ\0ht4:\0f¬²,_IûÁLÜUUí`D\0@£Cht Ñ0“_Ï¤ÝŒË\0L.W±®°¥ÑÀä%ëW¶vs´¢,Ë\0LW±®°¥ÑÀä%ëeíMŽÖ®çê\0€Éã*VÂ¶4:\0˜œD½ÆnŽVTUµ“€Éã*VÂ¶4:\0˜øD}ÆhMŽf\\j„\0\0àaõ³F@\'é1ws8W\0\0ŒZCkt\0tp’^¶¶&‡+°\0\0À\Z5´F€Ä\r\0\0êe\0$n\0\0P/ q\0€z\0‰\0\0ÔË\07\0\0¨—¸\0@½€Ä\r\0\0êe\0$n\0\0P/HÜ\0\0€z@â\0\0õ2\07\0\0¨—¸\0@½€Ä\r\0\0êe\0‰\0\0ÔË\0HÜ\0\0 ^@â\0\0õ2\07\0\0¨—$n\0\0@½ q\0€z\0‰\0\0ÔË\0HÜ\0\0 ^@â\0\0õ2€Ä\r\0\0êe\0$n\0\0P/ q\0€z\0‰\0\0ÔË\07\0\0 ^¸\0@½€Ä\r\0\0êe\0$n\0\0P/ q\0€z@â\0\0õ2\07\0\0¨—¸\0@½€Ä\r\0\0êe\0‰\0\0P/HÜ\0\0 ^@â\0\0õ2\07\0\0¨—X#q!„B!Æ«\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€ò¼ÙMºLŒ•P\0\0\0\0IEND®B`‚',1),('4',5,'source',NULL,'eyJyZXNvdXJjZUlkIjoiMyIsInByb3BlcnRpZXMiOnsicHJvY2Vzc19pZCI6IkxlYXZlQmlsbCIs\r\nIm5hbWUiOiJsZWF2ZUJpbGxQcm9jZXNzIiwiZG9jdW1lbnRhdGlvbiI6IiIsInByb2Nlc3NfYXV0\r\naG9yIjoiIiwicHJvY2Vzc192ZXJzaW9uIjoiIiwicHJvY2Vzc19uYW1lc3BhY2UiOiJodHRwOi8v\r\nd3d3LmFjdGl2aXRpLm9yZy9wcm9jZXNzZGVmIiwiZXhlY3V0aW9ubGlzdGVuZXJzIjoiIiwiZXZl\r\nbnRsaXN0ZW5lcnMiOiIiLCJzaWduYWxkZWZpbml0aW9ucyI6IiIsIm1lc3NhZ2VkZWZpbml0aW9u\r\ncyI6IiJ9LCJzdGVuY2lsIjp7ImlkIjoiQlBNTkRpYWdyYW0ifSwiY2hpbGRTaGFwZXMiOlt7InJl\r\nc291cmNlSWQiOiJzaWQtMkY0Mjk3RjAtN0M3MS00M0IwLUE2RTAtNERBRjE5OTk0QkY0IiwicHJv\r\ncGVydGllcyI6eyJvdmVycmlkZWlkIjoiIiwibmFtZSI6IuW8gOWniyIsImRvY3VtZW50YXRpb24i\r\nOiIiLCJleGVjdXRpb25saXN0ZW5lcnMiOiIiLCJpbml0aWF0b3IiOiIiLCJmb3Jta2V5ZGVmaW5p\r\ndGlvbiI6IiIsImZvcm1wcm9wZXJ0aWVzIjoiIn0sInN0ZW5jaWwiOnsiaWQiOiJTdGFydE5vbmVF\r\ndmVudCJ9LCJjaGlsZFNoYXBlcyI6W10sIm91dGdvaW5nIjpbeyJyZXNvdXJjZUlkIjoic2lkLTJG\r\nRDhBRDFBLUZGQjQtNDk5MC1CNjJELUE5RTMxNzhBQUJGMCJ9XSwiYm91bmRzIjp7Imxvd2VyUmln\r\naHQiOnsieCI6NzcuMzE3NzMwOTMyOTA5MDksInkiOjQwMy4wNjgwMzA3MjE1ODU4fSwidXBwZXJM\r\nZWZ0Ijp7IngiOjQ3LjMxNzczMDkzMjkwOTA4LCJ5IjozNzMuMDY4MDMwNzIxNTg1OH19LCJkb2Nr\r\nZXJzIjpbXX0seyJyZXNvdXJjZUlkIjoic2lkLTRDOENDNjBELTBGQjctNDM0RS05RjE0LTc2REIw\r\nQzA4MEFFQiIsInByb3BlcnRpZXMiOnsib3ZlcnJpZGVpZCI6IiIsIm5hbWUiOiLlkK/liqjmtYHn\r\nqIsiLCJkb2N1bWVudGF0aW9uIjoiIiwiYXN5bmNocm9ub3VzZGVmaW5pdGlvbiI6ImZhbHNlIiwi\r\nZXhjbHVzaXZlZGVmaW5pdGlvbiI6ImZhbHNlIiwiZXhlY3V0aW9ubGlzdGVuZXJzIjoiIiwibXVs\r\ndGlpbnN0YW5jZV90eXBlIjoiTm9uZSIsIm11bHRpaW5zdGFuY2VfY2FyZGluYWxpdHkiOiIiLCJt\r\ndWx0aWluc3RhbmNlX2NvbGxlY3Rpb24iOiIiLCJtdWx0aWluc3RhbmNlX3ZhcmlhYmxlIjoiIiwi\r\nbXVsdGlpbnN0YW5jZV9jb25kaXRpb24iOiIiLCJpc2ZvcmNvbXBlbnNhdGlvbiI6ImZhbHNlIiwi\r\ndXNlcnRhc2thc3NpZ25tZW50Ijp7ImFzc2lnbm1lbnQiOnsiYXNzaWduZWUiOiIke2lucHV0VXNl\r\ncn0ifX0sImZvcm1rZXlkZWZpbml0aW9uIjoiIiwiZHVlZGF0ZWRlZmluaXRpb24iOiIiLCJwcmlv\r\ncml0eWRlZmluaXRpb24iOiIiLCJmb3JtcHJvcGVydGllcyI6IiIsInRhc2tsaXN0ZW5lcnMiOiIi\r\nfSwic3RlbmNpbCI6eyJpZCI6IlVzZXJUYXNrIn0sImNoaWxkU2hhcGVzIjpbXSwib3V0Z29pbmci\r\nOlt7InJlc291cmNlSWQiOiJzaWQtOTJBMjZFRDItMkVGRC00RkVGLTgxMEMtNTEwNkVCMDc2ODQ4\r\nIn1dLCJib3VuZHMiOnsibG93ZXJSaWdodCI6eyJ4IjoyNTIuMTQ4NjA3Nzc1NDg1NDYsInkiOjQy\r\nOC4wNjgwMzA3MjE1ODU4fSwidXBwZXJMZWZ0Ijp7IngiOjE1Mi4xNDg2MDc3NzU0ODU0NiwieSI6\r\nMzQ4LjA2ODAzMDcyMTU4NTh9fSwiZG9ja2VycyI6W119LHsicmVzb3VyY2VJZCI6InNpZC0yRkQ4\r\nQUQxQS1GRkI0LTQ5OTAtQjYyRC1BOUUzMTc4QUFCRjAiLCJwcm9wZXJ0aWVzIjp7Im92ZXJyaWRl\r\naWQiOiIiLCJuYW1lIjoiIiwiZG9jdW1lbnRhdGlvbiI6IiIsImNvbmRpdGlvbnNlcXVlbmNlZmxv\r\ndyI6IiIsImV4ZWN1dGlvbmxpc3RlbmVycyI6IiIsImRlZmF1bHRmbG93IjoiZmFsc2UifSwic3Rl\r\nbmNpbCI6eyJpZCI6IlNlcXVlbmNlRmxvdyJ9LCJjaGlsZFNoYXBlcyI6W10sIm91dGdvaW5nIjpb\r\neyJyZXNvdXJjZUlkIjoic2lkLTRDOENDNjBELTBGQjctNDM0RS05RjE0LTc2REIwQzA4MEFFQiJ9\r\nXSwiYm91bmRzIjp7Imxvd2VyUmlnaHQiOnsieCI6MTUxLjk4OTMxNTEzNTUxNzIsInkiOjM4OC4w\r\nNjgwMzA3MjE1ODU4fSwidXBwZXJMZWZ0Ijp7IngiOjc3LjUxOTMwNDM2MjIzMzI0LCJ5IjozODgu\r\nMDY4MDMwNzIxNTg1OH19LCJkb2NrZXJzIjpbeyJ4IjoxNS4wMDAwMDAwMDAwMDAwMDQsInkiOjE1\r\nfSx7IngiOjUwLCJ5Ijo0MH1dLCJ0YXJnZXQiOnsicmVzb3VyY2VJZCI6InNpZC00QzhDQzYwRC0w\r\nRkI3LTQzNEUtOUYxNC03NkRCMEMwODBBRUIifX0seyJyZXNvdXJjZUlkIjoic2lkLTNFMTMxNjNC\r\nLTM0MjMtNDJGMS1CRTEwLTdFNjM0MTdFOUJENiIsInByb3BlcnRpZXMiOnsib3ZlcnJpZGVpZCI6\r\nIiIsIm5hbWUiOiLpg6jpl6jlrqHmibkiLCJkb2N1bWVudGF0aW9uIjoiIiwiYXN5bmNocm9ub3Vz\r\nZGVmaW5pdGlvbiI6ImZhbHNlIiwiZXhjbHVzaXZlZGVmaW5pdGlvbiI6ImZhbHNlIiwiZXhlY3V0\r\naW9ubGlzdGVuZXJzIjp7ImV4ZWN1dGlvbkxpc3RlbmVycyI6W3siZXZlbnQiOiJzdGFydCIsImlt\r\ncGxlbWVudGF0aW9uIjoib3JnLnhpYW9qbC5vYS5saXN0ZW5lci5MZWF2ZVRhc2tMaXN0ZW5lciIs\r\nImNsYXNzTmFtZSI6Im9yZy54aWFvamwub2EubGlzdGVuZXIuTGVhdmVUYXNrTGlzdGVuZXIiLCJl\r\neHByZXNzaW9uIjoiIiwiZGVsZWdhdGVFeHByZXNzaW9uIjoiIn1dfSwibXVsdGlpbnN0YW5jZV90\r\neXBlIjoiTm9uZSIsIm11bHRpaW5zdGFuY2VfY2FyZGluYWxpdHkiOiIiLCJtdWx0aWluc3RhbmNl\r\nX2NvbGxlY3Rpb24iOiIiLCJtdWx0aWluc3RhbmNlX3ZhcmlhYmxlIjoiIiwibXVsdGlpbnN0YW5j\r\nZV9jb25kaXRpb24iOiIiLCJpc2ZvcmNvbXBlbnNhdGlvbiI6ImZhbHNlIiwidXNlcnRhc2thc3Np\r\nZ25tZW50IjoiIiwiZm9ybWtleWRlZmluaXRpb24iOiIiLCJkdWVkYXRlZGVmaW5pdGlvbiI6IiIs\r\nInByaW9yaXR5ZGVmaW5pdGlvbiI6IiIsImZvcm1wcm9wZXJ0aWVzIjoiIiwidGFza2xpc3RlbmVy\r\ncyI6IiJ9LCJzdGVuY2lsIjp7ImlkIjoiVXNlclRhc2sifSwiY2hpbGRTaGFwZXMiOltdLCJvdXRn\r\nb2luZyI6W3sicmVzb3VyY2VJZCI6InNpZC0xQUIxQzUxNi1FNzZCLTRDMDEtOTg0RC0yNTZFQTc0\r\nMEQyMzkifV0sImJvdW5kcyI6eyJsb3dlclJpZ2h0Ijp7IngiOjQzOS45Mzg0Mjg4ODE5MDQ0Mywi\r\neSI6NDI4LjA2ODAzMDcyMTU4NTd9LCJ1cHBlckxlZnQiOnsieCI6MzM5LjkzODQyODg4MTkwNDQz\r\nLCJ5IjozNDguMDY4MDMwNzIxNTg1N319LCJkb2NrZXJzIjpbXX0seyJyZXNvdXJjZUlkIjoic2lk\r\nLTkyQTI2RUQyLTJFRkQtNEZFRi04MTBDLTUxMDZFQjA3Njg0OCIsInByb3BlcnRpZXMiOnsib3Zl\r\ncnJpZGVpZCI6IiIsIm5hbWUiOiIiLCJkb2N1bWVudGF0aW9uIjoiIiwiY29uZGl0aW9uc2VxdWVu\r\nY2VmbG93IjoiIiwiZXhlY3V0aW9ubGlzdGVuZXJzIjoiIiwiZGVmYXVsdGZsb3ciOiJmYWxzZSJ9\r\nLCJzdGVuY2lsIjp7ImlkIjoiU2VxdWVuY2VGbG93In0sImNoaWxkU2hhcGVzIjpbXSwib3V0Z29p\r\nbmciOlt7InJlc291cmNlSWQiOiJzaWQtM0UxMzE2M0ItMzQyMy00MkYxLUJFMTAtN0U2MzQxN0U5\r\nQkQ2In1dLCJib3VuZHMiOnsibG93ZXJSaWdodCI6eyJ4IjozMzkuMDU2NzU3NjUwNTExOTQsInki\r\nOjM4OC4wNjgwMzA3MjE1ODU3fSwidXBwZXJMZWZ0Ijp7IngiOjI1My4wMzAyNzkwMDY4NzgsInki\r\nOjM4OC4wNjgwMzA3MjE1ODU3fX0sImRvY2tlcnMiOlt7IngiOjUwLCJ5Ijo0MH0seyJ4Ijo1MCwi\r\neSI6NDB9XSwidGFyZ2V0Ijp7InJlc291cmNlSWQiOiJzaWQtM0UxMzE2M0ItMzQyMy00MkYxLUJF\r\nMTAtN0U2MzQxN0U5QkQ2In19LHsicmVzb3VyY2VJZCI6InNpZC02NjMyMjI5OS1EQTFFLTQ2MkQt\r\nQjUxQi1DOTMwQTBBMUFDNTgiLCJwcm9wZXJ0aWVzIjp7Im92ZXJyaWRlaWQiOiIiLCJuYW1lIjoi\r\nIiwiZG9jdW1lbnRhdGlvbiI6IiIsImFzeW5jaHJvbm91c2RlZmluaXRpb24iOiJmYWxzZSIsImV4\r\nY2x1c2l2ZWRlZmluaXRpb24iOiJmYWxzZSIsInNlcXVlbmNlZmxvd29yZGVyIjoiIn0sInN0ZW5j\r\naWwiOnsiaWQiOiJFeGNsdXNpdmVHYXRld2F5In0sImNoaWxkU2hhcGVzIjpbXSwib3V0Z29pbmci\r\nOlt7InJlc291cmNlSWQiOiJzaWQtN0JEODU1QjMtN0M1NC00NTdBLTlBQzUtNUM1RUYzQ0IwMDdF\r\nIn0seyJyZXNvdXJjZUlkIjoic2lkLTEwNDdDN0U4LUI2NzEtNDcyNC1BMjkxLTFBRDY2MzhGQjc0\r\nNCJ9XSwiYm91bmRzIjp7Imxvd2VyUmlnaHQiOnsieCI6NTc0LjE4ODk1OTY3MTU2NDEsInkiOjQw\r\nOC4wNjgwMzA3MjE1ODU4NH0sInVwcGVyTGVmdCI6eyJ4Ijo1MzQuMTg4OTU5NjcxNTY0MSwieSI6\r\nMzY4LjA2ODAzMDcyMTU4NTg0fX0sImRvY2tlcnMiOltdfSx7InJlc291cmNlSWQiOiJzaWQtMkUz\r\nQzBEMTMtNDYwMC00QkVGLTk1QzEtOEVDMzQ3NERCQjQwIiwicHJvcGVydGllcyI6eyJvdmVycmlk\r\nZWlkIjoiIiwibmFtZSI6IuaAu+e7j+eQhuWuoeaJuSIsImRvY3VtZW50YXRpb24iOiIiLCJhc3lu\r\nY2hyb25vdXNkZWZpbml0aW9uIjoiZmFsc2UiLCJleGNsdXNpdmVkZWZpbml0aW9uIjoiZmFsc2Ui\r\nLCJleGVjdXRpb25saXN0ZW5lcnMiOnsiZXhlY3V0aW9uTGlzdGVuZXJzIjpbeyJldmVudCI6InN0\r\nYXJ0IiwiaW1wbGVtZW50YXRpb24iOiJvcmcueGlhb2psLm9hLmxpc3RlbmVyLkxlYXZlVGFza0xp\r\nc3RlbmVyIiwiY2xhc3NOYW1lIjoib3JnLnhpYW9qbC5vYS5saXN0ZW5lci5MZWF2ZVRhc2tMaXN0\r\nZW5lciIsImV4cHJlc3Npb24iOiIiLCJkZWxlZ2F0ZUV4cHJlc3Npb24iOiIifV19LCJtdWx0aWlu\r\nc3RhbmNlX3R5cGUiOiJOb25lIiwibXVsdGlpbnN0YW5jZV9jYXJkaW5hbGl0eSI6IiIsIm11bHRp\r\naW5zdGFuY2VfY29sbGVjdGlvbiI6IiIsIm11bHRpaW5zdGFuY2VfdmFyaWFibGUiOiIiLCJtdWx0\r\naWluc3RhbmNlX2NvbmRpdGlvbiI6IiIsImlzZm9yY29tcGVuc2F0aW9uIjoiZmFsc2UiLCJ1c2Vy\r\ndGFza2Fzc2lnbm1lbnQiOiIiLCJmb3Jta2V5ZGVmaW5pdGlvbiI6IiIsImR1ZWRhdGVkZWZpbml0\r\naW9uIjoiIiwicHJpb3JpdHlkZWZpbml0aW9uIjoiIiwiZm9ybXByb3BlcnRpZXMiOiIiLCJ0YXNr\r\nbGlzdGVuZXJzIjoiIn0sInN0ZW5jaWwiOnsiaWQiOiJVc2VyVGFzayJ9LCJjaGlsZFNoYXBlcyI6\r\nW10sIm91dGdvaW5nIjpbeyJyZXNvdXJjZUlkIjoic2lkLTg2RUE5QzRELTA1MDItNEI4MC1CMjc2\r\nLUY1OTVGQUQ0OUJCOCJ9XSwiYm91bmRzIjp7Imxvd2VyUmlnaHQiOnsieCI6ODE5LjEyNDMyODE2\r\nMTcwODQsInkiOjQzNC4zMjAzNDk1MDMxOTI4fSwidXBwZXJMZWZ0Ijp7IngiOjY3OS44NzY4NTc3\r\nNjM4MDg5LCJ5IjozNDguMDY4MDMwNzIxNTg1OH19LCJkb2NrZXJzIjpbXX0seyJyZXNvdXJjZUlk\r\nIjoic2lkLTk1QkU0MUFBLUQ1QjgtNDQ2Mi1BOTQ0LTJFNjQ5MkI5NDU0QiIsInByb3BlcnRpZXMi\r\nOnsib3ZlcnJpZGVpZCI6IiIsIm5hbWUiOiIiLCJkb2N1bWVudGF0aW9uIjoiIiwiYXN5bmNocm9u\r\nb3VzZGVmaW5pdGlvbiI6ImZhbHNlIiwiZXhjbHVzaXZlZGVmaW5pdGlvbiI6ImZhbHNlIiwic2Vx\r\ndWVuY2VmbG93b3JkZXIiOiIifSwic3RlbmNpbCI6eyJpZCI6IkV4Y2x1c2l2ZUdhdGV3YXkifSwi\r\nY2hpbGRTaGFwZXMiOltdLCJvdXRnb2luZyI6W3sicmVzb3VyY2VJZCI6InNpZC0wNDM5MURBOC0x\r\nNzQ2LTRERDYtOUM0Ni0zQzk5QUFEQTY4MTAifSx7InJlc291cmNlSWQiOiJzaWQtNjhGQzQ0QkQt\r\nMzRFRS00OTlCLUI4OTQtODJGNDM1NjVFNEREIn1dLCJib3VuZHMiOnsibG93ZXJSaWdodCI6eyJ4\r\nIjo5MzguNDA4NzA0OTAyMTc1OSwieSI6NDA4LjA2ODAzMDcyMTU4NTh9LCJ1cHBlckxlZnQiOnsi\r\neCI6ODk4LjQwODcwNDkwMjE3NTksInkiOjM2OC4wNjgwMzA3MjE1ODU4fX0sImRvY2tlcnMiOltd\r\nfSx7InJlc291cmNlSWQiOiJzaWQtNjlDOUYwMjUtQjRGMS00QTAwLThFRkMtNTIxMEREMEQwQUQw\r\nIiwicHJvcGVydGllcyI6eyJvdmVycmlkZWlkIjoiIiwibmFtZSI6Iue7k+adnyIsImRvY3VtZW50\r\nYXRpb24iOiIiLCJleGVjdXRpb25saXN0ZW5lcnMiOiIifSwic3RlbmNpbCI6eyJpZCI6IkVuZE5v\r\nbmVFdmVudCJ9LCJjaGlsZFNoYXBlcyI6W10sIm91dGdvaW5nIjpbXSwiYm91bmRzIjp7Imxvd2Vy\r\nUmlnaHQiOnsieCI6MTA3Mi4wOTY2MDI5OTQ0MjA3LCJ5Ijo0MDIuMDY4MDMwNzIxNTg1OH0sInVw\r\ncGVyTGVmdCI6eyJ4IjoxMDQ0LjA5NjYwMjk5NDQyMDcsInkiOjM3NC4wNjgwMzA3MjE1ODU4fX0s\r\nImRvY2tlcnMiOltdfSx7InJlc291cmNlSWQiOiJzaWQtMUFCMUM1MTYtRTc2Qi00QzAxLTk4NEQt\r\nMjU2RUE3NDBEMjM5IiwicHJvcGVydGllcyI6eyJvdmVycmlkZWlkIjoiIiwibmFtZSI6IiIsImRv\r\nY3VtZW50YXRpb24iOiIiLCJjb25kaXRpb25zZXF1ZW5jZWZsb3ciOiIiLCJleGVjdXRpb25saXN0\r\nZW5lcnMiOiIiLCJkZWZhdWx0ZmxvdyI6ImZhbHNlIn0sInN0ZW5jaWwiOnsiaWQiOiJTZXF1ZW5j\r\nZUZsb3cifSwiY2hpbGRTaGFwZXMiOltdLCJvdXRnb2luZyI6W3sicmVzb3VyY2VJZCI6InNpZC02\r\nNjMyMjI5OS1EQTFFLTQ2MkQtQjUxQi1DOTMwQTBBMUFDNTgifV0sImJvdW5kcyI6eyJsb3dlclJp\r\nZ2h0Ijp7IngiOjUzMy45NDA4NTA1OTQ2NTA4LCJ5IjozODguMDY4MDMwNzIxNTg1ODR9LCJ1cHBl\r\nckxlZnQiOnsieCI6NDQwLjM0MTkwODg0NTk4MTcsInkiOjM4OC4wNjgwMzA3MjE1ODU3fX0sImRv\r\nY2tlcnMiOlt7IngiOjUwLCJ5Ijo0MH0seyJ4IjoyMCwieSI6MjB9XSwidGFyZ2V0Ijp7InJlc291\r\ncmNlSWQiOiJzaWQtNjYzMjIyOTktREExRS00NjJELUI1MUItQzkzMEEwQTFBQzU4In19LHsicmVz\r\nb3VyY2VJZCI6InNpZC02OEZDNDRCRC0zNEVFLTQ5OUItQjg5NC04MkY0MzU2NUU0REQiLCJwcm9w\r\nZXJ0aWVzIjp7Im92ZXJyaWRlaWQiOiIiLCJuYW1lIjoi5a6h5om55LiN6YCa6L+HIiwiZG9jdW1l\r\nbnRhdGlvbiI6IiIsImNvbmRpdGlvbnNlcXVlbmNlZmxvdyI6IiIsImV4ZWN1dGlvbmxpc3RlbmVy\r\ncyI6IiIsImRlZmF1bHRmbG93IjoiZmFsc2UifSwic3RlbmNpbCI6eyJpZCI6IlNlcXVlbmNlRmxv\r\ndyJ9LCJjaGlsZFNoYXBlcyI6W10sIm91dGdvaW5nIjpbeyJyZXNvdXJjZUlkIjoic2lkLTRDOEND\r\nNjBELTBGQjctNDM0RS05RjE0LTc2REIwQzA4MEFFQiJ9XSwiYm91bmRzIjp7Imxvd2VyUmlnaHQi\r\nOnsieCI6OTE4LjkwODcwNDkwMjE3NTksInkiOjQ3Ny4zMjg1MzM0MzIyMzkzNH0sInVwcGVyTGVm\r\ndCI6eyJ4IjoyMDIuMTQ4NjA3Nzc1NDg1NDYsInkiOjQwOC45ODQzOTA2ODk1NDEyfX0sImRvY2tl\r\ncnMiOlt7IngiOjIwLjUsInkiOjIwLjV9LHsieCI6OTE4LjkwODcwNDkwMjE3NTksInkiOjQ3Ny4z\r\nMjg1MzM0MzIyMzkzNH0seyJ4IjoyMDIuMTQ4NjA3Nzc1NDg1NDYsInkiOjQ3Ny4zMjg1MzM0MzIy\r\nMzkzNH0seyJ4Ijo1MCwieSI6NDB9XSwidGFyZ2V0Ijp7InJlc291cmNlSWQiOiJzaWQtNEM4Q0M2\r\nMEQtMEZCNy00MzRFLTlGMTQtNzZEQjBDMDgwQUVCIn19LHsicmVzb3VyY2VJZCI6InNpZC0xMDQ3\r\nQzdFOC1CNjcxLTQ3MjQtQTI5MS0xQUQ2NjM4RkI3NDQiLCJwcm9wZXJ0aWVzIjp7Im92ZXJyaWRl\r\naWQiOiIiLCJuYW1lIjoi5a6h5om56YCa6L+HIiwiZG9jdW1lbnRhdGlvbiI6IiIsImNvbmRpdGlv\r\nbnNlcXVlbmNlZmxvdyI6IiIsImV4ZWN1dGlvbmxpc3RlbmVycyI6IiIsImRlZmF1bHRmbG93Ijoi\r\nZmFsc2UifSwic3RlbmNpbCI6eyJpZCI6IlNlcXVlbmNlRmxvdyJ9LCJjaGlsZFNoYXBlcyI6W10s\r\nIm91dGdvaW5nIjpbeyJyZXNvdXJjZUlkIjoic2lkLTJFM0MwRDEzLTQ2MDAtNEJFRi05NUMxLThF\r\nQzM0NzREQkI0MCJ9XSwiYm91bmRzIjp7Imxvd2VyUmlnaHQiOnsieCI6Njc5LjI1MTIzNjA0MDkx\r\nODMsInkiOjM5MC4yNDcxOTMyMzUxNDJ9LCJ1cHBlckxlZnQiOnsieCI6NTczLjk1MjQ1OTQ0Mjk3\r\nNDYsInkiOjM4OC44Mjc3MTI0NDU3NzEzfX0sImRvY2tlcnMiOlt7IngiOjIwLjUsInkiOjIwLjUw\r\nMDAwMDAwMDAwMDAzMn0seyJ4Ijo2OS42MjM3MzUxOTg5NDk3NiwieSI6NDMuMTI2MTU5MzkwODAz\r\nNX1dLCJ0YXJnZXQiOnsicmVzb3VyY2VJZCI6InNpZC0yRTNDMEQxMy00NjAwLTRCRUYtOTVDMS04\r\nRUMzNDc0REJCNDAifX0seyJyZXNvdXJjZUlkIjoic2lkLTA0MzkxREE4LTE3NDYtNERENi05QzQ2\r\nLTNDOTlBQURBNjgxMCIsInByb3BlcnRpZXMiOnsib3ZlcnJpZGVpZCI6IiIsIm5hbWUiOiLlrqHm\r\nibnpgJrov4ciLCJkb2N1bWVudGF0aW9uIjoiIiwiY29uZGl0aW9uc2VxdWVuY2VmbG93IjoiIiwi\r\nZXhlY3V0aW9ubGlzdGVuZXJzIjoiIiwiZGVmYXVsdGZsb3ciOiJmYWxzZSJ9LCJzdGVuY2lsIjp7\r\nImlkIjoiU2VxdWVuY2VGbG93In0sImNoaWxkU2hhcGVzIjpbXSwib3V0Z29pbmciOlt7InJlc291\r\ncmNlSWQiOiJzaWQtNjlDOUYwMjUtQjRGMS00QTAwLThFRkMtNTIxMEREMEQwQUQwIn1dLCJib3Vu\r\nZHMiOnsibG93ZXJSaWdodCI6eyJ4IjoxMDQ0LjA0Nzc0NDAwMDM5OSwieSI6Mzg4LjQ5ODAzMjIy\r\nODQzMjV9LCJ1cHBlckxlZnQiOnsieCI6OTM4LjM5NDU5MTE2NTQyNTksInkiOjM4OC4xMTg0OTc5\r\nNjQ3MzkwNX19LCJkb2NrZXJzIjpbeyJ4IjoyMC41LCJ5IjoyMC41fSx7IngiOjE0LCJ5IjoxNH1d\r\nLCJ0YXJnZXQiOnsicmVzb3VyY2VJZCI6InNpZC02OUM5RjAyNS1CNEYxLTRBMDAtOEVGQy01MjEw\r\nREQwRDBBRDAifX0seyJyZXNvdXJjZUlkIjoic2lkLTg2RUE5QzRELTA1MDItNEI4MC1CMjc2LUY1\r\nOTVGQUQ0OUJCOCIsInByb3BlcnRpZXMiOnsib3ZlcnJpZGVpZCI6IiIsIm5hbWUiOiIiLCJkb2N1\r\nbWVudGF0aW9uIjoiIiwiY29uZGl0aW9uc2VxdWVuY2VmbG93IjoiIiwiZXhlY3V0aW9ubGlzdGVu\r\nZXJzIjoiIiwiZGVmYXVsdGZsb3ciOiJmYWxzZSJ9LCJzdGVuY2lsIjp7ImlkIjoiU2VxdWVuY2VG\r\nbG93In0sImNoaWxkU2hhcGVzIjpbXSwib3V0Z29pbmciOlt7InJlc291cmNlSWQiOiJzaWQtOTVC\r\nRTQxQUEtRDVCOC00NDYyLUE5NDQtMkU2NDkyQjk0NTRCIn1dLCJib3VuZHMiOnsibG93ZXJSaWdo\r\ndCI6eyJ4Ijo4OTguMDU2MzExOTE4MTUzNSwieSI6MzkwLjExMTgxMjc1MjY0ODl9LCJ1cHBlckxl\r\nZnQiOnsieCI6ODE5LjMyMjUxODMwNDI2ODgsInkiOjM4OC44OTEyODM4ODI0MjJ9fSwiZG9ja2Vy\r\ncyI6W3sieCI6NjkuNjIzNzM1MTk4OTQ5NzYsInkiOjQzLjEyNjE1OTM5MDgwMzV9LHsieCI6MjAu\r\nNSwieSI6MjAuNX1dLCJ0YXJnZXQiOnsicmVzb3VyY2VJZCI6InNpZC05NUJFNDFBQS1ENUI4LTQ0\r\nNjItQTk0NC0yRTY0OTJCOTQ1NEIifX0seyJyZXNvdXJjZUlkIjoic2lkLTdCRDg1NUIzLTdDNTQt\r\nNDU3QS05QUM1LTVDNUVGM0NCMDA3RSIsInByb3BlcnRpZXMiOnsib3ZlcnJpZGVpZCI6IiIsIm5h\r\nbWUiOiLlrqHmibnkuI3pgJrov4ciLCJkb2N1bWVudGF0aW9uIjoiIiwiY29uZGl0aW9uc2VxdWVu\r\nY2VmbG93IjoiIiwiZXhlY3V0aW9ubGlzdGVuZXJzIjoiIiwiZGVmYXVsdGZsb3ciOiJmYWxzZSIs\r\nInNob3dkaWFtb25kbWFya2VyIjpmYWxzZX0sInN0ZW5jaWwiOnsiaWQiOiJTZXF1ZW5jZUZsb3ci\r\nfSwiY2hpbGRTaGFwZXMiOltdLCJvdXRnb2luZyI6W3sicmVzb3VyY2VJZCI6InNpZC00QzhDQzYw\r\nRC0wRkI3LTQzNEUtOUYxNC03NkRCMEMwODBBRUIifV0sImJvdW5kcyI6eyJsb3dlclJpZ2h0Ijp7\r\nIngiOjU1NC42ODg5NTk2NzE1NjQxLCJ5IjozNjcuMTg2MjE5Mjg5NjY1Nn0sInVwcGVyTGVmdCI6\r\neyJ4IjoyMDUuODYwODk4MTQyMzI3OCwieSI6MjQzLjYzMDcwNDk4MzQ4NTk3fX0sImRvY2tlcnMi\r\nOlt7IngiOjIwLjUsInkiOjIwLjUwMDAwMDAwMDAwMDAzMn0seyJ4Ijo1NTQuNjg4OTU5NjcxNTY0\r\nMSwieSI6MjQzLjYzMDcwNDk4MzQ4NTk3fSx7IngiOjUwLCJ5IjoxfV0sInRhcmdldCI6eyJyZXNv\r\ndXJjZUlkIjoic2lkLTRDOENDNjBELTBGQjctNDM0RS05RjE0LTc2REIwQzA4MEFFQiJ9fV0sImJv\r\ndW5kcyI6eyJsb3dlclJpZ2h0Ijp7IngiOjEyMDAsInkiOjEwNTB9LCJ1cHBlckxlZnQiOnsieCI6\r\nMCwieSI6MH19LCJzdGVuY2lsc2V0Ijp7InVybCI6InN0ZW5jaWxzZXRzL2JwbW4yLjAvYnBtbjIu\r\nMC5qc29uIiwibmFtZXNwYWNlIjoiaHR0cDovL2IzbW4ub3JnL3N0ZW5jaWxzZXQvYnBtbjIuMCMi\r\nfSwic3NleHRlbnNpb25zIjpbXX0=',NULL),('5001',1,'source-extra',NULL,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\02\0\0\02\0\0\0?ˆ±\0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€è\0\0u0\0\0ê`\0\0:˜\0\0pœºQ<\0\0\0gAMA\0\0±Ž|ûQ“\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0\0 IDATxÚíÁ\0\0\0‚ ÿ¯nH@\0\0\0\0\0\0\0\0À£\'B\0ü¦•þ\0\0\0\0IEND®B`‚',NULL),('5003',1,'è¯·å‡æµç¨‹001.bpmn20.xml','5002','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"LeaveBill\" name=\"leaveBillProcess\" isExecutable=\"true\">\n    <startEvent id=\"sid-2F4297F0-7C71-43B0-A6E0-4DAF19994BF4\" name=\"å¼€å§‹\"></startEvent>\n    <userTask id=\"sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB\" name=\"å¯åŠ¨æµç¨‹\" activiti:assignee=\"${inputUser}\"></userTask>\n    <sequenceFlow id=\"sid-2FD8AD1A-FFB4-4990-B62D-A9E3178AABF0\" sourceRef=\"sid-2F4297F0-7C71-43B0-A6E0-4DAF19994BF4\" targetRef=\"sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB\"></sequenceFlow>\n    <userTask id=\"sid-3E13163B-3423-42F1-BE10-7E63417E9BD6\" name=\"éƒ¨é—¨å®¡æ‰¹\">\n      <extensionElements>\n        <activiti:executionListener event=\"start\" class=\"org.xiaojl.oa.listener.LeaveTaskListener\"></activiti:executionListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-92A26ED2-2EFD-4FEF-810C-5106EB076848\" sourceRef=\"sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB\" targetRef=\"sid-3E13163B-3423-42F1-BE10-7E63417E9BD6\"></sequenceFlow>\n    <exclusiveGateway id=\"sid-66322299-DA1E-462D-B51B-C930A0A1AC58\"></exclusiveGateway>\n    <userTask id=\"sid-2E3C0D13-4600-4BEF-95C1-8EC3474DBB40\" name=\"æ€»ç»ç†å®¡æ‰¹\">\n      <extensionElements>\n        <activiti:executionListener event=\"start\" class=\"org.xiaojl.oa.listener.LeaveTaskListener\"></activiti:executionListener>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway id=\"sid-95BE41AA-D5B8-4462-A944-2E6492B9454B\"></exclusiveGateway>\n    <endEvent id=\"sid-69C9F025-B4F1-4A00-8EFC-5210DD0D0AD0\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-1AB1C516-E76B-4C01-984D-256EA740D239\" sourceRef=\"sid-3E13163B-3423-42F1-BE10-7E63417E9BD6\" targetRef=\"sid-66322299-DA1E-462D-B51B-C930A0A1AC58\"></sequenceFlow>\n    <sequenceFlow id=\"sid-68FC44BD-34EE-499B-B894-82F43565E4DD\" name=\"å®¡æ‰¹ä¸é€šè¿‡\" sourceRef=\"sid-95BE41AA-D5B8-4462-A944-2E6492B9454B\" targetRef=\"sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB\"></sequenceFlow>\n    <sequenceFlow id=\"sid-1047C7E8-B671-4724-A291-1AD6638FB744\" name=\"å®¡æ‰¹é€šè¿‡\" sourceRef=\"sid-66322299-DA1E-462D-B51B-C930A0A1AC58\" targetRef=\"sid-2E3C0D13-4600-4BEF-95C1-8EC3474DBB40\"></sequenceFlow>\n    <sequenceFlow id=\"sid-04391DA8-1746-4DD6-9C46-3C99AADA6810\" name=\"å®¡æ‰¹é€šè¿‡\" sourceRef=\"sid-95BE41AA-D5B8-4462-A944-2E6492B9454B\" targetRef=\"sid-69C9F025-B4F1-4A00-8EFC-5210DD0D0AD0\"></sequenceFlow>\n    <sequenceFlow id=\"sid-86EA9C4D-0502-4B80-B276-F595FAD49BB8\" sourceRef=\"sid-2E3C0D13-4600-4BEF-95C1-8EC3474DBB40\" targetRef=\"sid-95BE41AA-D5B8-4462-A944-2E6492B9454B\"></sequenceFlow>\n    <sequenceFlow id=\"sid-7BD855B3-7C54-457A-9AC5-5C5EF3CB007E\" name=\"å®¡æ‰¹ä¸é€šè¿‡\" sourceRef=\"sid-66322299-DA1E-462D-B51B-C930A0A1AC58\" targetRef=\"sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_LeaveBill\">\n    <bpmndi:BPMNPlane bpmnElement=\"LeaveBill\" id=\"BPMNPlane_LeaveBill\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-2F4297F0-7C71-43B0-A6E0-4DAF19994BF4\" id=\"BPMNShape_sid-2F4297F0-7C71-43B0-A6E0-4DAF19994BF4\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.000000000000007\" x=\"47.31773093290908\" y=\"373.0680307215858\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB\" id=\"BPMNShape_sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"152.14860777548546\" y=\"348.0680307215858\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-3E13163B-3423-42F1-BE10-7E63417E9BD6\" id=\"BPMNShape_sid-3E13163B-3423-42F1-BE10-7E63417E9BD6\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"339.93842888190443\" y=\"348.0680307215857\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-66322299-DA1E-462D-B51B-C930A0A1AC58\" id=\"BPMNShape_sid-66322299-DA1E-462D-B51B-C930A0A1AC58\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"534.1889596715641\" y=\"368.06803072158584\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-2E3C0D13-4600-4BEF-95C1-8EC3474DBB40\" id=\"BPMNShape_sid-2E3C0D13-4600-4BEF-95C1-8EC3474DBB40\">\n        <omgdc:Bounds height=\"86.25231878160702\" width=\"139.24747039789952\" x=\"679.8768577638089\" y=\"348.0680307215858\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-95BE41AA-D5B8-4462-A944-2E6492B9454B\" id=\"BPMNShape_sid-95BE41AA-D5B8-4462-A944-2E6492B9454B\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"898.4087049021759\" y=\"368.0680307215858\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-69C9F025-B4F1-4A00-8EFC-5210DD0D0AD0\" id=\"BPMNShape_sid-69C9F025-B4F1-4A00-8EFC-5210DD0D0AD0\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"1044.0966029944207\" y=\"374.0680307215858\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1047C7E8-B671-4724-A291-1AD6638FB744\" id=\"BPMNEdge_sid-1047C7E8-B671-4724-A291-1AD6638FB744\">\n        <omgdi:waypoint x=\"573.4362368886183\" y=\"388.82075350453164\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"679.8768577638089\" y=\"390.25562693252914\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-04391DA8-1746-4DD6-9C46-3C99AADA6810\" id=\"BPMNEdge_sid-04391DA8-1746-4DD6-9C46-3C99AADA6810\">\n        <omgdi:waypoint x=\"937.9772040295741\" y=\"388.49953159418766\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1044.0966933241882\" y=\"388.11832212573125\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7BD855B3-7C54-457A-9AC5-5C5EF3CB007E\" id=\"BPMNEdge_sid-7BD855B3-7C54-457A-9AC5-5C5EF3CB007E\">\n        <omgdi:waypoint x=\"554.6889596715641\" y=\"368.56803072158584\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"554.6889596715641\" y=\"243.63070498348597\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"205.49220881456878\" y=\"348.0680307215858\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-86EA9C4D-0502-4B80-B276-F595FAD49BB8\" id=\"BPMNEdge_sid-86EA9C4D-0502-4B80-B276-F595FAD49BB8\">\n        <omgdi:waypoint x=\"819.1243281617084\" y=\"390.11488509020165\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"899.2140114402857\" y=\"388.8733372596956\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1AB1C516-E76B-4C01-984D-256EA740D239\" id=\"BPMNEdge_sid-1AB1C516-E76B-4C01-984D-256EA740D239\">\n        <omgdi:waypoint x=\"439.93842888190443\" y=\"388.0680307215858\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"534.1889596715641\" y=\"388.06803072158584\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2FD8AD1A-FFB4-4990-B62D-A9E3178AABF0\" id=\"BPMNEdge_sid-2FD8AD1A-FFB4-4990-B62D-A9E3178AABF0\">\n        <omgdi:waypoint x=\"77.31773093290909\" y=\"388.0680307215858\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"152.14860777548546\" y=\"388.0680307215858\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-92A26ED2-2EFD-4FEF-810C-5106EB076848\" id=\"BPMNEdge_sid-92A26ED2-2EFD-4FEF-810C-5106EB076848\">\n        <omgdi:waypoint x=\"252.14860777548546\" y=\"388.0680307215858\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"339.93842888190443\" y=\"388.0680307215857\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-68FC44BD-34EE-499B-B894-82F43565E4DD\" id=\"BPMNEdge_sid-68FC44BD-34EE-499B-B894-82F43565E4DD\">\n        <omgdi:waypoint x=\"918.9087049021759\" y=\"407.5680307215858\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"918.9087049021759\" y=\"477.32853343223934\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"202.14860777548546\" y=\"477.32853343223934\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"202.14860777548546\" y=\"428.0680307215858\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('5004',1,'è¯·å‡æµç¨‹001.LeaveBill.png','5002','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0:\0\0ç\0\0\0Yµ=ï\0\0.IDATxÚíÝœ\\ey0ðpSQñ~Ãh-õBýÔz­Õn­­¤’âÙ3g6›,Vî )²^PA%€¥­à\r«¢¥à%µ Ü¡\\PŠ(\n\n„K\"¤ˆ\n:ßóì7“oØì&›d/³³ÿÿï÷üf2³»Ù¼yç™ç}æ=çÌ™\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0À:<Ê(\0\0\0\03ZY–¯­ªêäZ­ÖÐì\0\0\0\0fœþþþÇÔjµÁ²,·×UUõîlt\0\0\0`Æ¨ªê%µZíŸ\"îŠ8=þüwñð&ùœF\0\0\0ÐñŠ¢xDY–µªª.¨Õj·FÅcÏ\Zùu\Z\0\0\0@Çª×ëÛÔjµDÜqvY–oïééÙ|¬¯×è\0\0\0\0:ÊÐÐÐ¦µZí­ÿ±2â˜²,·Ï÷jt\0\0\0\0¡¿¿ÿieY¾·V«Ýñ½ˆ¢(¶\\ŸŸ¡Ñ\0\0\0L«Z­ö†ˆ¯DÜ]–åI¯ØˆŸ¥Ñ\0\0\0L­¾¾¾ÇÕjµ}\"®‰øIÄþEQ<~c®F\0\0\00eêõúËjµÚ§s÷FÄ×\"z&òçkt\0\0\0\0“j``àQµZ­?â’ˆ_–eyXQÏ˜Œ¿K£\0\0\0˜EQ¼ V«}<bEÄUU5/Ûl2ÿN\0\0\0`Âd#£ªªjµÚw\"î,Ëò¨z½þü©úû5:\0\0\0€¶`Á‚­Ë²|­V»%â¿ã~ßÜ¹s9Õ¿‡F\0\0\0°ÁªªzS­V;µyrÑîëëûóéü}4:\0\0\0€õR¯×ŸXUÕ?­Õjÿ±çüùó·ê„ßM£\0\0\0—²,_UUÕçr÷FÜ~©··÷õö;jt\0\0\0\0cš7oÞ£kµÚnWDÜPUÕ{\"žÒ©¿¯F\0\0\0°†ªª^ql­VûUÄ7ãþñð&þ{kt\0\0\0\0Ã·(Ë²¨ªêÜZ­v[Ü~¸(ŠçÎ¤ƒF\0\0\0ÌrµZí9ÊæFÄyUUõfÓc†þ[4:\0\0\0`Ú¤^¯¿¥V«}£yxÊqeY¾h¦ÿ£4:\0\0\0`É‰–eyp­Vûyó£»ç	G»åß§Ñ\0\0\0³@­VûËˆ+ËrUÜ~¾^¯¿ºKÿ\Z\0\0\0ÐŠ¢xlUUïŒÅÿU?‹xW½^b7ÿ›5:\0\0\0 Ë”e¹}Ä	±è¿+nÿ#nÿvÎ¸4ìDÐè\0\0\0€.PÅ#b‘_¸(â–²,ß·Ïœmã Ñ\0\0\03XQÏ‹ÅýÇ\"îŒønÄÎñØf³u<4:\0\0\0`†\Z\ZÚ´,Ë#¾ûqû‰¢(^`d4:\0\0\0`Æ¨ªêé±_Ä/\".-ËráÀÀÀ£ŒÌÿ§Ñ\0\0\0®ªª¿ŽüW#îŽ81âåFet\Z\0\0\0ÐŠ¢x|UUûEü8ï×”e¹o__ßãŒÌÚit\0\0\0@g-Ô_ÞÜµqwUU§ôöö¾Ñ¨¬×øit\0\0\0ÀtÊólTUµ(é—åù7âþ¡ýýýO32ëO£\0\0\0¦I½^ÿÓªª>‹ó•y•¼’J^QÅÈl8\0\0\0˜B===›Çb|çªªÎŠÛ;âö£q»­‘™\Z\0\0\005ðgFqkÄ…U(ŠâFfÂÇY£\0\0\0&É&½½½oŽÅ÷iw•eyBÄö†eòht\0\0\0À+ŠâIeY‹îë\"®ªªêñØcÌäÓè\0\0\0€	R¯×_íÏ—e¹*n¿XUÕëŒÊÔÒè\0\0\0€0oÞ¼GWUµ8ØWFü<bÉÂ…Ÿld¦‡F\0\0\0l€²,_q|,¬ñz½þ–xx#3½4:\0\0\0`œ·ˆ…tq~Äòˆöõõ=ÛÈt\0\0\0X‡¢(ž[UÕ‡c}{Ä9ïèééÙÜÈt\0\0\0ÅÐÐÐ¦eYÎøVž·K‹¢ø3#ÓÙ4:\0\0\0 MQOÅò!7F\\±[<¶¥‘™4:\0\0\0 ôöö¾>É_Ž¸;â³¯4*3F\0\0\0³Öüùó·*Ër¯ˆ«c|mÜ000ð#3sit\0\0\00ëTUõÒXÿKs÷Æ©½½½cTºƒF\0\0\0³ÂÜ¹sYUÕ‚X_qsÄá,ØÚÈt\0\0\0ºZ½^~Y–GÅøÎ¸=3âmEQlfdº“F\0\0\0]\'±àqFÄŠªªŽ.ËòOŒL÷Óè\0\0\0 kEñŒXèþcóÐ”K\"úó#3{ht\0\0\0Ð\r‹Ûžªªþ=O.Z–å¿Fü£2kç‚F\0\0\03O^6µûçea#~TUÕÞy¹X#3»it\0\0\00£Ôëõ¿ˆÅìgš—†ýrUUeThÑè\0\0\0 ãE±eY–»Æ\"öû7Åý÷ÆcO52Œ¤Ñ\0\0@Ç*Ër»X¸±2bY½^ÿ‡¡¡¡McÑè\0\0\0 £ôôôl^UÕ.±`=;âöˆ#ëõú6F†ñÐè\0\0\0 #ôõõ=»ªªÄBuyÜ^·åàààF†õ¡Ñ\0\0ÀtÚ¤,Ë¿øz,PïŠøTQ/6,l(\0\0\0¦ÜÂ…Ÿ\\UÕ»cQz}Ä\"öèïïŒ‘acit\0\0\00eÊ²|mUU\'ÇíªX~!â5F…‰¤Ñ\0\0À¤Ê\Z±ø,Ëò‡q{]îä(ŠâIF†É Ñ\0\0À¤¨ªê%±èü§æ¹7N?ÿ]<¼‰‘a2it\0\0\00aŠ¢xDY–µæUSnŠÇžed˜*\Z\0\0\0l´z½¾M,0?qGÄÙeY¾½§§gs#ÃTÓè\0\0\0`ƒ\r\rm\Z‹Ê·FügÄÊˆcÊ²ÜÎÈ04:\0\0\0X/ýýýO+Ëò½± ¼)â{EQlidè\Z\0\0\0Œwù†ˆ¯DÜ]–åI¯0*tà<Õè\0\0\0`t}}}‹…ã>×Dü$bÿ¢(odèT\Z\0\0\0¬¡^¯¿,ŒŸÎÝ_‹è1*Ì\Z\0\0\0xT,û#.‰øeY–‡Eñ#ÃL¢Ñ\0\00ËEñ‚X~<bEÄUU5/ÛÌÈ0it\0\0\0ÌBÙÈ¨ªj§X~\'âÎ²,ª×ëÏ72Ìt\Z\0\0\0³È‚¶.Ëòý±¼%â¿ã~ßÜ¹sidè\Z\0\0\0³@UUoŠà©Í“‹þs__ßŸº‘F\0\0@—ª×ëO¬ªêÀˆŸÆâï\"öœ?þVF†n¦Ñ\0\0ÐeÊ²|UUUŸËÝqû¥ÞÞÞ×f\0\0€.0oÞ¼GÇo·ˆ+\"n¨ªê=O12Ì6\Z\0\0\03XUU/Œ86w¿ŠøfÜß!ÞÄÈ0[it\0\0\0Ì0ƒƒƒ[”eYTUun,ên‹ÛEñ\\#\Z\0\0\03i÷œˆes#â¼ªªz³éadàa¯\0\0€¶I½^K,Þ¾Ñ<<å¸²,_dX`t\Z\0\0\0(O$Z–åÁ±hûyó£»ç	G¬F\0\0@g-Òþ2âßÊ²\\·Ÿ¯×ë¯6*°^¯!\0\0€éTÅc«ªzg,Ð®ŠøYÄ»êõú¬?\0\0€iR–åö\'ÄÂì®¸ý¸ýÛ9.\rE£\0\0`\nEñˆXˆÕ#.Š¸¥,Ë÷Çí3L\0\0€)PÅóbö±ˆ;#¾±s<¶™‘‰¥Ñ\0\00I†††6-ËrÇˆoÇâkEÜ~¢(Š˜<\Z\0\0\0¬ªª§Çbë}¿ˆ¸´,Ë…220ù4:\0\0\0&HUU‹¬¯FÜqbÄË\nL-\0\0€PÅã«ªÚ/âÇ±Àº¦,Ë}ûúúgd`zht\0\0\0lØbêåÍ]wWUuJooï\ntÄkS£\0\0`<ò<UU-Š…Ôeyþ¸hÿÓŒt\0\0€u¨×ëZUÕ\'cµ2¯ ’WRÉ+ªè<\Z\0\0\0£èééÙ<L;WUuVÜÞ·Ûmt6\0\0€‡/’žqDÄ­V¡(ŠG˜1¯a\0\0`ÖÛ¤··÷Í±@:-â®²,OˆØÞ°ÀÌ£Ñ\0\0ÌZEQ<©,Ëƒbat]ÄUUU½3{¬‘™K£\0\0˜uêõú«c1ôù²,WÅí«ªzQî Ñ\0\0Ì\nóæÍ{tUU‹cteÄÏ#–,\\¸ðÉFº‹F\0\0ÐÕÊ²|QÄñ±øùUÄ7êõú[âáMŒt\'\0\0 ën‹2âüˆåìëë{¶‘î§Ñ\0@Gi4\Z›ßxã§^vÙe8çœs\Zgu–˜â8ûì³^xá¯\"Ì´ùSÅs«ªúp,tn8\'â===››ë¢Ûæ:\ZÈ§B®`†ÈBå¢‹.j¬X±¢ñÀˆiŠ•+W6.¸à‚{¢8xG§Ï™¡¡¡MË²œñ­<<%n—Eñgæºè¶¹ŽFò©ë˜òÓ…JÇœuÖY×vê\\)Šâ©± 9$âÆˆË#v‹Ç¶4×E·Íu4:O…\\À–[N½wNDAð`§Í‘ÞÞÞ×ÇBæËwG|6â•æºèÆ¹ŽFò©ëèy,¥7âŽ*:bÁ0þü­Ê²Ü+âêXÄ\\·<Á\\Ý6×Ñè@>r=\0³´XùÍÿÞÞ¸ñòÏ7~|ö‡#ïçcÞÄ»« ¨ªê¥±hù—æîS{{{ÿÆ\\7×¿ht Ÿ\n¹€®*Vî]µ¼qÍwoüÏ·~Xäcùœ7ò™]Ì;÷‘UU-ˆÅÊÅ7G¾`Á‚­Íus]ñ‹Fò©ëèÊbå–kB¥·þx™7òZÔëõç—eyT,RîŒÛ3#ÞVÅfæº¹®øE£ùTÈõ\0tu±ríyGY¬äsÞÈgNAŒX”Ì8#bEUUG—eù\'æº¹®øE£ùTÈõ\0Ìšbåš³†Æ,Vò9oä_EñŒXŒücóÐ”K\"úósÝ\\Wü¢Ñ|*äz\0+Š•i)²Y±žªªþ=O.Z–å¿FüsÝ\\Wü¢Ñ|*äz\0fu±’gJ«XÉç¼‘O~APUÕâXL\\4žÿÓ¼l|íþyYØˆÅ÷î—‹5×ÍuÅ/\ZÈ§B®@±qýÅÿ4f±’Ïy#ŸÜ‚ ··÷Í±¸/õzýecý_Æs_ó™æ¥a¿\\UÕ_™áæºâäS!× Xw-¿ºqÍwXsëi<–Ïy#Ÿ¼‚ ±ˆX™‰Œªª>Úþ|Q[–e¹k<÷ýˆ›âþ{ã±§šÙæºâäS!× XYKÜtÅ×(Vò1oâ“WTUõ”X@ÜÞjr4ãöG•e¹]Ü?¦ÙYV¯×ÿahhhS3Ú\\Wü¢Ñ|*äz\0+ëz£ºÿþÆõ—üËš[Oã±|ÎùÄÍól\\>¢É1eYþ¸Ù\09²^¯oc›ëŠ_4:O…\\\0ã,Vî]µ¼qÝÅŸ\Zó8Û|.¿Æ›ùÄ===›ç‰GGkr4ã†ÁÁÁ-Ì^s]ñ‹Fò©ë`¼ÅÊý÷7n¿þÜÆÎ|ß˜…J+òkòk}B31AY–__K“£¯4{ÍuÅ/\ZÈ§B®€q+ëú$Æ\'4“þð‡ãhr¬qRRÌuÅ/\ZÈ§B®€1Š•ñ|³¶Oh¼±oXüæ7¿iìºë®ÙÄø÷z½Þß¼¬ì@^I%n‡\">Ï·çåù;ò¤¤f°¹®øE£ùTÈõŒÓ0k‹•\r-TZá}ÃãÌ3ÏT˜ëŠ_f’šŽ…|*Ÿ\n¹¾³óu„|\rÌÞbE(Ìua®3oŽX±´y»£!‘O…ëåk\0ÅŠP˜ëæ:3¹hnËù	áJÅ³|*„\\/_(V„‚À\\7×™éEóºG>r=ò5€bEA€¹n®Ó‘vXGqÜzÞ1àò©r½|\r³Ûi§öÚO~ò“Ÿ?âˆ#nÚ{ï½»hÑ¢?äÉÍ,Xð‡=÷Üó¾÷½ï}7|ä#ùÂQGõgFK±¢ À\\7×™Ö¢y]E±O\nåS!äzùš¤¯¯ïÙeYîkðS#®¸7×ã÷EÜÏ}=n—ä×­q8î¸ã=ì°ÃVpÀüô§?Ý¸ì²Ë\ZË—/oÜwß}”·+V¬h\\yå•“O>¹‘_·dÉ’ÛÞóž÷hô+\nÌus)óæ9ë÷Éßú~=ò©ë‘¯™bUUíqV­V»¿ÙØOœß³Àèâøãùá‡¾òàƒnb<ôÐCñºêª«\Z‡zè8à€[Þõ®w½Äh*V˜ëæ:SR4ï¸ßw¯âY>r=ò5¥V«mqÆz47F‹‹Š¢xÑl:öØc|hÙ²eëÕàéÌ3Ïlì±Ç¿?ðÀ÷1ªŠæº¹NGÍõýÈ§B®G¾f•eY«ªêWíM‹¾¾¾ÆG?úÑÆ¹çžÛ¸ùæ›¿þõ¯‡×Ü¿ýío‡¸¸øâ‹K—.mô÷÷lvÜkwG8é¤“ŽØwß}ÿxÝu×5&Â/~ñ‹Æ>ûìóà’%K1e+\nÌus	µ®ÙMõÏA>r=ò5×äØ±V«=ØÞàøÒ—¾4|ºˆñXµjÕð×ç÷µ7<ªªZ<kõ¨£Ž:<›ãÄñÊŸ—ÍŽýöÛo/SW±¢ À\\7×™Ð¢y¢¶1û¤P>r=ò5ÓÛä¨µ79:è áÝ\"¿/OC1¢Ù1ûvv\r\r½xppðÁ‰ÚÉ1ÚÎŽÝvÛíw1¸/4…+\nÌus	)r[Eó&‹š·ëcä÷9á|*äzäk¦Až“£ýp•#Ž8bõá)*k9òÈ#GÆ2»Öã‡rÈò<\'ÇdÊsvì¹çž?5+\nÌus.šwl+~?ÑhÞŽ·xëûÏò©ë‘¯™bÍ+«¬ÞÉ±±MŽöfÇˆÍšAøÀ’%Kþøûßÿ¾1ÙÞýîwßçd(Šæº¹Î„ÍiQ³øm¬GñÜ^4·baÛóŽ—O…\\|ÍÔ59vj?\'Ç†®²¶ÃXÚÏÙ1kÖã|ðÍy	Ù©põÕW7öÚk¯Ÿ™ÎŠæº¹Îz«˜­^[ñ<Ú×f”¯w¸|*äzäk¦¦Ñ±z7GžHt2œrÊ)³kWG__ß³÷ÙgŸ‡6æ2²ëkï½÷þMƒdBWgEü•bEA`¾›ëæº×Á8‹æÖ£­xoÑ<²x¶-Z£CÈõ³JQÏˆõÊ?Æícåk&ó}?×ã­æ®‹»îºkRÖày5–—žíîõø!‡räg>ó™ÆT:ùä“ïÿÄ÷Ìö‰ß¶uè¬²,_«XQÌöùn®›ë^U¼®«x^ß¢¹ýï_9Ç\'…c``à	\ZB®Ÿô|½mæëÈÕ«\"Þyû)ò5“ñ¾ïÛúº£>zR×áK—.mot,éêÁ?øàƒxÙe—Mi£#“Y¼xñ&~­1\"Î­ã§XQÌ–ùn®›ë^cÍã-ZÇ*ž7ÝÀ¢¹Å1à5®øøÚ\Zò©ë7Nîä‘¯ïË×],J·—¯™È÷ýxìÔÖóçŸþ¤®Ã/¾øâößeYWþ{ìq×í·ß>¥Ž+Vä¶™&þ\ZuÇ¯ý XQÌ–ùn®›ë^U4¯­xþÙFÍûû0ñóè¦Ö\'Ícm­—O…\\?©9û”\rùš\r~ß?_ßz|¢OB:ÒòåËÛ[ºzðûûûß}÷Mi£#ÿ¾z½þ{ô‰ßÞñË-NŠÁl™ïæº¹îuðÿòþ|\"7Zñ¼1EóÈâÙ1àÓ;V¶Ï›fÃc §§gs!×OmÎÞvÛm”¯Ù˜9ñ»ÖŸ\'ê’²k»Ôlû.¥®üé0ŽÿtÑÅJg…9i®Ï¦â×¼œúxûÛßÞ*p—nä[ü¦£|2ø³æãciów}°YœÝñ«ˆ;òÓ¡ˆ#~qM,À·—G\\RUÕq{v³™ó­¸==âkñø—âöó\'FüsÄqñü\'âñÆýF÷Íc‰ãñâþÞq\\Øçåñâ6.ß÷çEìþÛ¸ýë¸ýËxüUõzýeñç—ÄýíâþóãñçäI.\\øä¾¾¾ÇÅý-·è’ÂùÚÑŽx­>bþüù[åkwÁ‚[ç94òu¯ã?×ö_ÄÜ]<Öý}3ìQe®ˆŒ»ûE¼»™O†\">÷?·ŸŠøtÄ\"¾qZnéøÎºòõ.»ìò‡Ì­Ûm·Ý;<_‹S½ïêFG$Š¦cGG$–tøÆœä—G’Þ±õÉÌt+Ë–-k<æ1Yïï{âŸØØm·ÝÖxü—¿üåðÙ„ÛË„>Ú×fÜpÃ\r¯}íkù&ÒxéK_ÚøÁ~Ðxë[ßšo.x³k|ó›ßl<ëYÏRtÁ|ŸŽ¹žs/OüÔþÿÓð¼Új«­\Z×\\sÍêçn»í¶á¯ÏÇ®¿þúáy˜‘_ûœç<§qâ‰\'®õïùÄ\'>±ÎßeÉ’%Ã÷sÎg®l=ž—\ZSüÎž¼?gÝgíß˜O?;ŸæïšM‚läÂ#Þ×ŸžgŽÇž—‹l.d“!þm¯ÌHooï›Mˆr÷wŽÛÞøÚ¾æBdfcÿ\\ŒäÉÿ²É‘ÍŽfÓããq{l<~B³)’Í‘‹øj.LšÍ“3šÍ”ó#.Žø~³ÙrM³ùrCÄÍ·7›3÷4›5¿øãLiÞŒ£X¾R£C¬o®Ÿ¦FB¾V/É9ñ£æëì·EÜqoÄÍ×çñó~Ý|mÞÖ<„ëgñû\\·W4ÎyùsóõñÍ¿/_‹ŸŽ?Ÿ¯Ãü½\"ŽÈß3þ|PóDùû/ÊO¾ö2ç¿s¬×X<—‡\Zì³ÓN;=a³Í6Û±ÓóµwßÎ~ßoÎs;:&ÚâÅ‹WNÇ9:\"Þiâ¯³Ð¶í§y¢š(J‡#q™l[M…¼ŸÍ‡Ö×¾êU¯\ZŽ|.’ýêÅÞ–[n™ÿÏc.èòßuÎ9çß¾ð…áÇ¾ò•¯GÞ¿÷Þ{‡_Œù5Ûl³Íð÷¶ßÏÈ¦I~ýO~ò‹¿>ß§r®_pÁÃséCúÐðüÉÆBü.Ã‘\r‘\r†Ÿþô§óÎ;¯ñš×¼f¸É–ó²ÕˆÈÈfà[Þò–5~~ëu³õÖ[7Þð†7ßÏ8í´Ó\ZÏ{ÞóÖx]äU°Z÷¿øÅ/®¾Ÿ¿ŸFÇìÉûmEê½s&ç˜ï\r)ž»þ˜ï™Ò¼YW£#~æ4:ÄzîÞûÃt4²—¯¥¸ÿŠ<çEsçÕ6Ùh‰×Ý“òü3Ù€™Æœ½Æabñû.x”|ÍD½ï;GÇ$Ùk¯½Î›ê«®\\qÅô÷÷Ÿiâ¯žd—FÒÜiŒBwZ\Z[l±Åðbn¬&Å©§žºúÏí‹½ŒVc\"¹#ïçÏ»çž{VM.Ú®¾úêÆ-·Ü²úgî¹çžÃßÛþ³òSóüþÃ?|øóW¼âÃÏüytÐðsù³òûW®\\iñ7ÃçûTÎõl¤eC¯õç3Î8cõ\\Ìy—ÏµkßÍñÝï~wÔŸ7²Ñ1²9‘Î¦JûkìÐC¾ÓM7­n\"¾ñonpäýl®´¾7_/y{ÜqÇitÌ‚¼¿ŸÈuIÂÑÎâ¿>Å³³øÏŒOóÌý=ÓU;‡®tákí¦¶+®­ãÒÎò5ô¾ïª+“dÑ¢Eï:é¤“šÊFÇ‰\'žx[×_·w|mŸäMk£#weä\'ÐÙLÈO¤[ÑZŒµˆyJ.î2ÚŸo-\n=öØÕµü;w]\\zé¥«kíÆøØÇ>6üØUW]5üç;î¸cuÓ$)ùXî\ZÉÇ¾ÿýïg³ìa•ÖÏTÌìù>Õs}Ns§R6\Zò~ÎçV£#o[¸Œœ“sš;‘ÆÓèÈFJkÇRëu‘‡gåýwÞyøïí÷ißÑñô§?}¸±’÷s÷GîQüÎŽ¼¿ŸÌU4o²–çÇS<¿2b¥¢¹3ŒvÉË˜SKG^òr&5:r—hûï›sóÈ#õk[91ßû¿ýío¯®=ò0ÂX„Nø{ÄL;äP®Ÿðœ}m¾¾búùšÉzßoîz\ZÎéy8õdZºtiûûGw¯ÇsKæàààozhêz»ï¾ûŠ<îÏÔŸNÛÑ1ÚïÓ*<rÁØþæŸÍ‘»@ò~Ûøóùüsîüøú×¿¾úçŒ,ZI>\"]tÑêèÈæŠ‚À\\Oä\\Éy³ýöÛ7>õ©O\r7)r.æ!Q/|á‡ŸÏ&E6>F\"5Þ£Íûü;[»GÿøÇZ0çŽŽläåýö¦`þžŠßYm]ŸÐ­«hž³Åsk;öNþ:¦hÞ¶ùxïÚ`3mGG+ç­Zµêa¨ŒöuÇsÌ\Z‡æã­]r­æô›Þô¦á¼›5Åë^÷ºáº¡ýÂÜ=—»O»éC¹~b­c‡|Í„­Ç›çˆjÄýášs2d~íïïoottÿz|ñâÅß‹ÂzJ:?üáÿ7þ/5¥;»Ñ‘É4ßðóM~äŽŽ<Çh_Ÿ\'	Ííµvíoø¹xÌEdžÐ1ŸÏ“Œæ§!ÙüÈkþœöŸ_—ßÂ	\'4ùÈG®>&‹ùû)Ìõ\r‰|É¦F6\'Z‡W<<%ï·_ÙÐFÇë_ÿú5vtä¼}ÛÛÞ¶úëò°”|\rä×´Îq3²IâÌû“ÂñÍë[<·þ>EsÉ+ÆŒcýŒitä{|6žúÔ§çÇ|ŸÏ?¿øÅ/nh´m~ Òúwå¼=äCVßÏr#v6Cò¹ÜùÑúºÏ}îs«wóe$‹í¦CåzùÚÐÏLUUÕj@dnš§œrJ{“ã¢Ù2°;í·ß~÷LÅ®Ž=÷Üó—yFqÓ¹ó­ÃHÚÏÇ1ÚvÌ,<Z\rŽ|<ŠÜ¶?§m›ÿhÅCÆ’;9² ™;wîð‚2OôØþ‰L{Ã¤uÒü¾üó>ðá+»äßŸÅ‡‚À\\_ŸÈ†ÙÈ¦F«(mÍïöû“ÙèÈOsëöÈæ`{££õ»Ýzë­æúì–ŸŽÜ–¼h=ŠæµÏGü=Žñ–O\'=ò½´÷ðÜõ6²!<§¹StNÛîVCºu¾®üÐd´\Z¢u¿õáIžø¼ÕÜn¦Ø\r‡Êõò53w=ÞjBä®Ž‰>)iþ¼ü¹m\'­ž=ëñE‹]úo|ãw“Ùä8ýôÓó„>ÿ½žÇ&+V¦©ÑÑ*F~’ÜþX«’\r‡,>šo–Ãoî­ÃXZçØÈç³˜Èû­mûy?·éçù7Ú­‹æ\'#¹Ã£½ÑÑÚ®jG‡¹¾±\'#Ùˆh«#çd~R8§íj>Òèh?™i{±óz´«,˜³°oÆ’¿[6>Fžü×\\ŸµÅsû	ïÚ‹àñÍsÖñ}.I(Ÿv\\£#·\\gNÌÃ[òÄäY£ä×´Ÿ£«už¥ü\0$›Ù­Üžy5ÿk5çŒ±££9”ëåkf®æU†yžÄ‰ºÔl®>øà‡íæ˜Uëñ<F\'’þªë®»nR¶uD‘þÛ¾¾¾•UU½Ð4îìb%W=ì°ÃV¿QgbäÉHÛOÚÚ¦Ù~¾Žü³àÈ7üÖ\'­O¢³a‘[R[Ÿ¨ç‰sËj«Ñ‘Ÿ¦,[¶luS£uIÙü=òkó„cí;:Z¿ÓÈ\'\ns}mÑ:<ç[ûÕVæ4wqdccäy=Ú¿¾½°n5øöÞ{ïµ6[óhM—Vã%/µÜ~^šV£ðˆ#ŽXãts}V¹-:‹Þ…sÖÿ„#¿oE³|:ÕŽ9Í+¯¬5<ðÀ5sÉç²~È:$ÏãÑÚ}Ñ:ì¥Õ,noh·ïÜkåòÜÑ‘ÏgÞï¦Cåzùš™½o¿¤qÖ~ÛìÈµTžÜ¹­Éqï¬\\—eYÛ}÷ÝW­X±bB›wÞyçý‹-ºÃ!+_¬d3¢ýÄ\\£-ìæ¬åSíÜÉÑj’ddÃbä›}ž!?ÉYdäcY@äÎ|lß}÷}Ø	½2²ÒÓÓ³ÆågæúdìfjÏÝÙÐËçò“‘Ïµ>ÉËc¿7¤Ñ‘ÑÚŽÝþiàT^MÈ\\ïŠâyc¶Í\ZùtR#w·µv¸eÞË1Z——y¨^«œ\'%Ï&p«&X[S¡=÷fíÒj`dC»uÅ¸n:äP®—¯™ùëñÖ‰I[;;6ô0–ü¾;9\Z³z=0ÍŽ‰ÚÙqã7þ:›ñŸö^S·»‹×›Ç\\7×™±ÅóDáÈ§ëŒ<œ5›ùáÇþûï¿z§g6²‰‡´,^¼xïËB^Qe¬“ˆ¶GîüÌŸŸçÊhÌ|NsGÇX;Lfò!‡r½|Mw¬ÇÛ›ynlÎænäñ^]%O<Ú~NŽëñf\')fÕé§Ÿ~÷Æœ 4Þt~T¯×óR²¦¬ÅŸÅæº¹Î¤ØØíË¶?Ë§S­óåá\'ÙŒX°`ÁÃžo¿Lkûù7òÐ×l äÎ»öÃ\\vÙe—Õ÷³©ÑÚm‘WvËÃU²1ÒºÜìœæ9:Z÷sG]·r(×Ë×tÏz<bU{£\"G}tãüóÏÞ­Ñ:¬%w·-_¾|8Ÿüñ‡58òpëñ‡w’¶Á<wppð¶+¯¼òžõip\\qÅ7Ç÷ý4O<êœ˜ëæ:SV<¯ï\'|Nd\'ŸN{äÉC[M‚<WÇ;ßùÎÕ»#Æúžñì’h;Þ¯ï†CåzùšîZ·_vvã\"ëñ±øÙðØu×]WuÔQ?¹ä’Kî¼ýöÛ‡ß0RÞæ9=¾÷½ïÝtÌ1Çü````yæÅÙ5ru‹?‹?Ìus)³¾Û™m–O…ëåkfÀz¼Ùðxp}\ZÖããÔ××÷ìàcÀNÈËÄÞßÄ¼½%bYÄ’ì<-ÅŠ‚\0sÝ\\§£‹çWFÜ±“!“O…\\ï#_3#×ã÷5×ã÷Y£X\ns]˜ëÝn‡fQ¼ÃZž_©h–O…ëåk\0ÅŠP˜ëæ:3ÅXŸÚþ,Ÿ\n!×Ë×\0Š¡ 0×Íuº¢xV4Ë§BÈõò5€bE(Ìus®(ž—*šåS!äzù\Z@±\"æº¹N7Èc¼s\\’P>B®ïø|\'—”¯ÅŠP˜ëÂ\\gÝž`äS!äúÎ×lt\0(V„‚À\\æ: Ÿ\n¹^£@±\"æº0×A>r=\Z\0ŠYi®›ë€|*äz4:\0+\nÌusO…\\F XQ¬(Ìua®ò©ë5:\0+BA`®säS!äz\0ÅŠP˜ëÂ\\ùTÈõht\0(V˜ëæ: Ÿ\n¹\0ÅŠ‚\0sÝ\\äS!×kt@±\"æº0×ùTÈõ\Z\0Š¡ 0×…¹ò©ëåz\0ÅŠ‚@A`®›ë€|*äz4:\0+\nÌusO…\\F€bEA`®sO…\\¯Ñ X\ns]˜ë Ÿ\n!×kt\0tœsÎ9ÇqçÄ}Q<hVšëæ: Ñ!4:Ðè\0Ø@^xáí+V¬ðfÜ±|ùò¯FAp­Yi®›ë€F‡Ðè@£`{î¹o;ÿüóÿ÷Î;ïü7äéût;~gŸ}ö/#ÞaVšëæ: Ñ!4:Ðè\0Ø±àØ1Þˆ.Ï­äù†4Óâ”SNidâž‰¿{3rÜ¯µð3×gA˜ë Ñ!4:Ðè\0`I{Y&îžžžÍ\0ht4:\0f¬²,_IûÁLÜUUí`D\0@£Cht Ñ0“_Ï¤ÝŒË\0L.W±®°¥ÑÀä%ëW¶vs´¢,Ë\0LW±®°¥ÑÀä%ëeíMŽÖ®çê\0€Éã*VÂ¶4:\0˜œD½ÆnŽVTUµ“€Éã*VÂ¶4:\0˜øD}ÆhMŽf\\j„\0\0àaõ³F@\'é1ws8W\0\0ŒZCkt\0tp’^¶¶&‡+°\0\0À\Z5´F€Ä\r\0\0êe\0$n\0\0P/ q\0€z\0‰\0\0ÔË\07\0\0¨—¸\0@½€Ä\r\0\0êe\0$n\0\0P/HÜ\0\0€z@â\0\0õ2\07\0\0¨—¸\0@½€Ä\r\0\0êe\0‰\0\0ÔË\0HÜ\0\0 ^@â\0\0õ2\07\0\0¨—$n\0\0@½ q\0€z\0‰\0\0ÔË\0HÜ\0\0 ^@â\0\0õ2€Ä\r\0\0êe\0$n\0\0P/ q\0€z\0‰\0\0ÔË\07\0\0 ^¸\0@½€Ä\r\0\0êe\0$n\0\0P/ q\0€z@â\0\0õ2\07\0\0¨—¸\0@½€Ä\r\0\0êe\0‰\0\0P/HÜ\0\0 ^@â\0\0õ2\07\0\0¨—X#q!„B!Æ«\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€ò¼ÙMºLŒ•P\0\0\0\0IEND®B`‚',1);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','7501',4),('schema.history','create(5.22.0.0)',1),('schema.version','5.22.0.0',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('2511','LeaveBill:1:2509','2510','2510','sid-2F4297F0-7C71-43B0-A6E0-4DAF19994BF4',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2016-11-22 22:45:09.944','2016-11-22 22:45:09.967',23,''),('2514','LeaveBill:1:2509','2510','2510','sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB','2515',NULL,'å¯åŠ¨æµç¨‹','userTask',NULL,'2016-11-22 22:45:09.968',NULL,NULL,''),('5007','LeaveBill:2:5005','5006','5006','sid-2F4297F0-7C71-43B0-A6E0-4DAF19994BF4',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2016-11-22 23:10:59.755','2016-11-22 23:10:59.779',24,''),('5010','LeaveBill:2:5005','5006','5006','sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB','5011',NULL,'å¯åŠ¨æµç¨‹','userTask','admin','2016-11-22 23:10:59.780',NULL,NULL,'');

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('5012',NULL,'participant','admin',NULL,'5006');

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('2510','2510','LeaveBill.2','LeaveBill:1:2509','2016-11-22 22:45:09.944',NULL,NULL,NULL,'sid-2F4297F0-7C71-43B0-A6E0-4DAF19994BF4',NULL,NULL,NULL,'',NULL),('5006','5006','LeaveBill.3','LeaveBill:2:5005','2016-11-22 23:10:59.755',NULL,NULL,NULL,'sid-2F4297F0-7C71-43B0-A6E0-4DAF19994BF4',NULL,NULL,NULL,'',NULL);

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('2515','LeaveBill:1:2509','sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB','2510','2510','å¯åŠ¨æµç¨‹',NULL,NULL,NULL,NULL,'2016-11-22 22:45:09.972',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('5011','LeaveBill:2:5005','sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB','5006','5006','å¯åŠ¨æµç¨‹',NULL,NULL,NULL,'admin','2016-11-22 23:10:59.784',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('2512','2510','2510',NULL,'businessKey','string',0,NULL,NULL,NULL,'LeaveBill.2',NULL,'2016-11-22 22:45:09.945','2016-11-22 22:45:09.945'),('2513','2510','2510',NULL,'inputUser','string',0,NULL,NULL,NULL,'admin',NULL,'2016-11-22 22:45:09.946','2016-11-22 22:45:09.946'),('5008','5006','5006',NULL,'businessKey','string',0,NULL,NULL,NULL,'LeaveBill.3',NULL,'2016-11-22 23:10:59.756','2016-11-22 23:10:59.756'),('5009','5006','5006',NULL,'inputUser','string',0,NULL,NULL,NULL,'admin',NULL,'2016-11-22 23:10:59.758','2016-11-22 23:10:59.758');

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('2506','è¯·å‡æµç¨‹001',NULL,'','2016-11-22 22:44:46.907'),('5002','è¯·å‡æµç¨‹001',NULL,'','2016-11-22 22:58:34.964');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

insert  into `act_re_model`(`ID_`,`REV_`,`NAME_`,`KEY_`,`CATEGORY_`,`CREATE_TIME_`,`LAST_UPDATE_TIME_`,`VERSION_`,`META_INFO_`,`DEPLOYMENT_ID_`,`EDITOR_SOURCE_VALUE_ID_`,`EDITOR_SOURCE_EXTRA_VALUE_ID_`,`TENANT_ID_`) values ('1',5,'12','12','LeaveBill','2016-11-22 21:52:16.421','2016-11-22 22:58:22.656',1,'{\"name\":\"12\",\"revision\":1,\"description\":\"12\"}',NULL,'2','5001',''),('3',11,'è¯·å‡æµç¨‹001','è¯·å‡æµç¨‹001','LeaveBill','2016-11-22 22:11:15.880','2016-11-22 22:57:20.401',1,'{\"name\":\"è¯·å‡æµç¨‹001\",\"revision\":1,\"description\":\"è¯·å‡æµç¨‹001\"}',NULL,'4','2501','');

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('LeaveBill:1:2509',1,'http://www.activiti.org/processdef','leaveBillProcess','LeaveBill',1,'2506','è¯·å‡æµç¨‹001.bpmn20.xml','è¯·å‡æµç¨‹001.LeaveBill.png',NULL,0,1,1,''),('LeaveBill:2:5005',1,'http://www.activiti.org/processdef','leaveBillProcess','LeaveBill',2,'5002','è¯·å‡æµç¨‹001.bpmn20.xml','è¯·å‡æµç¨‹001.LeaveBill.png',NULL,0,1,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`LOCK_TIME_`) values ('2510',1,'2510','LeaveBill.2',NULL,'LeaveBill:1:2509',NULL,'sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB',1,0,1,0,1,2,'',NULL,NULL),('5006',1,'5006','LeaveBill.3',NULL,'LeaveBill:2:5005',NULL,'sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB',1,0,1,0,1,2,'',NULL,NULL);

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('5012',1,NULL,'participant','admin',NULL,'5006',NULL);

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`) values ('2515',1,'2510','2510','LeaveBill:1:2509','å¯åŠ¨æµç¨‹',NULL,NULL,'sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB',NULL,'admin',NULL,50,'2016-11-22 22:45:09.968',NULL,NULL,1,'',NULL),('5011',1,'5006','5006','LeaveBill:2:5005','å¯åŠ¨æµç¨‹',NULL,NULL,'sid-4C8CC60D-0FB7-434E-9F14-76DB0C080AEB',NULL,'admin',NULL,50,'2016-11-22 23:10:59.781',NULL,NULL,1,'',NULL);

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('2512',1,'string','businessKey','2510','2510',NULL,NULL,NULL,NULL,'LeaveBill.2',NULL),('2513',1,'string','inputUser','2510','2510',NULL,NULL,NULL,NULL,'admin',NULL),('5008',1,'string','businessKey','5006','5006',NULL,NULL,NULL,NULL,'LeaveBill.3',NULL),('5009',1,'string','inputUser','5006','5006',NULL,NULL,NULL,NULL,'admin',NULL);

/*Table structure for table `leavebill` */

DROP TABLE IF EXISTS `leavebill`;

CREATE TABLE `leavebill` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®id',
  `leaveDays` bigint(19) NOT NULL COMMENT 'è¯·å‡å¤©æ•°',
  `context` varchar(100) DEFAULT NULL COMMENT 'è¯·å‡å†…å®¹',
  `leaveTime` datetime NOT NULL COMMENT 'è¯·å‡æ—¶é—´',
  `leavePeople` varchar(100) NOT NULL COMMENT 'è¯·å‡äººuserid',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'è¯·å‡çŠ¶æ€',
  `processInstanceId` varchar(64) DEFAULT NULL COMMENT 'å¯¹åº”çš„æµç¨‹å®žä¾‹ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='è¯·å‡è¡¨';

/*Data for the table `leavebill` */

insert  into `leavebill`(`id`,`leaveDays`,`context`,`leaveTime`,`leavePeople`,`remark`,`status`,`processInstanceId`) values (2,2,'12','2016-11-22 22:39:07','admin','12',1,'2510'),(3,3,'1','2016-11-22 23:10:52','admin','1',1,'5006');

/*Table structure for table `organization` */

DROP TABLE IF EXISTS `organization`;

CREATE TABLE `organization` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®id',
  `name` varchar(64) NOT NULL COMMENT 'ç»„ç»‡å',
  `address` varchar(100) DEFAULT NULL COMMENT 'åœ°å€',
  `code` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `icon` varchar(32) DEFAULT NULL COMMENT 'å›¾æ ‡',
  `pid` bigint(19) DEFAULT NULL COMMENT 'çˆ¶çº§ä¸»é”®',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'æŽ’åº',
  `create_time` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='ç»„ç»‡æœºæž„';

/*Data for the table `organization` */

insert  into `organization`(`id`,`name`,`address`,`code`,`icon`,`pid`,`seq`,`create_time`) values (1,'æ€»ç»åŠž','','01','icon-company',NULL,0,'2014-02-19 01:00:00'),(3,'æŠ€æœ¯éƒ¨','','02','icon-company',NULL,1,'2015-10-01 13:10:42'),(5,'äº§å“éƒ¨','','03','icon-company',NULL,2,'2015-12-06 12:15:30'),(6,'æµ‹è¯•ç»„','','04','icon-folder',3,0,'2015-12-06 13:12:18');

/*Table structure for table `process_type` */

DROP TABLE IF EXISTS `process_type`;

CREATE TABLE `process_type` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®id',
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='æµç¨‹ç±»åž‹è¡¨';

/*Data for the table `process_type` */

insert  into `process_type`(`id`,`code`,`name`) values (10,'LeaveBill','è¯·å‡æµç¨‹');

/*Table structure for table `resource` */

DROP TABLE IF EXISTS `resource`;

CREATE TABLE `resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®',
  `name` varchar(64) NOT NULL COMMENT 'èµ„æºåç§°',
  `url` varchar(100) DEFAULT NULL COMMENT 'èµ„æºè·¯å¾„',
  `description` varchar(255) DEFAULT NULL COMMENT 'èµ„æºä»‹ç»',
  `icon` varchar(32) DEFAULT NULL COMMENT 'èµ„æºå›¾æ ‡',
  `pid` bigint(19) DEFAULT NULL COMMENT 'çˆ¶çº§èµ„æºid',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'æŽ’åº',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'çŠ¶æ€',
  `resource_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'èµ„æºç±»åˆ«',
  `create_time` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 COMMENT='èµ„æº';

/*Data for the table `resource` */

insert  into `resource`(`id`,`name`,`url`,`description`,`icon`,`pid`,`seq`,`status`,`resource_type`,`create_time`) values (1,'ç³»ç»Ÿç®¡ç†','','ç³»ç»Ÿç®¡ç†','monitor-monitor',NULL,0,0,0,'2014-02-19 01:00:00'),(11,'èµ„æºç®¡ç†','/resource/manager.do','èµ„æºç®¡ç†','feed-feed',1,1,0,0,'2014-02-19 01:00:00'),(12,'è§’è‰²ç®¡ç†','/role/manager.do','è§’è‰²ç®¡ç†','group-group_gear',1,2,0,0,'2014-02-19 01:00:00'),(13,'ç”¨æˆ·ç®¡ç†','/user/manager.do','ç”¨æˆ·ç®¡ç†','icon-man',1,3,0,0,'2014-02-19 01:00:00'),(14,'éƒ¨é—¨ç®¡ç†','/organization/manager.do','éƒ¨é—¨ç®¡ç†','icon-tux',1,4,0,0,'2014-02-19 01:00:00'),(111,'åˆ—è¡¨','/resource/treeGrid.do','èµ„æºåˆ—è¡¨','icon-list',11,0,0,1,'2014-02-19 01:00:00'),(112,'æ·»åŠ ','/resource/add.do','èµ„æºæ·»åŠ ','icon-add',11,0,0,1,'2014-02-19 01:00:00'),(113,'ç¼–è¾‘','/resource/edit.do','èµ„æºç¼–è¾‘','icon-edit',11,0,0,1,'2014-02-19 01:00:00'),(114,'åˆ é™¤','/resource/delete.do','èµ„æºåˆ é™¤','icon-del',11,0,0,1,'2014-02-19 01:00:00'),(121,'åˆ—è¡¨','/role/dataGrid.do','è§’è‰²åˆ—è¡¨','icon-list',12,0,0,1,'2014-02-19 01:00:00'),(122,'æ·»åŠ ','/role/add.do','è§’è‰²æ·»åŠ ','icon-add',12,0,0,1,'2014-02-19 01:00:00'),(123,'ç¼–è¾‘','/role/edit.do','è§’è‰²ç¼–è¾‘','icon-edit',12,0,0,1,'2014-02-19 01:00:00'),(124,'åˆ é™¤','/role/delete.do','è§’è‰²åˆ é™¤','icon-del',12,0,0,1,'2014-02-19 01:00:00'),(125,'æŽˆæƒ','/role/grant.do','è§’è‰²æŽˆæƒ','icon-ok',12,0,0,1,'2014-02-19 01:00:00'),(131,'åˆ—è¡¨','/user/dataGrid.do','ç”¨æˆ·åˆ—è¡¨','icon-list',13,0,0,1,'2014-02-19 01:00:00'),(132,'æ·»åŠ ','/user/add.do','ç”¨æˆ·æ·»åŠ ','icon-add',13,0,0,1,'2014-02-19 01:00:00'),(133,'ç¼–è¾‘','/user/edit.do','ç”¨æˆ·ç¼–è¾‘','icon-edit',13,0,0,1,'2014-02-19 01:00:00'),(134,'åˆ é™¤','/user/delete.do','ç”¨æˆ·åˆ é™¤','icon-del',13,0,0,1,'2014-02-19 01:00:00'),(141,'åˆ—è¡¨','/organization/treeGrid.do','ç”¨æˆ·åˆ—è¡¨','icon-list',14,0,0,1,'2014-02-19 01:00:00'),(142,'æ·»åŠ ','/organization/add.do','éƒ¨é—¨æ·»åŠ ','icon-add',14,0,0,1,'2014-02-19 01:00:00'),(143,'ç¼–è¾‘','/organization/edit.do','éƒ¨é—¨ç¼–è¾‘','icon-edit',14,0,0,1,'2014-02-19 01:00:00'),(144,'åˆ é™¤','/organization/delete.do','éƒ¨é—¨åˆ é™¤','icon-del',14,0,0,1,'2014-02-19 01:00:00'),(221,'ç³»ç»Ÿç›‘æŽ§','',NULL,'monitor-monitor_edit',NULL,2,0,0,'2015-12-01 11:44:20'),(226,'ä¿®æ”¹å¯†ç ','/user/editPwdPage.do',NULL,'icon-edit',NULL,3,0,1,'2015-12-07 20:23:06'),(227,'ç³»ç»Ÿæ—¥å¿—','/sysLog/manager.do',NULL,'icon-search',221,0,0,0,'2016-09-30 22:10:53'),(228,'Druidç›‘æŽ§','/druid',NULL,'chart-chart_bar',221,0,0,0,'2016-09-30 22:12:50'),(229,'æµç¨‹ç®¡ç†','',NULL,'flag-flag_blue',NULL,3,0,0,'2016-11-10 10:01:03'),(230,'éƒ¨ç½²ç®¡ç†','/workflow/deploymentList.do',NULL,'flag-flag_orange',229,2,0,0,'2016-11-10 10:02:16'),(232,'éƒ¨ç½²æµç¨‹','/workflow/addDeployment.do',NULL,'icon-add',230,0,0,1,'2016-11-10 10:04:13'),(233,'åˆ é™¤','/workflow/deleteDeployment.do',NULL,'icon-del',230,1,0,1,'2016-11-10 10:05:50'),(234,'ä¸ªäººä¸­å¿ƒ','',NULL,'user-user',NULL,4,0,0,'2016-11-14 12:34:33'),(235,'è¯·å‡ç®¡ç†','/leave/manager.do',NULL,'clock-clock',234,0,0,0,'2016-11-14 12:37:34'),(236,'åˆ—è¡¨','/leave/dataGrid.do',NULL,'icon-list',235,0,0,1,'2016-11-14 12:38:26'),(237,' æ·»åŠ ','/leave/add.do',NULL,'icon-add',235,1,0,1,'2016-11-14 12:38:55'),(238,'ç¼–è¾‘','/leave/edit.do',NULL,'icon-edit',235,2,0,1,'2016-11-14 12:39:30'),(239,'åˆ é™¤','/leave/delete.do',NULL,'icon-del',235,3,0,1,'2016-11-14 12:39:57'),(240,'æµç¨‹è®¾è®¡','/workflowModel/manager.do',NULL,'flag-flag_green',229,1,0,0,'2016-11-15 11:18:02'),(241,'åˆ—è¡¨','/workflowModel/dataGrid.do',NULL,'icon-list',240,0,0,1,'2016-11-15 11:18:43'),(242,'æ·»åŠ ','/workflowModel/add.do',NULL,'icon-add',240,1,0,1,'2016-11-15 11:19:09'),(243,'åˆ é™¤','/workflowModel/delete.do',NULL,'icon-del',240,3,0,1,'2016-11-15 11:19:49'),(244,'ä»£åŠžåˆ—è¡¨','/workflow/personTaskManager.do',NULL,'flag-flag_pink',229,3,0,0,'2016-11-18 10:04:06'),(245,'ä»»åŠ¡åˆ—è¡¨','/leave/personTaskList.do',NULL,'bell-bell',234,1,0,0,'2016-11-22 14:16:51'),(246,'ç±»åž‹ç®¡ç†','/processType/manager.do',NULL,'flag-flag_purple',229,0,0,0,'2016-11-22 19:47:08'),(247,'åˆ—è¡¨','/processType/dataGrid.do',NULL,'icon-list',246,0,0,1,'2016-11-22 19:47:40'),(248,'æ·»åŠ ','/processType/add.do',NULL,'icon-add',246,1,0,1,'2016-11-22 19:48:04'),(249,'åˆ é™¤','/processType/delete.do',NULL,'icon-del',246,2,0,1,'2016-11-22 19:48:37'),(250,'ä¿®æ”¹','/processType/edit.do',NULL,'icon-edit',246,3,0,1,'2016-11-22 19:48:59');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®id',
  `name` varchar(64) NOT NULL COMMENT 'è§’è‰²å',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'æŽ’åºå·',
  `description` varchar(255) DEFAULT NULL COMMENT 'ç®€ä»‹',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'çŠ¶æ€',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='è§’è‰²';

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`seq`,`description`,`status`) values (1,'è¶…çº§ç®¡ç†å‘˜',0,'è¶…çº§ç®¡ç†å‘˜',0),(2,'æŠ€æœ¯éƒ¨ç»ç†',0,'æŠ€æœ¯éƒ¨ç»ç†',0),(7,'äº§å“éƒ¨ç»ç†',0,'äº§å“éƒ¨ç»ç†',0),(8,'æµ‹è¯•è´¦æˆ·',0,'æµ‹è¯•è´¦æˆ·',0);

/*Table structure for table `role_resource` */

DROP TABLE IF EXISTS `role_resource`;

CREATE TABLE `role_resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®id',
  `role_id` bigint(19) NOT NULL COMMENT 'è§’è‰²id',
  `resource_id` bigint(19) NOT NULL COMMENT 'èµ„æºid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=707 DEFAULT CHARSET=utf8 COMMENT='è§’è‰²èµ„æº';

/*Data for the table `role_resource` */

insert  into `role_resource`(`id`,`role_id`,`resource_id`) values (158,3,1),(159,3,11),(160,3,111),(161,3,112),(162,3,113),(163,3,114),(164,3,12),(165,3,121),(166,3,122),(167,3,123),(168,3,124),(169,3,125),(170,3,13),(171,3,131),(172,3,132),(173,3,133),(174,3,134),(175,3,14),(176,3,141),(177,3,142),(178,3,143),(179,3,144),(359,7,1),(360,7,14),(361,7,141),(362,7,142),(363,7,143),(367,7,221),(368,7,226),(437,2,1),(438,2,13),(439,2,131),(440,2,132),(441,2,133),(445,2,221),(446,2,227),(447,2,228),(464,8,1),(465,8,11),(466,8,111),(467,8,112),(468,8,113),(469,8,114),(470,8,12),(471,8,121),(472,8,13),(473,8,131),(661,1,1),(662,1,11),(663,1,111),(664,1,112),(665,1,113),(666,1,114),(667,1,12),(668,1,121),(669,1,122),(670,1,123),(671,1,124),(672,1,125),(673,1,13),(674,1,131),(675,1,132),(676,1,133),(677,1,134),(678,1,14),(679,1,141),(680,1,142),(681,1,143),(682,1,144),(683,1,221),(684,1,227),(685,1,228),(686,1,229),(687,1,246),(688,1,247),(689,1,248),(690,1,249),(691,1,250),(692,1,240),(693,1,241),(694,1,242),(695,1,243),(696,1,230),(697,1,232),(698,1,233),(699,1,244),(700,1,234),(701,1,235),(702,1,236),(703,1,237),(704,1,238),(705,1,239),(706,1,245);

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®id',
  `login_name` varchar(255) DEFAULT NULL COMMENT 'ç™»é™†å',
  `role_name` varchar(255) DEFAULT NULL COMMENT 'è§’è‰²å',
  `opt_content` varchar(1024) DEFAULT NULL COMMENT 'å†…å®¹',
  `client_ip` varchar(255) DEFAULT NULL COMMENT 'å®¢æˆ·ç«¯ip',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=491 DEFAULT CHARSET=utf8 COMMENT='ç³»ç»Ÿæ—¥å¿—';

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`login_name`,`role_name`,`opt_content`,`client_ip`,`create_time`) values (406,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','0:0:0:0:0:0:0:1','2016-11-22 14:23:13'),(407,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','0:0:0:0:0:0:0:1','2016-11-22 14:27:41'),(408,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','0:0:0:0:0:0:0:1','2016-11-22 14:32:22'),(409,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','0:0:0:0:0:0:0:1','2016-11-22 14:53:28'),(410,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','0:0:0:0:0:0:0:1','2016-11-22 16:51:48'),(411,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','0:0:0:0:0:0:0:1','2016-11-22 17:11:03'),(412,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=keyu0203&password=1&','0:0:0:0:0:0:0:1','2016-11-22 17:20:43'),(413,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','0:0:0:0:0:0:0:1','2016-11-22 17:20:50'),(414,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','127.0.0.1','2016-11-22 19:34:22'),(415,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','127.0.0.1','2016-11-22 19:38:36'),(416,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','127.0.0.1','2016-11-22 19:39:41'),(417,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','127.0.0.1','2016-11-22 19:42:55'),(418,'admin','admin','[è¯·æ±‚åœ°å€]:-workflowModel-addPage.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowModelController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 19:45:14'),(419,'admin','admin','[è¯·æ±‚åœ°å€]:-resource-addPage.do,[ç±»å]:org.xiaojl.core.controller.ResourceController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 19:45:52'),(420,'admin','admin','[è¯·æ±‚åœ°å€]:-resource-add.do,[ç±»å]:org.xiaojl.core.controller.ResourceController,[æ–¹æ³•]:add,[å‚æ•°]:name=ç±»åž‹ç®¡ç†&resourceType=0&url=/processType/manager.do&seq=0&icon=flag-flag_purple&status=0&pid=229&','127.0.0.1','2016-11-22 19:47:08'),(421,'admin','admin','[è¯·æ±‚åœ°å€]:-resource-addPage.do,[ç±»å]:org.xiaojl.core.controller.ResourceController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 19:47:10'),(422,'admin','admin','[è¯·æ±‚åœ°å€]:-resource-add.do,[ç±»å]:org.xiaojl.core.controller.ResourceController,[æ–¹æ³•]:add,[å‚æ•°]:name=åˆ—è¡¨&resourceType=1&url=/processType/dataGrid.do&seq=0&icon=icon-list&status=0&pid=246&','127.0.0.1','2016-11-22 19:47:40'),(423,'admin','admin','[è¯·æ±‚åœ°å€]:-resource-addPage.do,[ç±»å]:org.xiaojl.core.controller.ResourceController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 19:47:42'),(424,'admin','admin','[è¯·æ±‚åœ°å€]:-resource-add.do,[ç±»å]:org.xiaojl.core.controller.ResourceController,[æ–¹æ³•]:add,[å‚æ•°]:name=æ·»åŠ &resourceType=1&url=/processType/add.do&seq=1&icon=icon-add&status=0&pid=246&','127.0.0.1','2016-11-22 19:48:04'),(425,'admin','admin','[è¯·æ±‚åœ°å€]:-resource-addPage.do,[ç±»å]:org.xiaojl.core.controller.ResourceController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 19:48:06'),(426,'admin','admin','[è¯·æ±‚åœ°å€]:-resource-add.do,[ç±»å]:org.xiaojl.core.controller.ResourceController,[æ–¹æ³•]:add,[å‚æ•°]:name=åˆ é™¤&resourceType=1&url=/processType/delete.do&seq=2&icon=icon-del&status=0&pid=246&','127.0.0.1','2016-11-22 19:48:37'),(427,'admin','admin','[è¯·æ±‚åœ°å€]:-resource-addPage.do,[ç±»å]:org.xiaojl.core.controller.ResourceController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 19:48:42'),(428,'admin','admin','[è¯·æ±‚åœ°å€]:-resource-add.do,[ç±»å]:org.xiaojl.core.controller.ResourceController,[æ–¹æ³•]:add,[å‚æ•°]:name=ä¿®æ”¹&resourceType=1&url=/processType/edit.do&seq=3&icon=icon-edit&status=0&pid=246&','127.0.0.1','2016-11-22 19:48:59'),(429,'admin','admin','[è¯·æ±‚åœ°å€]:-resource-addPage.do,[ç±»å]:org.xiaojl.core.controller.ResourceController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 19:49:07'),(430,'admin','admin','[è¯·æ±‚åœ°å€]:-resource-editPage.do,[ç±»å]:org.xiaojl.core.controller.ResourceController,[æ–¹æ³•]:editPage,[å‚æ•°]:id=240&_=1479815044678&','127.0.0.1','2016-11-22 19:49:10'),(431,'admin','admin','[è¯·æ±‚åœ°å€]:-resource-edit.do,[ç±»å]:org.xiaojl.core.controller.ResourceController,[æ–¹æ³•]:edit,[å‚æ•°]:id=240&name=æµç¨‹è®¾è®¡&resourceType=0&url=/workflowModel/manager.do&seq=1&icon=flag-flag_green&status=0&pid=229&','127.0.0.1','2016-11-22 19:49:13'),(432,'admin','admin','[è¯·æ±‚åœ°å€]:-resource-editPage.do,[ç±»å]:org.xiaojl.core.controller.ResourceController,[æ–¹æ³•]:editPage,[å‚æ•°]:id=230&_=1479815044679&','127.0.0.1','2016-11-22 19:49:20'),(433,'admin','admin','[è¯·æ±‚åœ°å€]:-resource-edit.do,[ç±»å]:org.xiaojl.core.controller.ResourceController,[æ–¹æ³•]:edit,[å‚æ•°]:id=230&name=éƒ¨ç½²ç®¡ç†&resourceType=0&url=/workflow/deploymentList.do&seq=2&icon=flag-flag_orange&status=0&pid=229&','127.0.0.1','2016-11-22 19:49:22'),(434,'admin','admin','[è¯·æ±‚åœ°å€]:-resource-editPage.do,[ç±»å]:org.xiaojl.core.controller.ResourceController,[æ–¹æ³•]:editPage,[å‚æ•°]:id=244&_=1479815044680&','127.0.0.1','2016-11-22 19:49:28'),(435,'admin','admin','[è¯·æ±‚åœ°å€]:-resource-edit.do,[ç±»å]:org.xiaojl.core.controller.ResourceController,[æ–¹æ³•]:edit,[å‚æ•°]:id=244&name=ä»£åŠžåˆ—è¡¨&resourceType=0&url=/workflow/personTaskManager.do&seq=3&icon=flag-flag_pink&status=0&pid=229&','127.0.0.1','2016-11-22 19:49:31'),(436,'admin','admin','[è¯·æ±‚åœ°å€]:-role-grantPage.do,[ç±»å]:org.xiaojl.core.controller.RoleController,[æ–¹æ³•]:grantPage,[å‚æ•°]:id=1&_=1479815044681&','127.0.0.1','2016-11-22 19:49:36'),(437,'admin','admin','[è¯·æ±‚åœ°å€]:-role-grant.do,[ç±»å]:org.xiaojl.core.controller.RoleController,[æ–¹æ³•]:grant,[å‚æ•°]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228,229,246,247,248,249,250,240,241,242,243,230,232,233,244,234,235,236,237,238,239,245&','127.0.0.1','2016-11-22 19:49:39'),(438,'admin','admin','[è¯·æ±‚åœ°å€]:-framework-logout.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:logout,[å‚æ•°]:','127.0.0.1','2016-11-22 19:50:00'),(439,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','127.0.0.1','2016-11-22 19:50:01'),(440,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','127.0.0.1','2016-11-22 19:52:15'),(441,'admin','admin','[è¯·æ±‚åœ°å€]:-workflowModel-addPage.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowModelController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 19:55:08'),(442,'admin','admin','[è¯·æ±‚åœ°å€]:-workflowModel-addPage.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowModelController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 20:04:32'),(443,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','127.0.0.1','2016-11-22 20:51:03'),(444,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-add.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:add,[å‚æ•°]:code=1&name=1&','127.0.0.1','2016-11-22 20:51:14'),(445,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-add.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:add,[å‚æ•°]:code=1&name=1&','127.0.0.1','2016-11-22 20:53:51'),(446,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-add.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:add,[å‚æ•°]:code=1&name=1&','127.0.0.1','2016-11-22 20:54:43'),(447,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','127.0.0.1','2016-11-22 20:55:54'),(448,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-add.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:add,[å‚æ•°]:code=2&name=2&','127.0.0.1','2016-11-22 20:56:11'),(449,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-delete.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:delete,[å‚æ•°]:ids=&','127.0.0.1','2016-11-22 20:56:51'),(450,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-edit.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:edit,[å‚æ•°]:id=7&code=11&name=11&','127.0.0.1','2016-11-22 21:05:20'),(451,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-edit.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:edit,[å‚æ•°]:id=8&code=22&name=22&','127.0.0.1','2016-11-22 21:06:01'),(452,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-edit.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:edit,[å‚æ•°]:id=7&code=112&name=112&','127.0.0.1','2016-11-22 21:09:38'),(453,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-edit.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:edit,[å‚æ•°]:id=7&code=12&name=12&','127.0.0.1','2016-11-22 21:11:20'),(454,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-edit.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:edit,[å‚æ•°]:id=7&code=123&name=12&','127.0.0.1','2016-11-22 21:11:46'),(455,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-edit.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:edit,[å‚æ•°]:id=7&code=3&name=12&','127.0.0.1','2016-11-22 21:12:09'),(456,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-edit.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:edit,[å‚æ•°]:id=7&code=123&name=122&','127.0.0.1','2016-11-22 21:12:56'),(457,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-add.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:add,[å‚æ•°]:code=3&name=3&','127.0.0.1','2016-11-22 21:15:10'),(458,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-edit.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:edit,[å‚æ•°]:id=7&code=1233&name=122&','127.0.0.1','2016-11-22 21:15:19'),(459,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-edit.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:edit,[å‚æ•°]:id=8&code=2234&name=22&','127.0.0.1','2016-11-22 21:15:37'),(460,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-delete.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:delete,[å‚æ•°]:ids=&','127.0.0.1','2016-11-22 21:16:45'),(461,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-delete.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:delete,[å‚æ•°]:ids=8&','127.0.0.1','2016-11-22 21:18:01'),(462,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-delete.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:delete,[å‚æ•°]:ids=7&','127.0.0.1','2016-11-22 21:24:10'),(463,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-delete.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:delete,[å‚æ•°]:ids=9&','127.0.0.1','2016-11-22 21:24:12'),(464,'admin','admin','[è¯·æ±‚åœ°å€]:-processType-add.do,[ç±»å]:org.xiaojl.workflow.controller.ProcessTypeController,[æ–¹æ³•]:add,[å‚æ•°]:code=LeaveBill&name=è¯·å‡æµç¨‹&','127.0.0.1','2016-11-22 21:25:22'),(465,'admin','admin','[è¯·æ±‚åœ°å€]:-workflowModel-addPage.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowModelController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 21:25:52'),(466,'admin','admin','[è¯·æ±‚åœ°å€]:-workflowModel-addPage.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowModelController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 21:25:58'),(467,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','127.0.0.1','2016-11-22 21:45:27'),(468,'admin','admin','[è¯·æ±‚åœ°å€]:-workflowModel-addPage.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowModelController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 21:45:31'),(469,'admin','admin','[è¯·æ±‚åœ°å€]:-workflowModel-addPage.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowModelController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 21:46:11'),(470,'admin','admin','[è¯·æ±‚åœ°å€]:-workflowModel-addPage.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowModelController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 21:47:22'),(471,'admin','admin','[è¯·æ±‚åœ°å€]:-workflowModel-addPage.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowModelController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 21:47:47'),(472,'admin','admin','[è¯·æ±‚åœ°å€]:-workflowModel-addPage.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowModelController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 21:48:25'),(473,'admin','admin','[è¯·æ±‚åœ°å€]:-workflowModel-addPage.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowModelController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 21:49:12'),(474,'admin','admin','[è¯·æ±‚åœ°å€]:-workflowModel-addPage.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowModelController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 21:49:38'),(475,'admin','admin','[è¯·æ±‚åœ°å€]:-workflowModel-addPage.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowModelController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 21:50:11'),(476,'admin','admin','[è¯·æ±‚åœ°å€]:-workflowModel-addPage.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowModelController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 21:52:09'),(477,'admin','admin','[è¯·æ±‚åœ°å€]:-workflowModel-add.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowModelController,[æ–¹æ³•]:add,[å‚æ•°]:name=12&key=12&category=LeaveBill&description=12&','127.0.0.1','2016-11-22 21:52:16'),(478,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','127.0.0.1','2016-11-22 22:08:11'),(479,'admin','admin','[è¯·æ±‚åœ°å€]:-workflowModel-addPage.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowModelController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 22:10:54'),(480,'admin','admin','[è¯·æ±‚åœ°å€]:-workflowModel-add.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowModelController,[æ–¹æ³•]:add,[å‚æ•°]:name=è¯·å‡æµç¨‹001&key=è¯·å‡æµç¨‹001&category=LeaveBill&description=è¯·å‡æµç¨‹001&','127.0.0.1','2016-11-22 22:11:16'),(481,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','127.0.0.1','2016-11-22 22:13:50'),(482,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','127.0.0.1','2016-11-22 22:15:28'),(483,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','127.0.0.1','2016-11-22 22:16:35'),(484,'admin','admin','[è¯·æ±‚åœ°å€]:-leave-addPage.do,[ç±»å]:org.xiaojl.oa.controller.LeaveController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 22:39:04'),(485,'admin','admin','[è¯·æ±‚åœ°å€]:-leave-add.do,[ç±»å]:org.xiaojl.oa.controller.LeaveController,[æ–¹æ³•]:add,[å‚æ•°]:leaveDays=2&leaveTime=2016-11-22 22:39:07&context=12&remark=12&','127.0.0.1','2016-11-22 22:39:13'),(486,'åŒ¿åç”¨æˆ·','åŒ¿åç”¨æˆ·','[è¯·æ±‚åœ°å€]:-framework-login.do,[ç±»å]:org.xiaojl.core.controller.FrameworkController,[æ–¹æ³•]:loginPost,[å‚æ•°]:username=admin&password=1&','127.0.0.1','2016-11-22 22:51:16'),(487,'admin','admin','[è¯·æ±‚åœ°å€]:-workflow-deleteDeployment.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowController,[æ–¹æ³•]:deleteDeployment,[å‚æ•°]:deploymentId=2502&','127.0.0.1','2016-11-22 23:02:39'),(488,'admin','admin','[è¯·æ±‚åœ°å€]:-workflow-deleteDeployment.do,[ç±»å]:org.xiaojl.workflow.controller.WorkflowController,[æ–¹æ³•]:deleteDeployment,[å‚æ•°]:deploymentId=2506&','127.0.0.1','2016-11-22 23:02:43'),(489,'admin','admin','[è¯·æ±‚åœ°å€]:-leave-addPage.do,[ç±»å]:org.xiaojl.oa.controller.LeaveController,[æ–¹æ³•]:addPage,[å‚æ•°]:','127.0.0.1','2016-11-22 23:10:49'),(490,'admin','admin','[è¯·æ±‚åœ°å€]:-leave-add.do,[ç±»å]:org.xiaojl.oa.controller.LeaveController,[æ–¹æ³•]:add,[å‚æ•°]:leaveDays=3&leaveTime=2016-11-22 23:10:52&context=1&remark=1&','127.0.0.1','2016-11-22 23:10:56');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®id',
  `login_name` varchar(64) NOT NULL COMMENT 'ç™»é™†å',
  `name` varchar(64) NOT NULL COMMENT 'ç”¨æˆ·å',
  `password` varchar(64) NOT NULL COMMENT 'å¯†ç ',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'æ€§åˆ«',
  `age` tinyint(2) DEFAULT '0' COMMENT 'å¹´é¾„',
  `phone` varchar(20) DEFAULT NULL COMMENT 'æ‰‹æœºå·',
  `user_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'ç”¨æˆ·ç±»åˆ«',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'ç”¨æˆ·çŠ¶æ€',
  `organization_id` int(11) NOT NULL DEFAULT '0' COMMENT 'æ‰€å±žæœºæž„',
  `create_time` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·';

/*Data for the table `user` */

insert  into `user`(`id`,`login_name`,`name`,`password`,`sex`,`age`,`phone`,`user_type`,`status`,`organization_id`,`create_time`) values (1,'admin','admin','c4ca4238a0b923820dcc509a6f75849b',0,25,'18707173376',0,0,1,'2015-12-06 13:14:05'),(13,'snoopy','snoopy','c4ca4238a0b923820dcc509a6f75849b',0,25,'18707173376',1,0,3,'2015-10-01 13:12:07'),(14,'dreamlu','dreamlu','098f6bcd4621d373cade4e832627b4f6',0,25,'18707173376',1,0,5,'2015-10-11 23:12:58'),(15,'test','test1','098f6bcd4621d373cade4e832627b4f6',0,25,'18707173376',1,0,6,'2015-12-06 13:13:03');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®id',
  `user_id` bigint(19) NOT NULL COMMENT 'ç”¨æˆ·id',
  `role_id` bigint(19) NOT NULL COMMENT 'è§’è‰²id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·è§’è‰²';

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`user_id`,`role_id`) values (64,14,7),(67,15,8),(68,1,1),(70,13,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
