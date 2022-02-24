-- ------------------------------------------------------
--		{{ iv_schema }} DDL
-- ------------------------------------------------------

-- -----------------------------------------------------
-- Table `{{ iv_schema }}`.`user_test`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`user_test` (
  `Id`    INT         NOT NULL AUTO_INCREMENT,
  `name`  VARCHAR(75) NOT NULL,
  `email` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`Id`)
);

-- -----------------------------------------------------
-- Table `{{ iv_schema }}`.`user`
-- -----------------------------------------------------	
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`user` (
  `userId`     INT          NOT NULL AUTO_INCREMENT,
  `userName`   VARCHAR(75)  NOT NULL,
  `email`      VARCHAR(75)  NOT NULL,
  `password`   VARCHAR(100) NOT NULL,
  `firstName`  VARCHAR(50)  NOT NULL,
  `lastName`   VARCHAR(50)  NOT NULL,
  `country`    VARCHAR(45)  NOT NULL,
  `createdOn`  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` TIMESTAMP    NULL     DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY (`userName`)
);

-- -----------------------------------------------------
-- Table `{{ iv_schema }}`.`user_attributes_m`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`user_attributes_m` (
  `userAttributesId` INT          NOT NULL AUTO_INCREMENT,
  `userId`           INT          NOT NULL,
  `name`             VARCHAR(45)  NOT NULL,
  `description`      VARCHAR(255) NULL,
  `createdOn`        TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`       TIMESTAMP    NULL,
  `attributes`       JSON         NOT NULL,
  PRIMARY KEY (`userAttributesId`)
);

-- -----------------------------------------------------
-- Table `{{ iv_schema }}`.`user_device`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`user_device` (
  `userDeviceId`   INT          NOT NULL AUTO_INCREMENT,
  `userId`         INT          NOT NULL,
  `deviceId`       VARCHAR(75)  NOT NULL,  
  `status` 		   VARCHAR(25)  NOT NULL,
  `description`    VARCHAR(255) NULL,
  `createdOn`      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`     TIMESTAMP    NULL,
  PRIMARY KEY (`userDeviceId`),
  UNIQUE KEY (`deviceId`)
);

--- Document Support ---
-- -----------------------------------------------------
-- Table `{{ iv_schema }}`.`document_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`document_type` (
  `documentTypeId` INT          NOT NULL AUTO_INCREMENT,
  `type`           VARCHAR(45)  NOT NULL,
  `description`    VARCHAR(255) NULL,
  `createdOn`      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`     TIMESTAMP    NULL,
  PRIMARY KEY (`documentTypeId`),
  UNIQUE KEY (`type`)
);

-- -----------------------------------------------------
-- Table `{{ iv_schema }}`.`user_document`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`user_document` (
  `userDocumentId` INT          NOT NULL AUTO_INCREMENT,
  `userId`         INT          NOT NULL,
  `documentTypeId` INT          NOT NULL,
  `comment`        VARCHAR(255) NULL,
  `createdOn`      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`     TIMESTAMP    NULL,
  `documentB`      MEDIUMBLOB   NULL,
  PRIMARY KEY (`userDocumentId`)
);

-- -----------------------------------------------------
-- Table `{{ iv_schema }}`.`source_of_truth_m`
-- ----------------------------------------------------- 
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`source_of_truth_m` (
  `sourceOfTruthId` INT         NOT NULL AUTO_INCREMENT,
  `firstName`       VARCHAR(75) NOT NULL,
  `lastName`        VARCHAR(75) NOT NULL,
  `dateOfBirth`     DATE        NOT NULL,
  `attributes`      JSON        NOT NULL,
  `userImageB`      MEDIUMBLOB  NULL,
  `createdOn`       TIMESTAMP   NOT NULL,
  `modifiedOn`      TIMESTAMP   NULL,
  PRIMARY KEY (`sourceOfTruthId`)
);

------------------------------------------------------------
-- Table  `{{ iv_schema }}`.`pctf_score_m`
-----------------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`pctf_score_m` (
  `pctfScoreId`  INT          NOT NULL AUTO_INCREMENT,
  `documentName` VARCHAR(45)  NOT NULL,
  `type`         VARCHAR(45)  NOT NULL,
  `isSupported`  BOOLEAN      NOT NULL,
  `description`  VARCHAR(255) NULL,
  `attributes`   JSON         NOT NULL,
  `createdOn`    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`   TIMESTAMP    NULL,
  PRIMARY KEY (`pctfScoreId`),
  UNIQUE KEY (`documentName`)
);

------------------------------------------------------------
-- Table  `{{ iv_schema }}`.`provider_score_m`
-----------------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`provider_score_m` (
  `providerScoreId` INT          NOT NULL AUTO_INCREMENT,
  `providerName`    VARCHAR(45)  NOT NULL,
  `type`            VARCHAR(45)  NOT NULL,
  `isActive`        BOOLEAN      NOT NULL,
  `url_base`        VARCHAR(45)  NOT NULL,
  `description`     VARCHAR(255) NULL,
  `services`        JSON         NOT NULL,
  `createdOn`       TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`      TIMESTAMP    NULL,
  PRIMARY KEY (`providerScoreId`),
  UNIQUE KEY (`providerName`)
);

------------------------------------------------------------
-- CLAIMS & MERCHANT TABLES BEGINS
------------------------------------------------------------
--- Claim Supported ---
-- -----------------------------------------------------
-- Table `{{ iv_schema }}`.`claim_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`claim_type` (
  `claimTypeId` INT          NOT NULL AUTO_INCREMENT,
  `type`        VARCHAR(45)  NOT NULL,
  `description` VARCHAR(255) NULL,
  `createdOn`   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`  TIMESTAMP    NULL,
  PRIMARY KEY (`claimTypeId`),
  UNIQUE KEY (`type`)
);

