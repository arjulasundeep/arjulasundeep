-- Authors: pkulkarni, cstewart, rmishra

CREATE DATABASE IF NOT EXISTS `$(DB_schema)`;

USE `$(DB_schema)`;

CREATE TABLE IF NOT EXISTS `io_user`
(
    `io_user_id` BIGINT       NOT NULL AUTO_INCREMENT,
    `username`   VARCHAR(75)  NOT NULL,
    `userpwd`    VARCHAR(75)  NOT NULL,
    `email`      VARCHAR(125) NOT NULL,
    `first_name` VARCHAR(75)  DEFAULT NULL,
    `last_name`  VARCHAR(75)  DEFAULT NULL,
    `mobile_no`  VARCHAR(15)  DEFAULT NULL,
    `status`     TINYINT      NOT NULL,
    `created_by` VARCHAR(255) DEFAULT NULL,
    `created_on` DATETIME(6)  NOT NULL,
    `updated_by` VARCHAR(255) DEFAULT NULL,
    `updated_on` DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`io_user_id`),
    UNIQUE KEY (`username`),
    UNIQUE KEY (`email`)
);

CREATE TABLE IF NOT EXISTS `org`
(
    `org_id`      BIGINT       NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(255) NOT NULL,
    `status`      BIT(1)       NOT NULL,
    `description` VARCHAR(255) DEFAULT NULL,
    `created_by`  VARCHAR(255) DEFAULT NULL,
    `created_on`  DATETIME(6)  NOT NULL,
    `updated_by`  VARCHAR(255) DEFAULT NULL,
    `updated_on`  DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`org_id`),
    UNIQUE KEY (`name`)
);

CREATE TABLE IF NOT EXISTS `mfa_shadow_user`
(
    `mfa_shadow_user_id` BIGINT       NOT NULL AUTO_INCREMENT,
    `userName`           VARCHAR(255) NOT NULL,
    `io_user_id`         BIGINT       DEFAULT NULL,
    `target_system_id`   BIGINT       DEFAULT NULL,
    `mfa_attributes`     JSON         DEFAULT NULL,
    `extra_attributes`   JSON         DEFAULT NULL,
    `created_by`         VARCHAR(255) DEFAULT NULL,
    `created_on`         DATETIME(6)  NOT NULL,
    `updated_by`         VARCHAR(255) DEFAULT NULL,
    `updated_on`         DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`mfa_shadow_user_id`)
);

CREATE TABLE IF NOT EXISTS `user_org`
(
    `user_org_id` BIGINT      NOT NULL AUTO_INCREMENT,
    `org_id`      BIGINT      NOT NULL,
    `io_user_id`  BIGINT      NOT NULL,
    `created_by`  VARCHAR(255) DEFAULT NULL,
    `created_on`  DATETIME(6) NOT NULL,
    `updated_by`  VARCHAR(255) DEFAULT NULL,
    `updated_on`  DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`user_org_id`)
);

CREATE TABLE IF NOT EXISTS `auth_config`
(
    `auth_config_id`  BIGINT       NOT NULL AUTO_INCREMENT,
    `auth_type`       VARCHAR(255) NOT NULL,
    `status`          BIT(1)       NOT NULL,
    `org_id`          BIGINT       NOT NULL,
    `additional_info` JSON         NOT NULL,
    `created_by`      VARCHAR(255) DEFAULT NULL,
    `created_on`      DATETIME(6)  NOT NULL,
    `updated_by`      VARCHAR(255) DEFAULT NULL,
    `updated_on`      DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`auth_config_id`)
);

CREATE TABLE IF NOT EXISTS `config`
(
    `config_id`   BIGINT      NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(255) DEFAULT NULL,
    `org_id`      BIGINT       DEFAULT NULL,
    `value`       JSON        NOT NULL,
    `description` VARCHAR(255) DEFAULT NULL,
    `created_by`  VARCHAR(255) DEFAULT NULL,
    `created_on`  DATETIME(6) NOT NULL,
    `updated_by`  VARCHAR(255) DEFAULT NULL,
    `updated_on`  DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`config_id`)
);

