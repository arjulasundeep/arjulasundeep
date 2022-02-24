-- Authors: pkulkarni, cstewart, Abdel Belkasri, PhD, rmishra

USE `$(DB_schema)`;
-- --------------------------
-- config
-- --------------------------

INSERT INTO `config` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `name`,
                      `org_id`, `value`)
VALUES (NULL, now(), NULL, NULL, NULL, 'auth.for.github', NULL, '{
  \"extra\": {
    \"authtype\": \"OAuth2\",
    \"attrs-mapping\": \"username=login,email=email,name=name,Role=type\",
    \"claims-to-add\": \"email,name\",
    \"roles-mapping\": \"User=do_user_stuff,do_customer_stuff;Admin=do_user_stuff,do_customer_stuff,do_all\",
    \"path-to-init-auth\": \"/login/oauth2/code/github\"
  },
  \"client\": {
    \"scope\": \"repo repo:status read:user\",
    \"clientId\": \"598eaa9cbbffce7de55a\",
    \"clientSecret\": \"ab1a84e0d9db0c2026fe4a4e4ca19312bf8e4281\",
    \"accessTokenUri\": \"https://github.com/login/oauth/access_token\",
    \"userAuthorizationUri\": \"https://github.com/login/oauth/authorize\",
    \"clientAuthenticationScheme\": \"form\"
  },
  \"resource\": {
    \"userInfoUri\": \"https://api.github.com/user\"
  }
}'),
       (NULL, now(), NULL, NULL, NULL, 'auth.for.acme', NULL, '{
         \"saml\": {
           \"idp\": {
             \"entity-id\": \"http://idp.keycloak.com:18080/auth/realms/simeio\",
             \"metadata-url\": \"http://idp.keycloak.com:18080/auth/realms/simeio/protocol/saml/descriptor\"
           }
         },
         \"extra\": {
           \"authtype\": \"SAML2\",
           \"attrs-mapping\": \"username=username,email=email,lastname=surname,firstname=givenName,Role=Role\",
           \"claims-to-add\": \"email,lastname\",
           \"roles-mapping\": \"manage-account-links=do_customer_stuff,do_user_stuff;view-profile=do_user_stuff;uma_authorization=do_user_stuff;a_user=do_user_stuff;offline_access=do_user_stuff,do_customer_stuff;manage-account=do_all\",
           \"path-to-init-auth\": \"/saml/login\"
         }
       }'),
       (NULL, now(), NULL, NULL, NULL, 'auth.for.google', NULL, '{
         \"extra\": {
           \"authtype\": \"OAuth2\",
           \"attrs-mapping\": \"username=sub,email=email,name=name,firstname=given_name,lastname=family_name\",
           \"claims-to-add\": \"email,firstname,lastname\",
           \"roles-mapping\": \"ROLE_USER=do_user_stuff;ROLE_ADMIN=do_user_stuff,do_customer_stuff,do_all\",
           \"path-to-init-auth\": \"/login/oauth2/code/google\"
         },
         \"client\": {
           \"scope\": \"profile email\",
           \"clientId\": \"368238083842-3d4gc7p54rs6bponn0qhn4nmf6apf24a.apps.googleusercontent.com\",
           \"clientSecret\": \"2RM2QkEaf3A8-iCNqSfdG8wP\",
           \"accessTokenUri\": \"https://www.googleapis.com/oauth2/v4/token\",
           \"userAuthorizationUri\": \"https://accounts.google.com/o/oauth2/v2/auth\",
           \"clientAuthenticationScheme\": \"form\"
         },
         \"resource\": {
           \"userInfoUri\": \"https://www.googleapis.com/oauth2/v3/userinfo\"
         }
       }'),
       (NULL, now(), NULL, NULL, NULL, 'auth.for.simeio', NULL, '{
         \"extra\": {
           \"authtype\": \"Form\",
           \"attrs-mapping\": \"username=username,email=email,name=name,Role=Role\",
           \"claims-to-add\": \"email,name\",
           \"roles-mapping\": \"USER=USER;ADMIN=ADMIN;CUSTOMER=CUSTOMER\"
         }
       }');

