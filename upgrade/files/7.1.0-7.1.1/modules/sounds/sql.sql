
DELETE FROM `sys_page_compose` WHERE `Page` = 'bx_sounds_view' AND `Func` = 'RelatedFiles';
INSERT INTO `sys_page_compose` (`Page`, `PageWidth`, `Desc`, `Caption`, `Column`, `Order`, `Func`, `Content`, `DesignBox`, `ColWidth`, `Visible`, `MinWidth`) VALUES
('bx_sounds_view', '1140px', '', '_bx_sounds_related', 0, 0, 'RelatedFiles', '', 1, 28.1, 'non,memb', 0);

DELETE FROM `sys_stat_site` WHERE `Name` = 'pmu';
SET @iStatSiteOrder := (SELECT `StatOrder` + 1 FROM `sys_stat_site` WHERE 1 ORDER BY `StatOrder` DESC LIMIT 1);
INSERT INTO `sys_stat_site` (`Name`, `Title`, `UserLink`, `UserQuery`, `AdminLink`, `AdminQuery`, `IconName`, `StatOrder`) VALUES
('pmu', 'bx_sounds', 'modules/?r=sounds/browse/all', 'SELECT COUNT(`ID`) FROM `RayMp3Files` WHERE `Status`=''approved''', 'modules/?r=sounds/administration/home/disapproved', 'SELECT COUNT(*) FROM `RayMp3Files` as a left JOIN `sys_albums_objects` as b ON b.`id_object`=a.`ID` left JOIN `sys_albums` as c ON c.`ID`=b.`id_album` WHERE a.`Status` =''disapproved'' AND c.`AllowAlbumView` NOT IN(8) AND c.`Type`=''bx_sounds''', 'music', @iStatSiteOrder);

DELETE FROM `sys_account_custom_stat_elements` WHERE `Label` = '_bx_sounds';
INSERT INTO `sys_account_custom_stat_elements` VALUES
(NULL, '_bx_sounds', '__pmu__ (<a href="modules/?r=sounds/albums/my/main/">__l_add__</a>)');


-- update module version

UPDATE `sys_modules` SET `version` = '1.1.1' WHERE `uri` = 'sounds' AND `version` = '1.1.0';