CREATE TABLE IF NOT EXISTS `custom_jpa_sql`
(
    `custom_jpa_sql_id` INT           NOT NULL AUTO_INCREMENT,
    `type`              VARCHAR(7)    NOT NULL,
    `entity`            VARCHAR(100)  NOT NULL,
    `key`               VARCHAR(100)  NOT NULL,
    `jpa_sql`           VARCHAR(3000) NOT NULL,
    `description`       VARCHAR(255) DEFAULT NULL,
    `additional_info`   JSON         DEFAULT NULL,
    `created_by`        VARCHAR(125) DEFAULT NULL,
    `created_on`        DATETIME(6)   NOT NULL,
    `updated_by`        VARCHAR(125) DEFAULT NULL,
    `updated_on`        DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`custom_jpa_sql_id`),
    UNIQUE KEY `key` (`key`)
);

CREATE TABLE IF NOT EXISTS `device`
(
    `device_id`          BIGINT       NOT NULL AUTO_INCREMENT,
    `device_type`        VARCHAR(255) NOT NULL,
    `global_id`          VARCHAR(255) NOT NULL,
    `is_primary`         BIT(1)       NOT NULL,
    `status`             VARCHAR(255) NOT NULL,
    `mfa_shadow_user_id` BIGINT       DEFAULT NULL,
    `io_user_id`         BIGINT       DEFAULT NULL,
    `description`        VARCHAR(255) DEFAULT NULL,
    `device_attributes`  JSON         NOT NULL,
    `additional_info`    JSON         DEFAULT NULL,
    `created_by`         VARCHAR(255) DEFAULT NULL,
    `created_on`         DATETIME(6)  NOT NULL,
    `updated_by`         VARCHAR(255) DEFAULT NULL,
    `updated_on`         DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`device_id`),
    INDEX (`io_user_id`)
);

CREATE TABLE IF NOT EXISTS `email_template`
(
    `email_template_id` BIGINT      NOT NULL AUTO_INCREMENT,
    `template_name`     VARCHAR(255)  DEFAULT NULL,
    `locale`            varchar(10)   DEFAULT NULL,
    `description`       VARCHAR(255)  DEFAULT NULL,
    `toemail`           VARCHAR(255)  DEFAULT NULL,
    `cc`                VARCHAR(255)  DEFAULT NULL,
    `bcc`               VARCHAR(255)  DEFAULT NULL,
    `subject`           VARCHAR(255)  DEFAULT NULL,
    `placeholders`      VARCHAR(1000) DEFAULT NULL,
    `body`              VARCHAR(3000) DEFAULT NULL,
    `fromemail`         VARCHAR(255)  DEFAULT NULL,
    `fromname`          VARCHAR(255)  DEFAULT NULL,
    `created_by`        VARCHAR(255)  DEFAULT NULL,
    `created_on`        DATETIME(6) NOT NULL,
    `updated_by`        VARCHAR(255)  DEFAULT NULL,
    `updated_on`        DATETIME(6)   DEFAULT NULL,
    PRIMARY KEY (`email_template_id`),
    UNIQUE KEY `unique_index` (`template_name`, `locale`)
);

CREATE TABLE IF NOT EXISTS `mfa_auth_req`
(
    `mfa_auth_req_no`     VARCHAR(255) NOT NULL,
    `mfa_auth_req_status` VARCHAR(255) DEFAULT NULL,
    `mfa_shadow_user_id`  BIGINT       NOT NULL,
    `auth_client_ip`      VARCHAR(255) DEFAULT NULL,
    `attributes`          JSON         DEFAULT NULL,
    `created_by`          VARCHAR(255) DEFAULT NULL,
    `created_on`          DATETIME(6)  NOT NULL,
    `updated_by`          VARCHAR(255) DEFAULT NULL,
    `updated_on`          DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`mfa_auth_req_no`)
);

CREATE TABLE IF NOT EXISTS `mfa_enrollment`
(
    `mfa_enrollment_id`  VARCHAR(255) NOT NULL,
    `mfa_type`           VARCHAR(255) NOT NULL,
    `status`             VARCHAR(255) DEFAULT NULL,
    `device_id`          BIGINT       DEFAULT NULL,
    `verification_code`  VARCHAR(255) DEFAULT NULL,
    `mfa_shadow_user_id` BIGINT       NOT NULL,
    `attributes`         JSON         NOT NULL,
    `created_by`         VARCHAR(255) DEFAULT NULL,
    `created_on`         DATETIME(6)  NOT NULL,
    `updated_by`         VARCHAR(255) DEFAULT NULL,
    `updated_on`         DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`mfa_enrollment_id`)
);

