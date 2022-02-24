-- Authors: Abdel Belkasri, PhD

USE `$(DB_schema)`;

-- --------------------------
-- create test users
-- --------------------------
INSERT INTO `io_user` (created_by, created_on, updated_by, updated_on, io_user_id, username, userpwd, email,mobile_no,status)
   VALUES (NULL, now(), NULL, NULL, 1001, 'anAdmin', '$2y$12$QgpwiTfAAaJgs9.tmJkSs.lNmUJhAslSl6vQiz2l17DCXRmReWuDa', 'anAdmin@something.con', '1234567890', 1);
INSERT INTO `io_user` (created_by, created_on, updated_by, updated_on, io_user_id, username, userpwd, email,mobile_no,status)
   VALUES (NULL, now(), NULL, NULL, 1002, 'aRegularUser31', '$2y$12$sAucj2xDyzuYUcaomEv8j.gVz/E4IyYLUCkUPd9mFM7w.Bkqgdvwa', 'aRegularUser31@something.con', '1234567890', 1);
INSERT INTO `io_user` (created_by, created_on, updated_by, updated_on, io_user_id, username, userpwd, email,mobile_no,status)
   VALUES (NULL, now(), NULL, NULL, 1003, 'aCustomer', '$2y$12$g6YopKOH1h9ym1N4UUngtuOaus6efNUNqlmesdiD2jlBiBqY7HWKa', 'aCustomer@something.con', '1234567890', 1);

-- --------------------------
-- associate the test users to simeio org
-- --------------------------
INSERT INTO `user_org` (created_by, created_on, updated_by,updated_on, user_org_id,org_id,io_user_id)
   VALUES (NULL, now(), NULL, NULL, 1001, 1, 1001);
INSERT INTO `user_org` (created_by, created_on, updated_by,updated_on, user_org_id,org_id,io_user_id)
   VALUES (NULL, now(), NULL, NULL, 1002, 1, 1002);
INSERT INTO `user_org` (created_by, created_on, updated_by,updated_on, user_org_id,org_id,io_user_id)
   VALUES (NULL, now(), NULL, NULL, 1003, 1, 1003);

-- --------------------------
-- create test permissions
-- --------------------------
-- load permission for 'mfaunlockuser'
INSERT INTO `permission` (`created_by`, `created_on`, `is_displayed`, `name`)
  VALUES ('System', now(), 1, 'do_all');

INSERT INTO `permission` (`created_by`, `created_on`, `is_displayed`, `name`)
  VALUES ('System',  now(), 1, 'do_user_stuff');

INSERT INTO `permission` (`created_by`, `created_on`, `is_displayed`, `name`)
  VALUES ('System',  now(), 1, 'do_customer_stuff');

-- --------------------------
-- create a test roles
-- --------------------------
INSERT INTO `simeio_io`.`role` (`role_id`, `name`, `status`, `is_editable`, `org_id`, `description`, `created_by`, `created_on`, `updated_by`,`updated_on`)
  VALUES (1001,'Test-Admin-Role',1,0,1,'Role for testing only', NULL, now(), NULL, NULL);
INSERT INTO `simeio_io`.`role` (`role_id`, `name`, `status`, `is_editable`, `org_id`, `description`, `created_by`, `created_on`, `updated_by`,`updated_on`)
  VALUES (1002,'Test-User-Role',1,0,1,'Role for testing only', NULL, now(), NULL, NULL);
INSERT INTO `simeio_io`.`role` (`role_id`, `name`, `status`, `is_editable`, `org_id`, `description`, `created_by`, `created_on`, `updated_by`,`updated_on`)
  VALUES (1003,'Test-Customer-Role',1,0,1,'Role for testing only', NULL, now(), NULL, NULL);

-- --------------------------
-- Associate test permissions to test role
-- --------------------------
INSERT INTO `simeio_io`.`role_permission` (`role_permission_id`, `role_id`, `permission_name`, `created_by`, `created_on`, `updated_by`, `updated_on`)
  VALUES (1001, 1001, 'do_all' , NULL, now(), NULL, NULL);
INSERT INTO `simeio_io`.`role_permission` (`role_permission_id`, `role_id`, `permission_name`, `created_by`, `created_on`, `updated_by`, `updated_on`)
  VALUES (1002, 1002, 'do_user_stuff' , NULL, now(), NULL, NULL);
INSERT INTO `simeio_io`.`role_permission` (`role_permission_id`, `role_id`, `permission_name`, `created_by`, `created_on`, `updated_by`, `updated_on`)
  VALUES (1003, 1003, 'do_customer_stuff' , NULL, now(), NULL, NULL);
-- These are needed for performance testing
INSERT INTO `simeio_io`.`role_permission` (role_id, permission_name, created_by, created_on, updated_by, updated_on )
    values ( 1002, 'int.user.search', NULL, now(), NULL, NULL);
