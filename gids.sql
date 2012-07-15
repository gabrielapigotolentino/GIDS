/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : gids

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2012-06-04 19:46:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `barangay`
-- ----------------------------
DROP TABLE IF EXISTS `barangay`;
CREATE TABLE `barangay` (
  `BCode` varchar(3) NOT NULL,
  `Description` varchar(150) NOT NULL,
  `Dist_Code` varchar(150) NOT NULL,
  `M_Code` varchar(50) NOT NULL,
  PRIMARY KEY (`BCode`,`M_Code`),
  KEY `BCode` (`BCode`),
  KEY `M_Code` (`M_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of barangay
-- ----------------------------
INSERT INTO `barangay` VALUES ('001', 'POBLACION', '00', '01');
INSERT INTO `barangay` VALUES ('001', 'WAWA', '00', '02');
INSERT INTO `barangay` VALUES ('001', 'IBABA', '00', '03');
INSERT INTO `barangay` VALUES ('001', 'AQUINO', '00', '04');
INSERT INTO `barangay` VALUES ('001', 'BURGOS-SOLIMAN', '00', '05');
INSERT INTO `barangay` VALUES ('001', 'POBLACION', '00', '06');
INSERT INTO `barangay` VALUES ('001', 'POBLACION', '00', '07');
INSERT INTO `barangay` VALUES ('001', 'POBLACION', '00', '08');
INSERT INTO `barangay` VALUES ('001', 'CENTRO 1', '00', '09');
INSERT INTO `barangay` VALUES ('001', 'SAN VICENTE', '00', '10');
INSERT INTO `barangay` VALUES ('001', 'POBLACION', '00', '11');
INSERT INTO `barangay` VALUES ('001', 'DAANG BAGO EAST', '00', '12');
INSERT INTO `barangay` VALUES ('002', 'BAGUMBAYAN', '00', '01');
INSERT INTO `barangay` VALUES ('002', 'CALAYLAYAN', '00', '02');
INSERT INTO `barangay` VALUES ('002', 'TABING-ILOG', '00', '03');
INSERT INTO `barangay` VALUES ('002', 'BONIFACIO', '00', '04');
INSERT INTO `barangay` VALUES ('002', 'ALMACEN', '00', '05');
INSERT INTO `barangay` VALUES ('002', 'ALANGAN', '00', '06');
INSERT INTO `barangay` VALUES ('002', 'ALAS-ASIN', '00', '07');
INSERT INTO `barangay` VALUES ('002', 'BINARITAN', '00', '08');
INSERT INTO `barangay` VALUES ('002', 'APOLLO', '00', '09');
INSERT INTO `barangay` VALUES ('002', 'ARELLANO', '00', '10');
INSERT INTO `barangay` VALUES ('002', 'ALA-ULI', '00', '11');
INSERT INTO `barangay` VALUES ('002', 'CALAGUIMAN EAST', '00', '12');
INSERT INTO `barangay` VALUES ('003', 'CABOG-CABOG', '00', '01');
INSERT INTO `barangay` VALUES ('003', 'CAPITANGAN', '00', '02');
INSERT INTO `barangay` VALUES ('003', 'BAGUMBAYAN', '00', '03');
INSERT INTO `barangay` VALUES ('003', 'BURGOS', '00', '04');
INSERT INTO `barangay` VALUES ('003', 'ANTONIO RIVERA', '00', '05');
INSERT INTO `barangay` VALUES ('003', 'KITANG I', '00', '06');
INSERT INTO `barangay` VALUES ('003', 'ALION', '00', '07');
INSERT INTO `barangay` VALUES ('003', 'MABAYO', '00', '08');
INSERT INTO `barangay` VALUES ('003', 'BALUT', '00', '09');
INSERT INTO `barangay` VALUES ('003', 'BALAGTAS', '00', '10');
INSERT INTO `barangay` VALUES ('003', 'BAGUMBAYAN', '00', '11');
INSERT INTO `barangay` VALUES ('003', 'CALAGUIMAN WEST', '00', '12');
INSERT INTO `barangay` VALUES ('004', 'CAMACHO', '00', '01');
INSERT INTO `barangay` VALUES ('004', 'GABON', '00', '02');
INSERT INTO `barangay` VALUES ('004', 'BANAWANG', '00', '03');
INSERT INTO `barangay` VALUES ('004', 'DAAN BAGO', '00', '04');
INSERT INTO `barangay` VALUES ('004', 'BACONG', '00', '05');
INSERT INTO `barangay` VALUES ('004', 'LAMAO', '00', '06');
INSERT INTO `barangay` VALUES ('004', 'BALON ANITO', '00', '07');
INSERT INTO `barangay` VALUES ('004', 'NAGBALAYONG', '00', '08');
INSERT INTO `barangay` VALUES ('004', 'BAYAN', '00', '09');
INSERT INTO `barangay` VALUES ('004', 'DAAN BILOLO', '00', '10');
INSERT INTO `barangay` VALUES ('004', 'BALUT I', '00', '11');
INSERT INTO `barangay` VALUES ('004', 'DAAN BAGO WEST', '00', '12');
INSERT INTO `barangay` VALUES ('005', 'CATANING', '00', '01');
INSERT INTO `barangay` VALUES ('005', 'LAON', '00', '02');
INSERT INTO `barangay` VALUES ('005', 'BINUCAWAN', '00', '03');
INSERT INTO `barangay` VALUES ('005', 'DEL PILAR', '00', '04');
INSERT INTO `barangay` VALUES ('005', 'BALSIC', '00', '05');
INSERT INTO `barangay` VALUES ('005', 'LANDING', '00', '06');
INSERT INTO `barangay` VALUES ('005', 'BASECO', '00', '07');
INSERT INTO `barangay` VALUES ('005', 'SABANG', '00', '08');
INSERT INTO `barangay` VALUES ('005', 'CALERO', '00', '09');
INSERT INTO `barangay` VALUES ('005', 'BAGUMBAYAN', '00', '10');
INSERT INTO `barangay` VALUES ('005', 'BALUT II', '00', '11');
INSERT INTO `barangay` VALUES ('005', 'GUGO', '00', '12');
INSERT INTO `barangay` VALUES ('006', 'CUPANG CENTRAL', '00', '01');
INSERT INTO `barangay` VALUES ('006', 'MABATANG', '00', '02');
INSERT INTO `barangay` VALUES ('006', 'BINUANGAN', '00', '03');
INSERT INTO `barangay` VALUES ('006', 'GEN. LUNA', '00', '04');
INSERT INTO `barangay` VALUES ('006', 'BAMBAN', '00', '05');
INSERT INTO `barangay` VALUES ('006', 'KITANG II', '00', '06');
INSERT INTO `barangay` VALUES ('006', 'BATANGAS II', '00', '07');
INSERT INTO `barangay` VALUES ('006', 'CENTRO II', '00', '09');
INSERT INTO `barangay` VALUES ('006', 'BALUT', '00', '10');
INSERT INTO `barangay` VALUES ('006', 'BANTAN MUNTI', '00', '11');
INSERT INTO `barangay` VALUES ('006', 'IBABA', '00', '12');
INSERT INTO `barangay` VALUES ('007', 'CUPANG PROPER', '00', '01');
INSERT INTO `barangay` VALUES ('007', 'OMBOY', '00', '02');
INSERT INTO `barangay` VALUES ('007', 'IBIS', '00', '03');
INSERT INTO `barangay` VALUES ('007', 'GOMEZ', '00', '04');
INSERT INTO `barangay` VALUES ('007', 'CATANING', '00', '05');
INSERT INTO `barangay` VALUES ('007', 'REFORMISTA', '00', '06');
INSERT INTO `barangay` VALUES ('007', 'BIAAN', '00', '07');
INSERT INTO `barangay` VALUES ('007', 'DONA', '00', '09');
INSERT INTO `barangay` VALUES ('007', 'BANTAN GRANDE', '00', '10');
INSERT INTO `barangay` VALUES ('007', 'BURGOS', '00', '11');
INSERT INTO `barangay` VALUES ('007', 'IMELDA', '00', '12');
INSERT INTO `barangay` VALUES ('008', 'CUPANG WEST', '00', '01');
INSERT INTO `barangay` VALUES ('008', 'SALIAN', '00', '02');
INSERT INTO `barangay` VALUES ('008', 'PAG-ASA', '00', '03');
INSERT INTO `barangay` VALUES ('008', 'KATAASAN', '00', '04');
INSERT INTO `barangay` VALUES ('008', 'CULIS', '00', '05');
INSERT INTO `barangay` VALUES ('008', 'TOWNSITE', '00', '06');
INSERT INTO `barangay` VALUES ('008', 'CABCABEN', '00', '07');
INSERT INTO `barangay` VALUES ('008', 'KABALUTAN', '00', '09');
INSERT INTO `barangay` VALUES ('008', 'CALUNGUSAN', '00', '10');
INSERT INTO `barangay` VALUES ('008', 'DIWA', '00', '11');
INSERT INTO `barangay` VALUES ('008', 'LALAWIGAN', '00', '12');
INSERT INTO `barangay` VALUES ('009', 'DANGCOL', '00', '01');
INSERT INTO `barangay` VALUES ('009', 'PARANG', '00', '03');
INSERT INTO `barangay` VALUES ('009', 'LAYAC', '00', '04');
INSERT INTO `barangay` VALUES ('009', 'DAUNGAN', '00', '05');
INSERT INTO `barangay` VALUES ('009', 'WAWA', '00', '06');
INSERT INTO `barangay` VALUES ('009', 'CAMAYA', '00', '07');
INSERT INTO `barangay` VALUES ('009', 'KAPARANGAN', '00', '09');
INSERT INTO `barangay` VALUES ('009', 'CAMACHILE', '00', '10');
INSERT INTO `barangay` VALUES ('009', 'LANDING', '00', '11');
INSERT INTO `barangay` VALUES ('009', 'PALILI', '00', '12');
INSERT INTO `barangay` VALUES ('010', 'IBAYO', '00', '01');
INSERT INTO `barangay` VALUES ('010', 'PAYSAWAN', '00', '03');
INSERT INTO `barangay` VALUES ('010', 'MABINI EXTENSION', '00', '04');
INSERT INTO `barangay` VALUES ('010', 'MANDAMA', '00', '05');
INSERT INTO `barangay` VALUES ('010', 'SAN FRANCISCO DE ASIS I', '00', '06');
INSERT INTO `barangay` VALUES ('010', 'IPAG', '00', '07');
INSERT INTO `barangay` VALUES ('010', 'MARIA FE', '00', '09');
INSERT INTO `barangay` VALUES ('010', 'DAANG BAGO', '00', '10');
INSERT INTO `barangay` VALUES ('010', 'LIYANG ', '00', '11');
INSERT INTO `barangay` VALUES ('010', 'SAN JUAN', '00', '12');
INSERT INTO `barangay` VALUES ('011', 'MALABIA', '00', '01');
INSERT INTO `barangay` VALUES ('011', 'SAN ANTONIO', '00', '03');
INSERT INTO `barangay` VALUES ('011', 'MABINI PROPER', '00', '04');
INSERT INTO `barangay` VALUES ('011', 'MABIGA', '00', '05');
INSERT INTO `barangay` VALUES ('011', 'SAN FRANCISCO DE ASIS II', '00', '06');
INSERT INTO `barangay` VALUES ('011', 'LUCANIN', '00', '07');
INSERT INTO `barangay` VALUES ('011', 'MASANTOL', '00', '09');
INSERT INTO `barangay` VALUES ('011', 'BILOLO', '00', '10');
INSERT INTO `barangay` VALUES ('011', 'NAGWALING', '00', '11');
INSERT INTO `barangay` VALUES ('011', 'SAN ROQUE', '00', '12');
INSERT INTO `barangay` VALUES ('012', 'MUNTING BATANGAS', '00', '01');
INSERT INTO `barangay` VALUES ('012', 'SAYSAIN', '00', '03');
INSERT INTO `barangay` VALUES ('012', 'PADRE DANDAN', '00', '04');
INSERT INTO `barangay` VALUES ('012', 'MABUCO', '00', '05');
INSERT INTO `barangay` VALUES ('012', 'PEAS DUALE', '00', '06');
INSERT INTO `barangay` VALUES ('012', 'MT. VIEW', '00', '07');
INSERT INTO `barangay` VALUES ('012', 'MULAWIN', '00', '09');
INSERT INTO `barangay` VALUES ('012', 'DAAN PARE', '00', '10');
INSERT INTO `barangay` VALUES ('012', 'PANILAO', '00', '11');
INSERT INTO `barangay` VALUES ('012', 'SANTA LUCIA', '00', '12');
INSERT INTO `barangay` VALUES ('013', 'PUERTO RIVAS IBABA', '00', '01');
INSERT INTO `barangay` VALUES ('013', 'QUINAWAN', '00', '03');
INSERT INTO `barangay` VALUES ('013', 'RIZAL', '00', '04');
INSERT INTO `barangay` VALUES ('013', 'MAITE', '00', '05');
INSERT INTO `barangay` VALUES ('013', 'SAN CARLOS', '00', '07');
INSERT INTO `barangay` VALUES ('013', 'PAKING-CARBONERO', '00', '09');
INSERT INTO `barangay` VALUES ('013', 'GENERAL LIM', '00', '10');
INSERT INTO `barangay` VALUES ('013', 'PANTINGAN', '00', '11');
INSERT INTO `barangay` VALUES ('013', 'SAPA', '00', '12');
INSERT INTO `barangay` VALUES ('014', 'PUERTO RIVAS ITAAS', '00', '01');
INSERT INTO `barangay` VALUES ('014', 'ATILANO RICARDO', '00', '03');
INSERT INTO `barangay` VALUES ('014', 'ROXAS', '00', '04');
INSERT INTO `barangay` VALUES ('014', 'MAMBOG', '00', '05');
INSERT INTO `barangay` VALUES ('014', 'SAN ISIDRO', '00', '07');
INSERT INTO `barangay` VALUES ('014', 'PAG-ASA', '00', '09');
INSERT INTO `barangay` VALUES ('014', 'CAPUNITAN', '00', '10');
INSERT INTO `barangay` VALUES ('014', 'RIZAL', '00', '11');
INSERT INTO `barangay` VALUES ('014', 'TABING-ILOG', '00', '12');
INSERT INTO `barangay` VALUES ('015', 'SAN JOSE', '00', '01');
INSERT INTO `barangay` VALUES ('015', 'SAN ISIDRO', '00', '04');
INSERT INTO `barangay` VALUES ('015', 'PALIHAN', '00', '05');
INSERT INTO `barangay` VALUES ('015', 'SISIMAN', '00', '07');
INSERT INTO `barangay` VALUES ('015', 'PALIHAN', '00', '09');
INSERT INTO `barangay` VALUES ('015', 'LATI', '00', '10');
INSERT INTO `barangay` VALUES ('015', 'DEL ROSARIO', '00', '11');
INSERT INTO `barangay` VALUES ('015', 'B.P.P.M.I.', '00', '12');
INSERT INTO `barangay` VALUES ('016', 'SIBACAN', '00', '01');
INSERT INTO `barangay` VALUES ('016', 'SAN RAMON', '00', '04');
INSERT INTO `barangay` VALUES ('016', 'PANDATONG', '00', '05');
INSERT INTO `barangay` VALUES ('016', 'TOWNSITE', '00', '07');
INSERT INTO `barangay` VALUES ('016', 'PANTALAN BAGO', '00', '09');
INSERT INTO `barangay` VALUES ('016', 'LUSUNGAN', '00', '10');
INSERT INTO `barangay` VALUES ('016', 'SANTA ROSA', '00', '11');
INSERT INTO `barangay` VALUES ('017', 'TALISAY', '00', '01');
INSERT INTO `barangay` VALUES ('017', 'STA. ISABEL (TABACAN)', '00', '04');
INSERT INTO `barangay` VALUES ('017', 'PULO', '00', '05');
INSERT INTO `barangay` VALUES ('017', 'EPZA', '00', '07');
INSERT INTO `barangay` VALUES ('017', 'PANTALAN LUMA', '00', '09');
INSERT INTO `barangay` VALUES ('017', 'PUTING BUHANGIN', '00', '10');
INSERT INTO `barangay` VALUES ('017', 'WAKAS NORTH', '00', '11');
INSERT INTO `barangay` VALUES ('018', 'TANATO', '00', '01');
INSERT INTO `barangay` VALUES ('018', 'TORRES BUGALLON', '00', '04');
INSERT INTO `barangay` VALUES ('018', 'SABA', '00', '05');
INSERT INTO `barangay` VALUES ('018', 'PARAISO', '00', '09');
INSERT INTO `barangay` VALUES ('018', 'SABATAN', '00', '10');
INSERT INTO `barangay` VALUES ('018', 'WAKAS SOUTH', '00', '11');
INSERT INTO `barangay` VALUES ('019', 'TENEJERO', '00', '01');
INSERT INTO `barangay` VALUES ('019', 'ZAMORA', '00', '04');
INSERT INTO `barangay` VALUES ('019', 'SACRIFICE VALLEY', '00', '05');
INSERT INTO `barangay` VALUES ('019', 'PARANG-PARANG', '00', '09');
INSERT INTO `barangay` VALUES ('019', 'SANTO DOMINGO', '00', '10');
INSERT INTO `barangay` VALUES ('019', 'WAWA', '00', '11');
INSERT INTO `barangay` VALUES ('020', 'TORTUGAS', '00', '01');
INSERT INTO `barangay` VALUES ('020', 'HAPPY VALLEY', '00', '04');
INSERT INTO `barangay` VALUES ('020', 'SAN PEDRO', '00', '05');
INSERT INTO `barangay` VALUES ('020', 'PUKSUAN', '00', '09');
INSERT INTO `barangay` VALUES ('020', 'VILLA ANGELES', '00', '10');
INSERT INTO `barangay` VALUES ('021', 'TUYO', '00', '01');
INSERT INTO `barangay` VALUES ('021', 'LUACAN', '00', '04');
INSERT INTO `barangay` VALUES ('021', 'STO. CRISTO', '00', '05');
INSERT INTO `barangay` VALUES ('021', 'SIBUL', '00', '09');
INSERT INTO `barangay` VALUES ('021', 'WAKAS', '00', '10');
INSERT INTO `barangay` VALUES ('022', 'DOÑA FRANCISCA', '00', '01');
INSERT INTO `barangay` VALUES ('022', 'NAPARING', '00', '04');
INSERT INTO `barangay` VALUES ('022', 'SUMALO', '00', '05');
INSERT INTO `barangay` VALUES ('022', 'SILAHIS', '00', '09');
INSERT INTO `barangay` VALUES ('022', 'WAWA', '00', '10');
INSERT INTO `barangay` VALUES ('023', 'CUPANG NORTH', '00', '01');
INSERT INTO `barangay` VALUES ('023', 'NEW SAN JOSE', '00', '04');
INSERT INTO `barangay` VALUES ('023', 'TIPO', '00', '05');
INSERT INTO `barangay` VALUES ('023', 'TAGUMPAY', '00', '09');
INSERT INTO `barangay` VALUES ('023', 'SANTA ELENA', '00', '10');
INSERT INTO `barangay` VALUES ('024', 'BAGONG SILANG', '00', '01');
INSERT INTO `barangay` VALUES ('024', 'OLD SAN JOSE', '00', '04');
INSERT INTO `barangay` VALUES ('024', 'TALA', '00', '09');
INSERT INTO `barangay` VALUES ('025', 'PUERTO RIVAS LOTE', '00', '01');
INSERT INTO `barangay` VALUES ('025', 'PAGALANGGANG', '00', '04');
INSERT INTO `barangay` VALUES ('025', 'TALIMUNDOC', '00', '09');
INSERT INTO `barangay` VALUES ('026', 'PENTOR', '00', '04');
INSERT INTO `barangay` VALUES ('026', 'TAPULAO', '00', '09');
INSERT INTO `barangay` VALUES ('027', 'PINULOT', '00', '04');
INSERT INTO `barangay` VALUES ('027', 'TENEJERO', '00', '09');
INSERT INTO `barangay` VALUES ('028', 'SAGUING', '00', '04');
INSERT INTO `barangay` VALUES ('028', 'TUGATOG', '00', '09');
INSERT INTO `barangay` VALUES ('029', 'STO. NIÑO', '00', '04');
INSERT INTO `barangay` VALUES ('029', 'WAWA', '00', '09');
INSERT INTO `barangay` VALUES ('030', 'BANGAL', '00', '04');
INSERT INTO `barangay` VALUES ('031', 'BODEGA', '00', '04');
INSERT INTO `barangay` VALUES ('032', 'COLO', '00', '04');
INSERT INTO `barangay` VALUES ('033', 'DALAO', '00', '04');
INSERT INTO `barangay` VALUES ('034', 'J.C. PAYUMO JR.', '00', '04');
INSERT INTO `barangay` VALUES ('035', 'MAGSAYSAY', '00', '04');
INSERT INTO `barangay` VALUES ('036', 'MALIGAYA', '00', '04');
INSERT INTO `barangay` VALUES ('037', 'PAG-ASA', '00', '04');
INSERT INTO `barangay` VALUES ('038', 'PAYANGAN', '00', '04');
INSERT INTO `barangay` VALUES ('039', 'PITA', '00', '04');
INSERT INTO `barangay` VALUES ('040', 'ROOSEVELT', '00', '04');
INSERT INTO `barangay` VALUES ('041', 'SAPANG BALAS', '00', '04');
INSERT INTO `barangay` VALUES ('042', 'SAN BENITO', '00', '04');
INSERT INTO `barangay` VALUES ('043', 'SAN PABLO', '00', '04');
INSERT INTO `barangay` VALUES ('044', 'SAN SIMON', '00', '04');
INSERT INTO `barangay` VALUES ('045', 'TUBO-TUBO', '00', '04');
INSERT INTO `barangay` VALUES ('046', 'TUCOP', '00', '04');

-- ----------------------------
-- Table structure for `beg_balance`
-- ----------------------------
DROP TABLE IF EXISTS `beg_balance`;
CREATE TABLE `beg_balance` (
  `cmonth` int(11) NOT NULL,
  `cyear` int(11) NOT NULL,
  `item_id` varchar(20) NOT NULL,
  `beg_qty` int(11) NOT NULL DEFAULT '0',
  `cactive` tinyint(4) NOT NULL DEFAULT '0',
  `UserID` int(11) NOT NULL DEFAULT '0',
  `TransDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cmonth`,`cyear`,`item_id`),
  KEY `item_id` (`item_id`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of beg_balance
-- ----------------------------
INSERT INTO `beg_balance` VALUES ('5', '2012', 'G-00001', '5000', '1', '1', '2012-06-04 17:26:53');
INSERT INTO `beg_balance` VALUES ('5', '2012', 'G-00002', '5000', '1', '1', '2012-06-04 17:26:57');
INSERT INTO `beg_balance` VALUES ('5', '2012', 'G-00003', '5000', '1', '1', '2012-06-04 17:27:01');
INSERT INTO `beg_balance` VALUES ('5', '2012', 'G-00004', '5000', '1', '1', '2012-06-04 17:27:04');
INSERT INTO `beg_balance` VALUES ('5', '2012', 'G-00005', '5000', '1', '1', '2012-06-04 17:27:09');
INSERT INTO `beg_balance` VALUES ('5', '2012', 'G-00006', '10000', '1', '1', '2012-06-04 17:27:11');
INSERT INTO `beg_balance` VALUES ('5', '2012', 'G-00007', '10000', '1', '1', '2012-06-04 17:27:16');
INSERT INTO `beg_balance` VALUES ('5', '2012', 'G-00008', '10000', '1', '1', '2012-06-04 17:27:20');
INSERT INTO `beg_balance` VALUES ('5', '2012', 'G-00009', '10000', '1', '1', '2012-06-04 17:27:24');
INSERT INTO `beg_balance` VALUES ('5', '2012', 'G-00010', '5000', '1', '1', '2012-06-04 17:27:27');
INSERT INTO `beg_balance` VALUES ('5', '2012', 'G-00011', '10000', '1', '1', '2012-06-04 17:27:31');
INSERT INTO `beg_balance` VALUES ('5', '2012', 'G-00012', '5000', '1', '1', '2012-06-04 17:27:36');
INSERT INTO `beg_balance` VALUES ('5', '2012', 'G-00013', '5000', '1', '1', '2012-06-04 17:27:39');

-- ----------------------------
-- Table structure for `beneficiary`
-- ----------------------------
DROP TABLE IF EXISTS `beneficiary`;
CREATE TABLE `beneficiary` (
  `beneficiary_id` int(11) NOT NULL AUTO_INCREMENT,
  `beneficiary_description` varchar(80) NOT NULL DEFAULT '',
  `UserID` int(11) NOT NULL DEFAULT '0',
  `TransDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`beneficiary_id`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of beneficiary
-- ----------------------------
INSERT INTO `beneficiary` VALUES ('1', 'Kabalikat', '0', '0000-00-00 00:00:00');
INSERT INTO `beneficiary` VALUES ('2', 'Boy Scout', '0', '0000-00-00 00:00:00');
INSERT INTO `beneficiary` VALUES ('3', 'Orion Fire Station', '0', '0000-00-00 00:00:00');
INSERT INTO `beneficiary` VALUES ('4', 'Senior Citizens', '0', '0000-00-00 00:00:00');
INSERT INTO `beneficiary` VALUES ('5', 'Disabled', '0', '0000-00-00 00:00:00');
INSERT INTO `beneficiary` VALUES ('6', 'Teachers', '0', '0000-00-00 00:00:00');
INSERT INTO `beneficiary` VALUES ('7', 'LGU Municipality', '0', '2012-05-11 08:17:28');
INSERT INTO `beneficiary` VALUES ('8', 'LGU Capitol', '0', '2012-05-11 08:17:45');
INSERT INTO `beneficiary` VALUES ('9', 'LGU City', '0', '2012-05-11 08:17:50');
INSERT INTO `beneficiary` VALUES ('10', 'PENELCO', '0', '0000-00-00 00:00:00');
INSERT INTO `beneficiary` VALUES ('11', 'Lamao Tricycle Drivers Association', '0', '0000-00-00 00:00:00');
INSERT INTO `beneficiary` VALUES ('12', 'Oranian\'s Plaza Joggers', '0', '0000-00-00 00:00:00');
INSERT INTO `beneficiary` VALUES ('13', 'FARMC', '0', '0000-00-00 00:00:00');
INSERT INTO `beneficiary` VALUES ('14', 'Typhoon Victim', '0', '0000-00-00 00:00:00');
INSERT INTO `beneficiary` VALUES ('15', 'Fire Victim', '0', '0000-00-00 00:00:00');
INSERT INTO `beneficiary` VALUES ('16', 'Ofiicials', '0', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_description` varchar(50) NOT NULL DEFAULT '',
  `UserID` int(11) NOT NULL DEFAULT '0',
  `TransDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`brand_id`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', 'NFA', '1', '2012-05-29 10:03:38');
INSERT INTO `brand` VALUES ('2', 'Purefoods', '1', '2012-05-29 12:13:57');
INSERT INTO `brand` VALUES ('3', 'San Miguel Pure Foods', '1', '2012-05-29 13:07:52');
INSERT INTO `brand` VALUES ('4', 'Magnolia', '1', '2012-05-29 13:01:35');
INSERT INTO `brand` VALUES ('5', 'Lucky Me', '1', '2012-05-29 13:12:16');
INSERT INTO `brand` VALUES ('6', 'WN', '1', '2012-05-29 13:59:26');
INSERT INTO `brand` VALUES ('7', 'CN', '1', '2012-05-29 14:00:40');
INSERT INTO `brand` VALUES ('8', 'BALLPEN', '1', '2012-05-29 14:02:32');

-- ----------------------------
-- Table structure for `designation`
-- ----------------------------
DROP TABLE IF EXISTS `designation`;
CREATE TABLE `designation` (
  `designation_id` int(11) NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(100) NOT NULL DEFAULT '',
  `UserID` int(11) NOT NULL DEFAULT '0',
  `TransDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`designation_id`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of designation
-- ----------------------------
INSERT INTO `designation` VALUES ('1', 'COMPUTER PROGRAMMER I', '1', '2012-05-31 13:45:22');
INSERT INTO `designation` VALUES ('2', 'COMPUTER PROGRAMMER II', '1', '2012-05-31 13:45:41');
INSERT INTO `designation` VALUES ('3', 'COMPUTER PROGRAMMER III', '1', '2012-05-31 13:45:50');

-- ----------------------------
-- Table structure for `goodstype`
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype` (
  `goodstype_id` int(11) NOT NULL AUTO_INCREMENT,
  `goodstype_description` varchar(30) NOT NULL DEFAULT '',
  `UserID` int(11) NOT NULL DEFAULT '0',
  `TransDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`goodstype_id`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES ('1', 'NORMAL', '1', '2012-05-29 14:06:22');
INSERT INTO `goodstype` VALUES ('2', 'CHRISTMAS', '1', '2012-05-29 14:06:30');
INSERT INTO `goodstype` VALUES ('3', 'CALAMITY', '1', '2012-05-29 14:06:36');
INSERT INTO `goodstype` VALUES ('4', 'SPECIAL PACKAGE', '1', '2012-05-29 14:06:42');

-- ----------------------------
-- Table structure for `groupbindary`
-- ----------------------------
DROP TABLE IF EXISTS `groupbindary`;
CREATE TABLE `groupbindary` (
  `GroupID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(50) NOT NULL DEFAULT '',
  `Description` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of groupbindary
-- ----------------------------
INSERT INTO `groupbindary` VALUES ('1', 'Administrators', 'Admin Group');

-- ----------------------------
-- Table structure for `groupmembershipbindary`
-- ----------------------------
DROP TABLE IF EXISTS `groupmembershipbindary`;
CREATE TABLE `groupmembershipbindary` (
  `Username` varchar(50) NOT NULL,
  `GroupName` varchar(50) NOT NULL DEFAULT '',
  KEY `GroupName` (`GroupName`),
  KEY `Username` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of groupmembershipbindary
-- ----------------------------
INSERT INTO `groupmembershipbindary` VALUES ('mishss', 'Administrators');
INSERT INTO `groupmembershipbindary` VALUES ('admin', 'Administrators');
INSERT INTO `groupmembershipbindary` VALUES ('misdsv', 'Administrators');

-- ----------------------------
-- Table structure for `grouppermissions`
-- ----------------------------
DROP TABLE IF EXISTS `grouppermissions`;
CREATE TABLE `grouppermissions` (
  `GroupName` varchar(50) NOT NULL DEFAULT '',
  `Permission` varchar(50) NOT NULL DEFAULT '',
  KEY `GroupName` (`GroupName`),
  KEY `Permission` (`Permission`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of grouppermissions
-- ----------------------------
INSERT INTO `grouppermissions` VALUES ('Administrators', 'Administrator');

-- ----------------------------
-- Table structure for `iadj`
-- ----------------------------
DROP TABLE IF EXISTS `iadj`;
CREATE TABLE `iadj` (
  `adjID` varchar(20) NOT NULL,
  `adjDate` datetime NOT NULL,
  `adjDescription` varchar(50) NOT NULL,
  `userID` int(11) NOT NULL,
  `TransDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `c_signatory_id` int(11) NOT NULL,
  `p_signatory_id` int(11) NOT NULL,
  `c_position_id` int(11) NOT NULL,
  `p_position_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of iadj
-- ----------------------------

-- ----------------------------
-- Table structure for `iadjdet`
-- ----------------------------
DROP TABLE IF EXISTS `iadjdet`;
CREATE TABLE `iadjdet` (
  `adjID` varchar(20) NOT NULL,
  `item_id` varchar(20) NOT NULL,
  `qty_onhand` decimal(10,2) NOT NULL DEFAULT '0.00',
  `unit_id` int(11) NOT NULL,
  `adjustment_type` int(11) NOT NULL,
  PRIMARY KEY (`adjID`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of iadjdet
-- ----------------------------

-- ----------------------------
-- Table structure for `ibalance`
-- ----------------------------
DROP TABLE IF EXISTS `ibalance`;
CREATE TABLE `ibalance` (
  `item_id` varchar(11) NOT NULL,
  `qty_onhand` int(11) NOT NULL DEFAULT '0',
  `UserID` int(11) NOT NULL,
  `TransDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`),
  KEY `item_id` (`item_id`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ibalance
-- ----------------------------
INSERT INTO `ibalance` VALUES ('G-00001', '5000', '1', '2012-06-04 17:23:56');
INSERT INTO `ibalance` VALUES ('G-00002', '5000', '1', '2012-06-04 17:23:53');
INSERT INTO `ibalance` VALUES ('G-00003', '2000', '1', '2012-06-04 09:58:15');
INSERT INTO `ibalance` VALUES ('G-00004', '5000', '1', '2012-06-04 17:24:05');
INSERT INTO `ibalance` VALUES ('G-00005', '5000', '1', '2012-06-04 17:24:12');
INSERT INTO `ibalance` VALUES ('G-00006', '10000', '1', '2012-06-04 17:24:26');
INSERT INTO `ibalance` VALUES ('G-00007', '10000', '1', '2012-06-04 17:25:31');
INSERT INTO `ibalance` VALUES ('G-00008', '10000', '1', '2012-06-04 17:25:36');
INSERT INTO `ibalance` VALUES ('G-00009', '10000', '1', '2012-06-04 17:25:41');
INSERT INTO `ibalance` VALUES ('G-00010', '500', '1', '2012-06-04 09:58:26');
INSERT INTO `ibalance` VALUES ('G-00011', '5500', '1', '2012-06-04 09:58:42');
INSERT INTO `ibalance` VALUES ('G-00012', '5000', '1', '2012-06-04 17:26:08');
INSERT INTO `ibalance` VALUES ('G-00013', '5000', '1', '2012-06-04 17:26:12');

-- ----------------------------
-- Table structure for `ihist`
-- ----------------------------
DROP TABLE IF EXISTS `ihist`;
CREATE TABLE `ihist` (
  `trans_type` varchar(10) NOT NULL,
  `reference_id` varchar(20) NOT NULL,
  `trans_date` datetime NOT NULL,
  PRIMARY KEY (`reference_id`),
  KEY `reference_id` (`reference_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ihist
-- ----------------------------
INSERT INTO `ihist` VALUES ('S', 'S-2012-00001', '2012-06-04 17:30:54');
INSERT INTO `ihist` VALUES ('S', 'S-2012-00002', '2012-06-04 17:31:36');
INSERT INTO `ihist` VALUES ('I', 'I-2012-00001', '2012-06-04 17:32:54');
INSERT INTO `ihist` VALUES ('I', 'I-2012-00002', '2012-06-04 17:33:24');

-- ----------------------------
-- Table structure for `irec`
-- ----------------------------
DROP TABLE IF EXISTS `irec`;
CREATE TABLE `irec` (
  `recID` varchar(20) NOT NULL,
  `recDate` datetime NOT NULL,
  `recDescription` varchar(50) NOT NULL,
  `userID` int(11) NOT NULL,
  `TransDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `c_signatory_id` int(11) NOT NULL,
  `p_signatory_id` int(11) NOT NULL,
  `c_position_id` int(11) NOT NULL,
  `p_position_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of irec
-- ----------------------------

-- ----------------------------
-- Table structure for `irecdet`
-- ----------------------------
DROP TABLE IF EXISTS `irecdet`;
CREATE TABLE `irecdet` (
  `recID` varchar(20) NOT NULL,
  `item_id` varchar(20) NOT NULL,
  `qty_onhand` decimal(10,2) NOT NULL DEFAULT '0.00',
  `unit_id` int(11) NOT NULL,
  PRIMARY KEY (`recID`,`item_id`),
  KEY `recID` (`recID`),
  KEY `item_id` (`item_id`),
  KEY `unit_id` (`unit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of irecdet
-- ----------------------------

-- ----------------------------
-- Table structure for `iret`
-- ----------------------------
DROP TABLE IF EXISTS `iret`;
CREATE TABLE `iret` (
  `retID` varchar(20) NOT NULL,
  `retDate` datetime NOT NULL,
  `retDescription` varchar(50) NOT NULL,
  `userID` int(11) NOT NULL,
  `TransDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ris_id` varchar(20) NOT NULL,
  `c_signatory_id` int(11) NOT NULL,
  `p_signatory_id` int(11) NOT NULL,
  `c_position_id` int(11) NOT NULL,
  `p_position_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of iret
-- ----------------------------

-- ----------------------------
-- Table structure for `iretdet`
-- ----------------------------
DROP TABLE IF EXISTS `iretdet`;
CREATE TABLE `iretdet` (
  `retID` varchar(20) NOT NULL,
  `item_id` varchar(20) NOT NULL,
  `qty_onhand` decimal(10,2) NOT NULL DEFAULT '0.00',
  `unit_id` int(11) NOT NULL,
  `qty_distributed` decimal(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of iretdet
-- ----------------------------
INSERT INTO `iretdet` VALUES ('U-2012-00002', '00002', '11.00', '1', '23.00');

-- ----------------------------
-- Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `item_id` varchar(20) NOT NULL,
  `item_description` varchar(50) NOT NULL DEFAULT '',
  `item_type` varchar(2) NOT NULL DEFAULT '',
  `brand_id` int(11) NOT NULL DEFAULT '0',
  `size_id` int(11) NOT NULL DEFAULT '0',
  `unit_id` int(11) NOT NULL DEFAULT '0',
  `UserID` int(11) NOT NULL DEFAULT '0',
  `TransDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`),
  KEY `brand_id` (`brand_id`),
  KEY `size_id` (`size_id`),
  KEY `unit_id` (`unit_id`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('G-00001', 'Corned Beef', 'G', '2', '2', '2', '1', '2012-06-04 17:11:52');
INSERT INTO `item` VALUES ('G-00002', 'Corned Beef', 'G', '2', '3', '3', '1', '2012-06-04 17:12:27');
INSERT INTO `item` VALUES ('G-00003', 'Corned Beef Chunkee', 'G', '2', '4', '3', '1', '2012-06-04 17:12:57');
INSERT INTO `item` VALUES ('G-00004', 'Sausage', 'G', '2', '11', '3', '1', '2012-06-04 17:14:26');
INSERT INTO `item` VALUES ('G-00005', 'Spagetti Meat Sauce', 'G', '2', '5', '2', '1', '2012-06-04 17:14:48');
INSERT INTO `item` VALUES ('G-00006', 'Jelly Ace Fuitees (Mixed Fruits)', 'G', '3', '7', '5', '1', '2012-06-04 17:16:37');
INSERT INTO `item` VALUES ('G-00007', 'San Mig Coffee Black', 'G', '3', '6', '4', '1', '2012-06-04 17:17:27');
INSERT INTO `item` VALUES ('G-00008', 'Lucky Me (Assorted)', 'G', '5', '10', '8', '1', '2012-06-04 17:18:37');
INSERT INTO `item` VALUES ('G-00009', 'Orange Juice', 'G', '4', '8', '6', '1', '2012-06-04 17:19:17');
INSERT INTO `item` VALUES ('G-00010', 'Ulam King (Assorted)', 'G', '3', '9', '7', '1', '2012-06-04 17:20:43');
INSERT INTO `item` VALUES ('G-00011', 'Rice', 'G', '1', '1', '1', '1', '2012-06-04 17:21:05');
INSERT INTO `item` VALUES ('G-00012', 'Writing Notebook', 'S', '6', '12', '9', '1', '2012-06-04 17:22:00');
INSERT INTO `item` VALUES ('G-00013', 'Composition Notebook', 'S', '7', '12', '9', '1', '2012-06-04 17:22:27');

-- ----------------------------
-- Table structure for `itemsbygoods`
-- ----------------------------
DROP TABLE IF EXISTS `itemsbygoods`;
CREATE TABLE `itemsbygoods` (
  `goodstype_id` int(11) NOT NULL DEFAULT '0',
  `item_id` varchar(20) NOT NULL DEFAULT '',
  `itemsbygoods_qty` int(11) NOT NULL DEFAULT '0',
  `UserID` int(11) NOT NULL DEFAULT '0',
  `TransDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`goodstype_id`,`item_id`),
  KEY `goodstype_id` (`goodstype_id`),
  KEY `item_id` (`item_id`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of itemsbygoods
-- ----------------------------
INSERT INTO `itemsbygoods` VALUES ('1', 'G-00003', '2', '1', '2012-06-04 17:29:07');
INSERT INTO `itemsbygoods` VALUES ('1', 'G-00010', '3', '1', '2012-06-04 17:29:17');
INSERT INTO `itemsbygoods` VALUES ('1', 'G-00011', '3', '1', '2012-06-04 17:29:50');
INSERT INTO `itemsbygoods` VALUES ('2', 'G-00003', '3', '1', '2012-06-04 17:30:02');
INSERT INTO `itemsbygoods` VALUES ('2', 'G-00010', '3', '1', '2012-06-04 17:30:12');
INSERT INTO `itemsbygoods` VALUES ('2', 'G-00011', '3', '1', '2012-06-04 17:30:26');

-- ----------------------------
-- Table structure for `municity`
-- ----------------------------
DROP TABLE IF EXISTS `municity`;
CREATE TABLE `municity` (
  `CM_Mode` varchar(50) NOT NULL DEFAULT '',
  `CM_Code` varchar(50) NOT NULL DEFAULT '',
  `Description` varchar(255) NOT NULL DEFAULT '',
  `Prov` varchar(255) NOT NULL DEFAULT '',
  `CM_Capital` varchar(255) NOT NULL DEFAULT '',
  `Cutoff` varchar(15) NOT NULL DEFAULT '',
  `LogoPath` varchar(100) NOT NULL DEFAULT '',
  `M_Code` varchar(50) NOT NULL,
  `CActive` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`M_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of municity
-- ----------------------------
INSERT INTO `municity` VALUES ('C', '018', 'BALANGA', 'BATAAN', 'BALANGA', '5:00:00 PM', '', '01', '0');
INSERT INTO `municity` VALUES ('M', '018', 'ABUCAY', 'BATAAN', '', '5:00:00 PM', '', '02', '0');
INSERT INTO `municity` VALUES ('M', '018', 'BAGAC', 'BATAAN', ' ', '5:00:00 PM', '', '03', '0');
INSERT INTO `municity` VALUES ('M', '018', 'DINALUPIHAN', 'BATAAN', '', '5:00:00 PM', '', '04', '0');
INSERT INTO `municity` VALUES ('M', '018', 'HERMOSA', 'BATAAN', '', '5:00:00 PM', '', '05', '0');
INSERT INTO `municity` VALUES ('M', '018', 'LIMAY', 'BATAAN', '', '5:00:00 PM', '', '06', '0');
INSERT INTO `municity` VALUES ('M', '018', 'MARIVELES', 'BATAAN', '', '5:00:00 PM', '', '07', '0');
INSERT INTO `municity` VALUES ('M', '018', 'MORONG', 'BATAAN', '', '5:00:00 PM', '', '08', '0');
INSERT INTO `municity` VALUES ('M', '018', 'ORANI', 'BATAAN', ' ', '5:00:00 PM', '', '09', '1');
INSERT INTO `municity` VALUES ('M', '018', 'ORION', 'BATAAN', '', '5:00:00 PM', '', '10', '0');
INSERT INTO `municity` VALUES ('M', '018', 'PILAR', 'BATAAN', '', '5:00:00 PM', '', '11', '0');
INSERT INTO `municity` VALUES ('M', '018', 'SAMAL', 'BATAAN', '', '5:00:00 PM', '', '12', '0');

-- ----------------------------
-- Table structure for `permissionbindary`
-- ----------------------------
DROP TABLE IF EXISTS `permissionbindary`;
CREATE TABLE `permissionbindary` (
  `Permission` varchar(50) DEFAULT NULL,
  `Item` text,
  `Action` int(11) DEFAULT NULL,
  `FormName` varchar(50) DEFAULT NULL,
  KEY `Permission` (`Permission`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of permissionbindary
-- ----------------------------
INSERT INTO `permissionbindary` VALUES ('Administrator', 'actLogout,actSI,actExit,actItem,actBrand,actSize,actUnit,actIR,actSAI,actRIS,actAS,actCP,actUAccount,actUPolicy,actBackup,actRestore,mniFile,mniReferences,mniTransactions,mniReports,mniUtilities,mniUser,mniAbout,actGT,actPosition,actSignatory,actIG,actRI,actAdjustment,actImportRIS,actImportSAI,actRISSummary,actDesignation,actBegBalance,mniSynchronize', '1', 'frmMain');

-- ----------------------------
-- Table structure for `position`
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `position_description` varchar(80) NOT NULL DEFAULT '',
  `UserID` int(11) NOT NULL DEFAULT '0',
  `TransDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`position_id`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('1', 'Prepared By', '1', '2012-05-16 13:26:26');
INSERT INTO `position` VALUES ('2', 'Checked By', '1', '2012-05-16 13:26:32');
INSERT INTO `position` VALUES ('3', 'Approved By', '1', '2012-05-16 13:26:37');
INSERT INTO `position` VALUES ('4', 'Received By', '1', '2012-05-16 13:26:51');
INSERT INTO `position` VALUES ('5', 'Encoded By', '1', '2012-05-16 13:26:59');
INSERT INTO `position` VALUES ('6', 'Noted/Accepted By', '1', '2012-05-16 13:27:06');
INSERT INTO `position` VALUES ('7', 'Items Encoded By', '1', '2012-05-16 13:27:15');
INSERT INTO `position` VALUES ('8', 'Items Checked/Issued By', '1', '2012-05-16 13:27:28');
INSERT INTO `position` VALUES ('9', 'Adjusted By', '1', '2012-05-23 10:58:28');

-- ----------------------------
-- Table structure for `ris`
-- ----------------------------
DROP TABLE IF EXISTS `ris`;
CREATE TABLE `ris` (
  `ris_id` varchar(20) NOT NULL DEFAULT '',
  `ris_date` datetime NOT NULL,
  `sai_id` varchar(20) NOT NULL DEFAULT '',
  `sai_date` datetime NOT NULL,
  `goodstype_id` int(11) NOT NULL DEFAULT '0',
  `ris_qty` int(11) NOT NULL DEFAULT '0',
  `ris_returned` tinyint(4) NOT NULL DEFAULT '0',
  `r_signatory_id` int(11) NOT NULL DEFAULT '0',
  `e_signatory_id` int(11) NOT NULL DEFAULT '0',
  `na_signatory_id` int(11) NOT NULL DEFAULT '0',
  `ie_signatory_id` int(11) NOT NULL DEFAULT '0',
  `ici_signatory_id` int(11) NOT NULL DEFAULT '0',
  `a_signatory_id` int(11) NOT NULL DEFAULT '0',
  `ris_copied` tinyint(4) NOT NULL,
  `UserID` int(11) NOT NULL DEFAULT '0',
  `TransDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ris_id`),
  KEY `sai_id` (`sai_id`),
  KEY `goodstype_id` (`goodstype_id`),
  KEY `r_signatory_id` (`r_signatory_id`) USING BTREE,
  KEY `e_signatory_id` (`e_signatory_id`),
  KEY `na_signatory_id` (`na_signatory_id`),
  KEY `ie_signatory_id` (`ie_signatory_id`),
  KEY `ici_signatory_id` (`ici_signatory_id`),
  KEY `a_signatory_id` (`a_signatory_id`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ris
-- ----------------------------
INSERT INTO `ris` VALUES ('I-2012-00001', '2012-06-04 17:32:54', 'S-2012-00001', '2012-06-04 17:30:54', '1', '1000', '0', '6', '7', '10', '11', '12', '3', '0', '1', '2012-06-04 17:33:23');
INSERT INTO `ris` VALUES ('I-2012-00002', '2012-06-04 17:33:24', 'S-2012-00002', '2012-06-04 17:31:36', '1', '500', '0', '6', '7', '8', '11', '12', '4', '0', '1', '2012-06-04 17:34:01');

-- ----------------------------
-- Table structure for `ris_det`
-- ----------------------------
DROP TABLE IF EXISTS `ris_det`;
CREATE TABLE `ris_det` (
  `ris_id` varchar(20) NOT NULL DEFAULT '',
  `goodstype_id` int(11) NOT NULL DEFAULT '0',
  `item_id` varchar(20) NOT NULL DEFAULT '',
  `total_quantity` int(11) NOT NULL DEFAULT '0',
  `unit_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`ris_id`,`item_id`),
  KEY `goodstype_id` (`goodstype_id`),
  KEY `ris_id` (`ris_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ris_det
-- ----------------------------
INSERT INTO `ris_det` VALUES ('I-2012-00001', '1', 'G-00003', '2000', '25.00', '50000.00');
INSERT INTO `ris_det` VALUES ('I-2012-00001', '1', 'G-00010', '3000', '25.50', '76500.00');
INSERT INTO `ris_det` VALUES ('I-2012-00001', '1', 'G-00011', '3000', '12.60', '37800.00');
INSERT INTO `ris_det` VALUES ('I-2012-00002', '1', 'G-00003', '1000', '25.00', '25000.00');
INSERT INTO `ris_det` VALUES ('I-2012-00002', '1', 'G-00010', '1500', '25.50', '38250.00');
INSERT INTO `ris_det` VALUES ('I-2012-00002', '1', 'G-00011', '1500', '12.60', '18900.00');

-- ----------------------------
-- Table structure for `sai`
-- ----------------------------
DROP TABLE IF EXISTS `sai`;
CREATE TABLE `sai` (
  `sai_id` varchar(20) NOT NULL,
  `sai_status` tinyint(4) NOT NULL DEFAULT '0',
  `sai_datetime` datetime NOT NULL,
  `goodstype_id` int(11) NOT NULL DEFAULT '0',
  `sai_qty` int(11) NOT NULL DEFAULT '0',
  `m_code` varchar(50) NOT NULL DEFAULT '',
  `bcode` varchar(3) NOT NULL DEFAULT '',
  `sai_cancelled` tinyint(4) NOT NULL DEFAULT '0',
  `is_emergency` tinyint(4) NOT NULL DEFAULT '0',
  `emergency_reason` text NOT NULL,
  `p_signatory_id` int(11) NOT NULL DEFAULT '0',
  `c_signatory_id` int(11) NOT NULL DEFAULT '0',
  `a_signatory_id` int(11) NOT NULL DEFAULT '0',
  `sai_copied` tinyint(4) NOT NULL DEFAULT '0',
  `UserID` int(11) NOT NULL DEFAULT '0',
  `TransDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sai_id`),
  KEY `goodstype_id` (`goodstype_id`),
  KEY `m_code` (`m_code`),
  KEY `bcode` (`bcode`),
  KEY `p_signatory_id` (`p_signatory_id`),
  KEY `c_signatory_id` (`c_signatory_id`),
  KEY `a_signatory_id` (`a_signatory_id`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sai
-- ----------------------------
INSERT INTO `sai` VALUES ('S-2012-00001', '1', '2012-06-04 17:30:54', '1', '1000', '01', '001', '0', '0', '', '1', '2', '3', '0', '1', '2012-06-04 09:32:59');
INSERT INTO `sai` VALUES ('S-2012-00002', '1', '2012-06-04 17:31:36', '1', '500', '01', '002', '0', '0', '', '1', '2', '4', '0', '1', '2012-06-04 09:33:37');

-- ----------------------------
-- Table structure for `sai_det`
-- ----------------------------
DROP TABLE IF EXISTS `sai_det`;
CREATE TABLE `sai_det` (
  `sai_id` varchar(20) NOT NULL DEFAULT '',
  `goodstype_id` int(11) NOT NULL DEFAULT '0',
  `item_id` varchar(20) NOT NULL DEFAULT '',
  `unit_w` int(11) NOT NULL DEFAULT '0',
  `unit_r` int(11) NOT NULL DEFAULT '0',
  `total_quantity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sai_id`,`item_id`),
  KEY `sai_id` (`sai_id`),
  KEY `goodstype_id` (`goodstype_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sai_det
-- ----------------------------
INSERT INTO `sai_det` VALUES ('S-2012-00001', '1', 'G-00003', '41', '32', '2000');
INSERT INTO `sai_det` VALUES ('S-2012-00001', '1', 'G-00010', '30', '0', '3000');
INSERT INTO `sai_det` VALUES ('S-2012-00001', '1', 'G-00011', '60', '0', '3000');
INSERT INTO `sai_det` VALUES ('S-2012-00002', '1', 'G-00003', '20', '40', '1000');
INSERT INTO `sai_det` VALUES ('S-2012-00002', '1', 'G-00010', '15', '0', '1500');
INSERT INTO `sai_det` VALUES ('S-2012-00002', '1', 'G-00011', '30', '0', '1500');

-- ----------------------------
-- Table structure for `signatory`
-- ----------------------------
DROP TABLE IF EXISTS `signatory`;
CREATE TABLE `signatory` (
  `signatory_id` int(11) NOT NULL AUTO_INCREMENT,
  `signatory_name` varchar(80) NOT NULL DEFAULT '',
  `position_id` int(11) NOT NULL DEFAULT '0',
  `designation_id` int(11) NOT NULL DEFAULT '0',
  `UserID` int(11) NOT NULL DEFAULT '0',
  `TransDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`signatory_id`),
  KEY `UserID` (`UserID`),
  KEY `position_id` (`position_id`),
  KEY `designation_id` (`designation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of signatory
-- ----------------------------
INSERT INTO `signatory` VALUES ('1', 'HERMOGENES STA. ANA JR', '1', '3', '1', '2012-05-31 14:17:32');
INSERT INTO `signatory` VALUES ('2', 'CESJIE JENCER ILAYA', '2', '1', '1', '2012-05-31 14:18:06');
INSERT INTO `signatory` VALUES ('3', 'DAISY VILLANUEVA', '3', '1', '1', '2012-05-31 14:18:40');
INSERT INTO `signatory` VALUES ('4', 'MARIENESS IBARRA', '3', '1', '1', '2012-05-31 14:18:49');
INSERT INTO `signatory` VALUES ('5', 'SHIELA RUANES', '3', '2', '1', '2012-05-31 14:19:08');
INSERT INTO `signatory` VALUES ('6', 'CESJIE JENCER ILAYA', '4', '1', '1', '2012-06-04 01:56:59');
INSERT INTO `signatory` VALUES ('7', 'HERMOGENES STA. ANA JR', '5', '3', '1', '2012-06-04 01:58:03');
INSERT INTO `signatory` VALUES ('8', 'DAISY VILLANUEVA', '6', '1', '1', '2012-06-04 01:58:24');
INSERT INTO `signatory` VALUES ('9', 'MARIENESS IBARRA', '6', '1', '1', '2012-06-04 01:58:34');
INSERT INTO `signatory` VALUES ('10', 'SHIELA RUANES', '6', '2', '1', '2012-06-04 01:58:45');
INSERT INTO `signatory` VALUES ('11', 'HERMOGENES STA. ANA JR', '7', '3', '1', '2012-06-04 01:59:14');
INSERT INTO `signatory` VALUES ('12', 'CESJIE JENCER ILAYA', '8', '1', '1', '2012-06-04 01:59:41');
INSERT INTO `signatory` VALUES ('13', 'CESJIE JENCER ILAYA', '9', '1', '1', '2012-06-04 02:00:00');
INSERT INTO `signatory` VALUES ('14', 'HERMOGENES STA. ANA JR', '9', '3', '1', '2012-06-04 02:00:14');

-- ----------------------------
-- Table structure for `size`
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size` (
  `size_id` int(11) NOT NULL AUTO_INCREMENT,
  `size_description` varchar(50) NOT NULL DEFAULT '',
  `UserID` int(11) NOT NULL DEFAULT '0',
  `TransDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`size_id`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of size
-- ----------------------------
INSERT INTO `size` VALUES ('1', '1kg', '1', '2012-05-29 10:04:06');
INSERT INTO `size` VALUES ('2', '380g', '1', '2012-05-29 12:14:05');
INSERT INTO `size` VALUES ('3', '150g', '1', '2012-05-29 12:16:09');
INSERT INTO `size` VALUES ('4', '260g', '1', '2012-05-29 12:17:36');
INSERT INTO `size` VALUES ('5', '310g', '1', '2012-05-29 12:18:28');
INSERT INTO `size` VALUES ('6', '14g', '1', '2012-05-29 12:44:38');
INSERT INTO `size` VALUES ('7', '3600g', '1', '2012-05-29 12:58:54');
INSERT INTO `size` VALUES ('8', '45g', '1', '2012-05-29 13:04:09');
INSERT INTO `size` VALUES ('9', '155g', '1', '2012-05-29 13:07:23');
INSERT INTO `size` VALUES ('10', '55g', '1', '2012-05-29 13:12:25');
INSERT INTO `size` VALUES ('11', '230g', '1', '2012-05-29 13:13:34');
INSERT INTO `size` VALUES ('12', 'None', '1', '2012-05-29 13:59:44');

-- ----------------------------
-- Table structure for `temp_ris_det`
-- ----------------------------
DROP TABLE IF EXISTS `temp_ris_det`;
CREATE TABLE `temp_ris_det` (
  `ris_id` varchar(20) NOT NULL DEFAULT '',
  `goodstype_id` int(11) NOT NULL DEFAULT '0',
  `item_id` varchar(20) NOT NULL DEFAULT '',
  `total_quantity` int(11) NOT NULL DEFAULT '0',
  `unit_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`ris_id`,`item_id`),
  KEY `goodstype_id` (`goodstype_id`),
  KEY `ris_id` (`ris_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of temp_ris_det
-- ----------------------------

-- ----------------------------
-- Table structure for `temp_sai_det`
-- ----------------------------
DROP TABLE IF EXISTS `temp_sai_det`;
CREATE TABLE `temp_sai_det` (
  `sai_id` varchar(20) NOT NULL DEFAULT '',
  `goodstype_id` int(11) NOT NULL DEFAULT '0',
  `item_id` varchar(20) NOT NULL DEFAULT '',
  `unit_w` int(11) NOT NULL DEFAULT '0',
  `unit_r` int(11) NOT NULL DEFAULT '0',
  `total_quantity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sai_id`,`item_id`),
  KEY `sai_id` (`sai_id`),
  KEY `goodstype_id` (`goodstype_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of temp_sai_det
-- ----------------------------

-- ----------------------------
-- Table structure for `unit`
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_description` varchar(50) NOT NULL DEFAULT '',
  `UserID` int(11) NOT NULL DEFAULT '0',
  `TransDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`unit_id`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES ('1', '50kg/Cavan', '1', '2012-05-29 10:05:31');
INSERT INTO `unit` VALUES ('2', '24pc/Box', '1', '2012-05-29 12:46:08');
INSERT INTO `unit` VALUES ('3', '48pc/Box', '1', '2012-05-29 12:46:14');
INSERT INTO `unit` VALUES ('4', '20sachet/Poly Bag', '1', '2012-05-29 12:45:37');
INSERT INTO `unit` VALUES ('5', '8pack/Box', '1', '2012-05-29 13:01:13');
INSERT INTO `unit` VALUES ('6', '120pack/Box', '1', '2012-05-29 13:04:55');
INSERT INTO `unit` VALUES ('7', '100pc/Box', '1', '2012-05-29 13:07:34');
INSERT INTO `unit` VALUES ('8', '72pc/Box', '1', '2012-05-29 13:13:02');
INSERT INTO `unit` VALUES ('9', '120pc/Box', '1', '2012-05-29 14:00:03');
INSERT INTO `unit` VALUES ('10', '50pc/Box', '1', '2012-05-29 14:03:02');

-- ----------------------------
-- Table structure for `update_ris`
-- ----------------------------
DROP TABLE IF EXISTS `update_ris`;
CREATE TABLE `update_ris` (
  `ris_id` varchar(20) NOT NULL DEFAULT '',
  `ris_date` datetime NOT NULL,
  `sai_id` varchar(20) NOT NULL DEFAULT '',
  `sai_date` datetime NOT NULL,
  `goodstype_id` int(11) NOT NULL DEFAULT '0',
  `ris_returned` tinyint(4) NOT NULL DEFAULT '0',
  `ris_qty` int(11) NOT NULL DEFAULT '0',
  `r_signatory_id` int(11) NOT NULL DEFAULT '0',
  `e_signatory_id` int(11) NOT NULL DEFAULT '0',
  `na_signatory_id` int(11) NOT NULL DEFAULT '0',
  `ie_signatory_id` int(11) NOT NULL DEFAULT '0',
  `ici_signatory_id` int(11) NOT NULL DEFAULT '0',
  `a_signatory_id` int(11) NOT NULL DEFAULT '0',
  `ris_copied` tinyint(4) NOT NULL,
  `UserID` int(11) NOT NULL DEFAULT '0',
  `TransDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ris_id`),
  KEY `sai_id` (`sai_id`),
  KEY `goodstype_id` (`goodstype_id`),
  KEY `r_signatory_id` (`r_signatory_id`) USING BTREE,
  KEY `e_signatory_id` (`e_signatory_id`),
  KEY `na_signatory_id` (`na_signatory_id`),
  KEY `ie_signatory_id` (`ie_signatory_id`),
  KEY `ici_signatory_id` (`ici_signatory_id`),
  KEY `a_signatory_id` (`a_signatory_id`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of update_ris
-- ----------------------------

-- ----------------------------
-- Table structure for `update_ris_det`
-- ----------------------------
DROP TABLE IF EXISTS `update_ris_det`;
CREATE TABLE `update_ris_det` (
  `ris_id` varchar(20) NOT NULL DEFAULT '',
  `goodstype_id` int(11) NOT NULL DEFAULT '0',
  `item_id` varchar(20) NOT NULL DEFAULT '',
  `total_quantity` int(11) NOT NULL DEFAULT '0',
  `unit_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`ris_id`,`item_id`),
  KEY `goodstype_id` (`goodstype_id`),
  KEY `ris_id` (`ris_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of update_ris_det
-- ----------------------------

-- ----------------------------
-- Table structure for `update_sai`
-- ----------------------------
DROP TABLE IF EXISTS `update_sai`;
CREATE TABLE `update_sai` (
  `sai_id` varchar(20) NOT NULL,
  `sai_status` tinyint(4) NOT NULL DEFAULT '0',
  `sai_datetime` datetime NOT NULL,
  `goodstype_id` int(11) NOT NULL DEFAULT '0',
  `sai_qty` int(11) NOT NULL DEFAULT '0',
  `m_code` varchar(50) NOT NULL DEFAULT '',
  `bcode` varchar(3) NOT NULL DEFAULT '',
  `sai_cancelled` tinyint(4) NOT NULL DEFAULT '0',
  `is_emergency` tinyint(4) NOT NULL DEFAULT '0',
  `emergency_reason` text NOT NULL,
  `p_signatory_id` int(11) NOT NULL DEFAULT '0',
  `c_signatory_id` int(11) NOT NULL DEFAULT '0',
  `a_signatory_id` int(11) NOT NULL DEFAULT '0',
  `sai_copied` tinyint(4) NOT NULL DEFAULT '0',
  `UserID` int(11) NOT NULL DEFAULT '0',
  `TransDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sai_id`),
  KEY `goodstype_id` (`goodstype_id`),
  KEY `m_code` (`m_code`),
  KEY `bcode` (`bcode`),
  KEY `p_signatory_id` (`p_signatory_id`),
  KEY `c_signatory_id` (`c_signatory_id`),
  KEY `a_signatory_id` (`a_signatory_id`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of update_sai
-- ----------------------------

-- ----------------------------
-- Table structure for `update_sai_det`
-- ----------------------------
DROP TABLE IF EXISTS `update_sai_det`;
CREATE TABLE `update_sai_det` (
  `sai_id` varchar(20) NOT NULL DEFAULT '',
  `goodstype_id` int(11) NOT NULL DEFAULT '0',
  `item_id` varchar(20) NOT NULL DEFAULT '',
  `unit_w` int(11) NOT NULL DEFAULT '0',
  `unit_r` int(11) NOT NULL DEFAULT '0',
  `total_quantity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sai_id`,`item_id`),
  KEY `sai_id` (`sai_id`),
  KEY `goodstype_id` (`goodstype_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of update_sai_det
-- ----------------------------

-- ----------------------------
-- Table structure for `userbindary`
-- ----------------------------
DROP TABLE IF EXISTS `userbindary`;
CREATE TABLE `userbindary` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(30) NOT NULL DEFAULT '',
  `Password` varchar(30) NOT NULL DEFAULT '',
  `Enabled` tinyint(4) NOT NULL DEFAULT '0',
  `CreatedDate` datetime NOT NULL,
  `LastAccess` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `AccessCount` int(11) NOT NULL DEFAULT '0',
  `LastAccessTime` time NOT NULL,
  `CreatedTime` time NOT NULL,
  `Fullname` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`UserID`),
  KEY `UserName` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of userbindary
-- ----------------------------
INSERT INTO `userbindary` VALUES ('1', 'mishss', 'senem22', '1', '2012-05-14 00:00:00', '2012-06-04 00:00:00', '1097', '17:59:28', '08:42:14', 'Hermogenes S. Sta. Ana Jr');
INSERT INTO `userbindary` VALUES ('2', 'admin', 'admin', '1', '2012-05-23 00:00:00', '2012-06-04 00:00:00', '4', '15:49:56', '09:54:30', 'System Administrator');
INSERT INTO `userbindary` VALUES ('3', 'misdsv', 'dsv', '1', '2012-05-25 00:00:00', '2012-05-25 05:45:52', '0', '00:00:00', '13:42:04', 'Daisy S. Villanueva');

-- ----------------------------
-- Table structure for `userpermissions`
-- ----------------------------
DROP TABLE IF EXISTS `userpermissions`;
CREATE TABLE `userpermissions` (
  `Username` varchar(50) NOT NULL DEFAULT '',
  `Permission` varchar(50) NOT NULL DEFAULT '',
  KEY `UserName` (`Username`),
  KEY `Permission` (`Permission`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of userpermissions
-- ----------------------------

-- ----------------------------
-- View structure for `view_recipient`
-- ----------------------------
DROP VIEW IF EXISTS `view_recipient`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_recipient` AS select concat(ifnull(concat(`barangay`.`Description`,', '),''),ifnull(`municity`.`Description`,'')) AS `DISTRIBUTION`,concat(`item`.`item_description`,ifnull(concat(' ',`unit`.`unit_description`),''),ifnull(concat('(',`size`.`size_description`,')'),'')) AS `ITEM`,sum(`ris`.`ris_qty`) AS `RECIPIENT`,sum(`ris_det`.`total_quantity`) AS `QUANTITY`,if((sum(`ris_det`.`total_quantity`) > 0),`ris_det`.`unit_cost`,0) AS `PRICE` from (((((((`ris` join `ris_det` on((`ris_det`.`ris_id` = `ris`.`ris_id`))) join `sai` on((`sai`.`sai_id` = `ris`.`sai_id`))) left join `barangay` on(((`barangay`.`M_Code` = `sai`.`m_code`) and (`barangay`.`BCode` = `sai`.`bcode`)))) left join `municity` on((`municity`.`M_Code` = `sai`.`m_code`))) join `item` on((`item`.`item_id` = `ris_det`.`item_id`))) left join `size` on((`size`.`size_id` = `item`.`size_id`))) left join `unit` on((`unit`.`unit_id` = `item`.`unit_id`))) group by `barangay`.`Description`,`municity`.`Description`,`item`.`item_description` order by `barangay`.`Description`,`municity`.`Description`,`item`.`item_description` ;

-- ----------------------------
-- Procedure structure for `spBegBalance`
-- ----------------------------
DROP PROCEDURE IF EXISTS `spBegBalance`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spBegBalance`(IN `ConditionStatement` varchar(255))
BEGIN
	SELECT
		CONCAT(
			'SELECT','\n',
			'	CONCAT(item.item_description,IFNULL(CONCAT(" ",unit.unit_description),""),IFNULL(CONCAT("(",size.size_description,")"),"")) AS `ITEM DESCRIPTION`,','\n',
			'	beg_balance.beg_qty AS `BEGINNING BALANCE`,','\n',
			'	IF(beg_balance.beg_qty > 0,ris_det.unit_cost,0) AS `BUNIT PRICE`,','\n',
			'	IF(beg_balance.beg_qty > 0,beg_balance.beg_qty * ris_det.unit_cost,0) AS `BSUB - TOTAL`,','\n',
			'	irecdet.qty_onhand AS `ADD`,','\n',
			'	IF(irecdet.qty_onhand > 0,ris_det.unit_cost,0) AS `AUNIT PRICE`,','\n',
			'	IF(irecdet.qty_onhand > 0,irecdet.qty_onhand * ris_det.unit_cost,0) AS `ASUB - TOTAL`,','\n',
			'	(IF(beg_balance.beg_qty > 0,beg_balance.beg_qty * ris_det.unit_cost,0) + IF(irecdet.qty_onhand > 0,irecdet.qty_onhand * ris_det.unit_cost,0)) AS `GRAND TOTAL`','\n',
			'FROM','\n',
			'	ris','\n',
			'INNER JOIN ris_det ON ris_det.ris_id = ris.ris_id','\n',
			'INNER JOIN beg_balance ON beg_balance.item_id = ris_det.item_id','\n',
			'LEFT JOIN irecdet ON irecdet.item_id = ris_det.item_id','\n',
			'LEFT JOIN irec ON irec.recID = irecdet.recID','\n',
			'INNER JOIN item ON item.item_id = ris_det.item_id','\n',
			'LEFT JOIN unit ON unit.unit_id = item.unit_id','\n',
			'LEFT JOIN size ON size.size_id = item.size_id','\n',
			ConditionStatement,'\n',
			'GROUP BY','\n',
			'	item.item_description, ris_det.unit_cost','\n',
			'ORDER BY','\n',
			'	item.item_description'
		) Statement
	INTO @begbalance_sql;

	PREPARE begbalance FROM @begbalance_sql;

	EXECUTE begbalance;

	DEALLOCATE PREPARE begbalance;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `spEndBalance`
-- ----------------------------
DROP PROCEDURE IF EXISTS `spEndBalance`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spEndBalance`(IN `ConditionStatement` varchar(255))
BEGIN
	SELECT
		CONCAT(
			'SELECT','\n',
			'	CONCAT(item.item_description,IFNULL(CONCAT(" ",unit.unit_description),""),IFNULL(CONCAT("(",size.size_description,")"),"")) AS `ITEM DESCRIPTION`,','\n',
			'	SUM(ris_det.total_quantity) AS `TOTAL DISTRIBUTION`,','\n',
			'	IF(SUM(ris_det.total_quantity) > 0,ris_det.unit_cost,0) AS `UNIT PRICE`,','\n',
			'	IF(SUM(ris_det.total_quantity) > 0,SUM(ris_det.total_quantity) * ris_det.unit_cost,0) AS `TOTAL COST GOODS DISTRIBUTED`,','\n',
			'	ibalance.qty_onhand AS `ENDING BALANCE`,','\n',
			'	IF(ibalance.qty_onhand > 0,ris_det.unit_cost,0) AS `EUNIT PRICE`,','\n',
			'	IF(ibalance.qty_onhand > 0,ibalance.qty_onhand * ris_det.unit_cost,0) AS `AMOUNT`','\n',
			'FROM','\n',
			'	ris','\n',
			'INNER JOIN ris_det ON ris_det.ris_id = ris.ris_id','\n',
			'INNER JOIN ibalance ON ibalance.item_id = ris_det.item_id','\n',
			'INNER JOIN item ON item.item_id = ris_det.item_id','\n',
			'LEFT OUTER JOIN unit ON unit.unit_id = item.unit_id','\n',
			'LEFT OUTER JOIN size ON size.size_id = item.size_id','\n',
			'INNER JOIN beg_balance ON beg_balance.item_id = ris_det.item_id','\n',
			ConditionStatement,'\n',
			'GROUP BY','\n',
			'	item.item_description, ris_det.unit_cost','\n',
			'ORDER BY','\n',
			'	item.item_description'
		) Statement
	INTO @endbalance_sql;

	PREPARE endbalance FROM @endbalance_sql;

	EXECUTE endbalance;

	DEALLOCATE PREPARE endbalance;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `spListOfBegBalance`
-- ----------------------------
DROP PROCEDURE IF EXISTS `spListOfBegBalance`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spListOfBegBalance`(IN `ConditionStatement` varchar(255))
BEGIN
	SELECT
		CONCAT(
			'SELECT','\n',
			'	beg_balance.cmonth,','\n',
			'	beg_balance.cyear,','\n',
			'	item.item_id,','\n',
			'	CONCAT(item.item_description,IFNULL(CONCAT(" ",brand.brand_description),""),IFNULL(CONCAT(" ",size.size_description),""),IFNULL(CONCAT(" ",unit.unit_description),"")) AS `item_descriptions`,','\n',
			'	unit.unit_description,','\n',
			'	beg_balance.beg_qty,','\n',
			'	beg_balance.cactive','\n',
			'FROM','\n',
			'	beg_balance','\n',
			'RIGHT OUTER JOIN item ON item.item_id = beg_balance.item_id','\n',
			'LEFT OUTER JOIN brand ON brand.brand_id = item.brand_id','\n',
			'LEFT OUTER JOIN size ON size.size_id = item.size_id','\n',
			'LEFT OUTER JOIN unit ON unit.unit_id = item.unit_id','\n',
			ConditionStatement
		) Statement
	INTO @list_of_begbalance_sql;

	PREPARE list_of_begbalance FROM @list_of_begbalance_sql;

	EXECUTE list_of_begbalance;

	DEALLOCATE PREPARE list_of_begbalance;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `spListOfRecipient`
-- ----------------------------
DROP PROCEDURE IF EXISTS `spListOfRecipient`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spListOfRecipient`(IN `ConditionStatement` varchar(255))
BEGIN
	SELECT
		CONCAT(
			'SELECT','\n',
			'	CONCAT(IFNULL(CONCAT(barangay.Description,", "),""),IFNULL(municity.Description,"")) AS `DISTRIBUTION TO`,','\n',
			'	CONCAT(item.item_description,IFNULL(CONCAT(" ",unit.unit_description),""),IFNULL(CONCAT("(",size.size_description,")"),"")) AS `ITEM DESCRIPTION`,','\n',
			'	SUM(ris.ris_qty) AS `NO OF RECIPIENT`,','\n',
			'	SUM(ris_det.total_quantity) AS `QUANTITY`,','\n',
			'	IF(SUM(ris_det.total_quantity) > 0,ris_det.unit_cost,0) AS `UNIT PRICE`','\n',
			'FROM','\n',
			'	ris','\n',
			'INNER JOIN ris_det ON ris_det.ris_id = ris.ris_id','\n',
			'INNER JOIN sai ON sai.sai_id = ris.sai_id','\n',
			'LEFT OUTER JOIN barangay ON barangay.M_Code = sai.m_code AND barangay.BCode = sai.bcode','\n',
			'LEFT OUTER JOIN municity ON municity.M_Code = sai.m_code','\n',
			'INNER JOIN item ON item.item_id = ris_det.item_id','\n',
			'LEFT OUTER JOIN size ON size.size_id = item.size_id','\n',
			'LEFT OUTER JOIN unit ON unit.unit_id = item.unit_id','\n',
			'INNER JOIN beg_balance ON beg_balance.item_id = ris_det.item_id','\n',
			ConditionStatement,'\n',
			'GROUP BY','\n',
			'	barangay.Description, municity.Description, item.item_description','\n',
			'ORDER BY','\n',
			'	barangay.Description, municity.Description, item.item_description'
		) Statement
	INTO @list_of_recipient_sql;

	PREPARE list_of_recipient FROM @list_of_recipient_sql;

	EXECUTE list_of_recipient;

	DEALLOCATE PREPARE list_of_recipient;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `spListOfRIS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `spListOfRIS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spListOfRIS`(IN `ConditionStatement` varchar(255))
BEGIN
	SELECT
		CONCAT(
			'SELECT','\n',
			'	`ris`.`ris_id`,','\n',
			'	`ris`.`ris_date`,','\n',
			'	`ris`.`sai_id`,','\n',
			'	`ris`.`sai_date`,','\n',
			'	`goodstype`.`goodstype_description`,','\n',
			'	`ris`.`ris_qty` AS `request_qty`,','\n',
			'	IFNULL(`municity`.`Description`,"") AS `mun`,','\n',
			'	IFNULL((SELECT `barangay`.`Description` FROM `barangay` WHERE `barangay`.`M_Code` = `sai`.`m_code` AND `barangay`.`BCode` = `sai`.`bcode`),"") AS `brgy`,','\n',
			'	`ris_det`.`item_id`,','\n',
			'	CONCAT(`item`.`item_description`," ",IFNULL(`brand`.`brand_description`,"")," ",IFNULL(`size`.`size_description`,"")," ",IFNULL(`unit`.`unit_description`,"")) AS `item_descriptions`,','\n',
			'	`sai_det`.`unit_w`,','\n',
			'	`sai_det`.`unit_r`,','\n',
			'	`sai_det`.`total_quantity` AS `sai_qty`,','\n',
			'	`ris_det`.`total_quantity` AS `ris_qty`,','\n',
			'	`ris_det`.`unit_cost`,','\n',
			'	`ris_det`.`amount`,','\n',
			'	IF(`sai`.`is_emergency` = 0,"",CONCAT("Emergency : "," ",`sai`.`emergency_reason`)) AS `sai_emergency`,','\n',
			'	(SELECT CONCAT(`position`.`position_description`," :") FROM `signatory` INNER JOIN `position` ON `position`.`position_id` = `signatory`.`position_id` WHERE `signatory`.`signatory_id` = `ris`.`r_signatory_id`) AS `r_position`,','\n',
			'	(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `signatory`.`signatory_id` = `ris`.`r_signatory_id`) AS `r_signatory`,','\n',
			'	(SELECT `designation`.`designation_name` FROM `signatory` INNER JOIN `designation` ON `designation`.`designation_id` = `signatory`.`designation_id` WHERE `signatory`.`signatory_id` = `ris`.`r_signatory_id`) AS `r_designation`,','\n',
			'	(SELECT CONCAT(`position`.`position_description`," :") FROM `signatory` INNER JOIN `position` ON `position`.`position_id` = `signatory`.`position_id` WHERE `signatory`.`signatory_id` = `ris`.`e_signatory_id`) AS `e_position`,','\n',
			'	(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `signatory`.`signatory_id` = `ris`.`e_signatory_id`) AS `e_signatory`,','\n',
			' (SELECT `designation`.`designation_name` FROM `signatory` INNER JOIN `designation` ON `designation`.`designation_id` = `signatory`.`designation_id` WHERE `signatory`.`signatory_id` = `ris`.`e_signatory_id`) AS `e_designation`,','\n',
			'	(SELECT CONCAT(`position`.`position_description`," :") FROM `signatory` INNER JOIN `position` ON `position`.`position_id` = `signatory`.`position_id` WHERE `signatory`.`signatory_id` = `ris`.`na_signatory_id`) AS `na_position`,','\n',
			'	(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `signatory`.`signatory_id` = `ris`.`na_signatory_id`) AS `na_signatory`,','\n',
			'	(SELECT `designation`.`designation_name` FROM `signatory` INNER JOIN `designation` ON `designation`.`designation_id` = `signatory`.`designation_id` WHERE `signatory`.`signatory_id` = `ris`.`na_signatory_id`) AS `na_designation`,','\n',
			'	(SELECT CONCAT(`position`.`position_description`," :") FROM `signatory` INNER JOIN `position` ON `position`.`position_id` = `signatory`.`position_id` WHERE `signatory`.`signatory_id` = `ris`.`ie_signatory_id`) AS `ie_position`,','\n',
			'	(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `signatory`.`signatory_id` = `ris`.`ie_signatory_id`) AS `ie_signatory`,','\n',
			'	(SELECT `designation`.`designation_name` FROM `signatory` INNER JOIN `designation` ON `designation`.`designation_id` = `signatory`.`designation_id` WHERE `signatory`.`signatory_id` = `ris`.`ie_signatory_id`) AS `ie_designation`,','\n',
			'	(SELECT CONCAT(`position`.`position_description`," :") FROM `signatory` INNER JOIN `position` ON `position`.`position_id` = `signatory`.`position_id` WHERE `signatory`.`signatory_id` = `ris`.`ici_signatory_id`) AS `ici_position`,','\n',
			'	(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `signatory`.`signatory_id` = `ris`.`ici_signatory_id`) AS `ici_signatory`,','\n',
			'	(SELECT `designation`.`designation_name` FROM `signatory` INNER JOIN `designation` ON `designation`.`designation_id` = `signatory`.`designation_id` WHERE `signatory`.`signatory_id` = `ris`.`ici_signatory_id`) AS `ici_designation`,','\n',
			'	(SELECT CONCAT(`position`.`position_description`," :") FROM `signatory` INNER JOIN `position` ON `position`.`position_id` = `signatory`.`position_id` WHERE `signatory`.`signatory_id` = `ris`.`a_signatory_id`) AS `a_position`,','\n',
			'	(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `signatory`.`signatory_id` = `ris`.`a_signatory_id`) AS `a_signatory`,','\n',
			'	(SELECT `designation`.`designation_name` FROM `signatory` INNER JOIN `designation` ON `designation`.`designation_id` = `signatory`.`designation_id` WHERE `signatory`.`signatory_id` = `ris`.`a_signatory_id`) AS `a_designation`,','\n',
			'	(SELECT `userbindary`.`UserName` FROM `userbindary` WHERE `userbindary`.`UserID` = `sai`.`UserID`) AS `user_name`','\n',
			'FROM','\n',
			'	`ris`','\n',
			'INNER JOIN `goodstype` ON `goodstype`.`goodstype_id` = `ris`.`goodstype_id`','\n',
			'INNER JOIN `sai` ON `sai`.`sai_id` = `ris`.`sai_id`','\n',
			'INNER JOIN `municity` ON `municity`.`M_Code` = `sai`.`m_code`','\n',
			'INNER JOIN `ris_det` ON `ris_det`.`ris_id` = `ris`.`ris_id`','\n',
			'INNER JOIN `item` ON `item`.`item_id` = `ris_det`.`item_id`','\n',
			'LEFT JOIN `brand` ON `brand`.`brand_id` = `item`.`brand_id`','\n',
			'LEFT JOIN `size` ON `size`.`size_id` = `item`.`size_id`','\n',
			'LEFT JOIN `unit` ON `unit`.`unit_id` = `item`.`unit_id`','\n',
			'INNER JOIN `sai_det` ON `sai_det`.`sai_id` = `ris`.`sai_id` AND `sai_det`.`item_id` = `ris_det`.`item_id`','\n',
			ConditionStatement
		) Statement
	INTO @list_of_ris_sql;

	PREPARE list_of_ris FROM @list_of_ris_sql;

	EXECUTE list_of_ris;

	DEALLOCATE PREPARE list_of_ris;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `spListOfSAI`
-- ----------------------------
DROP PROCEDURE IF EXISTS `spListOfSAI`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spListOfSAI`(IN `ConditionStatement` varchar(255))
BEGIN
	SELECT
		CONCAT(
			'SELECT','\n',
			'	`sai`.`sai_id`,','\n',
			'	`sai`.`sai_datetime`,','\n',
			'	`goodstype`.`goodstype_description`,','\n',
			'	`sai`.`sai_qty`,','\n',
			'	IFNULL(`municity`.`Description`,"") AS `mun`,','\n',
			'	IFNULL((SELECT `barangay`.`Description` FROM `barangay` WHERE `barangay`.`M_Code` = `sai`.`m_code` AND `barangay`.`BCode` = `sai`.`bcode`),"") AS `brgy`,','\n',
			'	`sai_det`.`item_id`,','\n',
			'	CONCAT(`item`.`item_description`," ",IFNULL(`brand`.`brand_description`,"")," ",IFNULL(`size`.`size_description`,"")," ",IFNULL(`unit`.`unit_description`,"")) AS `item_descriptions`,','\n',
			'	`sai_det`.`unit_w`,','\n',
			'	`sai_det`.`unit_r`,','\n',
			'	`sai_det`.`total_quantity`,','\n',
			'	IF(`sai`.`is_emergency` = 0,"",CONCAT("Emergency : "," ",`sai`.`emergency_reason`)) AS `sai_emergency`,','\n',
			'	(SELECT CONCAT(`position`.`position_description`," :") FROM `signatory` INNER JOIN `position` ON `position`.`position_id` = `signatory`.`position_id` WHERE `signatory`.`signatory_id` = `sai`.`p_signatory_id`) AS `p_position`,','\n',
			'	(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `signatory`.`signatory_id` = `sai`.`p_signatory_id`) AS `p_signatory`,','\n',
			'	(SELECT `designation`.`designation_name` FROM `signatory` INNER JOIN `designation` ON `designation`.`designation_id` = `signatory`.`designation_id` WHERE `signatory`.`signatory_id` = `sai`.`p_signatory_id`) AS `p_designation`,','\n',
			'	(SELECT CONCAT(`position`.`position_description`," :") FROM `signatory` INNER JOIN `position` ON `position`.`position_id` = `signatory`.`position_id` WHERE `signatory`.`signatory_id` = `sai`.`c_signatory_id`) AS `c_position`,','\n',
			'	(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `signatory`.`signatory_id` = `sai`.`c_signatory_id`) AS `c_signatory`,','\n',
			'	(SELECT `designation`.`designation_name` FROM `signatory` INNER JOIN `designation` ON `designation`.`designation_id` = `signatory`.`designation_id` WHERE `signatory`.`signatory_id` = `sai`.`c_signatory_id`) AS `c_designation`,','\n',
			'	(SELECT CONCAT(`position`.`position_description`," :") FROM `signatory` INNER JOIN `position` ON `position`.`position_id` = `signatory`.`position_id` WHERE `signatory`.`signatory_id` = `sai`.`a_signatory_id`) AS `a_position`,','\n',
			'	(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `signatory`.`signatory_id` = `sai`.`a_signatory_id`) AS `a_signatory`,','\n',
			'	(SELECT `designation`.`designation_name` FROM `signatory` INNER JOIN `designation` ON `designation`.`designation_id` = `signatory`.`designation_id` WHERE `signatory`.`signatory_id` = `sai`.`a_signatory_id`) AS `a_designation`,','\n',
			'	CASE','\n',
			'		WHEN `sai`.`sai_status` = 0 AND `sai`.`sai_cancelled` = 0 THEN "Not Yet Issue"','\n',
			'		WHEN `sai`.`sai_status` = 1 AND `sai`.`sai_cancelled` = 0 THEN CONCAT("Issued with RIS ID : ",(SELECT `ris`.`ris_id` FROM `ris` WHERE `ris`.`sai_id` = `sai`.`sai_id`))','\n',
			'		WHEN `sai`.`sai_status` = 0 AND `sai`.`sai_cancelled` = 1 THEN "Cancelled"','\n',
			'	END AS `sai_issued`,','\n',
			'	(SELECT `userbindary`.`UserName` FROM `userbindary` WHERE `userbindary`.`UserID` = `sai`.`UserID`) AS `user_name`','\n',
			'FROM','\n',
			'	`sai`','\n',
			'INNER JOIN `goodstype` ON `goodstype`.`goodstype_id` = `sai`.`goodstype_id`','\n',
			'INNER JOIN `municity` ON `municity`.`M_Code` = `sai`.`m_code`','\n',
			'INNER JOIN `sai_det` ON `sai_det`.`sai_id` = `sai`.`sai_id`','\n',
			'INNER JOIN `item` ON `item`.`item_id` = `sai_det`.`item_id`','\n',
			'LEFT JOIN `brand` ON `brand`.`brand_id` = `item`.`brand_id`','\n',
			'LEFT JOIN `size` ON `size`.`size_id` = `item`.`size_id`','\n',
			'LEFT JOIN `unit` ON `unit`.`unit_id` = `item`.`unit_id`','\n',
			ConditionStatement
		) Statement
	INTO @list_of_sai_sql;

	PREPARE list_of_sai FROM @list_of_sai_sql;

	EXECUTE list_of_sai;

	DEALLOCATE PREPARE list_of_sai;
END
;;
DELIMITER ;