-- --------------------------
-- custom_jpa_sql
-- --------------------------
INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'User', 'user.findByEmail', 'user.findByEmail = :email', 'Find user by Email', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'User', 'user.findByUserName', 'user.findByUserName = :username', 'Find user by Username', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('SQL', 'User', 'user.sql.findByUserName', 'SELECT * FROM io_user WHERE username = :username', 'Find user by Username', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('SQL', 'User', 'user.sql.findByUserNameAndStatus','SELECT * FROM io_user WHERE username AND status = :username :status', 'Find user by Username and Status', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'User', 'user.findByUserNameAndStatus', 'user.findByUserNameAndStatus = :username :status', 'Find user by Username and Status', NULL, NULL, now(), NULL, NULL);

-- ---------
INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'User', 'user.findByFirstName', 'SELECT * FROM io_user WHERE first_name = :firstName', 'Find user by First Name', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'User', 'user.findByLastName', 'SELECT * FROM io_user WHERE last_name = :lastName', 'Find user by Last Name', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'User', 'user.findByMobileNo', 'SELECT * FROM io_user WHERE mobile_no = :mobileNo', 'Find user by Mobile Number', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('SQL', 'User', 'user.sql.findAllOrderByCreatedOnWithOffsetAndLimit', 'SELECT * FROM io_user ORDER BY created_on DESC LIMIT = :offset :limit', 'Load user by Offset and Limit (Pagination)', NULL, NULL, now(), NULL, NULL);

-- ---------

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'MFAShadowUser', 'mfaShadowUser.findByUserName', 'mfaShadowUser.findByUserName = :userName', 'Find MFAShadowUser by Username', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'EmailTemplate', 'emailTemplate.findByTemplateName', 'emailTemplate.findByTemplateName = :template_name', 'Find EmailTemplate by Template Name', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'EmailTemplate', 'emailTemplate.findByTemplateNameAndEmailTemplateId',
			'emailTemplate.findByTemplateNameAndEmailTemplateId = :template_name :email_template_id',
			'Find EmailTemplate by Template Name And Template Id', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'EmailTemplate', 'emailTemplate.findByTemplateNameOrEmailTemplateId',
			'emailTemplate.findByTemplateNameOrEmailTemplateId = :template_name :email_template_id',
			'Find EmailTemplate by Template Name And Template Id', NULL, NULL, '2020-12-15 11:23:24.000000', NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'MFAAuthReq', 'mfaAuthReq.findByMfaAuthReqNo', 'mfaAuthReq.findByMfaAuthReqNo = :mfa_auth_req_no',
			'Find MFAAuthReq by Req Number', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'MFAAuthReq', 'mfaAuthReq.findAllByMfaShadowUser_MfaShadowUserId',
			'mfaAuthReq.findAllByMfaShadowUser_MfaShadowUserId = :mfa_shadow_user_id', 'Find MFAAuthReq by MFAShadowUserId', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'MFAEnrollment', 'mfaEnrollment.findByMfaEnrollmentId',
			'mfaEnrollment.findByMfaEnrollmentId = :mfa_enrollment_id', 'Find MFAEnrollment by MfaEnrollmentId', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'MFAEnrollment', 'mfaEnrollment.findByVerificationCode',
		'mfaEnrollment.findByVerificationCode = :verification_code', 'Find MFAEnrollment by Verification Code', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'MFAEnrollment', 'mfaEnrollment.findAllByMfaShadowUser_MfaShadowUserId',
			'mfaAuthReq.findAllByMfaShadowUserMfaShadowUserId = :mfa_shadow_user_id', 'Find MFAEnrollment by MFAShadowUserId', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'MFAEnrollment', 'mfaEnrollment.deleteByMfaEnrollmentId',
			'mfaEnrollment.deleteByMfaEnrollmentId = :mfa_enrollment_id', 'Find MFAEnrollment by MFAShadowUserId', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'MFAEnrollment', 'mfaEnrollment.deleteByMfaShadowUser_MfaShadowUserIdAndMfaType',
			'mfaEnrollment.deleteByMfaShadowUser_MfaShadowUserIdAndMfaType = :mfa_shadow_user_id :mfa_type', 'Find MFAEnrollment by MFAShadowUserId', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'MFAEnrollment', 'mfaEnrollment.findAllByMfaShadowUser_MfaShadowUserIdAndMfaType',
			'mfaEnrollment.findAllByMfaShadowUser_MfaShadowUserIdAndMfaType = :mfa_shadow_user_id :mfa_type', 'Find MFAEnrollment by MFAShadowUserId', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'MFAEnrollment', 'mfaEnrollment.deleteByMfaShadowUser_MfaShadowUserIdAndDevice_DeviceId',
			'mfaEnrollment.deleteByMfaShadowUser_MfaShadowUserIdAndDevice_DeviceId = :mfa_shadow_user_id :device_id', 'Find MFAEnrollment by MFAShadowUserId', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'Device', 'device.findAllByMfaShadowUser_MfaShadowUserId',
			'device.findAllByMfaShadowUser_MfaShadowUserId = :mfa_shadow_user_id ', 'Find MFAEnrollment by MFAShadowUserId', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'Device', 'device.findAllByGlobalId', 'device.findAllByGlobalId = :global_id', 'Find MFAEnrollment by MFAShadowUserId', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'Device', 'device.deleteAllByMfaShadowUser_MfaShadowUserId',
			'device.deleteAllByMfaShadowUser_MfaShadowUserId = :mfa_shadow_user_id ', 'Delete Device by MFAShadowUserId', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'MFAAuthReq', 'mfaAuthReq.findAllByMfaShadowUser_UserNameAndMfaAuthReqStatus',
			'mfaAuthReq.findAllByMfaShadowUser_UserNameAndMfaAuthReqStatus = :mfa_shadow_user_name :status :created_on',
			'Find expired MFAAuthReq', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'UserRole', 'userRole.findAllByUser_UserId', 'userRole.findAllByUser_UserId = :user_id', 'Find User Role by User ID', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'UserOrg', 'userOrg.findAllByUser_UserId', 'userOrg.findAllByUser_UserId = :user_id', 'Find User Org by User ID', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'UserOrg', 'userOrg.findAllByOrg_OrgId', 'userOrg.findAllByOrg_OrgId = :org_id', 'Find User Org by Org ID', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'RolePermission', 'rolePermission.findAllByRole_RoleIdIn',
			'rolePermission.findAllByRole_RoleIdIn= :roleIds', 'Find all RolePermission Mappings for specific role', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'Role', 'role.findAllByOrg_Name', 'role.findAllByOrg_Name = :orgName', 'Find All Roles by Org Name', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'Role', 'role.findByNameAndOrg_Name', 'role.findByNameAndOrg_Name = :name :orgName', 'Find By Role Name & Org Name', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'Org', 'org.findByName', 'org.findByName = :orgName', 'Find org by Name', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'SMSTemplate', 'smsTemplate.findByTemplateName', 'smsTemplate.findByTemplateName = :templateName',
			'Find SMS template using template name', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'FieldValidation', 'fieldValidation.findByFieldKey', 'fieldValidation.findByFieldKey = :fieldKey',
			'Find Field Validation by fieldKey', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'FieldValidation', 'fieldValidation.findByOrgName', 'fieldValidation.findByOrgName = :orgName',
			'Find Field Validation by orgName', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `created_on`)
	VALUES ('JPA', 'Device', 'device.findByUser_UserIdOrderByUpdatedOn',
			'device.findByUser_UserIdOrderByUpdatedOn = :userId', 'Find Device List by userId and orderby updatedOn', now());

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `created_on`)
	VALUES ('JPA', 'Device', 'device.findByUser_UserIdAndGlobalId',
			'device.findByUser_UserIdAndGlobalId = :userId :global_id', 'Find Device List by userId and orderby updatedOn', now());

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `created_on`)
	VALUES ('JPA', 'Device', 'device.findByUser_UserId', 'device.findByUser_UserId = :userId', 'Find Device List by userId', now());

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `created_on`)
	VALUES ('JPA', 'Device', 'device.findByUser_UserIdAndDeviceAdditionalInfo_Uuid',
        'device.findByUser_UserIdAndDeviceAdditionalInfo_Uuid = :userId :uuid', 'Find Device List by userId and uuid', now());

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`,  `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'UserVerify', 'userVerify.findByUserVerifyId', 'userVerify.findByUserVerifyId = :otp_id', 'Find OTP List by otp_id', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'UserVerify', 'userVerify.findByUserVerifyIdAndUser_UserId',
			'userVerify.findByUserVerifyIdAndUser_UserId = :otp_id :userId', 'Find OTP List by otp_id and userId', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'UserVerify', 'userVerify.findByUserVerifyIdAndMfaShadowUser_MfaShadowUserId',
			'userVerify.findByUserVerifyIdAndMfaShadowUser_MfaShadowUserId = :otp_id :mfa_shadow_user_id',
			'Find OTP List by otp_id and mfa_shadow_user_id', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'UserVerify', 'userVerify.findByUserVerifyIdAndCode',
			'userVerify.findByUserVerifyIdAndCode = :otp_id :otp', 'Find OTP List by otp_id and otp', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`,  `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'UserVerify', 'userVerify.findAllByUser_UserIdOrMfaShadowUser_MfaShadowUserId',
			'userVerify.findAllByUser_UserIdOrMfaShadowUser_MfaShadowUserId = :userId mfaUserId',
			'Find UserVerify by user id or mfa shadow id', NULL, NULL, now(), NULL, NULL);

