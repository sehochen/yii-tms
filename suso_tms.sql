/*
Navicat MySQL Data Transfer

Source Server         : Suso
Source Server Version : 50173
Source Host           : 120.26.231.172 :3306
Source Database       : suso_tms

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2018-12-19 10:14:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wokav_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `wokav_admin_user`;
CREATE TABLE `wokav_admin_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `auth_key` varchar(50) DEFAULT NULL COMMENT '自动登录key',
  `last_ip` varchar(50) DEFAULT NULL COMMENT '最近一次登录ip',
  `is_online` char(1) DEFAULT 'n' COMMENT '是否在线',
  `domain_account` varchar(100) DEFAULT NULL COMMENT '域账号',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '状态',
  `create_user` varchar(100) NOT NULL COMMENT '创建人',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_user` varchar(101) NOT NULL COMMENT '更新人',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wokav_admin_user
-- ----------------------------
INSERT INTO `wokav_admin_user` VALUES ('156', 'admin', '$2y$13$9O6bKJieocg//oSax9fZOOuljAKarBXknqD8.RyYg60FfNjS7SoqK', null, '127.0.0.1', 'n', null, '10', 'admin', '2014-07-07 00:05:47', 'admin', '2014-09-03 12:19:12');
INSERT INTO `wokav_admin_user` VALUES ('160', 'xiangmu', '$2y$13$oIZX/6irQbCBchNOggVdnuI4ajdi/hhEhKXrXNeOC7BzoCjc32Noi', null, null, 'n', '', '10', 'admin', '2018-11-14 15:16:38', 'admin', '2018-11-14 15:16:38');
INSERT INTO `wokav_admin_user` VALUES ('161', 'test01', '$2y$13$qlnWpf5AtYpY1ws1WbDoWeMGF6e423mw9TnL7KazaswNK40WOTtMe', null, null, 'n', '', '10', 'admin', '2018-11-21 15:55:08', 'admin', '2018-11-21 15:55:08');
INSERT INTO `wokav_admin_user` VALUES ('162', 'test02', '$2y$13$qlnWpf5AtYpY1ws1WbDoWeMGF6e423mw9TnL7KazaswNK40WOTtMe', null, null, 'n', '', '10', 'admin', '2018-11-21 15:55:24', 'admin', '2018-11-21 15:55:24');
INSERT INTO `wokav_admin_user` VALUES ('163', 'test03', '$2y$13$qlnWpf5AtYpY1ws1WbDoWeMGF6e423mw9TnL7KazaswNK40WOTtMe', null, null, 'n', '', '10', 'admin', '2018-11-21 15:55:39', 'admin', '2018-11-21 15:55:39');

-- ----------------------------
-- Table structure for wokav_rbac_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `wokav_rbac_admin_log`;
CREATE TABLE `wokav_rbac_admin_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `controller_id` varchar(20) DEFAULT NULL COMMENT '控制器ID',
  `action_id` varchar(20) DEFAULT NULL COMMENT '方法ID',
  `url` varchar(200) DEFAULT NULL COMMENT '访问地址',
  `module_name` varchar(50) DEFAULT NULL COMMENT '模块',
  `func_name` varchar(50) DEFAULT NULL COMMENT '功能',
  `right_name` varchar(50) DEFAULT NULL COMMENT '方法',
  `client_ip` varchar(15) DEFAULT NULL COMMENT '客户端IP',
  `create_user` varchar(50) DEFAULT NULL COMMENT '用户',
  `create_date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `index_create_date` (`create_date`),
  KEY `index_create_index` (`create_user`),
  KEY `index_url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=1449 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wokav_rbac_admin_log
-- ----------------------------
INSERT INTO `wokav_rbac_admin_log` VALUES ('1', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:43:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('2', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:45:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('3', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:47:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('4', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:48:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('5', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:48:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('6', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:48:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('7', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:49:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('8', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:49:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('9', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:52:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('10', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:52:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('11', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:53:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('12', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:53:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('13', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:54:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('14', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:54:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('15', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:54:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('16', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:54:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('17', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:55:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('18', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:55:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('19', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:55:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('20', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:55:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('21', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:55:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('22', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:56:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('23', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:56:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('24', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:58:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('25', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:58:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('26', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:58:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('27', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:58:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('28', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-09 16:58:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('29', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:58:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('30', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 16:59:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('31', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:00:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('32', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:00:50');
INSERT INTO `wokav_rbac_admin_log` VALUES ('33', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:00:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('34', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:02:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('35', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:02:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('36', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:02:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('37', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:04:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('38', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:04:15');
INSERT INTO `wokav_rbac_admin_log` VALUES ('39', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:04:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('40', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:04:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('41', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:04:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('42', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:04:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('43', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:04:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('44', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:04:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('45', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:04:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('46', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:06:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('47', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-09 17:06:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('48', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:06:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('49', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:06:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('50', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:06:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('51', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:06:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('52', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:09:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('53', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:09:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('54', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:10:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('55', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:10:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('56', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:10:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('57', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:10:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('58', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:10:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('59', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:10:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('60', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:11:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('61', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:12:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('62', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:12:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('63', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:13:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('64', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:14:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('65', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:14:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('66', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:15:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('67', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:15:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('68', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:16:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('69', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:16:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('70', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:16:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('71', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:18:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('72', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-09 17:18:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('73', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:18:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('74', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:18:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('75', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:18:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('76', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:19:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('77', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:20:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('78', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:21:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('79', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:21:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('80', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:21:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('81', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:21:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('82', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:22:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('83', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:22:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('84', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:22:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('85', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:22:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('86', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:23:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('87', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:26:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('88', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:26:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('89', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:27:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('90', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:28:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('91', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:28:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('92', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:29:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('93', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:29:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('94', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:29:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('95', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-09 17:29:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('96', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 13:39:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('97', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-14 13:39:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('98', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-14 13:40:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('99', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 13:40:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('100', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 13:40:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('101', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 13:40:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('102', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 14:22:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('103', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:22:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('104', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:22:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('105', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:22:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('106', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:22:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('107', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:22:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('108', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:22:50');
INSERT INTO `wokav_rbac_admin_log` VALUES ('109', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:23:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('110', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:24:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('111', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:24:15');
INSERT INTO `wokav_rbac_admin_log` VALUES ('112', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:24:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('113', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:27:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('114', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:27:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('115', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:28:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('116', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:28:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('117', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:28:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('118', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:29:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('119', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:29:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('120', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:30:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('121', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:30:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('122', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:31:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('123', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:31:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('124', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:32:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('125', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:32:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('126', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:32:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('127', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:33:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('128', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:33:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('129', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-14 14:33:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('130', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:33:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('131', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:33:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('132', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:33:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('133', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:34:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('134', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:34:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('135', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:34:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('136', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:34:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('137', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-14 14:34:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('138', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-14 14:34:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('139', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-14 14:34:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('140', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-14 14:34:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('141', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-14 14:34:52');
INSERT INTO `wokav_rbac_admin_log` VALUES ('142', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-14 14:34:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('143', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:35:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('144', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:36:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('145', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:37:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('146', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:38:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('147', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:38:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('148', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:38:10');
INSERT INTO `wokav_rbac_admin_log` VALUES ('149', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:38:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('150', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-14 14:38:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('151', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-14 14:38:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('152', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-14 14:38:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('153', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-14 14:38:50');
INSERT INTO `wokav_rbac_admin_log` VALUES ('154', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-14 14:38:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('155', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:39:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('156', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:39:10');
INSERT INTO `wokav_rbac_admin_log` VALUES ('157', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:40:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('158', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:40:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('159', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:41:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('160', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:41:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('161', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:41:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('162', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:41:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('163', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:41:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('164', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:41:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('165', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:41:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('166', 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:41:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('167', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:42:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('168', 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:42:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('169', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:42:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('170', 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:42:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('171', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:42:52');
INSERT INTO `wokav_rbac_admin_log` VALUES ('172', 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:42:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('173', 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:43:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('174', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:43:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('175', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:44:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('176', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:44:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('177', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:45:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('178', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:46:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('179', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:46:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('180', 'admin-user-role', 'view', 'admin-user-role/view', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:46:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('181', 'admin-user-role', 'view', 'admin-user-role/view', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:47:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('182', 'admin-user-role', 'view', 'admin-user-role/view', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:47:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('183', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:48:15');
INSERT INTO `wokav_rbac_admin_log` VALUES ('184', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:49:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('185', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:50:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('186', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:51:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('187', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:51:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('188', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:53:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('189', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-14 14:53:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('190', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:53:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('191', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-14 14:53:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('192', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:53:13');
INSERT INTO `wokav_rbac_admin_log` VALUES ('193', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:53:15');
INSERT INTO `wokav_rbac_admin_log` VALUES ('194', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 14:53:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('195', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 14:53:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('196', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 14:53:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('197', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:54:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('198', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:54:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('199', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:54:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('200', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:54:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('201', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-14 14:54:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('202', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:54:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('203', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:55:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('204', 'admin-role', 'create', 'admin-role/create', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:55:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('205', 'admin-role', 'create', 'admin-role/create', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:55:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('206', 'admin-role', 'create', 'admin-role/create', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:56:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('207', 'admin-role', 'create', 'admin-role/create', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 14:58:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('208', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:00:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('209', 'admin-role', 'create', 'admin-role/create', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:00:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('210', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:00:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('211', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:00:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('212', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:00:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('213', 'admin-role', 'create', 'admin-role/create', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:00:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('214', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:00:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('215', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:01:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('216', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:01:10');
INSERT INTO `wokav_rbac_admin_log` VALUES ('217', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:01:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('218', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:02:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('219', 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:02:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('220', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:02:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('221', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:02:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('222', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:03:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('223', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:03:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('224', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:03:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('225', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:05:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('226', 'admin-user', 'create', 'admin-user/create', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:05:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('227', 'admin-user', 'create', 'admin-user/create', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:05:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('228', 'admin-user', 'create', 'admin-user/create', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:05:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('229', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:06:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('230', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:06:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('231', 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:06:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('232', 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:06:10');
INSERT INTO `wokav_rbac_admin_log` VALUES ('233', 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:06:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('234', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:07:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('235', 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '127.0.0.1', 'admin', '2018-11-14 15:07:15');
INSERT INTO `wokav_rbac_admin_log` VALUES ('236', 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '127.0.0.1', 'admin', '2018-11-14 15:08:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('237', 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '127.0.0.1', 'admin', '2018-11-14 15:08:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('238', 'admin-log', 'view', 'admin-log/view', '日志管理', '操作日志', '操作', '127.0.0.1', 'admin', '2018-11-14 15:08:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('239', 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '127.0.0.1', 'admin', '2018-11-14 15:08:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('240', 'admin-log', 'view', 'admin-log/view', '日志管理', '操作日志', '操作', '127.0.0.1', 'admin', '2018-11-14 15:08:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('241', 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '127.0.0.1', 'admin', '2018-11-14 15:08:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('242', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 15:11:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('243', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:11:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('244', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:12:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('245', 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:12:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('246', 'admin-role', 'update', 'admin-role/update', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:12:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('247', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:12:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('248', 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:13:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('249', 'admin-role', 'update', 'admin-role/update', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:13:13');
INSERT INTO `wokav_rbac_admin_log` VALUES ('250', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:13:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('251', 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:13:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('252', 'admin-role', 'update', 'admin-role/update', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:13:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('253', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:13:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('254', 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:13:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('255', 'admin-role', 'update', 'admin-role/update', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:13:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('256', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:13:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('257', 'admin-role', 'create', 'admin-role/create', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:13:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('258', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:13:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('259', 'admin-role', 'create', 'admin-role/create', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:14:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('260', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:14:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('261', 'admin-role', 'create', 'admin-role/create', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:14:10');
INSERT INTO `wokav_rbac_admin_log` VALUES ('262', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:14:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('263', 'admin-role', 'create', 'admin-role/create', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:14:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('264', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:14:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('265', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 15:14:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('266', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:14:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('267', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:14:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('268', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:14:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('269', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:14:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('270', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:15:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('271', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:15:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('272', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:15:15');
INSERT INTO `wokav_rbac_admin_log` VALUES ('273', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:15:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('274', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:15:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('275', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:15:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('276', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:15:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('277', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:15:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('278', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:15:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('279', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:15:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('280', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:15:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('281', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:15:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('282', 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:16:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('283', 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:16:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('284', 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:16:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('285', 'admin-user', 'delete', 'admin-user/delete', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:16:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('286', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:16:15');
INSERT INTO `wokav_rbac_admin_log` VALUES ('287', 'admin-user', 'delete', 'admin-user/delete', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:16:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('288', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:16:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('289', 'admin-user', 'create', 'admin-user/create', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:16:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('290', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:16:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('291', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:17:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('292', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:17:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('293', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:17:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('294', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:17:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('295', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:17:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('296', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:17:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('297', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:17:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('298', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:17:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('299', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:18:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('300', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:18:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('301', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:18:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('302', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:18:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('303', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:18:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('304', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:18:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('305', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:18:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('306', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:18:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('307', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:18:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('308', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:18:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('309', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:18:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('310', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:18:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('311', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:18:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('312', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:18:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('313', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:18:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('314', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:21:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('315', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:21:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('316', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-14 15:21:50');
INSERT INTO `wokav_rbac_admin_log` VALUES ('317', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:22:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('318', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:22:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('319', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:23:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('320', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 15:23:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('321', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 15:23:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('322', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 15:23:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('323', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 15:23:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('324', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 15:23:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('325', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-14 15:23:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('326', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-14 15:23:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('327', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-14 15:23:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('328', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:23:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('329', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:23:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('330', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:24:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('331', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:24:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('332', 'admin-user-role', 'view', 'admin-user-role/view', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:24:10');
INSERT INTO `wokav_rbac_admin_log` VALUES ('333', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:24:52');
INSERT INTO `wokav_rbac_admin_log` VALUES ('334', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:24:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('335', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:25:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('336', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:25:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('337', 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '127.0.0.1', 'admin', '2018-11-14 15:25:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('338', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 15:25:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('339', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-14 15:25:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('340', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'xiangmu', '2018-11-14 15:33:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('341', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:35:10');
INSERT INTO `wokav_rbac_admin_log` VALUES ('342', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:35:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('343', 'admin-user-role', 'delete', 'admin-user-role/delete', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:35:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('344', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:35:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('345', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:35:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('346', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:35:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('347', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:35:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('348', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:35:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('349', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:35:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('350', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:35:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('351', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:35:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('352', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'xiangmu', '2018-11-14 15:35:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('353', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'xiangmu', '2018-11-14 15:35:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('354', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'xiangmu', '2018-11-14 15:35:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('355', 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '127.0.0.1', 'xiangmu', '2018-11-14 15:36:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('356', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'xiangmu', '2018-11-14 15:38:15');
INSERT INTO `wokav_rbac_admin_log` VALUES ('357', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'xiangmu', '2018-11-14 15:38:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('358', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'xiangmu', '2018-11-14 15:38:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('359', 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '127.0.0.1', 'xiangmu', '2018-11-14 15:38:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('360', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'xiangmu', '2018-11-14 15:38:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('361', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'xiangmu', '2018-11-14 15:38:50');
INSERT INTO `wokav_rbac_admin_log` VALUES ('362', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'xiangmu', '2018-11-14 15:38:52');
INSERT INTO `wokav_rbac_admin_log` VALUES ('363', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'xiangmu', '2018-11-14 15:38:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('364', 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'xiangmu', '2018-11-14 15:38:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('365', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'xiangmu', '2018-11-14 15:39:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('366', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'xiangmu', '2018-11-14 15:39:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('367', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'xiangmu', '2018-11-14 15:39:10');
INSERT INTO `wokav_rbac_admin_log` VALUES ('368', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'xiangmu', '2018-11-14 15:39:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('369', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'xiangmu', '2018-11-14 15:39:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('370', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'xiangmu', '2018-11-14 15:39:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('371', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'xiangmu', '2018-11-14 15:39:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('372', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'xiangmu', '2018-11-14 15:39:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('373', 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '127.0.0.1', 'xiangmu', '2018-11-14 15:39:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('374', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:39:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('375', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-14 15:39:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('376', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:40:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('377', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:40:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('378', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:40:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('379', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-14 15:40:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('380', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'xiangmu', '2018-11-14 15:40:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('381', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'xiangmu', '2018-11-14 17:08:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('382', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'xiangmu', '2018-11-14 17:08:13');
INSERT INTO `wokav_rbac_admin_log` VALUES ('383', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'xiangmu', '2018-11-14 17:08:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('384', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-16 09:18:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('385', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-16 09:18:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('386', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-16 09:18:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('387', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-16 09:48:10');
INSERT INTO `wokav_rbac_admin_log` VALUES ('388', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-16 09:48:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('389', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-16 09:48:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('390', 'admin-module', 'create', 'admin-module/create', '菜单用户权限', '菜单管理', '一级菜单添加', '127.0.0.1', 'admin', '2018-11-16 09:49:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('391', 'admin-module', 'create', 'admin-module/create', '菜单用户权限', '菜单管理', '一级菜单添加', '127.0.0.1', 'admin', '2018-11-16 09:49:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('392', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-16 09:51:13');
INSERT INTO `wokav_rbac_admin_log` VALUES ('393', 'admin-module', 'create', 'admin-module/create', '菜单用户权限', '菜单管理', '一级菜单添加', '127.0.0.1', 'admin', '2018-11-16 09:51:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('394', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-16 09:51:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('395', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-16 09:51:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('396', 'admin-module', 'update', 'admin-module/update', '菜单用户权限', '菜单管理', '一级菜单添加', '127.0.0.1', 'admin', '2018-11-16 09:51:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('397', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-16 09:51:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('398', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-16 09:51:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('399', 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '127.0.0.1', 'admin', '2018-11-16 09:52:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('400', 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '127.0.0.1', 'admin', '2018-11-16 09:53:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('401', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-16 09:54:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('402', 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '127.0.0.1', 'admin', '2018-11-16 09:55:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('403', 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '127.0.0.1', 'admin', '2018-11-16 09:55:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('404', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-16 09:55:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('405', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-16 09:55:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('406', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-16 09:55:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('407', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-16 09:55:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('408', 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '127.0.0.1', 'admin', '2018-11-16 09:56:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('409', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-16 09:56:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('410', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-16 09:56:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('411', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-16 09:56:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('412', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-16 09:56:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('413', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-16 09:56:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('414', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-16 09:56:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('415', 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '127.0.0.1', 'admin', '2018-11-16 09:57:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('416', 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '127.0.0.1', 'admin', '2018-11-16 09:57:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('417', 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '127.0.0.1', 'admin', '2018-11-16 09:57:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('418', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-16 09:58:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('419', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-16 09:58:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('420', 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '127.0.0.1', 'admin', '2018-11-16 09:58:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('421', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-16 09:58:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('422', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-16 09:58:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('423', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-16 09:58:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('424', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-16 09:58:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('425', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-16 09:58:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('426', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-16 09:59:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('427', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-16 09:59:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('428', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:27:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('429', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:27:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('430', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:27:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('431', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:27:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('432', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:27:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('433', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:27:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('434', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:27:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('435', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:27:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('436', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:27:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('437', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:27:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('438', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:28:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('439', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:28:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('440', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:28:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('441', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:28:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('442', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:28:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('443', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:28:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('444', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:28:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('445', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:28:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('446', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:28:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('447', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-16 10:28:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('448', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:26:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('449', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 09:26:50');
INSERT INTO `wokav_rbac_admin_log` VALUES ('450', 'admin-module', 'create', 'admin-module/create', '菜单用户权限', '菜单管理', '一级菜单添加', '127.0.0.1', 'admin', '2018-11-20 09:27:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('451', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 09:27:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('452', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 09:27:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('453', 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '127.0.0.1', 'admin', '2018-11-20 09:28:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('454', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 09:28:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('455', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-20 09:28:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('456', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-20 09:28:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('457', 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '127.0.0.1', 'admin', '2018-11-20 09:29:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('458', 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '127.0.0.1', 'admin', '2018-11-20 09:29:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('459', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-20 09:29:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('460', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 09:29:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('461', 'admin-module', 'create', 'admin-module/create', '菜单用户权限', '菜单管理', '一级菜单添加', '127.0.0.1', 'admin', '2018-11-20 09:29:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('462', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 09:29:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('463', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 09:29:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('464', 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '127.0.0.1', 'admin', '2018-11-20 09:29:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('465', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 09:29:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('466', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-20 09:30:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('467', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-20 09:30:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('468', 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '127.0.0.1', 'admin', '2018-11-20 09:30:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('469', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-20 09:30:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('470', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 09:30:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('471', 'admin-module', 'create', 'admin-module/create', '菜单用户权限', '菜单管理', '一级菜单添加', '127.0.0.1', 'admin', '2018-11-20 09:30:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('472', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 09:30:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('473', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 09:30:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('474', 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '127.0.0.1', 'admin', '2018-11-20 09:31:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('475', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 09:31:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('476', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-20 09:31:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('477', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-20 09:31:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('478', 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '127.0.0.1', 'admin', '2018-11-20 09:31:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('479', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-20 09:31:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('480', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 09:31:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('481', 'admin-module', 'create', 'admin-module/create', '菜单用户权限', '菜单管理', '一级菜单添加', '127.0.0.1', 'admin', '2018-11-20 09:31:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('482', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 09:31:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('483', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 09:31:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('484', 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '127.0.0.1', 'admin', '2018-11-20 09:32:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('485', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 09:32:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('486', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-20 09:32:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('487', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-20 09:32:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('488', 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '127.0.0.1', 'admin', '2018-11-20 09:32:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('489', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-20 09:32:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('490', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:32:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('491', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:32:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('492', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:32:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('493', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:32:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('494', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:32:52');
INSERT INTO `wokav_rbac_admin_log` VALUES ('495', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:33:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('496', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:33:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('497', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:33:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('498', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:33:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('499', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:33:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('500', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:33:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('501', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:33:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('502', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:33:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('503', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:33:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('504', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:33:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('505', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:33:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('506', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:33:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('507', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:33:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('508', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 09:33:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('509', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-20 09:33:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('510', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-20 09:33:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('511', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-20 09:33:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('512', 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '127.0.0.1', 'admin', '2018-11-20 09:34:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('513', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 09:34:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('514', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 14:30:13');
INSERT INTO `wokav_rbac_admin_log` VALUES ('515', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-20 14:30:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('516', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 14:30:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('517', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 14:36:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('518', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:01:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('519', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:01:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('520', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:01:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('521', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:01:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('522', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:01:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('523', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 15:01:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('524', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 15:01:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('525', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-20 15:02:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('526', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 15:02:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('527', 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '127.0.0.1', 'admin', '2018-11-20 15:02:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('528', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 15:03:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('529', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-20 15:03:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('530', 'admin-user-role', 'delete', 'admin-user-role/delete', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-20 15:03:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('531', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-20 15:03:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('532', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 15:04:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('533', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 15:04:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('534', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-20 15:04:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('535', 'admin-user-role', 'delete', 'admin-user-role/delete', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-20 15:04:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('536', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '127.0.0.1', 'admin', '2018-11-20 15:04:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('537', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:04:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('538', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 15:05:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('539', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 15:05:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('540', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 15:05:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('541', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 15:06:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('542', 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 15:07:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('543', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 15:07:50');
INSERT INTO `wokav_rbac_admin_log` VALUES ('544', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '127.0.0.1', 'admin', '2018-11-20 15:07:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('545', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:08:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('546', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:11:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('547', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:11:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('548', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:11:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('549', 'admin-menu', 'update', 'admin-menu/update', '菜单用户权限', '菜单管理', '二级菜单添加', '127.0.0.1', 'admin', '2018-11-20 15:11:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('550', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:11:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('551', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:11:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('552', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-20 15:11:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('553', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-20 15:11:52');
INSERT INTO `wokav_rbac_admin_log` VALUES ('554', 'admin-right', 'update', 'admin-right/update', '菜单用户权限', '菜单管理', '路由添加', '127.0.0.1', 'admin', '2018-11-20 15:12:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('555', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '127.0.0.1', 'admin', '2018-11-20 15:12:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('556', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:15:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('557', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:16:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('558', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:16:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('559', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:16:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('560', 'admin-menu', 'update', 'admin-menu/update', '菜单用户权限', '菜单管理', '二级菜单添加', '127.0.0.1', 'admin', '2018-11-20 15:16:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('561', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:16:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('562', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:16:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('563', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:16:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('564', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:16:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('565', 'admin-module', 'update', 'admin-module/update', '菜单用户权限', '菜单管理', '一级菜单添加', '127.0.0.1', 'admin', '2018-11-20 15:16:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('566', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:16:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('567', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:16:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('568', 'admin-module', 'update', 'admin-module/update', '菜单用户权限', '菜单管理', '一级菜单添加', '127.0.0.1', 'admin', '2018-11-20 15:16:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('569', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:16:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('570', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:17:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('571', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:17:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('572', 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '127.0.0.1', 'admin', '2018-11-20 15:17:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('573', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:17:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('574', 'admin-menu', 'delete', 'admin-menu/delete', '菜单用户权限', '菜单管理', '二级菜单删除', '127.0.0.1', 'admin', '2018-11-20 15:17:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('575', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '127.0.0.1', 'admin', '2018-11-20 15:17:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('576', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-20 15:20:52');
INSERT INTO `wokav_rbac_admin_log` VALUES ('577', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-21 09:39:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('578', 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '127.0.0.1', 'admin', '2018-11-21 09:39:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('579', 'site', 'error', 'site/error', null, null, null, '127.0.0.1', 'admin', '2018-11-21 09:49:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('580', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 15:53:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('581', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 15:53:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('582', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 15:53:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('583', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 15:54:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('584', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 15:54:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('585', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 15:54:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('586', 'admin-user', 'create', 'admin-user/create', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 15:55:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('587', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 15:55:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('588', 'admin-user', 'create', 'admin-user/create', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 15:55:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('589', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 15:55:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('590', 'admin-user', 'create', 'admin-user/create', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 15:55:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('591', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 15:55:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('592', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 15:55:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('593', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 15:55:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('594', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 15:59:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('595', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 15:59:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('596', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:00:52');
INSERT INTO `wokav_rbac_admin_log` VALUES ('597', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 16:01:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('598', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 16:01:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('599', 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 16:01:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('600', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:01:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('601', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 16:01:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('602', 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 16:01:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('603', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:01:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('604', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:02:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('605', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:02:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('606', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:02:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('607', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:02:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('608', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:02:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('609', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:02:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('610', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:02:52');
INSERT INTO `wokav_rbac_admin_log` VALUES ('611', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:03:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('612', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:03:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('613', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:03:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('614', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 16:03:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('615', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:03:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('616', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:03:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('617', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 16:03:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('618', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:03:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('619', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:07:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('620', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:14:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('621', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:15:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('622', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:15:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('623', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 16:15:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('624', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:16:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('625', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:16:10');
INSERT INTO `wokav_rbac_admin_log` VALUES ('626', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:16:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('627', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:16:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('628', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:16:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('629', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:16:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('630', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:16:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('631', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:16:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('632', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:16:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('633', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:17:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('634', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:17:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('635', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:17:13');
INSERT INTO `wokav_rbac_admin_log` VALUES ('636', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:17:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('637', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:17:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('638', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:17:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('639', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:17:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('640', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:17:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('641', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:17:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('642', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:18:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('643', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:18:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('644', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:18:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('645', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:18:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('646', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:18:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('647', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:18:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('648', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:18:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('649', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:18:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('650', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:19:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('651', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:19:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('652', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:19:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('653', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:19:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('654', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:19:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('655', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:19:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('656', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:19:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('657', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:19:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('658', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:19:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('659', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:19:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('660', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:20:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('661', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:20:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('662', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:20:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('663', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:20:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('664', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:20:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('665', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:20:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('666', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:20:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('667', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:20:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('668', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:20:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('669', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:20:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('670', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:20:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('671', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:21:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('672', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:21:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('673', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:21:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('674', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:21:15');
INSERT INTO `wokav_rbac_admin_log` VALUES ('675', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:21:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('676', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:21:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('677', 'admin-user-role', 'create', 'admin-user-role/create', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:21:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('678', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:21:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('679', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:21:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('680', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:21:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('681', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:21:52');
INSERT INTO `wokav_rbac_admin_log` VALUES ('682', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:22:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('683', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:23:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('684', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:23:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('685', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:24:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('686', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:24:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('687', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:24:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('688', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:24:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('689', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:24:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('690', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-21 16:24:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('691', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:24:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('692', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:24:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('693', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:25:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('694', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:25:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('695', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:25:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('696', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:25:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('697', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:25:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('698', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:25:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('699', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:26:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('700', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:26:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('701', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:26:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('702', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:26:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('703', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:26:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('704', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:26:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('705', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-21 16:26:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('706', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-21 16:26:50');
INSERT INTO `wokav_rbac_admin_log` VALUES ('707', 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '180.106.10.236', 'admin', '2018-11-21 16:27:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('708', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-21 16:27:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('709', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:27:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('710', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:27:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('711', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:27:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('712', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:27:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('713', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:27:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('714', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:27:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('715', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:28:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('716', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:28:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('717', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:28:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('718', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:28:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('719', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:29:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('720', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:29:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('721', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:29:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('722', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:29:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('723', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:29:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('724', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:30:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('725', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:30:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('726', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-21 16:30:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('727', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-21 16:30:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('728', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-21 16:30:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('729', 'admin-right', 'update', 'admin-right/update', '菜单用户权限', '菜单管理', '路由添加', '180.106.10.236', 'admin', '2018-11-21 16:30:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('730', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-21 16:30:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('731', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-21 16:31:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('732', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:33:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('733', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:33:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('734', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:33:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('735', 'admin-menu', 'update', 'admin-menu/update', '菜单用户权限', '菜单管理', '二级菜单添加', '180.106.10.236', 'admin', '2018-11-21 16:34:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('736', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:34:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('737', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:34:50');
INSERT INTO `wokav_rbac_admin_log` VALUES ('738', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:34:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('739', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:35:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('740', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:35:10');
INSERT INTO `wokav_rbac_admin_log` VALUES ('741', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:35:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('742', 'admin-menu', 'update', 'admin-menu/update', '菜单用户权限', '菜单管理', '二级菜单添加', '180.106.10.236', 'admin', '2018-11-21 16:35:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('743', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:35:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('744', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:35:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('745', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:35:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('746', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:35:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('747', 'admin-menu', 'update', 'admin-menu/update', '菜单用户权限', '菜单管理', '二级菜单添加', '180.106.10.236', 'admin', '2018-11-21 16:35:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('748', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:35:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('749', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:35:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('750', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:35:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('751', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:36:50');
INSERT INTO `wokav_rbac_admin_log` VALUES ('752', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:36:52');
INSERT INTO `wokav_rbac_admin_log` VALUES ('753', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:36:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('754', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:36:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('755', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('756', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('757', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('758', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('759', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:13');
INSERT INTO `wokav_rbac_admin_log` VALUES ('760', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('761', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('762', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('763', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('764', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('765', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('766', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('767', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('768', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('769', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('770', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('771', 'admin-menu', 'update', 'admin-menu/update', '菜单用户权限', '菜单管理', '二级菜单添加', '180.106.10.236', 'admin', '2018-11-21 16:37:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('772', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('773', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:37:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('774', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:38:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('775', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:38:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('776', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 16:41:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('777', 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 16:41:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('778', 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 16:41:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('779', 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-21 16:41:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('780', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:42:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('781', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:42:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('782', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:42:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('783', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:43:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('784', 'admin-menu', 'delete', 'admin-menu/delete', '菜单用户权限', '菜单管理', '二级菜单删除', '180.106.10.236', 'admin', '2018-11-21 16:43:15');
INSERT INTO `wokav_rbac_admin_log` VALUES ('785', 'admin-menu', 'delete', 'admin-menu/delete', '菜单用户权限', '菜单管理', '二级菜单删除', '180.106.10.236', 'admin', '2018-11-21 16:43:15');
INSERT INTO `wokav_rbac_admin_log` VALUES ('786', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:43:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('787', 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '180.106.10.236', 'admin', '2018-11-21 16:43:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('788', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:43:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('789', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:44:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('790', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:44:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('791', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:44:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('792', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:45:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('793', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:45:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('794', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-21 16:45:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('795', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-21 16:45:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('796', 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '180.106.10.236', 'admin', '2018-11-21 16:45:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('797', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-21 16:45:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('798', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:45:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('799', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:45:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('800', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:45:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('801', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:46:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('802', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:46:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('803', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:46:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('804', 'admin-menu', 'delete', 'admin-menu/delete', '菜单用户权限', '菜单管理', '二级菜单删除', '180.106.10.236', 'admin', '2018-11-21 16:46:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('805', 'admin-menu', 'delete', 'admin-menu/delete', '菜单用户权限', '菜单管理', '二级菜单删除', '180.106.10.236', 'admin', '2018-11-21 16:46:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('806', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:46:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('807', 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '180.106.10.236', 'admin', '2018-11-21 16:47:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('808', 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '180.106.10.236', 'admin', '2018-11-21 16:47:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('809', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:47:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('810', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-21 16:47:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('811', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-21 16:47:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('812', 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '180.106.10.236', 'admin', '2018-11-21 16:47:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('813', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-21 16:47:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('814', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:48:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('815', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:48:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('816', 'admin-menu', 'delete', 'admin-menu/delete', '菜单用户权限', '菜单管理', '二级菜单删除', '180.106.10.236', 'admin', '2018-11-21 16:48:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('817', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:48:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('818', 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '180.106.10.236', 'admin', '2018-11-21 16:48:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('819', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:48:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('820', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-21 16:48:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('821', 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-21 16:48:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('822', 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '180.106.10.236', 'admin', '2018-11-21 16:49:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('823', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-21 16:49:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('824', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:49:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('825', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:49:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('826', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:49:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('827', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:49:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('828', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:50:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('829', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:50:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('830', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:50:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('831', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:50:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('832', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:50:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('833', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:50:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('834', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:50:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('835', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:50:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('836', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:50:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('837', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 16:50:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('838', 'site', 'error', 'site/error', null, null, null, '124.160.213.242', 'test03', '2018-11-21 16:56:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('839', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 16:59:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('840', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-21 17:32:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('841', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-21 17:33:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('842', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-22 08:58:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('843', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-22 08:59:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('844', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-22 08:59:13');
INSERT INTO `wokav_rbac_admin_log` VALUES ('845', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-22 08:59:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('846', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-22 08:59:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('847', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-22 08:59:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('848', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-22 08:59:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('849', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-22 08:59:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('850', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-22 08:59:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('851', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-22 09:00:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('852', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-22 09:00:10');
INSERT INTO `wokav_rbac_admin_log` VALUES ('853', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-22 09:00:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('854', 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('855', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-22 09:00:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('856', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-22 09:00:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('857', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-22 09:00:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('858', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-22 09:01:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('859', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-22 09:01:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('860', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-22 09:01:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('861', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-22 09:01:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('862', 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '180.106.10.236', 'admin', '2018-11-22 09:02:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('863', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-23 14:19:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('864', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-23 15:50:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('865', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-23 15:50:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('866', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-23 15:50:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('867', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-23 15:50:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('868', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-23 15:50:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('869', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-23 15:50:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('870', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '180.106.10.236', 'test01', '2018-11-23 15:50:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('871', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '180.106.10.236', 'test01', '2018-11-23 15:50:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('872', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'test01', '2018-11-23 15:50:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('873', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '180.106.10.236', 'test01', '2018-11-23 15:50:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('874', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.106.10.236', 'test01', '2018-11-23 15:51:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('875', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-23 15:51:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('876', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '180.106.10.236', 'test01', '2018-11-23 15:51:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('877', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'test01', '2018-11-23 15:51:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('878', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '180.106.10.236', 'test01', '2018-11-23 15:51:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('879', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.106.10.236', 'test01', '2018-11-23 15:51:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('880', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-23 15:51:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('881', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'test01', '2018-11-23 15:51:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('882', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'test01', '2018-11-23 15:51:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('883', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '180.106.10.236', 'test01', '2018-11-23 15:51:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('884', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-23 15:52:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('885', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-23 15:53:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('886', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-23 15:53:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('887', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '180.106.10.236', 'test01', '2018-11-23 15:53:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('888', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '180.106.10.236', 'test01', '2018-11-23 15:53:13');
INSERT INTO `wokav_rbac_admin_log` VALUES ('889', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-23 15:53:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('890', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-23 15:53:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('891', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-23 15:53:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('892', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-23 16:01:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('893', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-23 16:01:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('894', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-23 16:02:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('895', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-23 16:02:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('896', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-23 16:02:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('897', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-23 16:02:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('898', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-23 16:02:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('899', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-23 16:02:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('900', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-23 16:02:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('901', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-23 16:02:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('902', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-23 16:02:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('903', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-23 16:02:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('904', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-23 16:02:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('905', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-23 16:02:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('906', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-23 16:03:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('907', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-23 16:03:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('908', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-23 16:03:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('909', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-23 16:03:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('910', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-23 16:03:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('911', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-23 16:04:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('912', 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-23 16:04:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('913', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-23 16:04:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('914', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-23 16:04:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('915', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-23 16:04:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('916', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-23 16:04:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('917', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-23 16:04:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('918', 'admin-right', 'update', 'admin-right/update', '菜单用户权限', '菜单管理', '路由添加', '180.106.10.236', 'admin', '2018-11-23 16:05:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('919', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-23 16:05:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('920', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-23 16:05:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('921', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-23 16:05:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('922', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-23 16:06:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('923', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-23 16:06:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('924', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-23 16:06:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('925', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-23 16:06:13');
INSERT INTO `wokav_rbac_admin_log` VALUES ('926', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-23 16:06:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('927', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-23 16:06:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('928', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-23 16:06:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('929', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '180.106.10.236', 'admin', '2018-11-23 16:07:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('930', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '180.106.10.236', 'admin', '2018-11-23 16:07:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('931', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '180.106.10.236', 'admin', '2018-11-23 16:07:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('932', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '180.106.10.236', 'admin', '2018-11-23 16:08:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('933', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'admin', '2018-11-23 16:08:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('934', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '180.106.10.236', 'admin', '2018-11-23 16:08:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('935', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '180.106.10.236', 'admin', '2018-11-23 16:08:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('936', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '180.106.10.236', 'admin', '2018-11-23 16:09:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('937', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.106.10.236', 'admin', '2018-11-23 16:09:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('938', 'tms-duizhang', 'view', 'tms-duizhang/view', '对账权限', '对账信息', '1', '180.106.10.236', 'admin', '2018-11-23 16:09:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('939', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.106.10.236', 'admin', '2018-11-23 16:09:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('940', 'tms-duizhang', 'update', 'tms-duizhang/update', '对账权限', '对账信息', '1', '180.106.10.236', 'admin', '2018-11-23 16:09:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('941', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.106.10.236', 'admin', '2018-11-23 16:09:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('942', 'tms-duizhang', 'create', 'tms-duizhang/create', '对账权限', '对账信息', '1', '180.106.10.236', 'admin', '2018-11-23 16:09:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('943', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.106.10.236', 'admin', '2018-11-23 16:09:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('944', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-23 16:41:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('945', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-23 16:41:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('946', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-23 16:44:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('947', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-23 16:44:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('948', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '180.106.10.236', 'admin', '2018-11-23 16:44:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('949', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '180.106.10.236', 'admin', '2018-11-23 16:44:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('950', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-23 16:44:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('951', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-23 16:44:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('952', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-23 16:44:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('953', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-23 16:44:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('954', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-23 16:45:10');
INSERT INTO `wokav_rbac_admin_log` VALUES ('955', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-23 16:45:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('956', 'admin-right', 'update', 'admin-right/update', '菜单用户权限', '菜单管理', '路由添加', '180.106.10.236', 'admin', '2018-11-23 16:45:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('957', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-23 16:45:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('958', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-23 16:45:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('959', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-23 16:46:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('960', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-23 16:46:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('961', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-23 16:46:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('962', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-23 16:46:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('963', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '180.106.10.236', 'test01', '2018-11-23 16:46:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('964', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '180.106.10.236', 'test01', '2018-11-23 16:46:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('965', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'test01', '2018-11-23 16:46:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('966', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '180.106.10.236', 'test01', '2018-11-23 16:46:52');
INSERT INTO `wokav_rbac_admin_log` VALUES ('967', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.106.10.236', 'test01', '2018-11-23 16:47:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('968', 'tms-duizhang', 'view', 'tms-duizhang/view', '对账权限', '对账信息', '1', '180.106.10.236', 'test01', '2018-11-23 16:47:15');
INSERT INTO `wokav_rbac_admin_log` VALUES ('969', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.106.10.236', 'test01', '2018-11-23 16:47:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('970', 'tms-duizhang', 'update', 'tms-duizhang/update', '对账权限', '对账信息', '1', '180.106.10.236', 'test01', '2018-11-23 16:47:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('971', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.106.10.236', 'admin', '2018-11-26 09:20:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('972', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'admin', '2018-11-26 09:20:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('973', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '180.106.10.236', 'admin', '2018-11-26 09:20:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('974', 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '180.106.10.236', 'admin', '2018-11-27 16:06:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('975', 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '180.106.10.236', 'admin', '2018-11-27 16:06:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('976', 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '180.106.10.236', 'admin', '2018-11-27 16:06:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('977', 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '180.106.10.236', 'admin', '2018-11-27 16:06:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('978', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:20:10');
INSERT INTO `wokav_rbac_admin_log` VALUES ('979', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:20:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('980', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test01', '2018-11-27 16:21:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('981', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '115.215.132.152', 'test01', '2018-11-27 16:21:15');
INSERT INTO `wokav_rbac_admin_log` VALUES ('982', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:21:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('983', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:21:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('984', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:21:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('985', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:22:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('986', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:22:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('987', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:22:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('988', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:22:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('989', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:22:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('990', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:22:50');
INSERT INTO `wokav_rbac_admin_log` VALUES ('991', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '115.215.132.152', 'test01', '2018-11-27 16:22:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('992', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '115.215.132.152', 'test01', '2018-11-27 16:22:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('993', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:23:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('994', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:24:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('995', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:24:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('996', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:24:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('997', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:25:10');
INSERT INTO `wokav_rbac_admin_log` VALUES ('998', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:25:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('999', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:25:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1000', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:26:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1001', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '115.215.132.152', 'test01', '2018-11-27 16:27:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1002', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '115.215.132.152', 'test01', '2018-11-27 16:27:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1003', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:27:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1004', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:28:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1005', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:28:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1006', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:29:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1007', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:29:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1008', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test01', '2018-11-27 16:30:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1009', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test01', '2018-11-27 16:30:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1010', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '115.215.132.152', 'test01', '2018-11-27 16:30:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1011', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '115.215.132.152', 'test01', '2018-11-27 16:30:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1012', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '115.215.132.152', 'test01', '2018-11-27 16:31:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1013', 'tms-duizhang', 'update', 'tms-duizhang/update', '对账权限', '对账信息', '1', '115.215.132.152', 'test01', '2018-11-27 16:31:10');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1014', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:31:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1015', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:31:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1016', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:31:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1017', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:31:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1018', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:31:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1019', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-27 16:31:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1020', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test01', '2018-11-27 16:31:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1021', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-27 16:32:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1022', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test01', '2018-11-27 16:32:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1023', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test01', '2018-11-27 16:32:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1024', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test01', '2018-11-27 16:32:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1025', 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-27 16:32:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1026', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-27 16:32:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1027', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '115.215.132.152', 'test01', '2018-11-27 16:32:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1028', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-27 16:32:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1029', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '115.215.132.152', 'test01', '2018-11-27 16:32:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1030', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-27 16:32:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1031', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-27 16:32:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1032', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test01', '2018-11-27 16:32:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1033', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-27 16:32:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1034', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test01', '2018-11-27 16:32:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1035', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-27 16:32:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1036', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:32:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1037', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:32:52');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1038', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:32:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1039', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:33:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1040', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:33:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1041', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-27 16:33:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1042', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:33:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1043', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:33:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1044', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-27 16:33:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1045', 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-27 16:33:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1046', 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-27 16:33:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1047', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:33:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1048', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test01', '2018-11-27 16:33:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1049', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-27 16:33:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1050', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:34:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1051', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-27 16:34:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1052', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test02', '2018-11-27 16:34:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1053', 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '180.106.10.236', 'admin', '2018-11-27 16:34:13');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1054', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:34:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1055', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test02', '2018-11-27 16:34:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1056', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test02', '2018-11-27 16:34:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1057', 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:34:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1058', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:34:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1059', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-27 16:34:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1060', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:34:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1061', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:34:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1062', 'admin-user-role', 'view', 'admin-user-role/view', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-27 16:34:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1063', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test03', '2018-11-27 16:34:52');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1064', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test03', '2018-11-27 16:34:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1065', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:34:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1066', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-27 16:35:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1067', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test03', '2018-11-27 16:35:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1068', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test03', '2018-11-27 16:35:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1069', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test03', '2018-11-27 16:35:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1070', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-27 16:35:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1071', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '115.215.132.152', 'test03', '2018-11-27 16:35:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1072', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '115.215.132.152', 'test03', '2018-11-27 16:35:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1073', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-27 16:35:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1074', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-27 16:35:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1075', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:35:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1076', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test03', '2018-11-27 16:35:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1077', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test03', '2018-11-27 16:35:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1078', 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-27 16:35:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1079', 'admin-user-role', 'view', 'admin-user-role/view', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-27 16:35:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1080', 'admin-user-role', 'view', 'admin-user-role/view', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-27 16:35:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1081', 'admin-user-role', 'view', 'admin-user-role/view', '菜单用户权限', '角色管理', '分配用户', '180.106.10.236', 'admin', '2018-11-27 16:35:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1082', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-27 16:36:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1083', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:36:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1084', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:36:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1085', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-27 16:36:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1086', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:36:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1087', 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:36:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1088', 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:36:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1089', 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:37:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1090', 'admin-role', 'update', 'admin-role/update', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:37:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1091', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:37:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1092', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.10.236', 'admin', '2018-11-27 16:37:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1093', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-27 16:37:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1094', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-27 16:37:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1095', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-27 16:37:15');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1096', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-27 16:37:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1097', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:38:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1098', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:38:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1099', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:38:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1100', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-27 16:38:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1101', 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-27 16:38:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1102', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-27 16:38:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1103', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-27 16:38:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1104', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-27 16:38:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1105', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-27 16:39:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1106', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-27 16:39:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1107', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test03', '2018-11-27 16:39:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1108', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '115.215.132.152', 'test03', '2018-11-27 16:40:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1109', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:43:13');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1110', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '115.215.132.152', 'test03', '2018-11-27 16:43:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1111', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '115.215.132.152', 'test03', '2018-11-27 16:45:50');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1112', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:48:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1113', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:48:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1114', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:50:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1115', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:50:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1116', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:50:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1117', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:51:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1118', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:54:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1119', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '115.215.132.152', 'test03', '2018-11-27 16:55:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1120', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:55:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1121', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:55:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1122', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:55:50');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1123', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '115.215.132.152', 'test03', '2018-11-27 16:55:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1124', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '115.215.132.152', 'test03', '2018-11-27 16:56:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1125', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '115.215.132.152', 'test03', '2018-11-27 16:56:13');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1126', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:56:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1127', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test03', '2018-11-27 16:56:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1128', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test03', '2018-11-27 16:56:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1129', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 16:56:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1130', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 16:57:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1131', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 16:57:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1132', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '115.215.132.152', 'test03', '2018-11-27 16:57:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1133', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '115.215.132.152', 'test03', '2018-11-27 16:57:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1134', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 16:57:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1135', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 16:57:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1136', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 16:57:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1137', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 16:57:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1138', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '180.106.10.236', 'admin', '2018-11-27 16:57:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1139', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'admin', '2018-11-27 16:58:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1140', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'admin', '2018-11-27 16:58:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1141', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'admin', '2018-11-27 16:58:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1142', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'admin', '2018-11-27 16:58:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1143', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'admin', '2018-11-27 16:58:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1144', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'admin', '2018-11-27 16:58:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1145', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'admin', '2018-11-27 16:58:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1146', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'admin', '2018-11-27 16:58:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1147', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'admin', '2018-11-27 16:58:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1148', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'admin', '2018-11-27 16:58:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1149', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '180.106.10.236', 'admin', '2018-11-27 16:58:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1150', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 16:58:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1151', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.106.10.236', 'admin', '2018-11-27 17:00:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1152', 'tms-duizhang', 'update', 'tms-duizhang/update', '对账权限', '对账信息', '1', '180.106.10.236', 'admin', '2018-11-27 17:00:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1153', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'admin', '2018-11-27 17:00:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1154', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 17:01:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1155', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 17:01:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1156', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '115.215.132.152', 'test03', '2018-11-27 17:05:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1157', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test03', '2018-11-27 17:05:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1158', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test03', '2018-11-27 17:06:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1159', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '115.215.132.152', 'test03', '2018-11-27 17:06:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1160', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '115.215.132.152', 'test03', '2018-11-27 17:06:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1161', 'tms-duizhang', 'view', 'tms-duizhang/view', '对账权限', '对账信息', '1', '115.215.132.152', 'test03', '2018-11-27 17:07:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1162', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '115.215.132.152', 'test03', '2018-11-27 17:07:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1163', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 17:08:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1164', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '115.215.132.152', 'test03', '2018-11-27 17:08:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1165', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '115.215.132.152', 'test03', '2018-11-27 17:08:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1166', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 17:08:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1167', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 17:08:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1168', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 17:08:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1169', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '115.215.132.152', 'test03', '2018-11-27 17:09:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1170', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '115.215.132.152', 'test03', '2018-11-27 17:09:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1171', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 17:10:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1172', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '115.215.132.152', 'test03', '2018-11-27 17:10:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1173', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 17:11:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1174', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 17:11:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1175', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-27 17:28:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1176', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-27 17:28:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1177', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-27 17:28:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1178', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-27 17:29:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1179', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-27 17:29:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1180', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-27 17:29:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1181', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-27 17:29:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1182', 'admin-right', 'update', 'admin-right/update', '菜单用户权限', '菜单管理', '路由添加', '180.106.10.236', 'admin', '2018-11-27 17:29:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1183', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-27 17:29:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1184', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-27 17:29:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1185', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 17:30:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1186', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-27 17:30:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1187', 'tms-order', 'create', 'tms-order/create', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-27 17:30:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1188', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-27 17:31:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1189', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-27 17:31:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1190', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-27 17:31:50');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1191', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-27 17:32:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1192', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-27 17:32:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1193', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '180.106.10.236', 'test01', '2018-11-27 17:33:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1194', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'test01', '2018-11-27 17:33:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1195', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.106.10.236', 'test01', '2018-11-27 17:33:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1196', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.106.10.236', 'test01', '2018-11-27 17:33:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1197', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'test01', '2018-11-27 17:34:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1198', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.106.10.236', 'test01', '2018-11-27 17:36:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1199', 'tms-duizhang', 'update', 'tms-duizhang/update', '对账权限', '对账信息', '1', '180.106.10.236', 'test01', '2018-11-27 17:36:52');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1200', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-27 17:37:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1201', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.10.236', 'test01', '2018-11-27 17:38:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1202', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '180.106.10.236', 'test01', '2018-11-27 17:38:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1203', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '180.106.10.236', 'test01', '2018-11-27 17:38:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1204', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '180.106.10.236', 'test01', '2018-11-27 17:38:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1205', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-27 17:38:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1206', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-27 17:39:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1207', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-27 17:39:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1208', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-27 17:39:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1209', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-27 17:39:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1210', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-27 17:39:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1211', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-27 17:39:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1212', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-27 17:39:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1213', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-27 17:40:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1214', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-27 17:40:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1215', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-27 17:40:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1216', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-27 17:40:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1217', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-27 17:40:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1218', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-27 17:40:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1219', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'test01', '2018-11-27 17:41:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1220', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'test01', '2018-11-27 17:41:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1221', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.10.236', 'admin', '2018-11-27 17:42:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1222', 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-27 17:42:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1223', 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '180.106.10.236', 'admin', '2018-11-27 17:42:15');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1224', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-27 17:42:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1225', 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-27 17:42:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1226', 'admin-right', 'update', 'admin-right/update', '菜单用户权限', '菜单管理', '路由添加', '180.106.10.236', 'admin', '2018-11-27 17:42:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1227', 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '180.106.10.236', 'admin', '2018-11-27 17:42:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1228', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 17:42:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1229', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 17:42:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1230', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 17:42:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1231', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 17:43:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1232', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 17:43:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1233', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 17:43:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1234', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 17:43:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1235', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 17:43:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1236', 'tms-kefu', 'view', 'tms-kefu/view', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 17:43:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1237', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 17:43:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1238', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 17:44:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1239', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 17:44:20');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1240', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 17:44:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1241', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 17:44:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1242', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 17:44:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1243', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 17:44:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1244', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 17:44:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1245', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 17:44:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1246', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 17:45:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1247', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 17:45:03');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1248', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 17:45:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1249', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 17:45:13');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1250', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 17:45:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1251', 'tms-kefu', 'view', 'tms-kefu/view', '客服', '客服列表', 'lb', '180.106.10.236', 'admin', '2018-11-27 17:45:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1252', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.10.236', 'admin', '2018-11-27 17:45:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1253', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:25:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1254', 'tms-order', 'create', 'tms-order/create', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:26:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1255', 'tms-order', 'create', 'tms-order/create', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:30:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1256', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:30:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1257', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '114.102.145.38', 'test03', '2018-11-28 10:31:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1258', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:33:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1259', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:33:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1260', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 10:33:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1261', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 10:33:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1262', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 10:33:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1263', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 10:34:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1264', 'tms-duizhang', 'view', 'tms-duizhang/view', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 10:34:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1265', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '114.102.145.38', 'test03', '2018-11-28 10:34:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1266', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '114.102.145.38', 'test03', '2018-11-28 10:36:18');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1267', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:36:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1268', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 10:38:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1269', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:38:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1270', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:40:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1271', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '114.102.145.38', 'test03', '2018-11-28 10:40:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1272', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 10:41:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1273', 'tms-duizhang', 'view', 'tms-duizhang/view', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 10:41:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1274', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:41:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1275', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:41:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1276', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:42:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1277', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:42:15');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1278', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:42:27');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1279', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:42:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1280', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '114.102.145.38', 'test03', '2018-11-28 10:42:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1281', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '114.102.145.38', 'test03', '2018-11-28 10:42:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1282', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:42:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1283', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:42:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1284', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:43:02');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1285', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:43:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1286', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:44:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1287', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:44:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1288', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:44:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1289', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:44:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1290', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 10:45:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1291', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 10:45:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1292', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 10:45:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1293', 'tms-duizhang', 'update', 'tms-duizhang/update', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 10:45:13');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1294', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '114.102.145.38', 'test03', '2018-11-28 10:47:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1295', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:49:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1296', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:51:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1297', 'tms-order', 'create', 'tms-order/create', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:51:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1298', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:53:28');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1299', 'tms-order', 'create', 'tms-order/create', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:53:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1300', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:57:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1301', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:57:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1302', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:57:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1303', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:57:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1304', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:58:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1305', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:58:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1306', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:58:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1307', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '114.102.145.38', 'test03', '2018-11-28 10:58:24');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1308', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '114.102.145.38', 'test03', '2018-11-28 10:58:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1309', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 10:58:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1310', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '114.102.145.38', 'test03', '2018-11-28 10:58:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1311', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '114.102.145.38', 'test03', '2018-11-28 10:58:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1312', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 11:00:34');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1313', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 11:00:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1314', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 11:03:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1315', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '114.102.145.38', 'test03', '2018-11-28 11:03:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1316', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 11:03:49');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1317', 'tms-duizhang', 'update', 'tms-duizhang/update', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 11:03:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1318', 'tms-duizhang', 'update', 'tms-duizhang/update', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 11:04:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1319', 'tms-duizhang', 'view', 'tms-duizhang/view', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 11:04:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1320', 'tms-duizhang', 'update', 'tms-duizhang/update', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 11:04:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1321', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 11:04:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1322', 'tms-duizhang', 'create', 'tms-duizhang/create', '对账权限', '对账信息', '1', '114.102.145.38', 'test03', '2018-11-28 11:05:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1323', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.102.145.38', 'test03', '2018-11-28 11:05:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1324', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '114.102.145.38', 'test03', '2018-11-28 11:08:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1325', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '114.102.145.38', 'test03', '2018-11-28 11:08:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1326', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.11.132', 'admin', '2018-11-28 14:34:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1327', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.11.132', 'admin', '2018-11-28 14:34:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1328', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.11.132', 'admin', '2018-11-28 14:48:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1329', 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '180.106.11.132', 'admin', '2018-11-28 14:58:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1330', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.11.132', 'admin', '2018-11-28 14:58:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1331', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.11.132', 'admin', '2018-11-28 14:58:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1332', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '180.106.11.132', 'admin', '2018-11-28 16:14:40');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1333', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.11.132', 'admin', '2018-11-28 16:15:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1334', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.11.132', 'admin', '2018-11-28 16:55:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1335', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.11.132', 'admin', '2018-11-28 17:07:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1336', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.11.132', 'admin', '2018-11-28 17:07:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1337', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.11.132', 'admin', '2018-11-28 17:07:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1338', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.106.11.132', 'admin', '2018-11-28 17:07:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1339', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '180.106.11.132', 'admin', '2018-11-28 17:07:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1340', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '180.106.11.132', 'admin', '2018-11-28 17:08:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1341', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '180.106.11.132', 'admin', '2018-11-28 17:08:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1342', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.11.132', 'admin', '2018-11-28 17:08:11');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1343', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.106.11.132', 'admin', '2018-11-28 17:08:13');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1344', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.106.11.132', 'admin', '2018-11-28 17:08:13');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1345', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.106.11.132', 'admin', '2018-11-29 10:12:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1346', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.11.132', 'admin', '2018-11-29 10:12:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1347', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '180.106.11.132', 'admin', '2018-11-29 10:12:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1348', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.11.132', 'admin', '2018-11-29 10:12:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1349', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.106.11.132', 'admin', '2018-11-29 10:12:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1350', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.225.200.84', 'test02', '2018-11-29 11:11:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1351', 'tms-order', 'create', 'tms-order/create', '调度管理', '调度订单', '订单列表', '114.225.200.84', 'test02', '2018-11-29 11:11:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1352', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.225.200.84', 'test02', '2018-11-29 11:11:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1353', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '114.225.200.84', 'test02', '2018-11-29 11:12:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1354', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '114.225.200.84', 'test02', '2018-11-29 11:12:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1355', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '114.225.200.84', 'test02', '2018-11-29 11:12:52');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1356', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '49.67.58.78', 'test02', '2018-11-29 11:12:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1357', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '114.225.200.84', 'test02', '2018-11-29 11:13:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1358', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '114.225.200.84', 'test02', '2018-11-29 11:13:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1359', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '114.225.200.84', 'test02', '2018-11-29 11:13:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1360', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '49.67.58.78', 'test02', '2018-11-29 11:13:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1361', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '114.225.200.84', 'test02', '2018-11-29 11:14:04');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1362', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '114.225.200.84', 'test02', '2018-11-29 11:14:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1363', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '49.67.58.78', 'test02', '2018-11-29 11:14:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1364', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '49.67.58.78', 'test02', '2018-11-29 11:14:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1365', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '114.225.200.84', 'test02', '2018-11-29 11:14:16');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1366', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '114.225.200.84', 'test02', '2018-11-29 11:14:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1367', 'tms-order', 'create', 'tms-order/create', '调度管理', '调度订单', '订单列表', '49.67.58.78', 'test02', '2018-11-29 11:14:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1368', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '114.225.200.84', 'test02', '2018-11-29 11:14:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1369', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '114.225.200.84', 'test02', '2018-11-29 11:14:38');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1370', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '114.225.200.84', 'test02', '2018-11-29 11:14:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1371', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '114.225.200.84', 'test02', '2018-11-29 11:14:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1372', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '114.225.200.84', 'test02', '2018-11-29 11:15:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1373', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '114.225.200.84', 'test02', '2018-11-29 11:15:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1374', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '114.225.200.84', 'test02', '2018-11-29 11:15:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1375', 'tms-duizhang', 'view', 'tms-duizhang/view', '对账权限', '对账信息', '1', '114.225.200.84', 'test02', '2018-11-29 11:15:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1376', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '114.225.200.84', 'test02', '2018-11-29 11:15:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1377', 'tms-duizhang', 'update', 'tms-duizhang/update', '对账权限', '对账信息', '1', '114.225.200.84', 'test02', '2018-11-29 11:15:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1378', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '114.225.200.84', 'test02', '2018-11-29 11:15:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1379', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '114.225.200.84', 'test02', '2018-11-29 11:15:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1380', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.225.200.84', 'test02', '2018-11-29 11:15:52');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1381', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '114.225.200.84', 'test02', '2018-11-29 11:15:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1382', 'tms-order', 'create', 'tms-order/create', '调度管理', '调度订单', '订单列表', '49.67.58.78', 'test02', '2018-11-29 11:20:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1383', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '49.67.58.78', 'test02', '2018-11-29 11:20:48');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1384', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '49.67.58.78', 'test02', '2018-11-29 11:20:55');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1385', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '49.67.58.78', 'test02', '2018-11-29 11:21:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1386', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '49.67.58.78', 'test02', '2018-11-29 11:21:00');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1387', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '49.67.58.78', 'test02', '2018-11-29 11:21:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1388', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '49.67.58.78', 'test02', '2018-11-29 11:21:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1389', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '49.67.58.78', 'test02', '2018-11-29 11:21:17');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1390', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.11.132', 'test02', '2018-11-29 11:24:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1391', 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '180.106.11.132', 'admin', '2018-11-29 14:52:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1392', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.115.62.42', 'test02', '2018-11-29 15:08:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1393', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '180.115.62.42', 'test02', '2018-11-29 15:09:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1394', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.115.62.42', 'test02', '2018-11-29 15:09:42');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1395', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.115.62.42', 'test02', '2018-11-29 15:09:46');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1396', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.115.62.42', 'test02', '2018-11-29 15:09:50');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1397', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.115.62.42', 'test02', '2018-11-29 15:09:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1398', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '180.115.62.42', 'test02', '2018-11-29 15:09:56');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1399', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '180.115.62.42', 'test02', '2018-11-29 15:09:58');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1400', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '180.115.62.42', 'test02', '2018-11-29 15:09:59');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1401', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '180.115.62.42', 'test02', '2018-11-29 15:10:01');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1402', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '180.115.62.42', 'test02', '2018-11-29 15:10:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1403', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.9.84', 'admin', '2018-12-06 13:45:06');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1404', 'tms-order', 'create', 'tms-order/create', '调度管理', '调度订单', '订单列表', '180.106.9.84', 'admin', '2018-12-06 13:45:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1405', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.9.84', 'admin', '2018-12-06 15:57:29');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1406', 'tms-order', 'create', 'tms-order/create', '调度管理', '调度订单', '订单列表', '180.106.9.84', 'admin', '2018-12-06 15:57:32');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1407', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.9.84', 'admin', '2018-12-06 16:00:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1408', 'tms-order', 'create', 'tms-order/create', '调度管理', '调度订单', '订单列表', '180.106.9.84', 'admin', '2018-12-06 16:04:53');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1409', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.9.84', 'admin', '2018-12-06 16:05:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1410', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.9.84', 'admin', '2018-12-06 16:05:26');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1411', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.9.84', 'admin', '2018-12-06 16:05:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1412', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.9.84', 'admin', '2018-12-06 16:05:31');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1413', 'tms-order', 'create', 'tms-order/create', '调度管理', '调度订单', '订单列表', '180.106.9.84', 'admin', '2018-12-06 16:05:39');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1414', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.9.84', 'admin', '2018-12-06 16:05:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1415', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.9.84', 'admin', '2018-12-06 17:18:12');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1416', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '180.106.9.84', 'admin', '2018-12-06 17:18:33');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1417', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '36.57.182.144', 'test03', '2018-12-12 10:45:19');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1418', 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '114.217.32.48', 'admin', '2018-12-18 12:48:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1419', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.225.166.38', 'test02', '2018-12-18 14:52:57');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1420', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '114.225.166.38', 'test02', '2018-12-18 14:53:10');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1421', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.225.166.38', 'test02', '2018-12-18 14:53:14');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1422', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.225.166.38', 'test02', '2018-12-18 14:53:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1423', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '114.225.166.38', 'test02', '2018-12-18 14:53:25');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1424', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '114.225.166.38', 'test02', '2018-12-18 14:53:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1425', 'tms-duizhang', 'index', 'tms-duizhang/index', '对账权限', '对账信息', '1', '114.225.166.38', 'test02', '2018-12-18 14:53:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1426', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.225.166.38', 'test02', '2018-12-18 14:53:51');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1427', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '114.225.166.38', 'test02', '2018-12-18 14:53:54');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1428', 'tms-yingshou', 'index', 'tms-yingshou/index', '应收权限', '应收订单管理', '1', '114.225.166.38', 'test02', '2018-12-18 14:54:07');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1429', 'tms-yingshou', 'update', 'tms-yingshou/update', '应收权限', '应收订单管理', '1', '114.225.166.38', 'test02', '2018-12-18 14:54:09');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1430', 'tms-yingfu', 'index', 'tms-yingfu/index', '应付权限', '应付订单管理', '1', '114.225.166.38', 'test02', '2018-12-18 14:54:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1431', 'tms-yingfu', 'update', 'tms-yingfu/update', '应付权限', '应付订单管理', '1', '114.225.166.38', 'test02', '2018-12-18 14:54:37');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1432', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.225.166.38', 'test02', '2018-12-18 14:55:44');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1433', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '114.225.166.38', 'test02', '2018-12-18 14:55:47');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1434', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.217.32.48', 'admin', '2018-12-18 15:10:43');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1435', 'tms-order', 'create', 'tms-order/create', '调度管理', '调度订单', '订单列表', '114.217.32.48', 'admin', '2018-12-18 15:10:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1436', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.217.32.48', 'admin', '2018-12-18 15:12:05');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1437', 'tms-order', 'create', 'tms-order/create', '调度管理', '调度订单', '订单列表', '114.217.32.48', 'admin', '2018-12-18 15:12:08');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1438', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.217.32.48', 'admin', '2018-12-18 15:12:21');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1439', 'tms-order', 'create', 'tms-order/create', '调度管理', '调度订单', '订单列表', '114.217.32.48', 'admin', '2018-12-18 15:12:22');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1440', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '114.217.32.48', 'admin', '2018-12-18 16:25:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1441', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '114.217.32.48', 'admin', '2018-12-18 16:25:35');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1442', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '114.217.32.48', 'admin', '2018-12-18 16:28:23');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1443', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.217.32.48', 'admin', '2018-12-18 16:28:30');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1444', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '114.217.32.48', 'admin', '2018-12-18 16:28:36');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1445', 'tms-order', 'update', 'tms-order/update', '调度管理', '调度订单', '订单列表', '114.217.32.48', 'admin', '2018-12-18 16:28:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1446', 'tms-order', 'index', 'tms-order/index', '调度管理', '调度订单', '订单列表', '114.217.32.48', 'admin', '2018-12-18 16:28:41');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1447', 'tms-kefu', 'index', 'tms-kefu/index', '客服', '客服列表', 'lb', '114.217.32.48', 'admin', '2018-12-18 16:28:45');
INSERT INTO `wokav_rbac_admin_log` VALUES ('1448', 'tms-kefu', 'update', 'tms-kefu/update', '客服', '客服列表', 'lb', '114.217.32.48', 'admin', '2018-12-18 16:28:47');

-- ----------------------------
-- Table structure for wokav_rbac_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `wokav_rbac_admin_menu`;
CREATE TABLE `wokav_rbac_admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) NOT NULL COMMENT 'code',
  `menu_name` varchar(200) NOT NULL COMMENT '名称',
  `module_id` int(11) NOT NULL COMMENT '模块id',
  `display_label` varchar(200) DEFAULT NULL COMMENT '显示名',
  `des` varchar(400) DEFAULT NULL COMMENT '描述',
  `display_order` int(5) DEFAULT NULL COMMENT '显示顺序',
  `entry_right_name` varchar(50) DEFAULT NULL COMMENT '入口地址名称',
  `entry_url` varchar(200) NOT NULL COMMENT '入口地址',
  `action` varchar(50) NOT NULL COMMENT '操作ID',
  `controller` varchar(100) NOT NULL COMMENT '控制器ID',
  `has_lef` varchar(1) NOT NULL DEFAULT 'n' COMMENT '是否有子',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_code` (`code`),
  KEY `fk_module_id` (`module_id`),
  CONSTRAINT `fk_module_id` FOREIGN KEY (`module_id`) REFERENCES `wokav_rbac_admin_module` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wokav_rbac_admin_menu
-- ----------------------------
INSERT INTO `wokav_rbac_admin_menu` VALUES ('1', 'menu_manger', '菜单管理', '1', '菜单管理', '菜单管理', '1', '菜单管理', 'admin-module/index', 'index', 'backend\\controllers\\AdminMenuController', 'n', 'admin', '2016-08-11 16:44:11', 'admin', '2016-08-11 16:44:11');
INSERT INTO `wokav_rbac_admin_menu` VALUES ('2', 'menu_role', '角色管理', '1', '角色管理', '角色管理', '2', '角色管理', 'admin-role/index', 'index', 'backend\\controllers\\AdminRoleController', 'n', 'admin', '2016-08-11 16:51:56', 'admin', '2016-08-11 16:51:56');
INSERT INTO `wokav_rbac_admin_menu` VALUES ('3', 'menu_user', '用户管理', '1', '用户管理', '用户管理', '3', '用户管理', 'admin-user/index', 'index', 'backend\\controllers\\AdminUserController', 'n', 'admin', '2016-08-11 16:58:43', 'admin', '2016-08-11 16:58:43');
INSERT INTO `wokav_rbac_admin_menu` VALUES ('4', 'coazaorizhi', '操作日志', '2', '操作日志', '操作日志', '1', '', 'admin-log/index', 'index', 'backend\\controllers\\AdminLogController', 'n', 'test', '2016-08-14 06:54:17', 'test', '2016-08-14 06:54:17');
INSERT INTO `wokav_rbac_admin_menu` VALUES ('6', 'tms_order', '调度订单', '4', '调度订单', '调度订单', '1', '调度订单', 'tms-order/index', 'index', 'backend\\controllers\\TmsOrderController', 'n', 'admin', '2018-11-16 09:55:18', 'admin', '2018-11-16 09:55:18');
INSERT INTO `wokav_rbac_admin_menu` VALUES ('11', '客服列表', '客服列表', '5', '客服列表', '客服列表', '21', '客服列表', 'tms-kefu/index', 'index', 'backend\\controllers\\TmsKefuController', 'n', 'admin', '2018-11-20 15:17:40', 'admin', '2018-11-20 15:17:40');
INSERT INTO `wokav_rbac_admin_menu` VALUES ('12', '应收订单管理', '应收订单管理', '6', '应收订单管理', '应收订单管理', '1', '应收订单管理', 'tms-yingshou/index', 'index', 'backend\\controllers\\TmsYingshouController', 'n', 'admin', '2018-11-21 16:43:53', 'admin', '2018-11-21 16:43:53');
INSERT INTO `wokav_rbac_admin_menu` VALUES ('13', '应付订单管理', '应付订单管理', '7', '应付订单管理', '应收订单应付订单管理', null, '应付订单管理', 'tms-yingfu/index', 'index', 'backend\\controllers\\TmsYingfuController', 'n', 'admin', '2018-11-21 16:47:30', 'admin', '2018-11-21 16:47:30');
INSERT INTO `wokav_rbac_admin_menu` VALUES ('14', '对账信息', '对账信息', '8', '对账信息', '对账信息', null, '对账信息', 'tms-duizhang/index', 'index', 'backend\\controllers\\TmsDuizhangController', 'n', 'admin', '2018-11-21 16:48:49', 'admin', '2018-11-21 16:48:49');

-- ----------------------------
-- Table structure for wokav_rbac_admin_message
-- ----------------------------
DROP TABLE IF EXISTS `wokav_rbac_admin_message`;
CREATE TABLE `wokav_rbac_admin_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `msg` varchar(1000) DEFAULT NULL COMMENT '留言内容',
  `expiry_days` int(5) unsigned DEFAULT NULL COMMENT '有效天数',
  `create_user` varchar(50) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wokav_rbac_admin_message
-- ----------------------------
INSERT INTO `wokav_rbac_admin_message` VALUES ('1', '测试文本', '1', 'admin', '2014-11-21 18:47:20', 'admin', '2014-11-21 18:47:27');

-- ----------------------------
-- Table structure for wokav_rbac_admin_module
-- ----------------------------
DROP TABLE IF EXISTS `wokav_rbac_admin_module`;
CREATE TABLE `wokav_rbac_admin_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) NOT NULL COMMENT 'code',
  `display_label` varchar(200) NOT NULL COMMENT '显示名称',
  `has_lef` varchar(1) NOT NULL DEFAULT 'n' COMMENT '是否有子',
  `des` varchar(400) DEFAULT NULL COMMENT '描述',
  `entry_url` varchar(100) DEFAULT NULL COMMENT '入口地址',
  `display_order` int(5) DEFAULT NULL COMMENT '顺序',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wokav_rbac_admin_module
-- ----------------------------
INSERT INTO `wokav_rbac_admin_module` VALUES ('1', 'menu_manage', '菜单用户权限', 'n', '菜单管理', '', '1', 'admin', '2016-08-11 15:26:21', 'admin', '2016-08-11 16:31:08');
INSERT INTO `wokav_rbac_admin_module` VALUES ('2', 'rizhimaanage', '日志管理', 'n', '日志管理', '', '2', 'test', '2016-08-14 06:53:13', 'test', '2016-08-14 06:53:13');
INSERT INTO `wokav_rbac_admin_module` VALUES ('4', 'tms_order', '调度管理', 'n', '调度订单', null, '1', 'admin', '2018-11-16 09:51:26', 'admin', '2018-11-16 09:51:41');
INSERT INTO `wokav_rbac_admin_module` VALUES ('5', 'kefu', '客服', 'n', '客服', null, '1', 'admin', '2018-11-20 09:27:40', 'admin', '2018-11-20 15:16:59');
INSERT INTO `wokav_rbac_admin_module` VALUES ('6', 'yingshou', '应收权限', 'n', '应收权限', null, '1', 'admin', '2018-11-20 09:29:24', 'admin', '2018-11-20 09:29:24');
INSERT INTO `wokav_rbac_admin_module` VALUES ('7', 'yingfu', '应付权限', 'n', '应付权限', null, '1', 'admin', '2018-11-20 09:30:31', 'admin', '2018-11-20 09:30:31');
INSERT INTO `wokav_rbac_admin_module` VALUES ('8', 'duizhgang', '对账权限', 'n', '对账权限', null, '1', 'admin', '2018-11-20 09:31:36', 'admin', '2018-11-20 09:31:36');

-- ----------------------------
-- Table structure for wokav_rbac_admin_right
-- ----------------------------
DROP TABLE IF EXISTS `wokav_rbac_admin_right`;
CREATE TABLE `wokav_rbac_admin_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_id` int(11) NOT NULL COMMENT '功能主键',
  `right_name` varchar(200) NOT NULL COMMENT '名称',
  `display_label` varchar(200) DEFAULT NULL COMMENT '显示名',
  `des` varchar(200) DEFAULT NULL COMMENT '描述',
  `display_order` int(5) DEFAULT NULL COMMENT '显示顺序',
  `has_lef` varchar(1) NOT NULL DEFAULT 'n' COMMENT '是否有子',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_wokav_rbac_admin_right` (`menu_id`),
  KEY `index_menu_id` (`menu_id`),
  CONSTRAINT `FK_wokav_rbac_admin_right` FOREIGN KEY (`menu_id`) REFERENCES `wokav_rbac_admin_menu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wokav_rbac_admin_right
-- ----------------------------
INSERT INTO `wokav_rbac_admin_right` VALUES ('4', '2', '角色操作', '角色操作', '角色操作', '1', 'n', 'admin', '2016-08-13 17:04:40', 'admin', '2016-08-13 17:04:40');
INSERT INTO `wokav_rbac_admin_right` VALUES ('5', '2', '分配用户', '分配用户', '分配用户', '2', 'n', 'admin', '2016-08-13 17:05:04', 'test', '2016-08-14 08:22:13');
INSERT INTO `wokav_rbac_admin_right` VALUES ('6', '2', '分配权限', '分配权限', '分配权限', '3', 'n', 'admin', '2016-08-13 17:05:24', 'admin', '2016-08-13 17:05:24');
INSERT INTO `wokav_rbac_admin_right` VALUES ('7', '3', '用户操作', '用户操作', '用户操作', '1', 'n', 'admin', '2016-08-13 17:05:57', 'admin', '2016-08-13 17:05:57');
INSERT INTO `wokav_rbac_admin_right` VALUES ('8', '4', '操作', '操作', '操作', '1', 'n', 'test', '2016-08-14 06:54:38', 'test', '2016-08-14 06:54:38');
INSERT INTO `wokav_rbac_admin_right` VALUES ('13', '1', '一级菜单查看', '一级菜单查看', '一级菜单查看', '1', 'n', 'test', '2016-08-16 15:52:45', 'test', '2016-08-16 15:52:45');
INSERT INTO `wokav_rbac_admin_right` VALUES ('14', '1', '一级菜单添加', '一级菜单添加', '一级菜单添加', '2', 'n', 'test', '2016-08-16 15:53:10', 'test', '2016-08-16 15:58:30');
INSERT INTO `wokav_rbac_admin_right` VALUES ('15', '1', '一级菜单删除', '一级菜单删除', '一级菜单删除', '3', 'n', 'test', '2016-08-16 15:53:44', 'test', '2016-08-16 15:53:44');
INSERT INTO `wokav_rbac_admin_right` VALUES ('16', '1', '二级菜单查看', '二级菜单查看', '二级菜单查看', '4', 'n', 'test', '2016-08-16 15:55:02', 'test', '2016-08-16 15:55:02');
INSERT INTO `wokav_rbac_admin_right` VALUES ('17', '1', '二级菜单添加', '二级菜单修改', '二级菜单添加', '5', 'n', 'test', '2016-08-16 15:55:21', 'test', '2016-08-16 15:58:50');
INSERT INTO `wokav_rbac_admin_right` VALUES ('18', '1', '二级菜单删除', '二级菜单删除', '二级菜单删除', '6', 'n', 'test', '2016-08-16 15:55:58', 'test', '2016-08-16 15:55:58');
INSERT INTO `wokav_rbac_admin_right` VALUES ('19', '1', '路由查看', '路由查看', '路由查看', '7', 'n', 'test', '2016-08-16 15:56:32', 'test', '2016-08-16 15:57:14');
INSERT INTO `wokav_rbac_admin_right` VALUES ('20', '1', '路由添加', '路由添加', '路由添加', '8', 'n', 'test', '2016-08-16 15:57:46', 'test', '2016-08-16 15:57:46');
INSERT INTO `wokav_rbac_admin_right` VALUES ('21', '1', '路由删除', '路由删除', '路由删除', '9', 'n', 'test', '2016-08-16 15:58:05', 'test', '2016-08-16 15:58:05');
INSERT INTO `wokav_rbac_admin_right` VALUES ('22', '6', '订单列表', '订单列表', '订单列表', '1', 'n', 'admin', '2018-11-16 09:58:36', 'admin', '2018-11-27 17:29:55');
INSERT INTO `wokav_rbac_admin_right` VALUES ('27', '11', 'lb', 'lb', 'lb', '1', 'n', 'admin', '2018-11-21 16:27:17', 'admin', '2018-11-27 17:42:33');
INSERT INTO `wokav_rbac_admin_right` VALUES ('28', '12', '1', '1', '1', '1', 'n', 'admin', '2018-11-21 16:45:40', 'admin', '2018-11-21 16:45:40');
INSERT INTO `wokav_rbac_admin_right` VALUES ('29', '13', '1', '1', '1', null, 'n', 'admin', '2018-11-21 16:47:58', 'admin', '2018-11-21 16:47:58');
INSERT INTO `wokav_rbac_admin_right` VALUES ('30', '14', '1', '1', '1', null, 'n', 'admin', '2018-11-21 16:49:05', 'admin', '2018-11-21 16:49:05');

-- ----------------------------
-- Table structure for wokav_rbac_admin_right_url
-- ----------------------------
DROP TABLE IF EXISTS `wokav_rbac_admin_right_url`;
CREATE TABLE `wokav_rbac_admin_right_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `right_id` int(11) NOT NULL COMMENT 'right主键',
  `url` varchar(200) DEFAULT NULL COMMENT 'url',
  `para_name` varchar(40) DEFAULT NULL COMMENT '参数名',
  `para_value` varchar(40) DEFAULT NULL COMMENT '参数值',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_wokav_rbac_admin_right_url` (`right_id`),
  KEY `index_right_id` (`right_id`),
  CONSTRAINT `FK_wokav_rbac_admin_right_url` FOREIGN KEY (`right_id`) REFERENCES `wokav_rbac_admin_right` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wokav_rbac_admin_right_url
-- ----------------------------
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('16', '4', 'admin-role/index', 'admin-role', 'index', 'admin', '2016-08-13 17:04:40', 'admin', '2016-08-13 17:04:40');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('17', '4', 'admin-role/view', 'admin-role', 'view', 'admin', '2016-08-13 17:04:40', 'admin', '2016-08-13 17:04:40');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('18', '4', 'admin-role/create', 'admin-role', 'create', 'admin', '2016-08-13 17:04:40', 'admin', '2016-08-13 17:04:40');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('19', '4', 'admin-role/update', 'admin-role', 'update', 'admin', '2016-08-13 17:04:40', 'admin', '2016-08-13 17:04:40');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('20', '4', 'admin-role/delete', 'admin-role', 'delete', 'admin', '2016-08-13 17:04:40', 'admin', '2016-08-13 17:04:40');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('21', '4', 'admin-role/get-all-rights', 'admin-role', 'get-all-rights', 'admin', '2016-08-13 17:04:40', 'admin', '2016-08-13 17:04:40');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('22', '4', 'admin-role/save-rights', 'admin-role', 'save-rights', 'admin', '2016-08-13 17:04:40', 'admin', '2016-08-13 17:04:40');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('30', '6', 'admin-role/index', 'admin-role', 'index', 'admin', '2016-08-13 17:05:24', 'admin', '2016-08-13 17:05:24');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('31', '6', 'admin-role/view', 'admin-role', 'view', 'admin', '2016-08-13 17:05:24', 'admin', '2016-08-13 17:05:24');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('32', '6', 'admin-role/create', 'admin-role', 'create', 'admin', '2016-08-13 17:05:24', 'admin', '2016-08-13 17:05:24');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('33', '6', 'admin-role/update', 'admin-role', 'update', 'admin', '2016-08-13 17:05:24', 'admin', '2016-08-13 17:05:24');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('34', '6', 'admin-role/delete', 'admin-role', 'delete', 'admin', '2016-08-13 17:05:24', 'admin', '2016-08-13 17:05:24');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('35', '6', 'admin-role/get-all-rights', 'admin-role', 'get-all-rights', 'admin', '2016-08-13 17:05:24', 'admin', '2016-08-13 17:05:24');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('36', '6', 'admin-role/save-rights', 'admin-role', 'save-rights', 'admin', '2016-08-13 17:05:24', 'admin', '2016-08-13 17:05:24');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('37', '7', 'admin-user/index', 'admin-user', 'index', 'admin', '2016-08-13 17:05:57', 'admin', '2016-08-13 17:05:57');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('38', '7', 'admin-user/view', 'admin-user', 'view', 'admin', '2016-08-13 17:05:57', 'admin', '2016-08-13 17:05:57');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('39', '7', 'admin-user/create', 'admin-user', 'create', 'admin', '2016-08-13 17:05:57', 'admin', '2016-08-13 17:05:57');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('40', '7', 'admin-user/update', 'admin-user', 'update', 'admin', '2016-08-13 17:05:57', 'admin', '2016-08-13 17:05:57');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('41', '7', 'admin-user/delete', 'admin-user', 'delete', 'admin', '2016-08-13 17:05:57', 'admin', '2016-08-13 17:05:57');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('42', '8', 'admin-log/index', 'admin-log', 'index', 'test', '2016-08-14 06:54:38', 'test', '2016-08-14 06:54:38');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('43', '8', 'admin-log/view', 'admin-log', 'view', 'test', '2016-08-14 06:54:38', 'test', '2016-08-14 06:54:38');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('44', '8', 'admin-log/create', 'admin-log', 'create', 'test', '2016-08-14 06:54:38', 'test', '2016-08-14 06:54:38');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('45', '8', 'admin-log/update', 'admin-log', 'update', 'test', '2016-08-14 06:54:38', 'test', '2016-08-14 06:54:38');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('46', '8', 'admin-log/delete', 'admin-log', 'delete', 'test', '2016-08-14 06:54:38', 'test', '2016-08-14 06:54:38');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('81', '5', 'admin-user-role/index', 'admin-user-role', 'index', 'test', '2016-08-14 08:22:13', 'test', '2016-08-14 08:22:13');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('82', '5', 'admin-user-role/view', 'admin-user-role', 'view', 'test', '2016-08-14 08:22:13', 'test', '2016-08-14 08:22:13');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('83', '5', 'admin-user-role/create', 'admin-user-role', 'create', 'test', '2016-08-14 08:22:13', 'test', '2016-08-14 08:22:13');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('84', '5', 'admin-user-role/update', 'admin-user-role', 'update', 'test', '2016-08-14 08:22:13', 'test', '2016-08-14 08:22:13');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('85', '5', 'admin-user-role/delete', 'admin-user-role', 'delete', 'test', '2016-08-14 08:22:13', 'test', '2016-08-14 08:22:13');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('112', '13', 'admin-module/index', 'admin-module', 'index', 'test', '2016-08-16 15:52:45', 'test', '2016-08-16 15:52:45');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('113', '13', 'admin-module/view', 'admin-module', 'view', 'test', '2016-08-16 15:52:45', 'test', '2016-08-16 15:52:45');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('115', '15', 'admin-module/delete', 'admin-module', 'delete', 'test', '2016-08-16 15:53:44', 'test', '2016-08-16 15:53:44');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('118', '16', 'admin-menu/index', 'admin-menu', 'index', 'test', '2016-08-16 15:55:02', 'test', '2016-08-16 15:55:02');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('119', '16', 'admin-menu/view', 'admin-menu', 'view', 'test', '2016-08-16 15:55:02', 'test', '2016-08-16 15:55:02');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('122', '18', 'admin-menu/delete', 'admin-menu', 'delete', 'test', '2016-08-16 15:55:58', 'test', '2016-08-16 15:55:58');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('125', '19', 'admin-right/index', 'admin-right', 'index', 'test', '2016-08-16 15:57:14', 'test', '2016-08-16 15:57:14');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('126', '19', 'admin-right/view', 'admin-right', 'view', 'test', '2016-08-16 15:57:14', 'test', '2016-08-16 15:57:14');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('127', '19', 'admin-right/right-action', 'admin-right', 'right-action', 'test', '2016-08-16 15:57:14', 'test', '2016-08-16 15:57:14');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('128', '20', 'admin-right/create', 'admin-right', 'create', 'test', '2016-08-16 15:57:46', 'test', '2016-08-16 15:57:46');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('129', '20', 'admin-right/update', 'admin-right', 'update', 'test', '2016-08-16 15:57:46', 'test', '2016-08-16 15:57:46');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('130', '21', 'admin-right/delete', 'admin-right', 'delete', 'test', '2016-08-16 15:58:05', 'test', '2016-08-16 15:58:05');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('131', '14', 'admin-module/create', 'admin-module', 'create', 'test', '2016-08-16 15:58:30', 'test', '2016-08-16 15:58:30');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('132', '14', 'admin-module/update', 'admin-module', 'update', 'test', '2016-08-16 15:58:30', 'test', '2016-08-16 15:58:30');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('133', '17', 'admin-menu/create', 'admin-menu', 'create', 'test', '2016-08-16 15:58:51', 'test', '2016-08-16 15:58:51');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('134', '17', 'admin-menu/update', 'admin-menu', 'update', 'test', '2016-08-16 15:58:51', 'test', '2016-08-16 15:58:51');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('147', '28', 'tms-yingshou/index', 'tms-yingshou', 'index', 'admin', '2018-11-21 16:45:40', 'admin', '2018-11-21 16:45:40');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('148', '28', 'tms-yingshou/update', 'tms-yingshou', 'update', 'admin', '2018-11-21 16:45:40', 'admin', '2018-11-21 16:45:40');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('149', '29', 'tms-yingfu/index', 'tms-yingfu', 'index', 'admin', '2018-11-21 16:47:58', 'admin', '2018-11-21 16:47:58');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('150', '29', 'tms-yingfu/view', 'tms-yingfu', 'view', 'admin', '2018-11-21 16:47:58', 'admin', '2018-11-21 16:47:58');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('151', '29', 'tms-yingfu/update', 'tms-yingfu', 'update', 'admin', '2018-11-21 16:47:58', 'admin', '2018-11-21 16:47:58');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('152', '29', 'tms-yingfu/delete', 'tms-yingfu', 'delete', 'admin', '2018-11-21 16:47:58', 'admin', '2018-11-21 16:47:58');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('153', '30', 'tms-duizhang/index', 'tms-duizhang', 'index', 'admin', '2018-11-21 16:49:05', 'admin', '2018-11-21 16:49:05');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('154', '30', 'tms-duizhang/view', 'tms-duizhang', 'view', 'admin', '2018-11-21 16:49:05', 'admin', '2018-11-21 16:49:05');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('155', '30', 'tms-duizhang/create', 'tms-duizhang', 'create', 'admin', '2018-11-21 16:49:05', 'admin', '2018-11-21 16:49:05');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('156', '30', 'tms-duizhang/update', 'tms-duizhang', 'update', 'admin', '2018-11-21 16:49:05', 'admin', '2018-11-21 16:49:05');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('157', '30', 'tms-duizhang/delete', 'tms-duizhang', 'delete', 'admin', '2018-11-21 16:49:05', 'admin', '2018-11-21 16:49:05');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('162', '22', 'tms-order/index', 'tms-order', 'index', 'admin', '2018-11-27 17:29:55', 'admin', '2018-11-27 17:29:55');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('163', '22', 'tms-order/create', 'tms-order', 'create', 'admin', '2018-11-27 17:29:55', 'admin', '2018-11-27 17:29:55');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('164', '22', 'tms-order/update', 'tms-order', 'update', 'admin', '2018-11-27 17:29:55', 'admin', '2018-11-27 17:29:55');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('165', '27', 'tms-kefu/index', 'tms-kefu', 'index', 'admin', '2018-11-27 17:42:33', 'admin', '2018-11-27 17:42:33');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('166', '27', 'tms-kefu/view', 'tms-kefu', 'view', 'admin', '2018-11-27 17:42:33', 'admin', '2018-11-27 17:42:33');
INSERT INTO `wokav_rbac_admin_right_url` VALUES ('167', '27', 'tms-kefu/update', 'tms-kefu', 'update', 'admin', '2018-11-27 17:42:33', 'admin', '2018-11-27 17:42:33');

-- ----------------------------
-- Table structure for wokav_rbac_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `wokav_rbac_admin_role`;
CREATE TABLE `wokav_rbac_admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) NOT NULL COMMENT '角色编号',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `des` varchar(400) DEFAULT NULL COMMENT '角色描述',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wokav_rbac_admin_role
-- ----------------------------
INSERT INTO `wokav_rbac_admin_role` VALUES ('1', '超级管理员', '超级管理员', '拥有所有权限', 'test', '2016-08-12 15:33:01', 'admin', '2018-11-14 15:12:57');
INSERT INTO `wokav_rbac_admin_role` VALUES ('2', '最高权限', '最高权限', '最高权限', 'test', '2016-08-12 15:33:45', 'admin', '2018-11-14 15:13:14');
INSERT INTO `wokav_rbac_admin_role` VALUES ('4', '项目管理', '项目管理', '项目管理', 'admin', '2018-11-14 15:00:21', 'admin', '2018-11-14 15:13:30');
INSERT INTO `wokav_rbac_admin_role` VALUES ('5', '调度管理', '调度管理', '调度管理', 'admin', '2018-11-14 15:00:54', 'admin', '2018-11-27 16:37:04');
INSERT INTO `wokav_rbac_admin_role` VALUES ('6', '客服权限', '客服权限', '客服权限', 'admin', '2018-11-14 15:13:55', 'admin', '2018-11-14 15:13:55');
INSERT INTO `wokav_rbac_admin_role` VALUES ('7', '应收权限', '应收权限', '应收权限', 'admin', '2018-11-14 15:14:03', 'admin', '2018-11-14 15:14:03');
INSERT INTO `wokav_rbac_admin_role` VALUES ('8', '应付权限', '应付权限', '应付权限', 'admin', '2018-11-14 15:14:11', 'admin', '2018-11-14 15:14:11');
INSERT INTO `wokav_rbac_admin_role` VALUES ('9', '对账权限', '对账权限', '对账权限', 'admin', '2018-11-14 15:14:20', 'admin', '2018-11-14 15:14:20');

-- ----------------------------
-- Table structure for wokav_rbac_admin_role_right
-- ----------------------------
DROP TABLE IF EXISTS `wokav_rbac_admin_role_right`;
CREATE TABLE `wokav_rbac_admin_role_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NOT NULL COMMENT '角色主键',
  `right_id` int(11) NOT NULL COMMENT '权限主键',
  `full_path` varchar(250) DEFAULT NULL COMMENT '全路径',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `index_role_id` (`role_id`),
  KEY `index_right_id` (`right_id`),
  CONSTRAINT `wokav_rbac_admin_role_right_ibfk_1` FOREIGN KEY (`right_id`) REFERENCES `wokav_rbac_admin_right` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wokav_rbac_admin_role_right
-- ----------------------------
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('261', '4', '4', null, 'admin', '2018-11-20 15:06:51', 'admin', '2018-11-20 15:06:51');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('262', '4', '5', null, 'admin', '2018-11-20 15:06:51', 'admin', '2018-11-20 15:06:51');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('263', '4', '6', null, 'admin', '2018-11-20 15:06:51', 'admin', '2018-11-20 15:06:51');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('264', '4', '7', null, 'admin', '2018-11-20 15:06:51', 'admin', '2018-11-20 15:06:51');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('348', '6', '27', null, 'admin', '2018-11-21 16:27:47', 'admin', '2018-11-21 16:27:47');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('349', '5', '22', null, 'admin', '2018-11-21 16:28:56', 'admin', '2018-11-21 16:28:56');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('388', '7', '28', null, 'admin', '2018-11-21 16:50:20', 'admin', '2018-11-21 16:50:20');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('389', '8', '29', null, 'admin', '2018-11-21 16:50:28', 'admin', '2018-11-21 16:50:28');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('390', '9', '30', null, 'admin', '2018-11-21 16:50:33', 'admin', '2018-11-21 16:50:33');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('416', '2', '8', null, 'admin', '2018-11-22 09:00:10', 'admin', '2018-11-22 09:00:10');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('417', '2', '22', null, 'admin', '2018-11-22 09:00:10', 'admin', '2018-11-22 09:00:10');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('418', '2', '27', null, 'admin', '2018-11-22 09:00:10', 'admin', '2018-11-22 09:00:10');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('419', '2', '28', null, 'admin', '2018-11-22 09:00:10', 'admin', '2018-11-22 09:00:10');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('420', '2', '29', null, 'admin', '2018-11-22 09:00:10', 'admin', '2018-11-22 09:00:10');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('421', '2', '30', null, 'admin', '2018-11-22 09:00:10', 'admin', '2018-11-22 09:00:10');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('422', '1', '13', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('423', '1', '14', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('424', '1', '15', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('425', '1', '16', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('426', '1', '17', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('427', '1', '18', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('428', '1', '19', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('429', '1', '20', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('430', '1', '21', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('431', '1', '4', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('432', '1', '5', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('433', '1', '6', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('434', '1', '7', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('435', '1', '8', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('436', '1', '22', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('437', '1', '27', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('438', '1', '28', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('439', '1', '29', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');
INSERT INTO `wokav_rbac_admin_role_right` VALUES ('440', '1', '30', null, 'admin', '2018-11-22 09:00:16', 'admin', '2018-11-22 09:00:16');

-- ----------------------------
-- Table structure for wokav_rbac_admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `wokav_rbac_admin_user_role`;
CREATE TABLE `wokav_rbac_admin_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`),
  KEY `index_role_id` (`role_id`),
  CONSTRAINT `wokav_rbac_admin_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wokav_admin_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wokav_rbac_admin_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `wokav_rbac_admin_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wokav_rbac_admin_user_role
-- ----------------------------
INSERT INTO `wokav_rbac_admin_user_role` VALUES ('1', '156', '1', 'admin', '2016-08-12 17:03:13', 'admin', '2016-08-12 17:03:13');
INSERT INTO `wokav_rbac_admin_user_role` VALUES ('7', '161', '5', 'admin', '2018-11-21 16:16:23', 'admin', '2018-11-21 16:16:23');
INSERT INTO `wokav_rbac_admin_user_role` VALUES ('8', '162', '5', 'admin', '2018-11-21 16:16:33', 'admin', '2018-11-21 16:16:33');
INSERT INTO `wokav_rbac_admin_user_role` VALUES ('9', '163', '5', 'admin', '2018-11-21 16:16:48', 'admin', '2018-11-21 16:16:48');
INSERT INTO `wokav_rbac_admin_user_role` VALUES ('10', '161', '6', 'admin', '2018-11-21 16:17:45', 'admin', '2018-11-21 16:17:45');
INSERT INTO `wokav_rbac_admin_user_role` VALUES ('11', '162', '6', 'admin', '2018-11-21 16:18:01', 'admin', '2018-11-21 16:18:01');
INSERT INTO `wokav_rbac_admin_user_role` VALUES ('12', '163', '6', 'admin', '2018-11-21 16:18:12', 'admin', '2018-11-21 16:18:12');
INSERT INTO `wokav_rbac_admin_user_role` VALUES ('13', '161', '7', 'admin', '2018-11-21 16:18:38', 'admin', '2018-11-21 16:18:38');
INSERT INTO `wokav_rbac_admin_user_role` VALUES ('14', '162', '7', 'admin', '2018-11-21 16:19:24', 'admin', '2018-11-21 16:19:24');
INSERT INTO `wokav_rbac_admin_user_role` VALUES ('15', '163', '7', 'admin', '2018-11-21 16:19:37', 'admin', '2018-11-21 16:19:37');
INSERT INTO `wokav_rbac_admin_user_role` VALUES ('16', '161', '8', 'admin', '2018-11-21 16:20:03', 'admin', '2018-11-21 16:20:03');
INSERT INTO `wokav_rbac_admin_user_role` VALUES ('17', '162', '8', 'admin', '2018-11-21 16:20:14', 'admin', '2018-11-21 16:20:14');
INSERT INTO `wokav_rbac_admin_user_role` VALUES ('18', '163', '8', 'admin', '2018-11-21 16:20:27', 'admin', '2018-11-21 16:20:27');
INSERT INTO `wokav_rbac_admin_user_role` VALUES ('19', '161', '9', 'admin', '2018-11-21 16:21:14', 'admin', '2018-11-21 16:21:14');
INSERT INTO `wokav_rbac_admin_user_role` VALUES ('20', '162', '9', 'admin', '2018-11-21 16:21:25', 'admin', '2018-11-21 16:21:25');
INSERT INTO `wokav_rbac_admin_user_role` VALUES ('21', '163', '9', 'admin', '2018-11-21 16:21:40', 'admin', '2018-11-21 16:21:40');

-- ----------------------------
-- Table structure for wokav_suso_order
-- ----------------------------
DROP TABLE IF EXISTS `wokav_suso_order`;
CREATE TABLE `wokav_suso_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_sn` varchar(200) NOT NULL COMMENT '订单号',
  `transport_number` varchar(200) NOT NULL COMMENT '交运单号',
  `order_date` varchar(30) DEFAULT NULL COMMENT '下单日期',
  `shipping_date` varchar(30) DEFAULT NULL COMMENT '出货日期',
  `destination` varchar(250) DEFAULT NULL COMMENT '目的地',
  `product` varchar(50) DEFAULT NULL COMMENT '产品别',
  `tonnage` varchar(50) DEFAULT NULL COMMENT '吨位',
  `remarks` varchar(250) DEFAULT NULL COMMENT '订单备注',
  `from_id` tinyint(4) DEFAULT NULL COMMENT '订单出处',
  `plate_number` varchar(20) DEFAULT NULL COMMENT '车牌号',
  `driver` varchar(30) DEFAULT NULL COMMENT '驾驶员姓名',
  `driver_id` varchar(30) DEFAULT NULL COMMENT '驾驶员证件号',
  `driver_tel` varchar(30) DEFAULT NULL COMMENT '驾驶员电话',
  `assistant` varchar(30) DEFAULT NULL COMMENT '助手姓名',
  `assistant_id` varchar(30) DEFAULT NULL COMMENT '助手证件号',
  `carrier` varchar(30) DEFAULT NULL COMMENT '承运人',
  `carrier_tel` varchar(30) DEFAULT NULL COMMENT '承运人电话',
  `customer` varchar(250) DEFAULT NULL COMMENT '客户名称',
  `customer_user` varchar(30) DEFAULT NULL COMMENT '客户联系人',
  `customer_address` varchar(250) DEFAULT NULL COMMENT '客户地址',
  `customer_tel` varchar(30) DEFAULT NULL COMMENT '客户电话',
  `remakes_control` varchar(250) DEFAULT NULL COMMENT '调度备注',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `jydate` varchar(250) DEFAULT NULL COMMENT '交运期',
  `yjdate` varchar(250) DEFAULT NULL COMMENT '预计到货日期',
  `realdate` varchar(250) DEFAULT NULL COMMENT '实际到货日期',
  `reback` varchar(250) DEFAULT NULL COMMENT '客户反馈',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='订单信息';

-- ----------------------------
-- Records of wokav_suso_order
-- ----------------------------
INSERT INTO `wokav_suso_order` VALUES ('1', 'TF0001', 'TD0001', '2018-11-22 08:55', '2018-11-22 08:55', '苏州', '塑料粒子', '34', '', null, '苏E88888', '玄烨', '34122719990201', '13083060621', '李元霸', '34122719990202', '玄烨', '13083060621', '昆山南亚', '李世民', '苏州工业园区现代大道88号', '1308303060621', '', '1', '', '', '', '');
INSERT INTO `wokav_suso_order` VALUES ('3', '8305945', '8305945', '2018-11-21', '2018-11-21', '济南重汽', '合肥佳通', '30.2', '', null, '皖A7N887', '汪斌', '', '', '', '', '', '', '济南重汽', '', '', '', '', '0', null, null, null, null);
INSERT INTO `wokav_suso_order` VALUES ('4', 'xx73460', 'xx73460', '2018-11-22 11:40', '苏州', '上海 ', '硅片', '3', '', null, '豫Q73460', '王得文', '412829198110092016', '13723089479', '', '', '王得文', '13723089479', '苏州协鑫', '', '', '', '', '1', null, null, null, null);
INSERT INTO `wokav_suso_order` VALUES ('5', '1122', 'PAA1956', '2018-11-22 ', '', '合肥', 'ABS', '30', '长程北线', null, '皖C80139', '唐红奎', '340321197705120810', '15850882518', '陆维秀', '340403198001231026', '郭兴东', '15869310557', '塑可丽', '', '合肥高新区', '15715697948', '', '1', '', '', '2018-11-23 18:35', '');
INSERT INTO `wokav_suso_order` VALUES ('6', '1', 'PAM2210', '2018-11-23 14:50', '2018-11-23', '北京', '台化ABS', '30', '运筹中心', null, '皖C80139', '唐红奎', '340321197705120810', '15850882518', '陆维秀', '340403198001231026', '张志良', '15315813111', '中化', '', '北京密云区', '', '', '1', '2018-11-25 15:55', '2018-11-25 14:50', '2018-11-25 14:55', '完整');
INSERT INTO `wokav_suso_order` VALUES ('7', '8310483', '8310483', '2018-11-28 10:30', '2018-11-25', '烟台', '佳通轮胎', '8.07', '', null, '鲁Q721BW', '林长青', '', '17353936771', '', '', '陈伟', '', '烟台通用', '', '', '', '', '1', null, null, null, null);
INSERT INTO `wokav_suso_order` VALUES ('8', 'IMF98M811', 'RA26631', '', '2018-11-19', '上海', '胶布', '13.24', '', null, '皖M25467', '李昌洪', '', '', '', '', '天荣物流', '15962849389', '上海东辉', '', '上海市大叶公路1688号', '', '', '1', null, null, null, null);

-- ----------------------------
-- Table structure for wokav_suso_point_list
-- ----------------------------
DROP TABLE IF EXISTS `wokav_suso_point_list`;
CREATE TABLE `wokav_suso_point_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oid` int(11) NOT NULL COMMENT '订单',
  `date` varchar(30) NOT NULL COMMENT '日期',
  `info` varchar(250) NOT NULL COMMENT '在途状态',
  `addtime` int(11) NOT NULL COMMENT '添加日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wokav_suso_point_list
-- ----------------------------
INSERT INTO `wokav_suso_point_list` VALUES ('12', '1', '2018-11-22 09:03:40', '宁波已发出', '1542848682');
INSERT INTO `wokav_suso_point_list` VALUES ('13', '1', '2018-11-23 10:05:40', '已到苏州园区', '1542848721');
INSERT INTO `wokav_suso_point_list` VALUES ('14', '6', '2018-11-23 14:48:49', '江苏苏州', '1542955817');
INSERT INTO `wokav_suso_point_list` VALUES ('15', '6', '2018-11-24 17:45:49', '山东德州', '1542955843');
INSERT INTO `wokav_suso_point_list` VALUES ('16', '6', '2018-11-25 13:45:49', '北京', '1542955857');
INSERT INTO `wokav_suso_point_list` VALUES ('17', '1', '2018-12-18 16:28:47', '到达宁波北仑', '1545121749');

-- ----------------------------
-- Table structure for wokav_suso_yf
-- ----------------------------
DROP TABLE IF EXISTS `wokav_suso_yf`;
CREATE TABLE `wokav_suso_yf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) NOT NULL COMMENT '订单',
  `price` decimal(10,0) NOT NULL COMMENT '应付价格',
  `freight` decimal(10,0) NOT NULL COMMENT '应付运费',
  `compensatory` decimal(10,0) NOT NULL COMMENT '补偿金额',
  `all` decimal(10,0) NOT NULL COMMENT '应付金额',
  `marks` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wokav_suso_yf
-- ----------------------------

-- ----------------------------
-- Table structure for wokav_suso_ys
-- ----------------------------
DROP TABLE IF EXISTS `wokav_suso_ys`;
CREATE TABLE `wokav_suso_ys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) NOT NULL COMMENT '订单',
  `price` decimal(10,0) NOT NULL COMMENT '应收价格',
  `freight` decimal(10,0) NOT NULL COMMENT '应收运费',
  `compensatory` decimal(10,0) NOT NULL COMMENT '应收金额',
  `all` decimal(10,0) NOT NULL COMMENT '应收金额',
  `marks` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wokav_suso_ys
-- ----------------------------
INSERT INTO `wokav_suso_ys` VALUES ('1', '1', '100', '3400', '51', '3451', null);
INSERT INTO `wokav_suso_ys` VALUES ('2', '5', '146', '4380', '0', '4380', null);
INSERT INTO `wokav_suso_ys` VALUES ('3', '6', '265', '7950', '0', '7950', null);
INSERT INTO `wokav_suso_ys` VALUES ('4', '7', '56', '452', '300', '752', null);
INSERT INTO `wokav_suso_ys` VALUES ('5', '4', '2000', '6000', '0', '6000', null);