-- --------------------------------------------------------
-- Table  `{{ iv_schema }}`.`claim_request_m` 
-----------------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`claim_request_m` (
  `claimRequestId` INT          NOT NULL AUTO_INCREMENT,
  `merchantId`     INT          NOT NULL,
  `citizenId`      INT          NOT NULL,
  `claimTypeId`    INT          NOT NULL,
  `status`         VARCHAR(25)  NOT NULL,
  `transactionId`  VARCHAR(45)  NOT NULL,
  `name`           VARCHAR(45)  NOT NULL,
  `description`    VARCHAR(255) NULL,
  `createdOn`      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`     TIMESTAMP    NULL,
  `attributes`     JSON         NOT NULL,
  PRIMARY KEY (`claimRequestId`)
);

-- -----------------------------------------------------
-- Table `{{ iv_schema }}`.`merchant_m`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`merchant` (
  `merchantId`     INT      NOT NULL AUTO_INCREMENT,
  `userName`   VARCHAR(75)  NOT NULL,
  `email`      VARCHAR(75)  NOT NULL,
  `password`   VARCHAR(100) NOT NULL,
  `firstName`  VARCHAR(45)  NOT NULL,
  `lastName`   VARCHAR(45)  NOT NULL,
  `country`    VARCHAR(45)  NOT NULL,
  `createdOn`  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` TIMESTAMP    NULL     DEFAULT NULL,
  PRIMARY KEY (`merchantId`),
  UNIQUE KEY (`userName`)
);

-- -----------------------------------------------------
-- Table `{{ iv_schema }}`.`merchant_attributes_m`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`merchant_attributes_m` (
  `merchantAttributesId` INT          NOT NULL AUTO_INCREMENT,
  `merchantId`           INT          NOT NULL,
  `name`                 VARCHAR(45)  NOT NULL,
  `description`          VARCHAR(255) NULL,
  `createdOn`            TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`           TIMESTAMP    NULL,
  `attributes`           JSON         NOT NULL,
  PRIMARY KEY (`merchantAttributesId`)
);

-- -----------------------------------------------------
-- Table `{{ iv_schema }}`.`merchant_document`
-- -----------------------------------------------------
-- documentTypeId Needs to be changed to NOT NULL once document_type created for merchant
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`merchant_document` (
  `merchantDocumentId` INT      NOT NULL AUTO_INCREMENT,
  `merchantId`         INT      NOT NULL,
  `documentTypeId` INT          NOT NULL,
  `comment`        VARCHAR(255) NULL,
  `createdOn`      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`     TIMESTAMP    NULL,
  `documentB`      MEDIUMBLOB   NOT NULL,
  PRIMARY KEY (`merchantDocumentId`)
);