INSERT INTO `custom_jpa_sql` (`type`, `entity`, `key`, `jpa_sql`, `description`, `additional_info`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('JPA', 'UserVerify', 'userVerify.deleteAllByUserVerifyIdIn',
			'userVerify.deleteAllByUserVerifyIdIn = :userVerifyIds', 'Find UserVerify by user id or mfa shadow id', NULL, NULL, now(), NULL, NULL);

-- --------------------------
-- email_template
-- --------------------------
INSERT INTO `email_template` (`created_by`, `created_on`, `updated_by`, `updated_on`, `bcc`, `body`, `cc`,
                              `description`, `fromemail`, `fromname`, `subject`, `template_name`, `toemail`,`locale`)
VALUES (NULL, now(), NULL, NULL, NULL,
        '<p>Hello,</p>\r\n<p>&nbsp;</p>\r\n<p>Here is your one time passcode: <strong>$$OTP$$</strong></p>\r\n<p>&nbsp;</p>\r\n<p>You can now Sign into Public Secure and access your Ontario Government Services with this passcode.</p>\r\n<p>&nbsp;</p>\r\n<p>If you have questions, please contact the Ontario Government service that you are trying to access.</p>\r\n<p>&nbsp;</p>\r\n<p><strong><u>WARNING:</u></strong> Your Ontario Public Secure account is used to access your Ontario Government services. To make changes to your Public Secure account requires your current password. In reading this message and you did not make this request, it is possible your account may have been compromised. To prevent others from accessing your services please ensure to call at the above number to deactivate your Public Secure account.</p>\r\n<p>&nbsp;</p>\r\n<p>Thank you,</p>\r\n<p>Public Secure Team</p>\r\n<p>&nbsp;</p>\r\n<p><strong>This message was sent automatically. This account is not being monitored. Please do not reply directly to this email. </strong></p>\r\n<p>&nbsp;</p>\r\n<p>Bonjour</p>',
        NULL, NULL, 'oceservice77@gmail.com', 'Simeio Solutions', 'OTP for Login', 'MFA_OTP_VERIFICATION', NULL,'en');

INSERT INTO `email_template` (`created_by`, `created_on`, `updated_by`, `updated_on`, `bcc`, `body`, `cc`,
                              `description`, `fromemail`, `fromname`, `subject`, `template_name`, `toemail`,`locale`)
VALUES (NULL, now(), NULL, NULL, NULL,
        '<p>Hello,</p>\r\n<p>&nbsp;</p>\r\n<p>Here is your one time passcode: <strong>$$OTP$$</strong></p>\r\n<p>&nbsp;</p>\r\n<p>You can now Sign into Public Secure and access your Ontario Government Services with this passcode.</p>\r\n<p>&nbsp;</p>\r\n<p>If you have questions, please contact the Ontario Government service that you are trying to access.</p>\r\n<p>&nbsp;</p>\r\n<p><strong><u>WARNING:</u></strong> Your Ontario Public Secure account is used to access your Ontario Government services. To make changes to your Public Secure account requires your current password. In reading this message and you did not make this request, it is possible your account may have been compromised. To prevent others from accessing your services please ensure to call at the above number to deactivate your Public Secure account.</p>\r\n<p>&nbsp;</p>\r\n<p>Thank you,</p>\r\n<p>Public Secure Team</p>\r\n<p>&nbsp;</p>\r\n<p><strong>This message was sent automatically. This account is not being monitored. Please do not reply directly to this email. </strong></p>\r\n<p>&nbsp;</p>\r\n<p>Bonjour</p>',
        NULL, NULL, 'oceservice77@gmail.com', 'Simeio Solutions', 'OTP for Login', 'DVC_PRINTING_OTP_VERIFICATION',
        NULL,'en');

INSERT INTO `email_template` (`created_by`, `created_on`, `updated_by`, `updated_on`, `bcc`, `body`, `cc`,
                              `description`, `fromemail`, `fromname`, `subject`, `template_name`, `toemail`,`locale`)
VALUES (NULL, now(), NULL, NULL, NULL,
        '<p>Hello,</p>\r\n<p>&nbsp;</p>\r\n<p>Here is your one time passcode: <strong>$$OTP$$</strong></p>\r\n<p>&nbsp;</p>\r\n<p>You can now Sign into Public Secure and access your Ontario Government Services with this passcode.</p>\r\n<p>&nbsp;</p>\r\n<p>If you have questions, please contact the Ontario Government service that you are trying to access.</p>\r\n<p>&nbsp;</p>\r\n<p><strong><u>WARNING:</u></strong> Your Ontario Public Secure account is used to access your Ontario Government services. To make changes to your Public Secure account requires your current password. In reading this message and you did not make this request, it is possible your account may have been compromised. To prevent others from accessing your services please ensure to call at the above number to deactivate your Public Secure account.</p>\r\n<p>&nbsp;</p>\r\n<p>Thank you,</p>\r\n<p>Public Secure Team</p>\r\n<p>&nbsp;</p>\r\n<p><strong>This message was sent automatically. This account is not being monitored. Please do not reply directly to this email. </strong></p>\r\n<p>&nbsp;</p>\r\n<p>Bonjour</p>',
        NULL, NULL, 'oceservice77@gmail.com', 'Simeio Solutions', 'OTP for Login', 'SNB_OTP_VERIFICATION',
        NULL,'en');

INSERT INTO `email_template` (`template_name`, `description`, `toemail`, `cc`, `bcc`, `subject`, `body`, `fromemail`,
                              `fromname`, `created_by`, `created_on`, `updated_by`, `updated_on`,`locale`)
VALUES ('REGISTRATION_VERIFICATION_OTP', 'Registration Email with OTP', NULL, NULL, NULL,
        'Simeio Registration Verification',
        '<!DOCTYPE html>\r\n\r\n<HTML>\r\n<BODY>\r\n<img src="https://www.simeiosolutions.com/html/website/images/hero_simeio_iic.jpg" height="120" width="250">\r\n<BR><BR>\r\nDear $$FirstName$$<BR><BR>\r\n\r\nThank you for Registering your Simeio Enterprise Account. \r\n\r\n\r\nRegistration Verification Code: <B>$$OTP$$</B><BR><BR>\r\n\r\n\r\nFor assistance, please contact Support Desk at <a href="https://support.simeiosolutions.com/portal">Simeio Support</a> or by telephone at <B>+1-770-282-4442</B><BR><BR>\r\n\r\nThank you<BR>\r\n$$SENDER$$\r\n<BR><BR>\r\n\r\n<img src="https://www.simeiosolutions.com/html/website/images/logo_simeio.png" height="52" width="160">\r\n\r\n</BODY>\r\n</HTML>',
        'oceservice77@gmail.com', 'Simeio Solutions', 'System', now(), NULL, NULL,'en');

INSERT INTO `email_template` (`template_name`, `description`, `toemail`, `cc`, `bcc`, `subject`, `body`, `fromemail`,
                              `fromname`, `created_by`, `created_on`, `updated_by`, `updated_on`,`locale`)
VALUES ('REGISTRATION_VERIFICATION_URL', 'Registration Email with URL', NULL, NULL, NULL,
        'Simeio Registration Verification',
        '<!DOCTYPE html>\n<html>\n<body>\nHello $$FirstName$$, <br>\n<br>\nThank you for creating your account. <br>\n<br>\nYour account will allow you to use single sign-on credentials for multiple services and programs (i.e. only need to remember and use a single set of credentials). It also puts in in control the flow of your personal information to applications and services of your choice (i.e. you are in control of sharing or revoking sharing of your personal information). <br>\n<br>\nYour identity is being protected while you securely access your personal information and digital services. <br>\n<br>\nTo confirm your email address, please click the following link <a href="$$DomainName$$?otp=$$URL_LINK$$">$$DomainName$$?otp=$$URL_LINK$$</a><br>\n<br>\nFor support, please visit <a href="https://support.simeiosolutions.com">https://support.simeiosolutions.com or call at <B>+1-***-***-****</B><br>\n<br>\nThank you, <br>\n$$SENDER$$\n</body>\n</html>',
        'oceservice77@gmail.com', 'Simeio Solutions', 'System', now(), NULL, NULL,'en');

INSERT INTO `email_template` (`template_name`, `description`, `toemail`, `cc`, `bcc`, `subject`, `body`, `fromemail`,
                              `fromname`, `created_by`, `created_on`, `updated_by`, `updated_on`,`locale`)
VALUES ('REGISTRATION_VERIFICATION_PLAIN', 'Registration Email Plain', NULL, NULL, NULL,
        'Simeio Registration Verification',
        '<!DOCTYPE html>\r\n\r\n<HTML>\r\n<BODY>\r\n<img src="https://www.simeiosolutions.com/html/website/images/hero_simeio_iic.jpg" height="120" width="250">\r\n<BR><BR>\r\nDear $$FirstName$$<BR><BR>\r\n\r\nThank you for Registering your Simeio Enterprise Account. For assistance, please contact Support Desk at <a href="https://support.simeiosolutions.com/portal">Simeio Support</a> or by telephone at <B>+1-770-282-4442</B><BR><BR>\r\n\r\nThank you<BR>\r\n$$SENDER$$\r\n<BR><BR>\r\n\r\n<img src="https://www.simeiosolutions.com/html/website/images/logo_simeio.png" height="52" width="160">\r\n\r\n</BODY>\r\n</HTML>',
        'oceservice77@gmail.com', 'Simeio Solutions', 'System', now(), NULL, NULL,'en');

INSERT INTO `email_template` (`template_name`, `description`, `toemail`, `cc`, `bcc`, `subject`, `body`, `fromemail`,
                              `fromname`, `created_by`, `created_on`, `updated_by`, `updated_on`,`locale`)
VALUES ('USER_PROFILE_UPDATE', 'User Profile Update', NULL, NULL, NULL, 'Profile Update',
        '<!DOCTYPE html>\r\n<html>\r\n<body>\r\nHello $$FirstName$$,<br>\r\n<br>\r\nThis is to confirm that your account has been updated.<br>\r\n\r\n\r\n<br>\r\nFor support, please visit <a href="https://support.simeiosolutions.com">https://support.simeiosolutions.com or call at <B>+1-***-***-****</B><br>\r\n<br>\r\nThank you, <br>\r\n$$SENDER$$\r\n</body>\r\n</html>',
        'oceservice77@gmail.com', 'Simeio Solutions', 'System', now(), NULL, NULL,'en');

INSERT INTO `email_template` (`template_name`, `description`, `toemail`, `cc`, `bcc`, `subject`, `body`, `fromemail`,
                              `fromname`, `created_by`, `created_on`, `updated_by`, `updated_on`,`locale`)
VALUES ('ACCOUNT_UNLOCK_VERIFIED', 'User Account Unlock', NULL, NULL, NULL, 'Account Verified',
        '<!DOCTYPE html>\r\n<html>\r\n<body>\r\nHello $$FirstName$$,<br>\r\n<br>\r\nThis is to confirm that your account was successfully verified.<br>\r\n\r\n\r\n<br>\r\nFor support, please visit <a href=\"https://support.simeiosolutions.com\">https://support.simeiosolutions.com or call at <B>+1-***-***-****</B><br>\r\n<br>\r\nThank you, <br>\r\n$$SENDER$$\r\n</body>\r\n</html>',
        'oceservice77@gmail.com', 'Simeio Solutions', 'System', now(), NULL, NULL,'en');

INSERT INTO `email_template` (`created_by`, `created_on`, `updated_by`, `updated_on`, `bcc`, `body`,
                              `cc`, `description`, `fromemail`, `fromname`, `subject`, `template_name`,
                              `toemail`,`locale`)
VALUES ('System', now(), NULL, NULL, NULL,
        '<!DOCTYPE html>\r\n<html>\r\n<body>\r\nHello $$FirstName$$,<br>\r\n<br>\r\n$$OTP$$ is the code. You can use this code to reset your account password.<br>\r\n\r\n\r\n<br>\r\nFor support, please visit <a href="https://support.simeiosolutions.com">https://support.simeiosolutions.com or call at <B>+1-***-***-****</B><br>\r\n<br>\r\nThank you, <br>\r\n$$SENDER$$\r\n</body>\r\n</html>',
        NULL, 'Reset your Password', 'oceservice77@gmail.com',  'Simeio Solutions', 'Reset your Password', 'RESET_PASSWORD_OTP', NULL,'en');

INSERT INTO `email_template` (`created_by`, `created_on`, `updated_by`, `updated_on`, `bcc`, `body`, `cc`,
                              `description`, `fromemail`, `fromname`, `subject`, `template_name`, `toemail`,`locale`)
VALUES (NULL, now(), NULL, NULL, NULL,
        '<p>Hello,</p>\r\n<p>&nbsp;</p>\r\n<p>Here is your one time passcode: <strong>$$OTP$$</strong></p>\r\n<p>&nbsp;</p>\r\n<p>You can now Sign into Public Secure and access your Ontario Government Services with this passcode.</p>\r\n<p>&nbsp;</p>\r\n<p>If you have questions, please contact the Ontario Government service that you are trying to access.</p>\r\n<p>&nbsp;</p>\r\n<p><strong><u>WARNING:</u></strong> Your Ontario Public Secure account is used to access your Ontario Government services. To make changes to your Public Secure account requires your current password. In reading this message and you did not make this request, it is possible your account may have been compromised. To prevent others from accessing your services please ensure to call at the above number to deactivate your Public Secure account.</p>\r\n<p>&nbsp;</p>\r\n<p>Thank you,</p>\r\n<p>Public Secure Team</p>\r\n<p>&nbsp;</p>\r\n<p><strong>This message was sent automatically. This account is not being monitored. Please do not reply directly to this email. </strong></p>\r\n<p>&nbsp;</p>\r\n<p>Bonjour</p>',
        NULL, NULL, 'oceservice77@gmail.com', 'Simeio Solutions', 'OTP for Login', 'SNB_NEW_EMAIL_OTP_VERIFICATION',
        NULL,'en');

INSERT INTO `email_template` (`created_by`, `created_on`, `updated_by`, `updated_on`, `bcc`, `body`, `cc`,
                              `description`, `fromemail`, `fromname`, `subject`, `template_name`, `toemail`,`locale`)
VALUES (NULL, now(), NULL, NULL, NULL,
        '<p>Hello,</p>\r\n<p>&nbsp;</p>\r\n<p>Here is your one time passcode: <strong>$$OTP$$</strong></p>\r\n<p>&nbsp;</p>\r\n<p>You can now Sign into Public Secure and access your Ontario Government Services with this passcode.</p>\r\n<p>&nbsp;</p>\r\n<p>If you have questions, please contact the Ontario Government service that you are trying to access.</p>\r\n<p>&nbsp;</p>\r\n<p><strong><u>WARNING:</u></strong> Your Ontario Public Secure account is used to access your Ontario Government services. To make changes to your Public Secure account requires your current password. In reading this message and you did not make this request, it is possible your account may have been compromised. To prevent others from accessing your services please ensure to call at the above number to deactivate your Public Secure account.</p>\r\n<p>&nbsp;</p>\r\n<p>Thank you,</p>\r\n<p>Public Secure Team</p>\r\n<p>&nbsp;</p>\r\n<p><strong>This message was sent automatically. This account is not being monitored. Please do not reply directly to this email. </strong></p>\r\n<p>&nbsp;</p>\r\n<p>Bonjour</p>',
        NULL, NULL, 'oceservice77@gmail.com', 'Simeio Solutions', 'OTP for Login', 'SNB_NEW_RCVY_EMAIL_OTP_VERIFICATION',
        NULL,'en');

-- --------------------------
-- sms_template
-- --------------------------
INSERT INTO `sms_template` (`template_name`, `locale`, `created_by`, `created_on`, `updated_by`, `updated_on`,
                            `description`, `sender`, `placeholders`, `message`)
VALUES ('MFA_OTP_VERIFICATION', 'en', 'System', now(), NULL, '2021-05-17 11:35:19.000000', NULL,
        'Simeio', NULL, '$$OTP$$ is your Simeio OTP. Do not share it with anyone.');

INSERT INTO `sms_template` (`template_name`, `locale`, `created_by`, `created_on`, `updated_by`, `updated_on`,
                            `description`, `sender`, `placeholders`, `message`)
VALUES ('SNB_OTP_VERIFICATION', 'en', 'System', now(), NULL, now(), NULL,
        'Simeio', NULL, '$$OTP$$ is your Simeio OTP. Do not share it with anyone.');

INSERT INTO `sms_template` (`template_name`, `locale`, `created_by`, `created_on`, `updated_by`, `updated_on`,
                            `description`, `sender`, `placeholders`, `message`)
VALUES ('RESET_PASSWORD_OTP', 'en', 'System', now(), NULL, now(), NULL,
        'Simeio', '[\'$$UserName$$\',   \'$$OTP$$\']',
        'Dear $$UserName$$, $OTP$$ is the code. You can use this code to reset your account password.');

INSERT INTO `sms_template` (`template_name`, `locale`, `created_by`, `created_on`, `updated_by`, `updated_on`,
                            `description`, `sender`, `placeholders`, `message`)
VALUES ('SNB_NEW_PHNO_OTP_VERIFICATION', 'en', 'System', now(), NULL, now(), NULL,
        'Simeio', NULL, '$$OTP$$ is your Simeio OTP. Do not share it with anyone.');

INSERT INTO `sms_template` (`template_name`, `locale`, `created_by`, `created_on`, `updated_by`, `updated_on`,
                            `description`, `sender`, `placeholders`, `message`)
VALUES ('SNB_NEW_RCVY_PHNO_OTP_VERIFICATION', 'en', 'System', now(), NULL, now(), NULL,
        'Simeio', NULL, '$$OTP$$ is your Simeio OTP. Do not share it with anyone.');

INSERT INTO `sms_template` (`template_name`, `locale`, `created_by`, `created_on`, `updated_by`, `updated_on`,
                            `description`, `sender`, `placeholders`, `message`)
VALUES ('DVC_PRINTING_OTP_VERIFICATION', 'en', 'System', now(), NULL, now(), NULL,
        'Simeio', NULL, '$$OTP$$ is your Simeio OTP. Do not share it with anyone.');

-- --------------------------
-- permission
-- --------------------------
INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'org.create');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'org.update');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'org.iprestrict');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'org.readrole');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'org.editrole');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'org.read');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'org.updateqna');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'org.notification');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'org.all');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'self.read');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'self.update');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.read');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.update');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.create');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.updatebasic');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.updateqna');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.updaterole');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.updatepwd');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.activeuser');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.inactiveuser');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.lockuser');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.unlockuser');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.delete');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.clearqna');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.profile');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'usergroup.read');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'usergroup.update');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'usergroup.delete');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.searchInactive');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.requestread');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.readaccount');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.deleteaccount');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'user.termdate');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'invite.new');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'invite.cancel');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'invite.resend');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'invite.read');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'report.auditreport');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'request.approve');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'request.myrequest');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'certification.access');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'certadmin.read');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'certadmin.update');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'certification.reassign');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'task.read');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'task.update');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'task.reassign');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'request.reassign');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'request.advance');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'request.manageCatalog');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'template.orgShare');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'template.deptShare');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'template.create');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'template.userShare');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'template.read');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'services.read');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'services.create');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'services.update');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'services.email');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'services.opendj');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'services.servicenow');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'analytics.read');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'form.read');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'form.update');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'targetApplication.view');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'task.readAssignee');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'definition.read');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'definition.create');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'definition.update');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'definition.run');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'etemplate.read');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'etemplate.create');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'etemplate.delete');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'etemplate.update');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'role.admin');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'mfa.unlockuser');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'self.mfa.readbackupcodes');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'self.mfa.geteenrollment');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'self.mfa.deleteenrollment');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'self.mfa.disable');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'self.mfa.profile');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'self.mfa.getdevice');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'self.mfa.removedevice');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'org.createrole');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, 'Allow user access for Management Console', b'1', 'main.dashboard');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, '', b'1', 'self.delete');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, 'SMS Template Read', b'1', 'smstemplate.read');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, 'SMS Template Create', b'1', 'smstemplate.create');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, 'SMS Template Update', b'1', 'smstemplate.update');