INSERT INTO `simeio_io`.`role_permission` (role_id, permission_name, created_by, created_on, updated_by, updated_on )
    values ( 1002, 'int.emailtemplate.read', NULL, now(), NULL, NULL);
INSERT INTO `simeio_io`.`role_permission` (role_id, permission_name, created_by, created_on, updated_by, updated_on )
    values ( 1002, 'int.emailtemplate.create', NULL, now(), NULL, NULL);
INSERT INTO `simeio_io`.`role_permission` (role_id, permission_name, created_by, created_on, updated_by, updated_on )
    values ( 1002, 'int.emailtemplate.update', NULL, now(), NULL, NULL);
INSERT INTO `simeio_io`.`role_permission` (role_id, permission_name, created_by, created_on, updated_by, updated_on )
    values ( 1002, 'etemplate.create', NULL, now(), NULL, NULL);
INSERT INTO `simeio_io`.`role_permission` (role_id, permission_name, created_by, created_on, updated_by, updated_on )
    values ( 1002, 'EmailTemplate.delete', NULL, now(), NULL, NULL);
INSERT INTO `simeio_io`.`role_permission` (role_id, permission_name, created_by, created_on, updated_by, updated_on )
    values ( 1002, 'etemplate.read', NULL, now(), NULL, NULL);

  -- --------------------------
-- Associate test users to test role
-- --------------------------
INSERT INTO `simeio_io`.`user_role` (`user_role_id`, `io_user_id`, `role_id`, `created_by`, `created_on`, `updated_by`, `updated_on`)
  VALUES (1001, 1001, 1001, NULL, now(), NULL, NULL);
INSERT INTO `simeio_io`.`user_role` (`user_role_id`, `io_user_id`, `role_id`, `created_by`, `created_on`, `updated_by`, `updated_on`)
  VALUES (1002, 1002, 1002, NULL, now(), NULL, NULL);
INSERT INTO `simeio_io`.`user_role` (`user_role_id`, `io_user_id`, `role_id`, `created_by`, `created_on`, `updated_by`, `updated_on`)
  VALUES (1003, 1003, 1003, NULL, now(), NULL, NULL);


-- --------------------------
-- This is only needed to test performance of io-persistence-service
--   this entry needs to be removed after testing is done. It could be exploited
-- --------------------------
INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/persistence/jpa-sql', 'POST', 'int.sts.authenticate', 'FOR TESTING ONLY', 'System', now(), null, null);
-- These are needed for performance testing
INSERT INTO `simeio_io`.`endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES ('/persistence/jpa-sql', 'POST', 'int.sts.authenticate', 'FOR TESTING ONLY Remove afterwards', 'System', now(), 'System', now());
INSERT INTO `simeio_io`.`endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES ('/notification/send', 'POST', 'int.push.broadcast', 'FOR TESTING ONLY Remove afterwards', 'System', now(), 'System', now());
INSERT INTO `simeio_io`.`endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES ('/email/template', 'POST', 'int.emailtemplate.create', 'FOR TESTING ONLY Remove afterwards', 'System', now(), 'System', now());
INSERT INTO `simeio_io`.`endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES ('/email/template', 'PUT', 'int.emailtemplate.update', 'FOR TESTING ONLY Remove afterwards', 'System', now(), 'System', now());
INSERT INTO `simeio_io`.`endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES ('/email/template', 'DELETE', 'int.emailtemplate.update', 'FOR TESTING ONLY Remove afterwards', 'System', now(), 'System', now());
INSERT INTO `simeio_io`.`endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES ('/email/template', 'GET', 'int.emailtemplate.read', 'FOR TESTING ONLY Remove afterwards', 'System', now(), 'System', now());
INSERT INTO `simeio_io`.`endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES ('/email/send/(.*)', 'POST', 'int.emailtemplate.create', 'FOR TESTING ONLY Remove afterwards', 'System', now(), 'System', now());
INSERT INTO `simeio_io`.`endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES ('/email/send/(.*)', 'PUT', 'int.emailtemplate.update', 'FOR TESTING ONLY Remove afterwards', 'System', now(), 'System', now());
INSERT INTO `simeio_io`.`endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES ('/email/send/(.*)', 'DELETE', 'int.emailtemplate.update', 'FOR TESTING ONLY Remove afterwards', 'System', now(), 'System', now());
INSERT INTO `simeio_io`.`endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES ('/email/send/(.*)', 'GET', 'int.emailtemplate.read', 'FOR TESTING ONLY Remove afterwards', 'System', now(), 'System', now());
INSERT INTO `simeio_io`.`endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES ('/email/send/(.*)', 'POST', 'int.emailtemplate.read', 'FOR TESTING ONLY Remove afterwards', 'System', now(), 'System', now());
INSERT INTO `simeio_io`.`endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES ('/email/send/(.*)', 'POST', 'int.email.send', 'FOR TESTING ONLY Remove afterwards', 'System', now(), 'System', now());