-- -----------------------------------------------------
-- Table `{{ iv_schema }}`.`merchant_document_type_m`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`merchant_document_type_m` (
  `documentTypeId` INT          NOT NULL AUTO_INCREMENT,
  `type`           VARCHAR(45)  NOT NULL,
  `description`    VARCHAR(255) NULL,
  `createdOn`      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`     TIMESTAMP    NULL,
  PRIMARY KEY (`documentTypeId`),
  UNIQUE KEY (`type`)
);

------------------------------------------------------------
-- Table  `{{ iv_schema }}`.`task_execution_s`
-----------------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`task_execution_s` (
  `taskExecutionId`  INT 		 NOT NULL AUTO_INCREMENT,
  `taskName` 		 VARCHAR(45) NOT NULL,
  `maxProcessedId`   INT 		 NOT NULL,
  `status`           VARCHAR(25) NOT NULL,
  `amount`           VARCHAR(25) NOT NULL,
  `createdOn`    	 TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`   	 TIMESTAMP   NULL,
  PRIMARY KEY (`taskExecutionId`)
);

------------------------------------------------------------
-- Table  `{{ iv_schema }}`.`source_system`
-----------------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`source_system` (
  `sourceSystemId`  	INT 			NOT NULL AUTO_INCREMENT,
  `name` 		 	   	VARCHAR(125) 	NOT NULL,
  `description`         VARCHAR(255)	NOT NULL,
  `createdOn`    	   	TIMESTAMP 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`   	   	TIMESTAMP 		NULL,
  PRIMARY KEY (`sourceSystemId`),
  UNIQUE KEY (`name`)
);

------------------------------------------------------------
-- Table  `{{ iv_schema }}`.`source_target_mapping`
-----------------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`source_target_mapping` (
  `sourceTargetMappingId`   	INT 			NOT NULL AUTO_INCREMENT, 
  `sourceSystemId` 				INT			 	NOT NULL,
  `targetSystemId` 				INT			 	NOT NULL,
  `termsAgreementBypass`      	BOOLEAN 		NOT NULL, 
  `orderNo` 					INT			 	NOT NULL,
  `allOrNone`      				BOOLEAN 		NOT NULL, 
  `comments`         			VARCHAR(255) 	NULL,
  `createdOn`    	   			TIMESTAMP 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`   	   			TIMESTAMP 		NULL,
  PRIMARY KEY (`sourceTargetMappingId`),
  UNIQUE KEY (`sourceSystemId`, `targetSystemId`, `orderNo`)
);
		
------------------------------------------------------------
-- Table  `{{ iv_schema }}`.`target_system_type`
-----------------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`target_system_type` (
  `targetSystemTypeId`  INT 			NOT NULL AUTO_INCREMENT,
  `type` 		 	   	VARCHAR(25) 	NOT NULL,
  `description`         VARCHAR(255)	NOT NULL,
  `createdOn`    	   	TIMESTAMP 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`   	   	TIMESTAMP 		NULL,
  PRIMARY KEY (`targetSystemTypeId`),
  UNIQUE KEY (`type`)
);

------------------------------------------------------------
-- Table  `{{ iv_schema }}`.`target_system`
-----------------------------------------------------------
-----------------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`target_system` (
  `targetSystemId`   	INT 			NOT NULL AUTO_INCREMENT,
  `name` 		 	   	VARCHAR(45) 	NOT NULL,
  `targetSystemTypeId` 	INT 			NOT NULL,
  `active`             	BOOLEAN 		NOT NULL,
  `url`             	VARCHAR(255)	NOT NULL,
  `username`           	VARCHAR(50) 	NOT NULL,
  `password`           	VARCHAR(50)  	NOT NULL, 
  `description`         VARCHAR(255) 	NOT NULL,
  `attributes`     		JSON         	NULL, 
  `createdOn`    	   	TIMESTAMP 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`   	   	TIMESTAMP 		NULL,
  PRIMARY KEY (`targetSystemId`),
  UNIQUE KEY (`name`, `targetSystemTypeId`)
);