INSERT INTO `permission` (`created_by`, `created_on`, `updated_by`, `updated_on`, `description`, `is_displayed`, `name`)
VALUES ('System', now(), NULL, NULL, 'SMS Template Delete', b'1', 'smstemplate.delete');


-- --------------------------
-- privileges
-- --------------------------
INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.email.send', '["emailTemplate.findByTemplateNameAndLocale"]', 'Access to Send Email', 'System', now(),
        'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.emailtemplate.read', '["emailTemplate.findByTemplateNameAndLocale","EmailTemplate.findAll"]', 'Access to Read Email Template',
        'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.emailtemplate.create', '["EmailTemplate.save","emailTemplate.findByTemplateNameAndLocale"]', 'Create Email Template',
        'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.self.create',
        '["role.findByNameAndOrg_Name","user.findByEmail","user.findByUserName","User.save","UserOrg.save","UserRole.save","org.findByName"]',
        'Create Self Account', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.qr_create',
        '["mfaShadowUser.findByUserName", "user.findByUserName","MFAShadowUser.save", "mfaEnrollment.findAllByMfaShadowUser_MfaShadowUserId", "UserVerify.save", "MFAEnrollment.save"]',
        'Create QR Code for MFA', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.validate_otp',
        '["mfaAuthReq.findByMfaAuthReqNo","mfaEnrollment.findByMfaEnrollmentId","MFAAuthReq.save","MFAShadowUser.save","mfaEnrollment.findAllByMfaShadowUser_MfaShadowUserId","MFAEnrollment.save"]',
        'Validate OTP for MFA', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.device',
        '["mfaEnrollment.findByVerificationCode","mfaEnrollment.findByMfaEnrollmentId","device.findAllByMfaShadowUser_MfaShadowUserId","Device.saveAll","MFAEnrollment.save","MFAShadowUser.save"]',
        'Add or Update MFA Device', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.create_req',
        '["mfaShadowUser.findByUserName","MFAShadowUser.save","MFAAuthReq.save","mfaEnrollment.findAllByMfaShadowUser_MfaShadowUserId","device.findAllByMfaShadowUser_MfaShadowUserId"]',
        'Create MFA Auth Request', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.get_req', '["mfaAuthReq.findByMfaAuthReqNo","MFAAuthReq.save"]', 'Get MFA Auth Request', 'System',
        now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.update_req', '["mfaAuthReq.findByMfaAuthReqNo","MFAAuthReq.save","device.findAllByGlobalId"]',
        'Update MFA Auth Request', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.otp',
        '["mfaAuthReq.findByMfaAuthReqNo","mfaEnrollment.findByMfaEnrollmentId","MFAAuthReq.save","mfaEnrollment.findAllByMfaShadowUser_MfaShadowUserIdAndMfaType","MFAEnrollment.save"]',
        'Create & Resend MFA OTP', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.history',
        '["mfaShadowUser.findByUserName","mfaAuthReq.findAllByMfaShadowUser_MfaShadowUserId","device.findAllByMfaShadowUser_MfaShadowUserId"]',
        'Fetch MFA History', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.user.verify_url', '["User.findById"]', 'Verify User Accont with URL', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.user.verify_code', '["user.findByUserName"]', 'Verify User Accont with Code', 'System', now(), 'System',
        now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.user.update', '["user.findByEmail","user.findByUserName","User.save"]', 'Update User', 'System', now(),
        'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.dp.create_device',
        '["user.findByUserName","User.save","device.findByUser_UserId","device.findByUser_UserIdAndGlobalId","Device.save"]',
        'Create Device : DP', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.dp.get_device',
        '["user.findByUserName","device.findByUser_UserIdAndIsPrimaryAndAndDeviceTypeOrderByUpdatedOnDesc"]',
        'Create Device : DP', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.dp.remove_device', '["Device.findById","Device.delete"]', 'Create Device : DP', 'System', now(), 'System',
        now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.dp.verify_otp',
        '["user.findByUserName","device.findByUser_UserIdOrderByUpdatedOnDesc","Device.save","Device.delete"]',
        'Create Device : DP', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.tbs.login', '["mfaShadowUser.findByUserName","MFAShadowUser.save"]', 'TBS : Login / Send OTP', 'System',
        now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.tbs.resend', '[]', 'TBS : Resend OTP', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.tbs.validate', '[]', 'TBS : Validate OTP', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.dp.send_otp', '["user.findByUserName","device.findByUser_UserId","Device.save"]',
        'Send OTP to Device : DP', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.dp.resend_otp', '["user.findByUserName","device.findByUser_UserId"]', 'Resend OTP to Device : DP',
        'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.userverify.create', '["UserVerify.save"]', 'Create User Verify', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.userverify.delete', '["userVerify.findByUserVerifyId","UserVerify.delete"]', 'Delete  User Verify',
        'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.userverify.verify', '["userVerify.findByUserVerifyId","UserVerify.save"]',
        'Verify Code Using  User Verify', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.userverify.resend', '["userVerify.findByUserVerifyId","UserVerify.save"]', 'Resend Code', 'System', now(),
        'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.userverify.read', '["userVerify.findByUserVerifyId"]', 'Get / Read  User Verify', 'System', now(),
        'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.user.search',
        '["user.findByUserName","user.findByEmail","user.findByFirstName","user.findByLastName","user.findByMobileNo"]',
        'Search User', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.snb.send_otp', '["user.findByUserName","User.save"]', 'Send OTP to User : SNB', 'System', now(), 'System',
        now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.snb.resend_otp', '["user.findByUserName"]', 'Resend OTP to User : SNB', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.snb.verify_otp', '["user.findByUserName","User.save"]', 'Verify OTP to User : SNB', 'System', now(),
        'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.user.readall', '["User.findAll"]', 'Retrieve All Users', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.user.lookup', '["user.findByUserName","user.findByEmail"]', 'Retrieve All Users', 'System', now(),
        'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.sts.authenticate',
        '["user.findByUserName","User.save","UserOrg.save","org.findByName","userOrg.findAllByUser_UserId","userRole.findAllByUser_UserId","rolePermission.findAllByRole_RoleIdIn","role.findByNameAndOrg_Name","UserRole.save"]',
        'Retrieve All Users', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.validation.load', '["FieldValidation.saveAll"]', 'Load Data in Validation Engine', 'System', now(),
        'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.readbackupcodes', '["mfaShadowUser.findByUserName"]', 'Read Backup Codes', 'System', now(), 'System',
        now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.profile', '["mfaShadowUser.findByUserName"]', 'Get MFA Shadow User Profile', 'System', now(), 'System',
        now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.disable',
        '["mfaShadowUser.findByUserName","device.deleteAllByMfaShadowUser_MfaShadowUserId","MFAShadowUser.save"]',
        'Disable MFA', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.deleteenrollment',
        '["mfaShadowUser.findByUserName","mfaEnrollment.findByMfaEnrollmentId","MFAEnrollment.delete"]',
        'Delete MFA Enrollment', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.unlockuser', '["mfaShadowUser.findByUserName","MFAShadowUser.save"]', 'MFA Unlock User', 'System',
        now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.getdevice', '["mfaShadowUser.findByUserName","device.findAllByMfaShadowUser_MfaShadowUserId"]',
        'Get MFA Devices', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.removedevice',
        '["mfaShadowUser.findByUserName","Device.findById","mfaEnrollment.deleteByMfaShadowUser_MfaShadowUserIdAndDevice_DeviceId"]',
        'Remove MFA Devices', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.removeaccount',
        '["mfaShadowUser.findByUserName","Device.findById","mfaEnrollment.deleteByMfaShadowUser_MfaShadowUserIdAndDevice_DeviceId", "device.findAllByMfaShadowUser_MfaShadowUserId","Device.delete","mfaEnrollment.deleteByMfaShadowUser_MfaShadowUserIdAndDevice_DeviceId"]',
        'Remove MFA Devices', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.push.broadcast', '[]', 'Send Push Notification', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.smstemplate.read', '["smsTemplate.findByTemplateNameAndLocale","SMSTemplate.findAll"]', 'Read SMS Template', 'System', now(),
        'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.smstemplate.create', '["SMSTemplate.save","smsTemplate.findByTemplateNameAndLocale"]', 'Create SMS Template', 'System', now(),
        'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.smstemplate.update', '["SMSTemplate.save","smsTemplate.findByTemplateNameAndLocale"]', 'Update SMS Template', 'System', now(),
        'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.sms.send', '[]', 'Send SMS', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.expire_req', '["mfaAuthReq.findAllByMfaShadowUser_UserNameAndMfaAuthReqStatus"]',
        'Expire MFA Auth Requests', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.org.all', '["Org.findAll"]', 'Get All Org', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.org.read', '["org.findByName"]', 'Get Org Details', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.org.create', '["org.findByName","Org.save"]', 'Create Org', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.org.update', '["org.findByName","Org.save"]', 'Modify Org', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.org.readrole',
        '["role.findAllByOrg_Name","rolePermission.findAllByRole_RoleIdIn","role.findByNameAndOrg_Name"]', 'Read Role',
        'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.org.editrole',
        '["org.findByName","role.findByNameAndOrg_Name","Role.save","rolePermission.findAllByRole_RoleIdIn","RolePermission.deleteAllById","RolePermission.saveAll"]',
        'Update Role', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.org.createrole', '["org.findByName","role.findByNameAndOrg_Name","Role.save","RolePermission.saveAll"]',
        'Create Role', 'System', now(), 'System', now());

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.permission.read', '["Permission.findAll"]', 'Read Permissions', 'System', now(), 'System', now());


INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.user.profile',
        '["user.findByUserName","user.findByEmail","userRole.findAllByUser_UserId","rolePermission.findAllByRole_RoleIdIn"]',
        'Load User Details including Roles and Permission', 'System', now(), null, null);

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.user.delete', '["user.findByUserName",
									"user.findByEmail",
	                                "userRole.findAllByUser_UserId",
									"mfaShadowUser.findByUserName",
									"mfaEnrollment.findAllByMfaShadowUser_MfaShadowUserId",
									"mfaEnrollment.deleteAllByMfaEnrollmentId",
									"mfaAuthReq.findAllByMfaShadowUser_MfaShadowUserId",
									"mfaAuthReq.deleteAllByMfaAuthReqNo",
									"MFAShadowUser.delete",
									"userVerify.findAllByMfaShadowUser_MfaShadowUserId",
                                    "userVerify.findAllByUser_UserId",
									"userVerify.deleteAllByUserVerifyIdIn",
									"device.findByUser_UserId",
									"Device.deleteAllById",
									"userRole.findAllByUser_UserId",
									"UserRole.deleteAllById",
									"userOrg.findAllByUser_UserId",
									"UserOrg.deleteAllById",
									"User.deleteById"]',
        'Delete User Details including Roles and Device', 'System', now(), null, null);


INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('int.mfa.getenrollment',
        '["mfaShadowUser.findByUserName","mfaEnrollment.findAllByMfaShadowUser_MfaShadowUserId"]',
        'Get MFA Enrollments', NULL, now(), NULL, NULL);

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('int.snb.delete_user', '["user.findByUserName","user.findByEmail","userRole.findAllByUser_UserId","mfaShadowUser.findByUserName","mfaEnrollment.findAllByMfaShadowUser_MfaShadowUserId","mfaEnrollment.deleteAllByMfaEnrollmentId","mfaAuthReq.findAllByMfaShadowUser_MfaShadowUserId","mfaAuthReq.deleteAllByMfaAuthReqNo","MFAShadowUser.delete","userVerify.findAllByMfaShadowUser_MfaShadowUserId","userVerify.findAllByUser_UserId","userVerify.deleteAllByUserVerifyIdIn","device.findByUser_UserId","Device.deleteAllById","userRole.findAllByUser_UserId","UserRole.deleteAllById","userOrg.findAllByUser_UserId","UserOrg.deleteAllById","User.deleteById"]',
			'SNB: Delete User', 'System', now(), null, null);

-- Ping service privileges
INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('int.ping.getuser', '[]',
			'Ping: Get User Details', 'System', now(), null, null);

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('int.ping.searchuser', '[]',
			'Ping: Search for User', 'System', now(), null, null);

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('int.ping.updateuser', '[]',
			'Ping: Update User Details', 'System', now(), null, null);

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('int.ping.deleteuser', '[]',
			'Ping: Delete User', 'System', now(), null, null);