CREATE TABLE IF NOT EXISTS `org_hierarchy`
(
    `org_hierarchy_id` BIGINT      NOT NULL AUTO_INCREMENT,
    `org_id`           BIGINT      NOT NULL,
    `parent_org_id`    BIGINT      NOT NULL,
    `created_by`       VARCHAR(255) DEFAULT NULL,
    `created_on`       DATETIME(6) NOT NULL,
    `updated_by`       VARCHAR(255) DEFAULT NULL,
    `updated_on`       DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`org_hierarchy_id`)
);

CREATE TABLE IF NOT EXISTS `permission`
(
    `permission_id` BIGINT       NOT NULL AUTO_INCREMENT,
    `name`          VARCHAR(255) NOT NULL,
    `is_displayed`  BIT(1)       NOT NULL,
    `description`   VARCHAR(255) DEFAULT NULL,
    `created_by`    VARCHAR(255) DEFAULT NULL,
    `created_on`    DATETIME(6)  NOT NULL,
    `updated_by`    VARCHAR(255) DEFAULT NULL,
    `updated_on`    DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`permission_id`),
    UNIQUE KEY (`name`)
);

CREATE TABLE IF NOT EXISTS `role`
(
    `role_id`     BIGINT       NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(255) NOT NULL,
    `status`      BIT(1)       NOT NULL,
    `is_editable` BIT(1)       NOT NULL,
    `org_id`      BIGINT       NOT NULL,
    `description` VARCHAR(255) DEFAULT NULL,
    `created_by`  VARCHAR(255) DEFAULT NULL,
    `created_on`  DATETIME(6)  NOT NULL,
    `updated_by`  VARCHAR(255) DEFAULT NULL,
    `updated_on`  DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`role_id`),
    UNIQUE KEY `unique_index` (`name`, `org_id`)
);

CREATE TABLE IF NOT EXISTS `role_permission`
(
    `role_permission_id` BIGINT       NOT NULL AUTO_INCREMENT,
    `role_id`            BIGINT       NOT NULL,
    `permission_name`    VARCHAR(255) NOT NULL,
    `created_by`         VARCHAR(255) DEFAULT NULL,
    `created_on`         DATETIME(6)  NOT NULL,
    `updated_by`         VARCHAR(255) DEFAULT NULL,
    `updated_on`         DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`role_permission_id`),
    INDEX (`role_id`),
    INDEX (`permission_name`)
);

CREATE TABLE IF NOT EXISTS `user_attribute`
(
    `user_attribute_id` BIGINT       NOT NULL AUTO_INCREMENT,
    `attribute_name`    VARCHAR(255) NOT NULL,
    `io_user_id`        BIGINT       NOT NULL,
    `description`       VARCHAR(255) NULL,
    `additional_info`   JSON         DEFAULT NULL,
    `created_by`        VARCHAR(255) DEFAULT NULL,
    `created_on`        DATETIME(6)  NOT NULL,
    `updated_by`        VARCHAR(255) DEFAULT NULL,
    `updated_on`        DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`user_attribute_id`),
    INDEX (`io_user_id`)
);

CREATE TABLE IF NOT EXISTS `user_role`
(
    `user_role_id` BIGINT      NOT NULL AUTO_INCREMENT,
    `io_user_id`   BIGINT      NOT NULL,
    `role_id`      BIGINT      NOT NULL,
    `created_by`   VARCHAR(255) DEFAULT NULL,
    `created_on`   DATETIME(6) NOT NULL,
    `updated_by`   VARCHAR(255) DEFAULT NULL,
    `updated_on`   DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`user_role_id`),
    UNIQUE KEY `unique_index` (`io_user_id`, `role_id`)
);