------------------------------------------------------------
-- Table  `{{ iv_schema }}`.`target_system_operation`
-----------------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`target_system_operation` (
  `targetSystemOperationId`   	INT 			NOT NULL AUTO_INCREMENT, 
  `operation` 		 	   		VARCHAR(50) 	NOT NULL, 
  `targetSystemId` 		 	   	INT 			NOT NULL,
  `uri`             			VARCHAR(255)	NOT NULL, 
  `description`         		VARCHAR(255) 	NOT NULL,
  `attributes`     				JSON         	NULL, 
  `createdOn`    	   			TIMESTAMP 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`   	   			TIMESTAMP 		NULL,
  PRIMARY KEY (`targetSystemOperationId`),
  UNIQUE KEY (`operation`, `targetSystemId`)
);

------------------------------------------------------------
-- Table  `{{ iv_schema }}`.`target_system_mapping`
-----------------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`target_system_mapping` (
  `targetSystemMappingId`   	INT 			NOT NULL AUTO_INCREMENT, 
  `targetSystemOperationId` 	INT			 	NOT NULL,
  `internalSystemField`       	VARCHAR(125)	NOT NULL, 
  `targetSystemField`       	VARCHAR(125)	NOT NULL, 
  `description`         		VARCHAR(255) 	NULL,
  `createdOn`    	   			TIMESTAMP 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`   	   			TIMESTAMP 		NULL,
  PRIMARY KEY (`targetSystemMappingId`)
);
    	
------------------------------------------------------------
-- Table  `{{ iv_schema }}`.`target_system_injection`
-----------------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`target_system_injection` (
  `targetSystemInjectionId`   	INT 			NOT NULL AUTO_INCREMENT, 
  `targetSystemMappingId` 		INT			 	NOT NULL,
  `injectedValue`       	    VARCHAR(255)	NOT NULL, 
  `description`         		VARCHAR(255) 	NULL,
  `createdOn`    	   			TIMESTAMP 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`   	   			TIMESTAMP 		NULL,
  PRIMARY KEY (`targetSystemInjectionId`)
);

-- -----------------------------------------------------
-- Table `{{ iv_schema }}`.`user_external_reference`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`user_external_reference` (
  `userExternalReferenceId`   	INT          	NOT NULL AUTO_INCREMENT,
  `userId`         				INT          	NOT NULL,
  `targetSystemUserId`       	VARCHAR(100)  	NOT NULL,  
  `status` 		   				VARCHAR(25)  	NOT NULL,
  `targetSystemId` 		   		INT  			NOT NULL,
  `description`    				VARCHAR(255) 	NULL,
  `createdOn`      				TIMESTAMP    	NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn`     				TIMESTAMP    	NULL,
  PRIMARY KEY (`userExternalReferenceId`),
  UNIQUE KEY (`targetSystemUserId`)
);

