SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE DATABASE `supo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `supo`;

DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `aid` char(36) NOT NULL,
  `case` char(73) NOT NULL,
  `ofile` varchar(128) NOT NULL,
  `desc` varchar(128) DEFAULT NULL,
  `fname` char(90) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `case`;
CREATE TABLE `case` (
  `cid` char(36) NOT NULL,
  `vcid` char(16) NOT NULL,
  `subj` varchar(128) NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `opened` timestamp NOT NULL DEFAULT current_timestamp(),
  `closed` timestamp NOT NULL DEFAULT current_timestamp(),
  `assigned` char(36) DEFAULT NULL,
  `closedby` char(36) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `coid` char(36) NOT NULL,
  `company` varchar(128) NOT NULL,
  `legalid` varchar(12) NOT NULL,
  `contactmail` varchar(128) NOT NULL,
  `billmail` varchar(128) NOT NULL,
  `address` varchar(128) NOT NULL,
  `country` char(36) NOT NULL,
  `phone` varchar(128) NOT NULL,
  `customerof` char(36) DEFAULT NULL,
  PRIMARY KEY (`coid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `cuid` char(36) NOT NULL,
  `callingcode` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `common` varchar(32) NOT NULL,
  `officialname` varchar(128) NOT NULL,
  PRIMARY KEY (`cuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `country` (`cuid`, `callingcode`, `iso`, `common`, `officialname`) VALUES
('ae2cfbbe-8083-11ec-842e-126d4fb00b80',	1,	'US',	'Estados Unidos de América',	'United States of America'),
('ce957c32-8083-11ec-804c-126d4fb00b80',	57,	'CO',	'Colombia',	'República de Colombia');

DROP TABLE IF EXISTS `logo`;
CREATE TABLE `logo` (
  `loid` char(36) NOT NULL,
  `fname` char(73) NOT NULL,
  PRIMARY KEY (`loid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `rid` tinyint(2) unsigned NOT NULL,
  `rol` varchar(128) NOT NULL,
  `manageusers` tinyint(1) unsigned NOT NULL,
  `managecases` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uuid` char(36) NOT NULL,
  `mail` varchar(128) NOT NULL,
  `company` char(36) NOT NULL,
  `rol` tinyint(2) NOT NULL,
  `password` char(65) NOT NULL,
  `oldpass` char(65) NOT NULL,
  `initts` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastpassts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

