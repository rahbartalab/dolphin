
DELETE FROM `sys_email_templates` WHERE `Name` = 't_[db_prefix]_share' AND `LangID` = 0;
DELETE FROM `sys_email_templates` WHERE `Name` = 't_[db_prefix]_report' AND `LangID` = 0;
INSERT INTO `sys_email_templates` (`Name`, `LangID`, `Subject`, `Body`, `Desc`) VALUES 
('t_[db_prefix]_share', 0, 'Someone from <SiteName> shared file with you', '<html><head></head><body style="font: 12px Verdana; color:#000000">\r\n<p><b>Hello</b>,</p>\r\n\r\n<p><SenderNickName> shared a <MediaType> with you: <a href="<MediaUrl>">See It</a>!</p>\r\n\r\n</p>\r\n\r\n<UserExplanation></p>\r\n\r\n</p>\r\n\r\n<p>---</p>\r\nBest regards,  <SiteName> \r\n<p style="font: bold 10px Verdana; color:red">!!!Auto-generated e-mail, please, do not reply!!!</p></body></html>', 'Message about sharing files.'),
('t_[db_prefix]_report', 0, '<SenderNickName> reported about file from <SiteName>', '<html><head></head><body style="font: 12px Verdana; color:#000000">\r\n<p><b>Hello</b>,</p>\r\n\r\n<p>Message about <MediaType>: <a href="<MediaUrl>">See It</a>!</p>\r\n\r\n</p>\r\n\r\n<UserExplanation></p>\r\n\r\n</p>\r\n\r\n<p>---</p>\r\nBest regards,  <SiteName> \r\n<p style="font: bold 10px Verdana; color:red">!!!Auto-generated e-mail, please, do not reply!!!</p></body></html>', 'Message about file.');

UPDATE `sys_modules` SET `version` = '1.0.8' WHERE `uri` = 'files' AND `version` = '1.0.7';