INSERT INTO `privilege` (`name`, `db_operations`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
	VALUES ('int.emailtemplate.update', '["EmailTemplate.save","emailTemplate.findByTemplateName","emailTemplate.findByTemplateNameAndLocale","emailTemplate.findByTemplateNameAndEmailTemplateId","emailTemplate.findByTemplateNameOrEmailTemplateId"]',
			'Update Email Template', 'System', now(), null, null);


-- --------------------------
-- endpoint_privilege
-- --------------------------
INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/qr-code', 'POST', 'int.mfa.qr_create', 'Create QR Code for MFA', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/qr-code', 'POST', 'int.emailtemplate.read', 'Read the Email Template', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/qr-code', 'POST', 'int.email.send', 'Send Email API', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/qr-code', 'POST', 'int.userverify.create', 'Create User Verify for QR Code', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/qr-code', 'POST', 'int.mfa.expire_req', 'Expire MFA Auth Requests', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/qr-code', 'POST', 'int.push.broadcast', 'Broadcast Push Notification', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/qr-code', 'POST', 'int.smstemplate.read', 'Read SMS Template', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/qr-code', 'POST', 'int.sms.send', 'Send SMS', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/otp', 'POST', 'int.mfa.validate_otp', 'Validate OTP for MFA', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/otp', 'POST', 'int.userverify.verify', 'UserVerify: Validate OTP for MFA', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/device', 'POST', 'int.mfa.device', 'Add or Update MFA Device', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/auth/user/[^/]*', 'POST', 'int.mfa.create_req', 'Create MFA Auth Req', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/auth/user/[^/]*', 'POST', 'int.mfa.otp', 'Create & Resend MFA OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/auth/user/[^/]*', 'POST', 'int.emailtemplate.read', 'Read the Email Template', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/auth/user/[^/]*', 'POST', 'int.email.send', 'Send Email API', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/auth/user/[^/]*', 'POST', 'int.userverify.create', 'Create User Verify', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/auth/user/[^/]*', 'POST', 'int.mfa.expire_req', 'Expire MFA Auth Req', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/auth/user/[^/]*', 'POST', 'int.push.broadcast', 'Broadcast Push Notification', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/auth/user/[^/]*', 'POST', 'int.smstemplate.read', 'Read SMS Template', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/auth/user/[^/]*', 'POST', 'int.sms.send', 'Send SMS', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/auth/[^/]*', 'GET', 'int.mfa.get_req', 'Get MFA Auth Req', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/auth/[^/]*', 'POST', 'int.mfa.update_req', 'Update MFA Auth Req', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/request/[^/]*/otp', 'POST', 'int.mfa.otp', 'Create & Resend MFA OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/request/[^/]*/otp', 'POST', 'int.userverify.resend', 'Create & Resend MFA OTP', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/request/[^/]*/otp', 'POST', 'int.emailtemplate.read', 'Create & Resend MFA OTP', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/request/[^/]*/otp', 'POST', 'int.email.send', 'Create & Resend MFA OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/history', 'POST', 'int.mfa.history', 'Fetch MFA History', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/user/[^/]*/backup-code', 'GET', 'int.mfa.readbackupcodes', 'Get Backup Codes', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/user/[^/]*', 'GET', 'int.mfa.profile', 'Get MFA Shadow User Details', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/user/[^/]*/disable', 'DELETE', 'int.mfa.disable', 'Disable MFA', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/user/[^/]*/enrollment', 'DELETE', 'int.mfa.deleteenrollment', 'Delete MFA Enrollment', 'System', now(),
        'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/user/[^/]*/unlock', 'PUT', 'int.mfa.unlockuser', 'MFA Unlock User', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/device/[^/]*', 'GET', 'int.mfa.getdevice', 'Get MFA Devices', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/device/[^/]*', 'DELETE', 'int.mfa.removedevice', 'Remove MFA Device', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/device/account', 'DELETE', 'int.mfa.removeaccount', 'Remove Account from MFA Device', 'System', now(),
        'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/register', 'POST', 'int.self.create', 'Register User', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/register', 'POST', 'int.emailtemplate.read', 'Read the Email Template', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/register', 'POST', 'int.email.send', 'Send Email API', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/account/verify/[^/]*', 'GET', 'int.user.verify_url', 'Verify User Account with Link', 'System', now(),
        'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/account/verify/[^/]*', 'GET', 'int.user.update', 'Update User', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/[^/]*/account/verify', 'GET', 'int.user.verify_url', 'Verify User Account with Code', 'System', now(),
        'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/[^/]*/account/verify', 'GET', 'int.user.update', 'Verify User Account with Code', 'System', now(),
        'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/[^/]*/update', 'POST', 'int.email.send', 'Update User Send Email', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/[^/]*/update', 'POST', 'int.emailtemplate.read', 'Update User Read the Email Template', 'System', now(),
        'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES ('/user/[^/]*/update', 'POST', 'int.user.update', 'Update User', 'System', now(), 'System', now());


INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/[^/]*/change-password', 'POST', 'int.emailtemplate.read', 'Change Password Email Template', 'System',
        now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/[^/]*/change-password', 'POST', 'int.email.send', 'Change Password Send Email', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/dp/device', 'POST', 'int.dp.create_device', 'DP : Create Device', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/dp/user/[^/]*/device', 'GET', 'int.dp.get_device', 'DP : Get Device', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/dp/user/[^/]*/device/[^/]*', 'DELETE', 'int.dp.remove_device', 'DP : Remove Devices', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/login', 'POST', 'int.tbs.login', 'TBS : Login / Send OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/login', 'POST', 'int.emailtemplate.read', 'TBS : Login / Send OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/login', 'POST', 'int.email.send', 'TBS : Login / Send OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/login', 'POST', 'int.mfa.create_req', 'TBS : Login / Send OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/login', 'POST', 'int.mfa.qr_create', 'TBS : Login / Send OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/validate', 'POST', 'int.tbs.validate', 'TBS : Validate OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/validate', 'POST', 'int.mfa.validate_otp', 'TBS : MFA Validate OTP', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/request/[^/]*/otp', 'POST', 'int.tbs.resend', 'TBS : Request OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/request/[^/]*/otp', 'POST', 'int.emailtemplate.read', 'TBS : Request OTP', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/request/[^/]*/otp', 'POST', 'int.email.send', 'TBS : Request OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/request/[^/]*/otp', 'POST', 'int.mfa.otp', 'TBS : Request OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/request/[^/]*/otp', 'POST', 'int.tbs.resend', 'TBS : Request OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/user/[^/]*/unlock', 'PUT', 'int.mfa.unlockuser', 'TBS : Unlock User', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/login', 'POST', 'int.mfa.otp', 'TBS : Login / Send OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/login', 'POST', 'int.userverify.create', 'TBS : Login / Send OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/request/[^/]*/otp', 'POST', 'int.userverify.resend', 'TBS : Request OTP from UserVerify', 'System',
        now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/validate', 'POST', 'int.userverify.verify', 'TBS : Validate OTP from UserVerify', 'System', now(),
        'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/tbs/mfa/login', 'POST', 'int.mfa.expire_req', 'TBS : Login / Send OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/dp/send-otp', 'POST', 'int.dp.send_otp', 'DP : Send OTP to Device', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/dp/send-otp', 'POST', 'int.emailtemplate.read', 'DP : Send OTP to Device', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/dp/send-otp', 'POST', 'int.email.send', 'DP : Send OTP to Device', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/dp/verify-otp', 'POST', 'int.dp.verify_otp', 'DP : Verify Device', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/dp/resend-otp', 'POST', 'int.dp.resend_otp', 'DP : Resend OTP to Device', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/dp/resend-otp', 'POST', 'int.emailtemplate.read', 'DP : Resend OTP to Device', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/dp/resend-otp', 'POST', 'int.email.send', 'DP : Resend OTP to Device', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/snb/send-otp', 'POST', 'int.email.send', 'SNB : Send OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/snb/send-otp', 'POST', 'int.emailtemplate.read', 'SNB : Send OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/snb/resend-otp', 'POST', 'int.emailtemplate.read', 'SNB : ReSend OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/snb/resend-otp', 'POST', 'int.email.send', 'SNB : ReSend OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/snb/send-otp', 'POST', 'int.snb.send_otp', 'SNB : Send OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/snb/resend-otp', 'POST', 'int.snb.resend_otp', 'SNB : Resend OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/snb/verify-otp', 'POST', 'int.snb.verify_otp', 'SNB : Verify OTP', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/snb/send-otp', 'POST', 'int.userverify.create', 'SNB : Create User Verify', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/snb/verify-otp', 'POST', 'int.userverify.verify', 'SNB : User Verify Verify OTP', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/snb/resend-otp', 'POST', 'int.userverify.resend', 'SNB : User Verify Resend OTP', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/search', 'POST', 'int.user.search', 'Search User', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/retrieve', 'GET', 'int.user.readall', 'Load All Users', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/email-username/lookup', 'POST', 'int.user.lookup', 'Lookup All Users', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/sts/authenticate', 'POST', 'int.sts.authenticate', 'Authenticate User', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/field-validation/simple-component', 'POST', 'int.validation.load', 'Validation Engine Init Data', 'System',
        now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/snb/resend-otp', 'POST', 'int.userverify.read', 'SNB : User Verify Resend OTP', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/dp/send-otp', 'POST', 'int.userverify.create', 'DP : Send OTP to Device', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/dp/verify-otp', 'POST', 'int.userverify.verify', 'DP : Verify Device', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/dp/resend-otp', 'POST', 'int.userverify.resend', 'DP : Resend OTP to Device', 'System', now(), 'System',
        now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/org/all', 'GET', 'int.org.all', 'Org: Get All Orgs', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/org/[^/]*', 'GET', 'int.org.read', 'Org: Get Org Details', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/org', 'POST', 'int.org.create', 'Org: Create New Org', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/org/[^/]*', 'PATCH', 'int.org.update', 'Org: Modify Org', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/role', 'POST', 'int.org.createrole', 'Role: Create Role', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/role', 'PUT', 'int.org.editrole', 'Role: Update Role', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/role', 'GET', 'int.org.readrole', 'Role: Get All Roles', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/role/[^/]*/org/[^/]*', 'PATCH', 'int.org.editrole', 'Role: Modify Role', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/role', 'POST', 'int.permission.read', 'Role: Create Role', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/role', 'PUT', 'int.permission.read', 'Role: Update Role', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/perm/all', 'GET', 'int.permission.read', 'Get All Permissions', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/[^/]*/profile', 'GET', 'int.user.profile', 'Load User Profile', 'System', now(), null, null);

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/[^/]*', 'DELETE', 'int.user.delete', 'Delete User Details including Roles and Device', 'System', now(),
        null, null);

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/[^/]*/account/status/[^/]*', 'POST', 'int.user.update', 'Admin Lock/Unlock User Account', 'System', now(), null, null);

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/[^/]*/reset-password', 'POST', 'int.user.update', 'Admin Reset User Password', 'System', now(), null, null);

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/email/template', 'POST', 'int.emailtemplate.create', 'Create email template', 'System', now(), null, null);

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/email/template', 'GET', 'int.emailtemplate.read', 'Get Email Templates', 'System', now(), null, null);

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/sms/template', 'POST', 'int.smstemplate.create', 'Create SMS Template', 'System', now(), null, null);

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/sms/template', 'GET', 'int.smstemplate.read', 'Get SMS Template', 'System', now(), null, null);

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/sms/template', 'PUT', 'int.smstemplate.update', 'Update SMS Template', 'System', now(), null, null);

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/mfa/user/[^/]*/enrollment', 'GET', 'int.mfa.getenrollment', 'Get MFA Enrollment', 'System', now(), NULL, NULL);

