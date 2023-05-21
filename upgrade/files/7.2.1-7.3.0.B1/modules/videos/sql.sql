

UPDATE `sys_options` SET `desc` = 'Maximum size of one file (in Megabytes)' WHERE `Name` = 'bx_videos_max_file_size';


DELETE FROM `sys_objects_actions` WHERE `Type` = 'bx_videos' AND `Caption` = '{repostCpt}';
INSERT INTO `sys_objects_actions` (`Type`, `Caption`, `Icon`, `Url`, `Script`, `Eval`, `Order`) VALUES
('bx_videos', '{repostCpt}', 'repeat', '', '{repostScript}', '', 10);


-- update module version

UPDATE `sys_modules` SET `version` = '1.3.0' WHERE `uri` = 'videos' AND `version` = '1.2.1';

