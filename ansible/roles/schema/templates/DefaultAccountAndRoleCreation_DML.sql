--
-- Copyright (c) 2021 Simeio Solutions.
-- All rights reserved.
--
-- @Author Pratik Kulkarni (pkulkarni)
--
-- @Date 03/05/21, 8:50 PM
--
USE `$(DB_schema)`;
-- -----------------------------------------------------------------------
-- create default org
-- -----------------------------------------------------------------------
INSERT INTO `org` (`org_id`, `created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `name`, `status`)
VALUES (1, NULL, now(), NULL, now(), 'IO', 'IO', 1);

-- -----------------------------------------------------------------------
-- create default user
-- Password is P@ssw0rd
-- -----------------------------------------------------------------------
INSERT INTO `io_user` (`io_user_id`, `username`, `userpwd`, `email`, `mobile_no`, `status`,
                       `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES (1, 'io_admin', '$2a$10$svMRShJqmJcAhODLYgNjB.Cr.LG580X7/zYWZx9siaNp29v2FpK.2', 'io_admin@yopmail.com',
        '123-456-7890', 1, NULL, now(), NULL, now());

-- -----------------------------------------------------------------------
-- create default user_org_mapping
-- -----------------------------------------------------------------------
INSERT INTO `user_org` (`user_org_id`, `created_by`, `created_on`, `updated_by`, `updated_on`, `org_id`, `io_user_id`)
VALUES (1, NULL, now(), NULL, now(), 1, 1);

-- -----------------------------------------------------------------------
-- create default role
-- -----------------------------------------------------------------------
INSERT INTO `role` (`role_id`, `created_by`, `created_on`, `is_editable`, `name`, `status`, `org_id`)
VALUES ('1', 'System', now(), 0, 'IO_ADMIN', 1, '1');

-- -----------------------------------------------------------------------
-- create default role
-- -----------------------------------------------------------------------
INSERT INTO `role` (`role_id`, `created_by`, `created_on`, `is_editable`, `name`, `status`, `org_id`)
VALUES ('2', 'System', now(), 0, 'USER', 1, '1');

-- -----------------------------------------------------------------------
-- create default user_role_mapping
-- -----------------------------------------------------------------------
INSERT INTO `user_role` (`created_by`, `created_on`, `role_id`, `io_user_id`)
VALUES ('System', now(), '1', '1');

-- -----------------------------------------------------------------------
-- create default role-permission mappings for role IO_ADMIN
-- -----------------------------------------------------------------------
INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'mfa.unlockuser', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.mfa.removedevice', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.mfa.readbackupcodes', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.mfa.geteenrollment', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.mfa.deleteenrollment', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.mfa.disable', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.mfa.profile', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.mfa.getdevice', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'org.all', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'org.create', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'org.update', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'org.readrole', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'org.editrole', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'org.createrole', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'org.read', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.update', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'user.search', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'user.read', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'user.updaterole', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'user.updatepwd', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'user.profile', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.delete', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'etemplate.create', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'etemplate.update', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'etemplate.delete', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'etemplate.read', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'main.dashboard', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'smstemplate.read', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'smstemplate.update', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'smstemplate.delete', '1');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'smstemplate.create', '1');

-- -----------------------------------------------------------------------
-- create default role-permission mappings for role USER
-- -----------------------------------------------------------------------
INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.update', '2');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'user.search', '2');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'user.read', '2');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'user.updaterole', '2');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.mfa.removedevice', '2');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.mfa.readbackupcodes', '2');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.mfa.geteenrollment', '2');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.mfa.deleteenrollment', '2');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.mfa.disable', '2');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.mfa.profile', '2');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.mfa.getdevice', '2');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'user.updatepwd', '2');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'user.profile', '2');

INSERT INTO `role_permission` (`created_on`, `permission_name`, `role_id`)
VALUES (now(), 'self.delete', '2');