-- Ping service privileges

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/[^/]*/profile', 'GET', 'int.ping.getuser', 'Load User Profile', 'System', now(), null, null);

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/[^/]*', 'DELETE', 'int.ping.deleteuser', 'Delete User Details including Roles and Device', 'System', now(),
        null, null);

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/search', 'POST', 'int.ping.searchuser', 'Search User', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/[^/]*/update', 'POST', 'int.ping.updateuser', 'Admin Lock/Unlock User Account', 'System', now(), null, null);

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/user/[^/]*/account/status/[^/]*', 'POST', 'int.ping.updateuser', 'Admin Lock/Unlock User Account', 'System', now(), null, null);

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/dp/send-otp', 'POST', 'int.smstemplate.read', 'Read SMS Template', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/dp/send-otp', 'POST', 'int.sms.send', 'Send SMS', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/dp/resend-otp', 'POST', 'int.smstemplate.read', 'Read SMS Template', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/dp/resend-otp', 'POST', 'int.sms.send', 'Send SMS', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/snb/send-otp', 'POST', 'int.smstemplate.read', 'Read SMS Template', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/snb/send-otp', 'POST', 'int.sms.send', 'Send SMS', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/snb/resend-otp', 'POST', 'int.smstemplate.read', 'Read SMS Template', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/snb/resend-otp', 'POST', 'int.sms.send', 'Send SMS', 'System', now(), 'System', now());

INSERT INTO `endpoint_privilege` (`endpoint`, `method`, `privilege_name`, `description`, `created_by`, `created_on`,
                                  `updated_by`, `updated_on`)
VALUES ('/snb/user/[^/]*', 'DELETE', 'int.snb.delete_user', 'SNB: Delete User', 'System', now(), null, null);