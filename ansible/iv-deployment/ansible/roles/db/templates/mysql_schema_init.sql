-- Dumping database structure for auditing
CREATE DATABASE IF NOT EXISTS `{{ auditing_schema }}`;
USE `{{ auditing_schema }}`;

-- Dumping structure for table auditing.auditlog
CREATE TABLE IF NOT EXISTS `auditlog` (
  `UserID` varchar(128) DEFAULT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `UserEmail` varchar(128) DEFAULT NULL,
  `UserAction` varchar(128) DEFAULT NULL,
  `InfoText` json DEFAULT NULL,
  `TxnStatus` tinyint(4) DEFAULT NULL,
  `TxnDate` timestamp NULL DEFAULT NULL
);