-- -----------------------------------------------------
-- Table `{{ iv_schema }}`.`user_invite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`user_invite` (
	`id` 				INT 			NOT NULL AUTO_INCREMENT,
	`email` 			VARCHAR(75) 	NOT NULL,
	`username`			VARCHAR(50) 	NOT NULL,
	`fname` 			VARCHAR(50) 	NULL DEFAULT NULL,
	`lname` 			VARCHAR(50) 	NULL DEFAULT NULL,
	`mobileNo` 			VARCHAR(50) 	NULL DEFAULT NULL,
	`vCode` 			INT 			NOT NULL,
	`sourceSystem` 		INT 			NOT NULL,
	`createdAt` 		TIMESTAMP 		NOT NULL DEFAULT NOW(),
	`updatedAt` 		TIMESTAMP 		NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	`expiredAt` 		TIMESTAMP 		NULL,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `email` (`email`),
	UNIQUE INDEX `username` (`username`),
	CONSTRAINT `FK_source_system` FOREIGN KEY (`sourceSystem`) REFERENCES `source_system` (`sourceSystemId`)
);

-- -----------------------------------------------------
-- Table `{{ iv_schema }}`.`email_template`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`email_template` (
  `email_template_id` 		INT(11) 		NOT NULL AUTO_INCREMENT,
  `template_name` 			VARCHAR(128) 	NOT NULL,
  `description` 			MEDIUMTEXT,
  `toemail` 				MEDIUMTEXT,
  `cc` 						MEDIUMTEXT,
  `bcc` 					MEDIUMTEXT,
  `subject` 				MEDIUMTEXT 		NOT NULL,
  `body` 					MEDIUMTEXT 		COMMENT 'html/plain text',
  `fromemail` 				VARCHAR(256) 	NOT NULL,
  `fromname` 				VARCHAR(256) 	DEFAULT NULL,
  `createddate` 			TIMESTAMP 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` 				VARCHAR(256) 	NOT NULL,
  `updateddate` 			TIMESTAMP 		NULL DEFAULT NULL,
  `updatedby` 			 	VARCHAR(256) 	DEFAULT NULL,
  PRIMARY KEY (`email_template_id`),
  UNIQUE INDEX `template_name` (`template_name`)
);

-- --------------------------------------------------------
-- Table `{{ iv_schema }}`.`systemconfig`
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`systemconfig` (
  `keyName` varchar(64) NOT NULL,
  `keyValue` varchar(512) NOT NULL,
  PRIMARY KEY (`keyName`)
);

ALTER TABLE `{{ iv_schema }}`.`systemconfig`
	CHANGE COLUMN `keyValue` `keyValue` VARCHAR(1024) NOT NULL AFTER `keyName`;

-- --------------------------------------------------------
-- Table `{{ iv_schema }}`.`user_device`
-- --------------------------------------------------------
ALTER TABLE `{{ iv_schema }}`.`user_device` DROP INDEX `deviceId`;

-- --------------------------------------------------------
-- Table `{{ iv_schema }}`.`user`
-- --------------------------------------------------------
ALTER TABLE `{{ iv_schema }}`.`user`
ADD `mfa_attributes` json DEFAULT NULL;

-- --------------------------------------------------------
-- Table `{{ iv_schema }}`.`mfa_auth_req`
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`mfa_auth_req` (
  `mfa_auth_req_no` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mfa_auth_req_status` varchar(50) NOT NULL,
  `auth_client_ip` varchar(50) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mfa_auth_req_no`),
  KEY `FK_mfa_auth_req_user` (`user_id`),
  CONSTRAINT `FK_mfa_auth_req_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`userId`)
);

-- --------------------------------------------------------
-- Table `{{ iv_schema }}`.`mfa_config_req`
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`mfa_config_req` (
  `mfa_config_req_no` varchar(50) NOT NULL,
  `verification_code` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mfa_config_req_status` varchar(50) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mfa_config_req_no`),
  KEY `FK__user` (`user_id`),
  CONSTRAINT `FK__user` FOREIGN KEY (`user_id`) REFERENCES `user` (`userId`)
);

-- --------------------------------------------------------
-- Table `{{ iv_schema }}`.`user_device`
-- --------------------------------------------------------
ALTER TABLE `{{ iv_schema }}`.`user_device`
ADD `device_attributes` json DEFAULT NULL;

ALTER TABLE `{{ iv_schema }}`.`user_device`
ADD `is_primary` tinyint(4) NOT NULL DEFAULT '0';

-- --------------------------------------------------------
-- Table `{{ iv_schema }}`.`mfa_auth_req`
-- --------------------------------------------------------
ALTER TABLE `{{ iv_schema }}`.`mfa_auth_req`
	ADD COLUMN `attributes` JSON NULL AFTER `mfa_auth_req_status`;

-- why are we dropping it? (Abdel)
-- DROP TABLE IF EXISTS `{{ iv_schema }}`.`systemconfig`;  

DROP TABLE IF EXISTS `{{ iv_schema }}`.`config_settings`;

-----------------------------------------------------------
-- Table  `{{ iv_schema }}`.`configuration`
-----------------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`configuration` (
  `configurationId` INT 		 NOT NULL AUTO_INCREMENT,
  `name` 		 	 VARCHAR(50) 	NOT NULL,
  `value`   		 VARCHAR(75) 	NULL, 
  `description`      VARCHAR(125)	NULL,
  `attributes`       JSON        	NULL,
  `createDate`    	 TIMESTAMP   	NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate`   	 TIMESTAMP   	NULL,
  `createdBy`   	 VARCHAR(75)   	NULL,
  `updatedBy`   	 VARCHAR(75)   	NULL,
  PRIMARY KEY (`configurationId`),
  UNIQUE KEY (`name`)
);

