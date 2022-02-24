-- ----------------------------------------------------
--		{{ iv_schema }} DML
-- ----------------------------------------------------

--- Document Support ---

INSERT INTO `{{ iv_schema }}`.`document_type` (`documentTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
	VALUES (1, 'Driver Licence', 'Province/State issued Driver Licence', now(), NULL);

INSERT INTO `{{ iv_schema }}`.`document_type` (`documentTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
	VALUES (2, 'Passport', 'Government issued Passport', now(), NULL);

INSERT INTO `{{ iv_schema }}`.`document_type` (`documentTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
	VALUES (3, 'Selfie', 'Selfie Image', now(), NULL);

INSERT INTO `{{ iv_schema }}`.`document_type` (`documentTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
	VALUES (4, 'Citizenship Card', 'Government issued Citizenship Card', now(), NULL);

INSERT INTO `{{ iv_schema }}`.`document_type` (`documentTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
	VALUES (5, 'Permanent Resident Card', 'Government issued Permanent Resident Card', now(), NULL);

INSERT INTO `{{ iv_schema }}`.`document_type` (`documentTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
	VALUES (6, 'Health Card', 'Government issued Health Card', now(), NULL);


---  PCTF Score Supprot --

INSERT INTO `{{ iv_schema }}`.`pctf_score_m` (`pctfScoreId`, `documentName`, `type`, `isSupported`, `description`, `attributes`, `createdOn`, `modifiedOn`)
	VALUES (1, 'IV Base TrueID', 'Default', true, 'IV Base TrueID', 
            '{"pctfDocument":"IV Base TrueID","telephoneNoPoints":5,"registrationPoints":5,"emailConfirmationPoints":5,"socialAccountLinking1Points":5,"socialAccountLinking2Points":7,"socialAccountLinking3Points":10,"socialAccountLinking4Points":0,"levelOfAssuranceValue":0,"baseExtendedPoints": null}',
			now(), null);

INSERT INTO `{{ iv_schema }}`.`pctf_score_m` (`pctfScoreId`, `documentName`, `type`, `isSupported`, `description`, `attributes`, `createdOn`, `modifiedOn`)
	VALUES (2, 'Canadian Birth Certificate', 'Foundational', false, 'Canadian Birth Certificate', 
            '{"pctfDocument":"Canadian Birth Certificate","fullNamePoints":0,"fullNameAndDOBPoints":15,"fullNameDOBAndPhotoPoints":0,"foundationalDocummentPoints":5,"supportingDocummentPoints":0,"linkingDocummentPoints":0,"dateOfBirthPoints":0,"placeOfBirthPoints":10,"addressPoints":0,"extendedPoints":null}',
			now(), null);


INSERT INTO `{{ iv_schema }}`.`pctf_score_m` (`pctfScoreId`, `documentName`, `type`, `isSupported`, `description`, `attributes`, `createdOn`, `modifiedOn`)
	VALUES (3, 'Canadian Permanent Residence Card', 'Foundational', false, 'Canadian Permanent Residence Card', 
            '{"pctfDocument":"Canadian Permanent Residence Card","fullNamePoints":0,"fullNameAndDOBPoints":15,"fullNameDOBAndPhotoPoints":20,"foundationalDocummentPoints":5,"supportingDocummentPoints":0,"linkingDocummentPoints":0,"dateOfBirthPoints":0,"placeOfBirthPoints":10,"addressPoints":0,"extendedPoints":null}',
			now(), null);
            
INSERT INTO `{{ iv_schema }}`.`pctf_score_m` (`pctfScoreId`, `documentName`, `type`, `isSupported`, `description`, `attributes`, `createdOn`, `modifiedOn`)
	VALUES (4, 'Certificate of Citizenship Card', 'Foundational', false, 'Certificate of Citizenship Card', 
            '{"pctfDocument":"Certificate of Citizenship Card","fullNamePoints":0,"fullNameAndDOBPoints":10,"fullNameDOBAndPhotoPoints":15,"foundationalDocummentPoints":5,"supportingDocummentPoints":0,"linkingDocummentPoints":0,"dateOfBirthPoints":0,"placeOfBirthPoints":5,"addressPoints":0,"extendedPoints":null}',
			now(), null);

INSERT INTO `{{ iv_schema }}`.`pctf_score_m` (`pctfScoreId`, `documentName`, `type`, `isSupported`, `description`, `attributes`, `createdOn`, `modifiedOn`)
	VALUES (5, 'Canadian Passport', 'Supporting', false, 'Canadian Passport ', 
            '{"pctfDocument":"Canadian Passport","fullNamePoints":0,"fullNameAndDOBPoints":10,"fullNameDOBAndPhotoPoints":25,"foundationalDocummentPoints":0,"supportingDocummentPoints":5,"linkingDocummentPoints":0,"dateOfBirthPoints":0,"placeOfBirthPoints":10,"addressPoints":0,"extendedPoints":null}',
			now(), null);
            
INSERT INTO `{{ iv_schema }}`.`pctf_score_m` (`pctfScoreId`, `documentName`, `type`, `isSupported`, `description`, `attributes`, `createdOn`, `modifiedOn`)
	VALUES (6, 'Ontario Driver Licence', 'Supporting', true, 'Ontario Driver’s Licence', 
            '{"pctfDocument":"Ontario Driver Licence","fullNamePoints":0,"fullNameAndDOBPoints":10,"fullNameDOBAndPhotoPoints":25,"foundationalDocummentPoints":0,"supportingDocummentPoints":5,"linkingDocummentPoints":0,"dateOfBirthPoints":0,"placeOfBirthPoints":0,"addressPoints":5,"extendedPoints":null}',
			now(), null);

INSERT INTO `{{ iv_schema }}`.`pctf_score_m` (`pctfScoreId`, `documentName`, `type`, `isSupported`, `description`, `attributes`, `createdOn`, `modifiedOn`)
	VALUES (7, 'Hydro Utility Bill', 'Linking', false, 'Canadian Hydro Utility Bill', 
            '{"pctfDocument":"Hydro Utility Bill","fullNamePoints":0,"fullNameAndDOBPoints":0,"fullNameDOBAndPhotoPoints":0,"foundationalDocummentPoints":0,"supportingDocummentPoints":0,"linkingDocummentPoints":0,"dateOfBirthPoints":0,"placeOfBirthPoints":0,"addressPoints":15,"extendedPoints":null}',
			now(), null);

INSERT INTO `{{ iv_schema }}`.`pctf_score_m` (`pctfScoreId`, `documentName`, `type`, `isSupported`, `description`, `attributes`, `createdOn`, `modifiedOn`)
	VALUES (8, 'Bank Statement', 'Linking', false, 'Canadian Bank Statement', 
            '{"pctfDocument":"Bank Statement","fullNamePoints":0,"fullNameAndDOBPoints":0,"fullNameDOBAndPhotoPoints":0,"foundationalDocummentPoints":0,"supportingDocummentPoints":0,"linkingDocummentPoints":0,"dateOfBirthPoints":0,"placeOfBirthPoints":0,"addressPoints":15,"extendedPoints":null}',
			now(), null);

INSERT INTO `{{ iv_schema }}`.`pctf_score_m` (`pctfScoreId`, `documentName`, `type`, `isSupported`, `description`, `attributes`, `createdOn`, `modifiedOn`)
	VALUES (9, 'Ontario Health Card', 'Supporting', true, 'Ontario Health Card', 
            '{"pctfDocument":"Ontario Health Card","fullNamePoints":0,"fullNameAndDOBPoints":10,"fullNameDOBAndPhotoPoints":25,"foundationalDocummentPoints":0,"supportingDocummentPoints":5,"linkingDocummentPoints":0,"dateOfBirthPoints":0,"placeOfBirthPoints":0,"addressPoints":0,"extendedPoints":null}',
			now(), null);
	

--- Claims Support -- 

INSERT INTO `{{ iv_schema }}`.`claim_type` (`claimTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
	VALUES (1, 'Adult', 'Citizen/Customer is an adult', now(), NULL);

INSERT INTO `{{ iv_schema }}`.`claim_type` (`claimTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
	VALUES (2, 'Senior', 'Citizen/Customer is a senior', now(), NULL);

INSERT INTO `{{ iv_schema }}`.`claim_type` (`claimTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
	VALUES (3, 'Age', 'Citizen/Customer age', now(), NULL);

INSERT INTO `{{ iv_schema }}`.`claim_type` (`claimTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
	VALUES (4, 'Date Of Birth', 'Citizen/Customer date of birth', now(), NULL);

INSERT INTO `{{ iv_schema }}`.`claim_type` (`claimTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
	VALUES (5, 'Name', 'Citizen/Customer Name', now(), NULL);

INSERT INTO `{{ iv_schema }}`.`claim_type` (`claimTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
	VALUES (6, 'Phone No.', 'Citizen/Customer Phone No.', now(), NULL);

INSERT INTO `{{ iv_schema }}`.`claim_type` (`claimTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
	VALUES (7, 'Email', 'Citizen/Customer email', now(), NULL);

INSERT INTO `{{ iv_schema }}`.`claim_type` (`claimTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
	VALUES (8, 'Address', 'Citizen/Customer address', now(), NULL);

INSERT INTO `{{ iv_schema }}`.`claim_type` (`claimTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
	VALUES (9, 'Citizenship', 'Citizen/Customer citizenship', now(), NULL);

INSERT INTO `{{ iv_schema }}`.`claim_type` (`claimTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
	VALUES (10, 'Driver Licence', 'Citizen/Customer Province/State issued Driver Licence', now(), NULL);


-- Background task ---

INSERT INTO `{{ iv_schema }}`.`task_execution_s` (`taskName`,  `maxProcessedId`, `status`, `amount`, `createdOn`, `modifiedOn`)
	VALUES ('PI_RETRACT', 21, 'unlock', 2, now(), null);

	
--- Source System Support ----

INSERT INTO `{{ iv_schema }}`.`source_system` (`name`, `description`, `createdOn`, `modifiedOn`)
		VALUES ('IV_MOBILE', 'Consumer Identity Vault', now(), null);
        
INSERT INTO `{{ iv_schema }}`.`source_system` (`name`, `description`, `createdOn`, `modifiedOn`)
		VALUES ('IV_WEB', 'Enterprise Identity Vault', now(), null);
        
INSERT INTO `{{ iv_schema }}`.`source_system` (`name`, `description`, `createdOn`, `modifiedOn`)
		VALUES ('IO_MOBILE', 'Mobile Identity Orchestrator', now(), null);
        
INSERT INTO `{{ iv_schema }}`.`source_system` (`name`, `description`, `createdOn`, `modifiedOn`)
		VALUES ('IO_WEB', 'Web Identity Orchestrator', now(), null);

INSERT INTO `{{ iv_schema }}`.`source_system` (`name`, `description`, `createdOn`, `modifiedOn`)
		VALUES ('TBS', 'Treasury Board Services', now(), null);

INSERT INTO `{{ iv_schema }}`.`source_system` (`name`, `description`, `createdOn`, `modifiedOn`)
		VALUES ('SNB', 'Service New Brunswick', now(), null);

INSERT INTO `{{ iv_schema }}`.`source_system` (`name`, `description`, `createdOn`, `modifiedOn`)
		VALUES ('SA', 'Service Alberta', now(), null);

INSERT INTO `{{ iv_schema }}`.`source_target_mapping` (`sourceSystemId`, `targetSystemId`, `termsAgreementBypass`, `orderNo`, `allOrNone`, `comments`, `createdOn`, `modifiedOn`)
		VALUES (2, 2, 1, 2, 1, 'Map Source System, IV to IV_WS call', now(), null);
		
INSERT INTO `{{ iv_schema }}`.`source_target_mapping` (`sourceSystemId`, `targetSystemId`, `termsAgreementBypass`, `orderNo`, `allOrNone`, `comments`, `createdOn`, `modifiedOn`)
		VALUES (2, 3, 1, 1, 1, 'Map Source System, IV_WEB to PNG-DIR', now(), null);
		

--- Target System Support ----

INSERT INTO `{{ iv_schema }}`.`target_system_type` (`targetSystemTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
		VALUES (1, 'IV', 'Simeio Identity Vault', now(), null);
        
INSERT INTO `{{ iv_schema }}`.`target_system_type` (`targetSystemTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
		VALUES (2, 'IO', 'Simeio Identity Orchestrator', now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_type` (`targetSystemTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
		VALUES (3, 'AM', 'Access Manager', now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_type` (`targetSystemTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
		VALUES (4, 'IDM', 'Identity Manager', now(), null);
		
INSERT INTO `{{ iv_schema }}`.`target_system_type` (`targetSystemTypeId`, `type`, `description`, `createdOn`, `modifiedOn`)
		VALUES (5, 'PNG', 'Ping Directory', now(), null);
        
INSERT INTO `{{ iv_schema }}`.`target_system` (`targetSystemId`, `name`, `targetSystemTypeId`, `active`, `url`, `username`, `password`, `description`, `attributes`, `createdOn`, `modifiedOn`)
		VALUES	(2, 'IV', 1, TRUE, 'http://localhost:8080/iv/api/v1/', 'NA', 'NA', 'Simeio Identity Proofing', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system` (`targetSystemId`, `name`, `targetSystemTypeId`, `active`, `url`, `username`, `password`, `description`, `attributes`, `createdOn`, `modifiedOn`)
		VALUES	(3, 'PNG-DIR', 5, TRUE, '{{ mfa_ping_url }}', 'NA', 'NA', 'Ping Directory', '{"authToken": "{{ mfa_ping_header }}"}', now(), null);
  
  
  
INSERT INTO `{{ iv_schema }}`.`target_system_operation` (`targetSystemOperationId`, `operation`, `targetSystemId`, `uri`, `description`, `attributes`, `createdOn`, `modifiedOn`)
		VALUES	(1, 'createUser', 1, 'managed/user?_action=create', 'ForgeRock IDM Create User URI', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_operation` (`targetSystemOperationId`, `operation`, `targetSystemId`, `uri`, `description`, `attributes`, `createdOn`, `modifiedOn`)
		VALUES	(2, 'updateUser', 1, 'managed/user/{userId}?_prettyPrint=true', 'ForgeRock IDM Update User URI', null, now(), null);
		
INSERT INTO `{{ iv_schema }}`.`target_system_operation` (`targetSystemOperationId`, `operation`, `targetSystemId`, `uri`, `description`, `attributes`, `createdOn`, `modifiedOn`)
		VALUES	(3, 'validateOAuth2AccessToken', 1, 'oauth2/userinfo', 'ForgeRock IDM User Access Token Lookup URI', null, now(), null);
		
INSERT INTO `{{ iv_schema }}`.`target_system_operation` (`targetSystemOperationId`, `operation`, `targetSystemId`, `uri`, `description`, `attributes`, `createdOn`, `modifiedOn`)
		VALUES	(4, 'lookupUser', 2, 'users/search', 'Simeio IV Lookup User URI', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_operation` (`targetSystemOperationId`, `operation`, `targetSystemId`, `uri`, `description`, `attributes`, `createdOn`, `modifiedOn`)
		VALUES	(5, 'validateJWTAccessToken', 2, 'auth/jwt-verify', 'Simeio IV JWT Token verification URI', null, now(), null);
		
INSERT INTO `{{ iv_schema }}`.`target_system_operation` (`targetSystemOperationId`, `operation`, `targetSystemId`, `uri`, `description`, `attributes`, `createdOn`, `modifiedOn`)
		VALUES	(6, 'createUser', 3, 'directory/v1', 'Ping DIR Create User URI', '{"dnVars":"{{ user_dn }}","objClass":["top","person","organizationalPerson","inetOrgPerson","extensibleObject","infowayUserClass"]}', now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_operation` (`targetSystemOperationId`, `operation`, `targetSystemId`, `uri`, `description`, `attributes`, `createdOn`, `modifiedOn`)
		VALUES	(7, 'updateUser', 3, '{{ mfa_ping_userpath }}', 'Ping DIR Update User URI', null, now(), null);
		
INSERT INTO `{{ iv_schema }}`.`target_system_operation` (`targetSystemOperationId`, `operation`, `targetSystemId`, `uri`, `description`, `attributes`, `createdOn`, `modifiedOn`)
		VALUES	(8, 'validateOAuth2AccessToken', 3, 'as/introspect.oauth2?token={accessToken}', 'Ping DIR User Access Token Lookup URI', '{"url": "{{ ping_federate_url }}", "authToken": "{{ accessToken }}"}', now(), null);		

INSERT INTO `{{ iv_schema }}`.`target_system_operation` (`targetSystemOperationId`, `operation`, `targetSystemId`, `uri`, `description`, `attributes`, `createdOn`, `modifiedOn`)
		VALUES	(10, 'introspectJWTAccessToken', 2, 'auth/jwt-introspection', 'Simeio IV JWT Token introspection URI', null, now(), null);	
	
INSERT INTO `{{ iv_schema }}`.`target_system_operation` (`targetSystemOperationId`, `operation`, `targetSystemId`, `uri`, `description`, `attributes`, `createdOn`, `modifiedOn`)
		VALUES	(11, 'deleteUser', 3, '{{ mfa_ping_userpath }}', 'Ping DIR Delete User URI', null, now(), null);

----------------------------------------------------
-- FR Mapping  --
-----------------------------------------------------

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (1, 1, 'firstName', 'givenName', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (2, 1, 'lastName', 'sn', null, now(), null);        
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (3, 1, 'email', 'userName:mail', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (4, 1, 'password', 'password', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (5, 1, 'accountStatus', 'accountStatus', null, now(), null);
		
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (6, 1, 'loa', 'levelOfAssurance', null, now(), null);
		
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (7, 1, 'registrationVerified', 'registrationVerified', null, now(), null);
		
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (8, 1, 'global2FA', 'global2FAEnabled', null, now(), null);
		
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (9, 1, 'service2FA', 'serviceSpecific2FAEnabled', null, now(), null);	
		
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (10, 1, 'userType', 'userType', null, now(), null);	
		
-- update operation mapping

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (11, 2, 'firstName', '/givenName', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (12, 2, 'lastName', '/sn', null, now(), null);        
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (13, 2, 'password', '/password', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (14, 2, 'accountStatus', '/accountStatus', null, now(), null);
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (15, 2, 'loa', '/levelOfAssurance', null, now(), null);
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (16, 2, 'phoneNo', '/telephoneNumber', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (17, 2, 'registrationVerified', '/registrationVerified', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (18, 2, 'global2FA', '/global2FAEnabled', null, now(), null);
		
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (19, 2, 'service2FA', '/serviceSpecific2FAEnabled', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (20, 4, 'id', 'userId', null, now(), null);
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (21, 4, 'email', 'email', null, now(), null);
		
----------------------------------------------------
-- PNG Mapping  --
-----------------------------------------------------

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (22, 6, 'userName', 'uid', null, now(), null);
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (23, 6, 'password', 'userPassword', null, now(), null);
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (24, 6, 'fullName', 'cn', 'Display / Full name', now(), null);       

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (25, 6, 'firstName', 'givenName', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (26, 6, 'lastName', 'sn', null, now(), null);        
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (27, 6, 'email', 'mail', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (28, 6, 'phoneNo', 'telephoneNumber', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (29, 6, 'accountStatus', 'ds-pwp-account-disabled', null, now(), null); 
		
--INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
--		VALUES (30, 6, 'loa', 'loaLevel', null, now(), null);
		
--INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
--		VALUES (31, 6, 'registrationVerified', 'registrationVerified', null, now(), null);
		
--INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
--		VALUES (32, 6, 'global2FA', 'global2FAEnabled', null, now(), null);
		
--INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
--		VALUES (33, 6, 'service2FA', 'serviceSpecific2FAEnabled', null, now(), null);	
		
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (34, 6, 'userType', 'userType', null, now(), null);	
		
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (35, 6, 'pseudonym', 'pseudonym', null, now(), null);	
		
-- update operation mapping

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (36, 7, 'userName', 'uid', null, now(), null);
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (37, 7, 'password', 'userPassword', null, now(), null);
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (38, 7, 'fullName', 'cn', 'Display / Full name', now(), null);       

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (39, 7, 'firstName', 'givenName', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (40, 7, 'lastName', 'sn', null, now(), null);        
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (41, 7, 'email', 'mail', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (42, 7, 'phoneNo', 'telephoneNumber', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (43, 7, 'accountStatus', 'ds-pwp-account-disabled', null, now(), null); 
		
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (44, 7, 'loa', 'loaLevel', null, now(), null);
		
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (45, 7, 'registrationVerified', 'registrationVerified', null, now(), null);
		
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (46, 7, 'global2FA', 'global2FAEnabled', null, now(), null);
		
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (47, 7, 'service2FA', 'serviceSpecific2FAEnabled', null, now(), null);	
		
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (48, 7, 'userType', 'userType', null, now(), null);	
		
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (49, 7, 'pseudonym', 'pseudonym', null, now(), null);	

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (50, 7, 'firstName', 'givenName', null, now(), null);
         

----------------------------------------------------
-- FR Injection --
-----------------------------------------------------
INSERT INTO `{{ iv_schema }}`.`target_system_injection` (`targetSystemMappingId`, `injectedValue`, `description`, `createdOn`, `modifiedOn`)
	VALUES (5, 'inactive','Account Status value injection', now(), null);
    
INSERT INTO `{{ iv_schema }}`.`target_system_injection` (`targetSystemMappingId`, `injectedValue`, `description`, `createdOn`, `modifiedOn`)
	VALUES (6, '0','LoA value injection', now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_injection` (`targetSystemMappingId`, `injectedValue`, `description`, `createdOn`, `modifiedOn`)
	VALUES (7, 'false','Registration Verified value injection', now(), null);
    
INSERT INTO `{{ iv_schema }}`.`target_system_injection` (`targetSystemMappingId`, `injectedValue`, `description`, `createdOn`, `modifiedOn`)
	VALUES (8, 'false','Global 2FA Enabled value injection', now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_injection` (`targetSystemMappingId`, `injectedValue`, `description`, `createdOn`, `modifiedOn`)
	VALUES (9, 'false','Service Specific 2FA Enabled value injection', now(), null);	

INSERT INTO `{{ iv_schema }}`.`target_system_injection` (`targetSystemMappingId`, `injectedValue`, `description`, `createdOn`, `modifiedOn`)
	VALUES (10, 'Access_Health_User','User Type value injection', now(), null);	
		
----------------------------------------------------
-- PNG Injection --
-----------------------------------------------------
INSERT INTO `{{ iv_schema }}`.`target_system_injection` (`targetSystemMappingId`, `injectedValue`, `description`, `createdOn`, `modifiedOn`)
	VALUES (29, 'inactive','Account Status value injection', now(), null);
    
INSERT INTO `{{ iv_schema }}`.`target_system_injection` (`targetSystemMappingId`, `injectedValue`, `description`, `createdOn`, `modifiedOn`)
	VALUES (30, '0','LoA value injection', now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_injection` (`targetSystemMappingId`, `injectedValue`, `description`, `createdOn`, `modifiedOn`)
	VALUES (31, 'false','Registration Verified value injection', now(), null);
    
INSERT INTO `{{ iv_schema }}`.`target_system_injection` (`targetSystemMappingId`, `injectedValue`, `description`, `createdOn`, `modifiedOn`)
	VALUES (32, 'false','Global 2FA Enabled value injection', now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_injection` (`targetSystemMappingId`, `injectedValue`, `description`, `createdOn`, `modifiedOn`)
	VALUES (33, 'false','Service Specific 2FA Enabled value injection', now(), null);	

INSERT INTO `{{ iv_schema }}`.`target_system_injection` (`targetSystemMappingId`, `injectedValue`, `description`, `createdOn`, `modifiedOn`)
	VALUES (34, 'Access_Health_User','User Type value injection', now(), null);	


INSERT INTO `{{ iv_schema }}`.`email_template` (`template_name`, `description`, `toemail`, `cc`, `bcc`, `subject`, `body`, `fromemail`, `fromname`, `createddate`, `createdby`, `updateddate`, `updatedby`)
VALUES ('TEST_EMAIL', 'This is a test email.', '[$$Email$$]', NULL, NULL, 'Test Email', '<!DOCTYPE html>\r\n<HTML>\r\n<BODY>\r\nDear $$FirstName$$,<BR>\r\n<BR>\r\nThis email is a test email from Simeio Solutions<BR>\r\n<BR>\r\n<B>First Name:</B> $$FirstName$$<BR>\r\n<B>Last Name:</B> $$LastName$$<BR>\r\n<B>Sender Name:</B> $$SENDER$$<BR>\r\n<B>Country Name:</B> $$COUNTRY$$<BR>\r\n<B>Email:</B> $$Email$$<BR>\r\n<B>Username:</B> $$UserName$$<BR><BR>\r\n<BR>\r\nFor assistance, please contact Support Desk at <a href="https://support.simeiosolutions.com/portal">Simeio Support</a> or by telephone at <B>+1-770-282-4442</B><BR>\r\n<BR>\r\nThank you,<BR>\r\n$$SENDER$$<BR>\r\n<img src="https://www.simeiosolutions.com/wp-content/themes/Simeio/images/logo.png" height="52" width="160">\r\n</BODY>\r\n</HTML>', '{{ Mail_ID }}', 'Simeio Solutions', '2020-02-12 10:30:24', 'System', NULL, NULL);

INSERT INTO `{{ iv_schema }}`.`email_template` (`template_name`, `description`, `toemail`, `cc`, `bcc`, `subject`, `body`, `fromemail`, `fromname`, `createddate`, `createdby`, `updateddate`, `updatedby`)
VALUES ('REGISTRATION_VERIFICATION_URL', 'This is a registration email with URL', NULL, NULL, NULL, 'Simeio Enterprise Registration Verification', '<!DOCTYPE html>\n<HTML>\n<BODY>\nDear $$FirstName$$<BR>\n<BR>\nThank you for Registering your Simeio Enterprise Account.  \n\n\nTo continue using your account, please <a href=\"$$DomainName$$?otp=$$URLLink$$\">click here</a><BR>\nYou can also use this verification URL Link: <a href=\"$$DomainName$$?otp=$$URLLink$$\">$$DomainName$$?otp=$$URLLink$$</a><BR><BR>\n\n\nFor assistance, please contact Support Desk at <a href=\"https://support.simeiosolutions.com/portal\">Simeio Support</a> or by telephone at <B>+1-770-282-4442</B><BR><BR>\n\nThank you<BR>\n$$SENDER$$\n<BR><BR>\n\n<img src=\"https://www.simeiosolutions.com/wp-content/themes/Simeio/images/logo.png\" height=\"52\" width=\"160\">\n\n</BODY>\n</HTML>', '{{ Mail_ID }}', 'Simeio Solutions', '2020-03-03 12:59:00', 'System', NULL, NULL);

INSERT INTO `{{ iv_schema }}`.`email_template` (`template_name`, `description`, `toemail`, `cc`, `bcc`, `subject`, `body`, `fromemail`, `fromname`, `createddate`, `createdby`, `updateddate`, `updatedby`)
VALUES ('USER_PROFILE_EMAIL_UPDATE', 'Email Template being used after user updates the email address in the profile', NULL, NULL, NULL, 'Email Update & Verification', '<!DOCTYPE html>\n<HTML>\n<BODY>\nDear $$FirstName$$,<BR>\n<BR>\nThank you for using Identity Vault.<BR>\nWe have received your request for updating email address from <B>$$OldEmail$$</B> to <B>$$NewEmail$$</B>.<BR>\n<BR>\n<BR>\n<a href=\"$$DomainName$$?otp=$$URLLink$$\">Click here</a> to update this email in your account.<BR>\n<BR>\n<B>Link:</B>$$DomainName$$?otp=$$URLLink$$<BR>\n<BR>\n<BR>\nKindly ignore this email if request is not submitted by you.<BR>\n<BR>\nFor assistance, please contact Support Desk at <a href=\"https://support.simeiosolutions.com/portal\">Simeio Support</a> or by telephone at <B>+1-770-282-4442</B><BR>\n<BR>\nThank you,<BR>\n$$SENDER$$<BR>\n<img src=\"https://www.simeiosolutions.com/wp-content/themes/Simeio/images/logo.png\" height=\"52\" width=\"160\">\n</BODY>\n</HTML>', '{{ Mail_ID }}', 'Simeio Solutions', '2020-02-22 00:25:54', 'System', NULL, NULL);

INSERT INTO `{{ iv_schema }}`.`email_template` (`template_name`, `description`, `toemail`, `cc`, `bcc`, `subject`, `body`, `fromemail`, `fromname`, `createddate`, `createdby`, `updateddate`, `updatedby`)
VALUES ('FIND_USERNAME_AND_EMAIL', 'Send email with the username', NULL, NULL, NULL, 'Your username for the identity vault account', '<!DOCTYPE html>\r\n<HTML>\r\n<BODY>\r\nDear $$FirstName$$,<BR>\r\n<BR>\r\nThank you for using Identity Vault.<BR>\r\nWe have received your request for retreiving username.<BR>\r\nYour username is <B>$$UserName$$</B>\r\n<BR>\r\n<BR>\r\nKindly ignore this email if request is not submitted by you.<BR>\r\n<BR>\r\nFor assistance, please contact Support Desk at <a href="https://support.simeiosolutions.com/portal">Simeio Support</a> or by telephone at <B>+1-770-282-4442</B><BR>\r\n<BR>\r\nThank you,<BR>\r\n$$SENDER$$<BR>\r\n<img src="https://www.simeiosolutions.com/wp-content/themes/Simeio/images/logo.png" height="52" width="160">\r\n</BODY>\r\n</HTML>', '{{ Mail_ID }}', 'Simeio Solutions', '2020-02-26 14:31:01', 'System', NULL, NULL);

INSERT INTO `{{ iv_schema }}`.`email_template` (`template_name`, `description`, `toemail`, `cc`, `bcc`, `subject`, `body`, `fromemail`, `fromname`, `createddate`, `createdby`, `updateddate`, `updatedby`)
VALUES ('USER_PROFILE_UPDATE', 'This template gets used while performing user update operation', NULL, NULL, NULL, 'Change in your User Profile', '<!DOCTYPE html>\r\n<HTML>\r\n<BODY>\r\nDear $$FirstName$$,<BR>\r\n<BR>\r\nThank you for using Identity Vault.<BR>\r\nAs per the request, your profile has been updated. Following is the current info of your profile.<BR>\r\n<B>First Name:</B> $$FirstName$$\r\n<B>Last Name:</B> $$LastName$$\r\n\r\nKindly verify your documents again to increase your identity assurance level.\r\n<BR>\r\n<BR>\r\nKindly ignore this email if request is not submitted by you.<BR>\r\n<BR>\r\nFor assistance, please contact Support Desk at <a href="https://support.simeiosolutions.com/portal">Simeio Support</a> or by telephone at <B>+1-770-282-4442</B><BR>\r\n<BR>\r\nThank you,<BR>\r\n$$SENDER$$<BR>\r\n<img src="https://www.simeiosolutions.com/wp-content/themes/Simeio/images/logo.png" height="52" width="160">\r\n</BODY>\r\n</HTML>', '{{ Mail_ID }}', 'Simeio Solutions', '2020-03-06 16:29:27', 'System', NULL, NULL);

INSERT INTO `{{ iv_schema }}`.`email_template` (`template_name`, `description`, `toemail`, `cc`, `bcc`, `subject`, `body`, `fromemail`, `fromname`, `createddate`, `createdby`, `updateddate`, `updatedby`)
VALUES ('VERIFICATION_COMPLETED', 'Notify user once the document verification is completed.', NULL, NULL, NULL, 'Notification for the Document Verification', '<!DOCTYPE html>\r\n<HTML>\r\n<BODY>\r\nDear $$FirstName$$,<BR>\r\n<BR>\r\nThank you for using Identity Vault.<BR>\r\nWe have completed processing your $$DocName$$.<BR>\r\nYou can login to your account and check the Identity Assurance Level. If not updated, kindly verify the document again.\r\n<BR>\r\n<BR>\r\nKindly ignore this email if request is not submitted by you.<BR>\r\n<BR>\r\nFor assistance, please contact Support Desk at <a href="https://support.simeiosolutions.com/portal">Simeio Support</a> or by telephone at <B>+1-770-282-4442</B><BR>\r\n<BR>\r\nThank you,<BR>\r\n$$SENDER$$<BR>\r\n<img src="https://www.simeiosolutions.com/wp-content/themes/Simeio/images/logo.png" height="52" width="160">\r\n</BODY>\r\n</HTML>', '{{ Mail_ID }}', 'Simeio Solutions', '2020-03-03 12:41:15', 'System', NULL, NULL);

INSERT INTO `{{ iv_schema }}`.`email_template` (`template_name`, `description`, `toemail`, `cc`, `bcc`, `subject`, `body`, `fromemail`, `fromname`, `createddate`, `createdby`, `updateddate`, `updatedby`)
VALUES ('REGISTRATION_VERIFICATION_OTP', 'This is a registration email with OTP', NULL, NULL, NULL, 'Simeio Enterprise Registration Verification', '<!DOCTYPE html>\r\n\r\n<HTML>\r\n<BODY>\r\n<img src="https://www.simeiosolutions.com/html/website/images/hero_simeio_iic.jpg" height="120" width="250">\r\n<BR><BR>\r\nDear $$FirstName$$<BR><BR>\r\n\r\nThank you for Registering your Simeio Enterprise Account.  \r\n\r\n\r\nRegistration Verification Code: <B>$$OTP$$</B><BR><BR>\r\n\r\n\r\nFor assistance, please contact Support Desk at <a href="https://support.simeiosolutions.com/portal">Simeio Support</a> or by telephone at <B>+1-770-282-4442</B><BR><BR>\r\n\r\nThank you<BR>\r\n$$SENDER$$\r\n<BR><BR>\r\n\r\n<img src="https://www.simeiosolutions.com/html/website/images/logo_simeio.png" height="52" width="160">\r\n\r\n</BODY>\r\n</HTML>', '{{ Mail_ID }}', 'Simeio Solutions', '2020-03-03 13:05:45', 'System', NULL, NULL);

INSERT INTO `{{ iv_schema }}`.`email_template` (`template_name`, `description`, `toemail`, `cc`, `bcc`, `subject`, `body`, `fromemail`, `fromname`, `createddate`, `createdby`, `updateddate`, `updatedby`)
	VALUES ('ACCOUNT_UNLOCK_VERIFIED', 'This template sent upon the user successfully verify/unlock their account.', NULL, NULL, NULL, 'Access Health Account Verified', '<!DOCTYPE html>\r\n<html>\r\n<body>\r\nHello $$FirstName$$,<br>\r\n<br>\r\nThis is to confirm that your account was successfully verified.<br>\r\n\r\n\r\n<br>\r\nFor support, please visit <a href=\"{{ infoway_support }}\">{{ infoway_support }}</a> or call at <B>+1-***-***-****</B><br>\r\n<br>\r\nThank you, <br>\r\n$$SENDER$$\r\n</body>\r\n</html>', '{{ Mail_ID }}', 'Canada Health Infoway', '2020-04-22 11:27:53', 'System', NULL, NULL);

-- --------------------------------------------------------
-- Table `{{ iv_schema }}`.`systemconfig`
-- --------------------------------------------------------
INSERT INTO `{{ iv_schema }}`.`systemconfig` (`keyName`, `keyValue`) VALUES ('emailPolicy', '{"maxLength":50,"regex":"(?:[\\\\p{L}0-9!#$%\\\\&\'*+/=?\\\\^_`{|}~-]+(?:\\\\.[\\\\p{L}0-9!#$%\\\\&\'*+/=?\\\\^_`{|}~-]+)*|\\"(?:[\\\\x01-\\\\x08\\\\x0b\\\\x0c\\\\x0e-\\\\x1f\\\\x21\\\\x23-\\\\x5b\\\\x5d-\\\\x7f]|\\\\\\\\[\\\\x01-\\\\x09\\\\x0b\\\\x0c\\\\x0e-\\\\x7f])*\\")@(?:(?:[\\\\p{L}0-9](?:[a-z0-9-]*[\\\\p{L}0-9])?\\\\.)+[\\\\p{L}0-9](?:[\\\\p{L}0-9-]*[\\\\p{L}0-9])?|\\\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\\\\p{L}0-9-]*[\\\\p{L}0-9]:(?:[\\\\x01-\\\\x08\\\\x0b\\\\x0c\\\\x0e-\\\\x1f\\\\x21-\\\\x5a\\\\x53-\\\\x7f]|\\\\\\\\[\\\\x01-\\\\x09\\\\x0b\\\\x0c\\\\x0e-\\\\x7f])+)\\\\])"}');
INSERT INTO `{{ iv_schema }}`.`systemconfig` (`keyName`, `keyValue`) VALUES ('firstNamePolicy', '{ "maxLength":50,"regex":"^[a-zA-Z][-.()\' a-zA-Z0-9ÀÈÌÒÙàèìòùÁÉÍÓÚÝáéíóúýÂÊÎÔÛâêîôûÃÑÕãñõÄËÏÖÜŸäëïöüŸ¡¿çÇŒœßØøÅåÆæÞþÐð]+"}');
INSERT INTO `{{ iv_schema }}`.`systemconfig` (`keyName`, `keyValue`) VALUES ('lastNamePolicy', '{"maxLength":50,"regex":"^[a-zA-Z][-.()\' a-zA-Z0-9ÀÈÌÒÙàèìòùÁÉÍÓÚÝáéíóúýÂÊÎÔÛâêîôûÃÑÕãñõÄËÏÖÜŸäëïöüŸ¡¿çÇŒœßØøÅåÆæÞþÐð]+"}');
INSERT INTO `{{ iv_schema }}`.`systemconfig` (`keyName`, `keyValue`) VALUES ('passwordPolicy', '{"minAlphaChars": 1, "minNumericChars": 1, "minSpecialChars": 1, "minLowerCaseChars": 1, "minPasswordLength": 8, "minUpperCaseChars": 1, "maxPasswordLength": 128}');
INSERT INTO `{{ iv_schema }}`.`systemconfig` (`keyName`, `keyValue`) VALUES ('userNamePolicy', '{"maxLength":30,"regex":"^[a-zA-Z][-.()\'a-zA-Z0-9ÀÈÌÒÙàèìòùÁÉÍÓÚÝáéíóúýÂÊÎÔÛâêîôûÃÑÕãñõÄËÏÖÜŸäëïöüŸ¡¿çÇŒœßØøÅåÆæÞþÐð@_]+"}');

 INSERT INTO `{{ iv_schema }}`.`target_system_operation` (`targetSystemOperationId`, `operation`, `targetSystemId`, `uri`, `description`, `attributes`, `createdOn`, `modifiedOn`)
		VALUES	(12, 'getUser', 3, '{{ mfa_ping_userpath }}', 'Ping DIR Search User URI', null, now(), null);

-- --------------------------------------------------------
-- Table `{{ iv_schema }}`.`target_system_operation`
-- --------------------------------------------------------
UPDATE `{{ iv_schema }}`.`target_system_operation` SET uri = '{{ mfa_ping_userpath }}', description = 'Ping DIR Get User URI', attributes = '{"dn": "uid={userName},{{ user_dn }}"}', createdOn = '2020-03-28 18:37:22', modifiedOn = null
WHERE targetSystemId = 3 AND operation = 'getUser';


-- --------------------------------------------------------
-- Script for audit log changes
-- --------------------------------------------------------
INSERT INTO `{{ iv_schema }}`.`target_system_type` (`targetSystemTypeId`, `type`, `description`, `createdOn`) VALUES (7, 'AUDIT', 'Auditing Service', '2020-05-15 12:26:59');

INSERT INTO `{{ iv_schema }}`.`target_system` (`targetSystemId`, `name`, `targetSystemTypeId`, `active`, `url`, `username`, `password`, `description`, `createdOn`) VALUES (5, 'AUDIT', 7, 1, 'http://localhost:8762/', 'NA', 'NA', 'Auditing Plugin for IV for Audit Log', '2020-05-15 12:27:48');

INSERT INTO `{{ iv_schema }}`.`source_target_mapping` (`sourceTargetMappingId`, `sourceSystemId`, `targetSystemId`, `termsAgreementBypass`, `orderNo`, `allOrNone`, `comments`, `createdOn`) VALUES (5, 2, 5, 1, 1, 1, 'Map Source System, IV_WEB to Auditing', now());

INSERT INTO `{{ iv_schema }}`.`target_system_operation` (`targetSystemOperationId`, `operation`, `targetSystemId`, `uri`, `description`, `createdOn`) VALUES (14, 'auditLog', 5, '/api/v1/auditing/log', 'Auditing insert log API', '2020-05-15 12:30:55');


-- --------------------------------------------------------
-- Table `{{ iv_schema }}`.`config_settings`
-- --------------------------------------------------------
INSERT INTO `{{ iv_schema }}`.`configuration` (`name`, `value`, `description`, `attributes`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES ('sotEnable', 'true', 'Contains status and messages for the caller', '{\n	\"disableMessage\" : \"No Authoritative Source in the backend\",\n	\"disableStatus\" : \"Disabled\",\n	\"enableMessage\" : \"success\",\n	\"enableStatus\" : \"Enabled\"\n}', now(), null, null, null);

INSERT INTO `{{ iv_schema }}`.`configuration` (`name`, `value`, `description`, `attributes`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES ('sotEnableSetter', 'n/a', 'Contains authentication key for enabling/disabling SOT Repository Verification/Lookup', '{\"authKey\":\"{{ authKey }}\"}', now(), null, null, null);
    
INSERT INTO `{{ iv_schema }}`.`configuration` (`name`, `value`, `description`, `attributes`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES ('adminDeleteScope', 'tier3', 'Contains Scope for an Administrator to Delete User Account', null, now(), null, null, null);

INSERT INTO `{{ iv_schema }}`.`configuration` (`name`, `value`, `description`, `attributes`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES ('clientRegistryMessages', 'n/a', 'Contains API response messages for unlocking User Account', '{\"success\":\"Your account is now successfully setup. Please navigate to the Access Identity homepage to login to your services.\",\"failure\":\"Your account was not activated.\",\"expired\":\"Your account activation code has expired.\"}', now(), null, null, null);

-- validation policies 
INSERT INTO `{{ iv_schema }}`.`configuration` (`name`, `value`, `description`, `attributes`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES ('emailPolicy', 'n/a', 'Regex for Email Policy', '{\"maxLength\":50,\"regex\":\"(?:[\\\\p{L}0-9!#$%\\\\&\'*+/=?\\\\^_`{|}~-]+(?:\\\\.[\\\\p{L}0-9!#$%\\\\&\'*+/=?\\\\^_`{|}~-]+)*|\\\"(?:[\\\\x01-\\\\x08\\\\x0b\\\\x0c\\\\x0e-\\\\x1f\\\\x21\\\\x23-\\\\x5b\\\\x5d-\\\\x7f]|\\\\\\\\[\\\\x01-\\\\x09\\\\x0b\\\\x0c\\\\x0e-\\\\x7f])*\\\")@(?:(?:[\\\\p{L}0-9](?:[a-z0-9-]*[\\\\p{L}0-9])?\\\\.)+[\\\\p{L}0-9](?:[\\\\p{L}0-9-]*[\\\\p{L}0-9])?|\\\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\\\\p{L}0-9-]*[\\\\p{L}0-9]:(?:[\\\\x01-\\\\x08\\\\x0b\\\\x0c\\\\x0e-\\\\x1f\\\\x21-\\\\x5a\\\\x53-\\\\x7f]|\\\\\\\\[\\\\x01-\\\\x09\\\\x0b\\\\x0c\\\\x0e-\\\\x7f])+)\\\\])\"}', now(), null, null, null);

INSERT INTO `{{ iv_schema }}`.`configuration` (`name`, `value`, `description`, `attributes`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES ('userNamePolicy', 'n/a', 'Regex for Username Policy', '{\"maxLength\":30,\"regex\":\"^[a-zA-Z][-.()\'a-zA-Z0-9ÀÈÌÒÙàèìòùÁÉÍÓÚÝáéíóúýÂÊÎÔÛâêîôûÃÑÕãñõÄËÏÖÜŸäëïöüŸ¡¿çÇŒœßØøÅåÆæÞþÐð@_]+\"}', now(), null, null, null);

INSERT INTO `{{ iv_schema }}`.`configuration` (`name`, `value`, `description`, `attributes`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES ('passwordPolicy', 'n/a', 'Regex for Password Policy', '{\"minAlphaChars\": 1, \"minNumericChars\": 1, \"minSpecialChars\": 1, \"minLowerCaseChars\": 1, \"minPasswordLength\": 8, \"minUpperCaseChars\": 1, \"maxPasswordLength\": 128}', now(), null, null, null);
	
INSERT INTO `{{ iv_schema }}`.`configuration` (`name`, `value`, `description`, `attributes`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES ('firstNamePolicy', 'n/a', 'Regex for First Name Policy ', '{ \"maxLength\":50,\"regex\":\"^[a-zA-Z][-.()\' a-zA-Z0-9ÀÈÌÒÙàèìòùÁÉÍÓÚÝáéíóúýÂÊÎÔÛâêîôûÃÑÕãñõÄËÏÖÜŸäëïöüŸ¡¿çÇŒœßØøÅåÆæÞþÐð]+\"}', now(), null, null, null);
	
INSERT INTO `{{ iv_schema }}`.`configuration` (`name`, `value`, `description`, `attributes`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES ('lastNamePolicy', 'n/a', 'Regex for Last Name Policy', '{\"maxLength\":50,\"regex\":\"^[a-zA-Z][-.()\' a-zA-Z0-9ÀÈÌÒÙàèìòùÁÉÍÓÚÝáéíóúýÂÊÎÔÛâêîôûÃÑÕãñõÄËÏÖÜŸäëïöüŸ¡¿çÇŒœßØøÅåÆæÞþÐð]+\"}', now(), null, null, null);


-- new operation to invalidate the token
INSERT INTO `{{ iv_schema }}`.`target_system_operation` (`operation`, `targetSystemId`, `uri`, `description`, `attributes`, `createdOn`, `modifiedOn`) VALUES ('invalidateJWTAccessToken', 2, 'auth/jwt-invalidate', 'Simeio IV JWT Token invalidate URI', NULL, '2020-06-05 17:16:34', NULL);

UPDATE `{{ iv_schema }}`.`configuration` SET `attributes` = '{\n    \"expired\": \"Your account activation code has expired. <br><br> Votre code d\'activation de compte a expiré.\",\n    \"failure\": \"Your account was not activated. <br><br> Votre compte n\'a pas été activé.\",\n    \"conditional\": \"Email was not sent to user for activating user account\",\n    \"success\": \"Thank you! Your MyHealthNB verification email has been verified. Please return to the Verify your email address page and click the Next button to complete the MyHealthNB account registration process. <br><br> Merci! Votre courriel de MaSantéNB a été vérifié.  Veuillez retourner à la page Vérifiez votre adresse de courrier électronique et cliquez le bouton Suivant afin de compléter le processus d\'enregistrement de votre compte MaSantéNB.\"\n}' WHERE (`configurationId` = '4');

-- Internationalization support (French Characters)
UPDATE `{{ iv_schema }}`.`configuration` SET `attributes`='{\n	\"maxLength\" : 50,\n	\"regex\" : \"^[a-zA-ZÀÈÌÒÙàèìòùÁÉÍÓÚÝáéíóúýÂÊÎÔÛâêîôûÃÑÕãñõÄËÏÖÜŸäëïöüŸ][-.()\' a-zA-Z0-9ÀÈÌÒÙàèìòùÁÉÍÓÚÝáéíóúýÂÊÎÔÛâêîôûÃÑÕãñõÄËÏÖÜŸäëïöüŸ¡¿çÇŒœßØøÅåÆæÞþÐð]+\"\n}' WHERE `name`='firstNamePolicy';
UPDATE `{{ iv_schema }}`.`configuration` SET `attributes`='{\n	\"maxLength\" : 50,\n	\"regex\" : \"^[a-zA-ZÀÈÌÒÙàèìòùÁÉÍÓÚÝáéíóúýÂÊÎÔÛâêîôûÃÑÕãñõÄËÏÖÜŸäëïöüŸ][-.()\' a-zA-Z0-9ÀÈÌÒÙàèìòùÁÉÍÓÚÝáéíóúýÂÊÎÔÛâêîôûÃÑÕãñõÄËÏÖÜŸäëïöüŸ¡¿çÇŒœßØøÅåÆæÞþÐð]+\"\n}' WHERE `name`='lastNamePolicy';
UPDATE `{{ iv_schema }}`.`configuration` SET `attributes`='{\n	\"maxLength\" : 30,\n	\"regex\" : \"^(?!.*[-]{2})(?!.+\\\\s.+$)[a-zA-ZÀÈÌÒÙàèìòùÁÉÍÓÚÝáéíóúýÂÊÎÔÛâêîôûÃÑÕãñõÄËÏÖÜŸäëïöüŸ][-.()\'a-zA-Z0-9ÀÈÌÒÙàèìòùÁÉÍÓÚÝáéíóúýÂÊÎÔÛâêîôûÃÑÕãñõÄËÏÖÜŸäëïöüŸ¡¿çÇŒœßØøÅåÆæÞþÐð@_]+\"\n}' WHERE `name`='userNamePolicy';
UPDATE `{{ iv_schema }}`.`configuration` SET `attributes`='{\n	\"maxLength\" : 50,\n	\"regex\" : \"(([^ÀÈÌÒÙàèìòùÁÉÍÓÚÝáéíóúýÂÊÎÔÛâêîôûÃÑÕãñõÄËÏÖÜŸäëïöüŸ¡¿çÇŒœßØøÅåÆæÞþÐð<>()\\\\[\\\\]\\\\\\\\.,;:\\\\s@\\\"]+(\\\\.[^<>()\\\\[\\\\]\\\\\\\\.,;:\\\\s@\\\"]+)*)|(\\\".+\\\"))[^ÀÈÌÒÙàèìòùÁÉÍÓÚÝáéíóúýÂÊÎÔÛâêîôûÃÑÕãñõÄËÏÖÜŸäëïöüŸ¡¿çÇŒœßØøÅåÆæÞþÐð][a-zA-Z0-9][^ÀÈÌÒÙàèìòùÁÉÍÓÚÝáéíóúýÂÊÎÔÛâêîôûÃÑÕãñõÄËÏÖÜŸäëïöüŸ¡¿çÇŒœßØøÅåÆæÞþÐð]@((\\\\[[0-9]{1,3}\\\\.[0-9]{1,3}\\\\.[0-9]{1,3}\\\\.[0-9]{1,3}\\\\])|(([a-zA-Z\\\\-0-9]+\\\\.)+[a-zA-Z]{2,}))$\"\n}' WHERE `name`='emailPolicy';

-- ADDING MFA as Target System in {{ iv_schema }}

INSERT INTO `target_system_type` (`targetSystemTypeId`, `type`, `description`, `createdOn`) VALUES (8, 'MFA', 'Simeio MFA Service', '2020-07-23 16:26:56');

INSERT INTO `target_system` (`targetSystemId`, `name`, `targetSystemTypeId`, `active`, `url`, `username`, `password`, `description`) VALUES (6, 'MFA', 8, 1, 'http://localhost:8764', 'NA', 'NA', 'IO MFA Plugin for IV');

INSERT INTO `target_system_operation` (`targetSystemOperationId`, `operation`, `targetSystemId`, `uri`, `description`, `attributes`, `createdOn`) VALUES (16, 'mfaEnrollment', 6, '/api/v1/mfa/{realm}/user/{userName}/device', 'Enroll user for MFA', '{"realm":"prescribeit"}', '2020-07-23 16:47:01');

INSERT INTO `source_target_mapping` (`sourceTargetMappingId`, `sourceSystemId`, `targetSystemId`, `termsAgreementBypass`, `orderNo`, `allOrNone`, `comments`, `createdOn`) VALUES (6, 2, 6, 1, 1, 1, 'Map Source System, IV to MFA', '2020-07-23 17:23:47');


UPDATE `{{ iv_schema }}`.`configuration` SET `attributes`='{\"minAlphaChars\": 1, \"minNumericChars\": 1, \"minSpecialChars\": 1, \"maxPasswordLength\": 128, \"minLowerCaseChars\": 1, \"minPasswordLength\": 8, \"minUpperCaseChars\": 1,\"alphaPattern\": \"[a-zA-Z]\" ,\"numericPattern\": \"[0-9]\" ,\"lowerPattern\": \"[a-z]\",\"upperPattern\": \"[A-Z]\" ,\"specialCharsPattern\": \"[^a-zA-Z0-9]\"
,\"allowedChars\": \"[a-zA-Z0-9\\\\~\\\\!\\\\@\\\\#\\\\$\\\\%\\\\^\\\\&\\\\*\\\\(\\\\)\\\\-\\\\_\\\\=\\\\+\\\\[\\\\]\\\\{\\\\}\\\\|\\\\;\\\\:\\\\,\\\\.\\\\<\\\\>\\\\/\\\\?]\"}' WHERE `name` = 'passwordPolicy';


INSERT INTO `{{ iv_schema }}`.`configuration` (`name`, `value`, `description`, `attributes`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
    VALUES ('adminScope', 'scopeAdmin', 'Contains Scope for an Administrator to Use MFA with Basic Token', null, now(), null, null, NULL);
    
-- Security/Authentication Questions

INSERT INTO `{{ iv_schema }}`.`authentication_question` (`locale`, `question`, `inUse`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES 	('en-CA', 'What is your all time favorite movie?', true, now(), null, null, null);
    
INSERT INTO `{{ iv_schema }}`.`authentication_question` (`locale`, `question`, `inUse`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES 	('en-CA', 'What is the name of your first pet?', true, now(), null, null, null);
    
INSERT INTO `{{ iv_schema }}`.`authentication_question` (`locale`, `question`, `inUse`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES 	('en-CA', 'What is the city that you grew up in?', true, now(), null, null, null);
    
INSERT INTO `{{ iv_schema }}`.`authentication_question` (`locale`, `question`, `inUse`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES 	('en-CA', 'What is the name of your favorite High School teacher?', true, now(), null, null, null);

INSERT INTO `{{ iv_schema }}`.`authentication_question` (`locale`, `question`, `inUse`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES 	('en-CA', 'What is your favorite colour?', true, now(), null, null, null);
	
-- update operation mapping for user create and update

delete from {{ iv_schema }}.target_system_mapping 
	where targetSystemMappingId = 50;

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (50, 6, 'securityQnA', 'n/a', 'Authentication Questions and Answers', now(), null);	

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (51, 6, 'secretPhrase', 'n/a', 'Authentication Secret Phrase', now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (52, 6, 'secretRepo', 'n/a', 'Third Party Secret Repository', now(), null);
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (53, 6, 'preferredFirstName', 'name', null, now(), null);        
    
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (54, 6, 'middleName', 'initials', null, now(), null);  

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (55, 6, 'phoneNoOther', 'telephoneNumber', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (56, 6, 'suiteApt', 'postalAddress', null, now(), null);  
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (57, 6, 'street', 'street', null, now(), null);  

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (58, 6, 'city', 'l', null, now(), null);  

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (59, 6, 'stateProvince', 'st', null, now(), null);  
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (60, 6, 'zipPostalCode', 'postalCode', null, now(), null);  

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (61, 6, 'country', 'c', null, now(), null);  

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (62, 6, 'address', 'n/a', null, now(), null);
		
-- complex attributes
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (63, 6, 'suiteApt_other', 'postalAddress1', null, now(), null);  
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (64, 6, 'street_other', 'street1', null, now(), null);  

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (65, 6, 'city_other', 'l1', null, now(), null);  

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (66, 6, 'stateProvince_other', 'st1', null, now(), null);  
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (67, 6, 'zipPostalCode_other', 'postalCode1', null, now(), null);  

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (68, 6, 'country_other', 'c1', null, now(), null); 

-- update mappings

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (69, 7, 'securityQnA', 'n/a', 'Authentication Questions and Answers', now(), null);	

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (70, 7, 'secretPhrase', 'n/a', 'Authentication Secret Phrase', now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (71, 7, 'secretRepo', 'n/a', 'Third Party Secret Repository', now(), null);
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (72, 7, 'preferredFirstName', 'name', null, now(), null);        
    
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (73, 7, 'middleName', 'initials', null, now(), null);  

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (74, 7, 'phoneNoOther', 'telephoneNumber', null, now(), null);

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (75, 7, 'suiteApt', 'postalAddress', null, now(), null);  
      
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (76, 7, 'street', 'street', null, now(), null);  

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (77, 7, 'city', 'l', null, now(), null);  

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (78, 7, 'stateProvince', 'st', null, now(), null);  
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (79, 7, 'zipPostalCode', 'postalCode', null, now(), null);  

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (80, 7, 'country', 'c', null, now(), null);  

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (81, 7, 'address', 'n/a', null, now(), null);
		
-- complex attributes update
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (82, 7, 'suiteApt_other', 'postalAddress1', null, now(), null);  
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (83, 7, 'street_other', 'street1', null, now(), null);  

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (84, 7, 'city_other', 'l1', null, now(), null);  

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (85, 7, 'stateProvince_other', 'st1', null, now(), null);  
        
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (86, 7, 'zipPostalCode_other', 'postalCode1', null, now(), null);  

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (87, 7, 'country_other', 'c1', null, now(), null); 
		
-- extended Attribute	

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (88, 6, 'extendedAttribute', 'description', null, now(), null); 

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (89, 7, 'extendedAttribute', 'description', null, now(), null); 

UPDATE `{{ iv_schema }}`.`target_system_mapping` SET `targetSystemField`='homePhone' WHERE `targetSystemMappingId` = 28;
UPDATE `{{ iv_schema }}`.`target_system_mapping` SET `targetSystemField`='homePhone' WHERE `targetSystemMappingId` = 42;
		
UPDATE `{{ iv_schema }}`.`target_system_operation` SET `uri`='v1/introspect', `attributes`='{"url": "{{ infoway_url }}", "authToken": "{{ authToken }}"}' WHERE  `operation` = 'validateOAuth2AccessToken' AND `targetSystemOperationId`= 8;

-- New policies for Security QnA, Secret Phrase and Address fields

INSERT INTO `{{ iv_schema }}`.`configuration` (`name`, `value`, `description`, `attributes`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES ('securityQnAPolicy', 'n/a', 'Policy for Security Questions and Answers', '{\"minNoOfQuestions\":3, \"minAnswerLength\":3}', now(), null, null, null);

INSERT INTO `{{ iv_schema }}`.`configuration` (`name`, `value`, `description`, `attributes`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES ('secretPhrasePolicy', 'n/a', 'Policy for Secret Phrase', '{\"regex\": \"(.*?)\", \"minLength\": 6, \"maxLength\": 2000}', now(), null, null, null);

INSERT INTO `{{ iv_schema }}`.`configuration` (`name`, `value`, `description`, `attributes`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES ('addressPolicy', 'n/a', 'Policy for Address', '{\"type\": [\"other\",\"home\"]}', now(), null, null, null);

INSERT INTO `{{ iv_schema }}`.`configuration` (`name`, `value`, `description`, `attributes`, `createDate`)
	VALUES ('phoneNoPolicy', 'n/a', 'Policy for Secret Phrase', '{"regex": "[1-9]{1}[0-9]{9}", "maxLength": 100, "minLength": 10}', now());

UPDATE `{{ iv_schema }}`.`configuration` SET `attributes`='{\n	\"minAnswerLength\" : 3,\n	\"minQuestionsRequired\" : 3\n}' WHERE `name`='securityQnAPolicy';
UPDATE `{{ iv_schema }}`.`configuration` SET `attributes`='{\n	\"maxLength\" : 200,\n	\"minLength\" : 6,\n	\"regex1\" : \".*.[0-9][0-9][0-9].*\",\n    \"regex2\" : \"[0-9][0-9][0-9].*\"\n}' WHERE `name`='secretPhrasePolicy';

-- Authentication Questions French Support
INSERT INTO `{{ iv_schema }}`.`authentication_question` (`locale`, `question`, `inUse`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES 	('fr-CA', 'Quel est votre film préféré de tous les temps?', true, now(), null, null, null);
    
INSERT INTO `{{ iv_schema }}`.`authentication_question` (`locale`, `question`, `inUse`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES 	('fr-CA', 'Quel est le nom de votre premier animal?', true, now(), null, null, null);
   
INSERT INTO `{{ iv_schema }}`.`authentication_question` (`locale`, `question`, `inUse`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES 	('fr-CA', 'Dans quelle ville avez-vous grandi?', true, now(), null, null, null);
    
INSERT INTO `{{ iv_schema }}`.`authentication_question` (`locale`, `question`, `inUse`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES 	('fr-CA', 'Quel est le nom de votre professeur de lycée préféré?', true, now(), null, null, null);

INSERT INTO `{{ iv_schema }}`.`authentication_question` (`locale`, `question`, `inUse`, `createDate`, `updateDate`, `createdBy`, `updatedBy`)
	VALUES 	('fr-CA', 'Quelle est ta couleur préférée?', true, now(), null, null, null);


--- Insert in target_system_mapping table
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (90,12,'userName','uid',NULL,'2020-09-03 09:52:08',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (91,12,'password','userPassword',NULL,'2020-09-03 09:52:09',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (92,12,'fullName','cn','Display / Full name','2020-09-03 09:52:09',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (93,12,'firstName','givenName',NULL,'2020-09-03 09:52:09',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (94,12,'lastName','sn',NULL,'2020-09-03 09:52:09',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (95,12,'email','mail',NULL,'2020-09-03 09:52:09',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (96,12,'phoneNo','homePhone',NULL,'2020-09-03 09:52:09',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (97,12,'accountStatus','ds-pwp-account-disabled',NULL,'2020-09-03 09:52:09',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (98,12,'loa','loaLevel',NULL,'2020-09-03 09:52:09',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (99,12,'registrationVerified','registrationVerified',NULL,'2020-09-03 09:52:09',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (100,12,'securityQnA','n/a','Authentication Questions and Answers','2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (101,12,'secretPhrase','n/a','Authentication Secret Phrase','2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (102,12,'secretRepo','n/a','Third Party Secret Repository','2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (103,12,'preferredFirstName','name',NULL,'2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (104,12,'middleName','initials',NULL,'2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (105,12,'phoneNoOther','telephoneNumber',NULL,'2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (106,12,'suiteApt','postalAddress',NULL,'2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (107,12,'street','street',NULL,'2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (108,12,'city','l',NULL,'2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (109,12,'stateProvince','st',NULL,'2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (110,12,'zipPostalCode','postalCode',NULL,'2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (111,12,'country','c',NULL,'2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (112,12,'address','n/a',NULL,'2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (113,12,'suiteApt_other','postalAddress1',NULL,'2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (114,12,'street_other','street1',NULL,'2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (115,12,'city_other','l1',NULL,'2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (116,12,'stateProvince_other','st1',NULL,'2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (117,12,'zipPostalCode_other','postalCode1',NULL,'2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (118,12,'country_other','c1',NULL,'2020-09-03 09:58:12',NULL);
INSERT INTO `target_system_mapping` (`targetSystemMappingId`,`targetSystemOperationId`,`internalSystemField`,`targetSystemField`,`description`,`createdOn`,`modifiedOn`) VALUES (119,12,'extendedAttribute','description',NULL,'2020-09-03 09:58:13',NULL);

-- Third-Party OCR Integration
INSERT INTO `{{ iv_schema }}`.`target_system_type` (`targetSystemTypeId`, `type`, `description`) 
		VALUES (9, 'M-BLNK', 'Microblink');

INSERT INTO `{{ iv_schema }}`.`target_system` (`targetSystemId`, `name`, `targetSystemTypeId`, `active`, `url`, `username`, `password`, `description`) 
		VALUES (7, 'M-BLNK', 9, 1, 'https://api.microblink.com', 'NA', 'NA', 'Microblink for image recognition');

INSERT INTO `{{ iv_schema }}`.`target_system_operation` (`targetSystemOperationId`, `operation`, `targetSystemId`, `uri`, `description`) 
		VALUES (17, 'scanDoc', 7, '/v1/recognizers/blinkid-combined', 'Microblink URL for Scan DL');

INSERT INTO `{{ iv_schema }}`.`source_target_mapping` (`sourceSystemId`, `targetSystemId`, `termsAgreementBypass`, `orderNo`, `allOrNone`, `comments`, `createdOn`, `modifiedOn`)
		VALUES (2, 7, 1, 1, 1, 'Map Source System, IV_WEB to MICROBLINK', now(), null);

UPDATE `{{ iv_schema }}`.`target_system` SET `attributes`='{\n	\"authToken\" : \"{{ MBlink_authToken }}\"\n}' 
		WHERE `name`='M-BLNK';

-- Mappings for Demo
INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (120, 6, 'carLicense', 'carLicense', null, now(), null); 

INSERT INTO `{{ iv_schema }}`.`target_system_mapping` (`targetSystemMappingId`, `targetSystemOperationId`, `internalSystemField`, `targetSystemField`, `description`, `createdOn`, `modifiedOn`)
		VALUES (121, 7, 'carLicense', 'carLicense', null, now(), null); 

--- To support the Multiple OAuths usecase, adding attributes column to the user external reference table
ALTER TABLE `{{ iv_schema }}`.`user_external_reference`
 ADD COLUMN `attributes` JSON NULL AFTER `description`;

UPDATE `{{ iv_schema }}`.`user_external_reference` SET `attributes` = '{"userDn": "{{ user_dn }}"}' where `attributes` IS NULL;

ALTER TABLE `{{ iv_schema }}`.`user_external_reference` MODIFY `attributes` JSON NOT NULL;

UPDATE `{{ iv_schema }}`.`target_system_operation` SET `uri` = 'directory/v1/uid={userName}' WHERE (`operation` = 'updateUser');
UPDATE `{{ iv_schema }}`.`target_system_operation` SET `uri` = 'directory/v1/uid={userName}' WHERE (`operation` = 'deleteUser');
UPDATE `{{ iv_schema }}`.`target_system_operation` SET `uri` = 'directory/v1/uid={userName}', `attributes` = '{\"dn\": \"uid={userName}\"}' WHERE (`operation` = 'getUser');