CREATE TABLE IF NOT EXISTS `sms_template`
(
    `template_id`   bigint      NOT NULL AUTO_INCREMENT,
    `template_name` varchar(255)  DEFAULT NULL,
    `locale`        varchar(10)   DEFAULT NULL,
    `created_by`    varchar(255)  DEFAULT NULL,
    `created_on`    datetime(6) NOT NULL,
    `updated_by`    varchar(255)  DEFAULT NULL,
    `updated_on`    datetime(6)   DEFAULT NULL,
    `description`   varchar(255)  DEFAULT NULL,
    `sender`        varchar(255)  DEFAULT NULL,
    `placeholders`  varchar(1000) DEFAULT NULL,
    `message`       varchar(3000) DEFAULT NULL,
    PRIMARY KEY (`template_id`),
    UNIQUE KEY `unique_index` (`template_name`, `locale`)
);

CREATE TABLE IF NOT EXISTS `field_validation`
(
    `field_validation_id` BIGINT       NOT NULL AUTO_INCREMENT,
    `field_key`           VARCHAR(125) NOT NULL,
    `component`           JSON         NOT NULL,
    `org_name`            VARCHAR(125) NOT NULL,
    `uri`                 JSON         NOT NULL,
    `description`         VARCHAR(255) NOT NULL,
    `created_by`          VARCHAR(255) DEFAULT NULL,
    `created_on`          DATETIME(6)  NOT NULL,
    `updated_by`          VARCHAR(255) DEFAULT NULL,
    `updated_on`          DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`field_validation_id`),
    INDEX (`field_key`)
);

-- --------------------------
-- user_verify
-- --------------------------
CREATE TABLE IF NOT EXISTS `user_verify`
(
    `user_verify_id`       VARCHAR(255) NOT NULL,
    `code`                 VARCHAR(255) DEFAULT NULL,
    `channel`              VARCHAR(25)  DEFAULT NULL,
    `recipients`           VARCHAR(255) DEFAULT NULL,
    `created_on`           datetime     DEFAULT NULL,
    `updated_on`           datetime     DEFAULT NULL,
    `verification_sent_on` datetime     DEFAULT NULL,
    `created_by`           VARCHAR(50)  DEFAULT NULL,
    `updated_by`           VARCHAR(50)  DEFAULT NULL,
    `type`                 VARCHAR(255) DEFAULT NULL,
    `io_user_id`           bigint       DEFAULT NULL,
    `used_count`           int          DEFAULT NULL,
    `resend_count`         int          DEFAULT NULL,
    `mfa_shadow_user_id`   bigint       DEFAULT NULL,
    `status`               VARCHAR(50)  DEFAULT NULL,
    `additional_info`      json         DEFAULT NULL,
    PRIMARY KEY (`user_verify_id`) USING BTREE
);

-- --------------------------
-- privileges
-- --------------------------
CREATE TABLE IF NOT EXISTS `privilege`
(
    `privilege_id`  BIGINT       NOT NULL AUTO_INCREMENT,
    `name`          VARCHAR(255) NOT NULL,
    `db_operations` VARCHAR(1000) NOT NULL,
    `description`   VARCHAR(255) DEFAULT NULL,
    `created_by`    VARCHAR(255) DEFAULT NULL,
    `created_on`    DATETIME(6)  NOT NULL,
    `updated_by`    VARCHAR(255) DEFAULT NULL,
    `updated_on`    DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`privilege_id`),
    UNIQUE KEY (`name`)
);

-- --------------------------
-- endpoint_privilege
-- --------------------------
CREATE TABLE IF NOT EXISTS `endpoint_privilege`
(
    `endpoint_privilege_id` BIGINT       NOT NULL AUTO_INCREMENT,
    `endpoint`              VARCHAR(255) NOT NULL,
    `method`                VARCHAR(255) NOT NULL,
    `privilege_name`        VARCHAR(255) NOT NULL,
    `description`           VARCHAR(255) DEFAULT NULL,
    `created_by`            VARCHAR(255) DEFAULT NULL,
    `created_on`            DATETIME(6)  NOT NULL,
    `updated_by`            VARCHAR(255) DEFAULT NULL,
    `updated_on`            DATETIME(6)  DEFAULT NULL,
    PRIMARY KEY (`endpoint_privilege_id`)
);