CREATE UNIQUE INDEX useremail ON user(email);
CREATE INDEX userattributesuserId ON user_attributes_m(userId);

-- Adding MFAEnrollment Table

ALTER TABLE `user_device`
    CHANGE COLUMN `userDeviceId` `device_id` INT(11) NOT NULL AUTO_INCREMENT FIRST,
    CHANGE COLUMN `userId` `user_id` INT(11) NOT NULL AFTER `device_id`,
    CHANGE COLUMN `deviceId` `global_id` VARCHAR(75) NOT NULL COLLATE 'utf8_general_ci' AFTER `user_id`,
    ADD COLUMN `mfa_type` VARCHAR(25) NOT NULL DEFAULT 'MFA_PUSH' COLLATE 'utf8_general_ci' AFTER `is_primary`,
    CHANGE COLUMN `device_attributes` `device_attributes` JSON NULL DEFAULT NULL AFTER `description`,
    CHANGE COLUMN `createdOn` `created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `device_attributes`,
    CHANGE COLUMN `modifiedOn` `updated_on` TIMESTAMP NULL DEFAULT NULL AFTER `created_on`,
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (`device_id`) USING BTREE,
    ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`userId`);
RENAME TABLE `user_device` TO `device`;


ALTER TABLE `mfa_config_req`
	CHANGE COLUMN `mfa_config_req_no` `mfa_enrollment_id` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci' FIRST,
	CHANGE COLUMN `user_id` `user_id` INT(11) NOT NULL AFTER `mfa_enrollment_id`,
	CHANGE COLUMN `verification_code` `verification_code` VARCHAR(50) NULL COLLATE 'utf8_general_ci' AFTER `user_id`,
	ADD COLUMN `device_id` INT NULL DEFAULT NULL AFTER `verification_code`,
	ADD COLUMN `mfa_type` VARCHAR(50) NOT NULL AFTER `device_id`,
	CHANGE COLUMN `mfa_config_req_status` `status` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci' AFTER `mfa_type`,
	DROP PRIMARY KEY,
	ADD PRIMARY KEY (`mfa_enrollment_id`) USING BTREE,
	ADD CONSTRAINT `FL__device` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`);
RENAME TABLE `mfa_config_req` TO `mfa_enrollment`;

ALTER TABLE `mfa_enrollment`
 ADD COLUMN `attributes` JSON NULL AFTER `status`;
 
-----------------------------------------------------------
-- Table  `{{ iv_schema }}`.`authentication_question `
-----------------------------------------------------------
CREATE TABLE IF NOT EXISTS `{{ iv_schema }}`.`authentication_question` (
  `authenticationQuestionId` 	INT 	 		NOT NULL AUTO_INCREMENT,
  `locale`      	 			VARCHAR(10)		NOT NULL,
  `question`      	 			VARCHAR(150)	NOT NULL,
  `inUse`            			BOOLEAN 		NOT NULL, 
  `createDate`    	 			TIMESTAMP   	NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate`   	 			TIMESTAMP   	NULL,
  `createdBy`   	 			VARCHAR(75)   	NULL,
  `updatedBy`   	 			VARCHAR(75)   	NULL,
  PRIMARY KEY (`authenticationQuestionId`),
  UNIQUE KEY (`question`)
);
