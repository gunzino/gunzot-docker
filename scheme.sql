-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 20, 2018 at 10:02 AM
-- Server version: 5.6.34
-- PHP Version: 7.0.27-1~dotdeb+8.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `gunzodus`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `session` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `premdays` int(11) NOT NULL DEFAULT '0',
  `lastday` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `proxy` tinyint(2) NOT NULL DEFAULT '1',
  `email` varchar(255) NOT NULL DEFAULT '',
  `creation` int(11) NOT NULL,
  `key` varchar(128) NOT NULL DEFAULT '',
  `blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'internal usage',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `page_lastday` int(11) NOT NULL,
  `email_new` varchar(255) NOT NULL,
  `email_new_time` int(15) NOT NULL,
  `recovery_key` varchar(100) DEFAULT NULL,
  `recovery_key_generated` tinyint(2) DEFAULT NULL,
  `email_verify_code` varchar(100) DEFAULT NULL,
  `email_verify_time` int(10) UNSIGNED DEFAULT NULL,
  `real_name` varchar(100) DEFAULT NULL,
  `real_address` varchar(200) DEFAULT NULL,
  `password_reset_token` varchar(40) DEFAULT NULL,
  `password_reset_time` int(10) UNSIGNED DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `page_access` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `email_code` varchar(255) NOT NULL DEFAULT '0',
  `next_email` int(11) NOT NULL DEFAULT '0',
  `premium_points` int(11) NOT NULL DEFAULT '0',
  `premium_points_old` int(11) DEFAULT NULL,
  `guild_points` int(11) DEFAULT '0',
  `guild_points_used` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL,
  `vipdays` int(11) NOT NULL DEFAULT '0',
  `nickname` char(48) DEFAULT NULL,
  `avatar` char(48) DEFAULT NULL,
  `about_me` text,
  `flag` varchar(3) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ref_by` int(11) DEFAULT NULL,
  `ref_status` tinyint(4) NOT NULL DEFAULT '0',
  `ref_gained` tinyint(4) NOT NULL DEFAULT '0',
  `email_verified` int(11) NOT NULL DEFAULT '0',
  `last_promocode` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_bans`
--

CREATE TABLE `account_bans` (
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_ban_history`
--

CREATE TABLE `account_ban_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_box`
--

CREATE TABLE `account_box` (
  `account_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ip` int(11) UNSIGNED NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_iphistory`
--

CREATE TABLE `account_iphistory` (
  `account_id` int(11) NOT NULL,
  `ip` int(10) UNSIGNED NOT NULL,
  `last_login` int(11) NOT NULL,
  `login_count` int(11) NOT NULL DEFAULT '1',
  `first_login` int(10) UNSIGNED DEFAULT NULL,
  `last_promocode` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  `description` varchar(128) NOT NULL,
  `icon` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_vouchers`
--

CREATE TABLE `account_vouchers` (
  `account_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `issued_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `used_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `acc_serialy`
--

CREATE TABLE `acc_serialy` (
  `id` int(11) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `used` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auction_system`
--

CREATE TABLE `auction_system` (
  `id` int(11) NOT NULL,
  `player` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 - ip banishment, 2 - namelock, 3 - account banishment, 4 - notation, 5 - deletion',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'ip address (integer), player guid or account number',
  `param` int(10) UNSIGNED NOT NULL DEFAULT '4294967295' COMMENT 'used only for ip banishment mask (integer)',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expires` int(11) NOT NULL,
  `added` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bugtracker`
--

CREATE TABLE `bugtracker` (
  `id` int(10) UNSIGNED NOT NULL,
  `category` int(3) UNSIGNED NOT NULL,
  `time` int(16) UNSIGNED NOT NULL,
  `author` int(16) UNSIGNED NOT NULL,
  `text` text NOT NULL,
  `title` varchar(64) NOT NULL,
  `done` int(3) UNSIGNED NOT NULL,
  `priority` int(3) UNSIGNED NOT NULL,
  `closed` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `characters_auctions`
--

CREATE TABLE `characters_auctions` (
  `id` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `finish_time` int(11) NOT NULL,
  `char_id` int(11) NOT NULL,
  `buy_now` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `bidder` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `char_transfer`
--

CREATE TABLE `char_transfer` (
  `from_acc` int(11) NOT NULL,
  `to_acc` int(11) NOT NULL,
  `points` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat_bans`
--

CREATE TABLE `chat_bans` (
  `account_id` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  `banned_till` timestamp NULL DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat_channels`
--

CREATE TABLE `chat_channels` (
  `channelMessageId` int(10) UNSIGNED NOT NULL,
  `channelId` int(11) NOT NULL,
  `senderGuid` int(11) NOT NULL,
  `senderName` varchar(100) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` varchar(255) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat_conversations`
--

CREATE TABLE `chat_conversations` (
  `hash` varchar(40) NOT NULL,
  `lastMessage` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastMessageId` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat_ignore_list`
--

CREATE TABLE `chat_ignore_list` (
  `account_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `created_on` int(11) NOT NULL,
  `updated_on` int(10) UNSIGNED DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `conversationHash` varchar(40) NOT NULL,
  `senderGuid` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat_participants`
--

CREATE TABLE `chat_participants` (
  `conversationHash` varchar(40) NOT NULL,
  `participantGuid` int(10) UNSIGNED NOT NULL,
  `hasRead` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat_push_tokens`
--

CREATE TABLE `chat_push_tokens` (
  `token` varchar(100) NOT NULL,
  `player_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event_time`
--

CREATE TABLE `event_time` (
  `id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `interval_days` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exphistory_day`
--

CREATE TABLE `exphistory_day` (
  `id` int(11) NOT NULL,
  `time_start` int(10) UNSIGNED NOT NULL,
  `time_end` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `global_storage`
--

CREATE TABLE `global_storage` (
  `key` varchar(100) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `checkdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL,
  `balance` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `logo_gfx_name` varchar(255) NOT NULL DEFAULT '',
  `invited_to` int(11) NOT NULL,
  `invited_by` int(11) NOT NULL,
  `in_war_with` int(11) NOT NULL,
  `kills` int(11) NOT NULL,
  `show` smallint(1) NOT NULL,
  `war_time` int(11) NOT NULL,
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `avg_lvl` int(11) NOT NULL DEFAULT '0',
  `guild_points` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `guilds`
--
DELIMITER $$
CREATE TRIGGER `ondelete_guilds` BEFORE DELETE ON `guilds` FOR EACH ROW BEGIN UPDATE `players` SET `guildnick` = '', `rank_id` = 0 WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = OLD.`id`); END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `guildwar_kills`
--

CREATE TABLE `guildwar_kills` (
  `id` int(11) NOT NULL,
  `killer` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `killerguild` int(11) NOT NULL DEFAULT '0',
  `targetguild` int(11) NOT NULL DEFAULT '0',
  `warid` int(11) NOT NULL DEFAULT '0',
  `time` bigint(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guild_membership`
--

CREATE TABLE `guild_membership` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 - leader, 2 - vice leader, 3 - member'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild1` int(11) NOT NULL,
  `guild2` int(11) NOT NULL,
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `started` bigint(20) NOT NULL DEFAULT '0',
  `ended` bigint(20) NOT NULL DEFAULT '0',
  `frags` int(10) UNSIGNED NOT NULL DEFAULT '100',
  `guild1_kills` int(11) NOT NULL DEFAULT '0',
  `guild2_kills` int(11) NOT NULL DEFAULT '0',
  `balance` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `g_countries`
--

CREATE TABLE `g_countries` (
  `id` tinyint(3) NOT NULL,
  `code` varchar(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `pocet` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `rent` int(11) NOT NULL,
  `town_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `bid` int(11) NOT NULL,
  `bid_end` int(11) NOT NULL,
  `last_bid` int(11) NOT NULL,
  `highest_bidder` int(11) NOT NULL,
  `size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `beds` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `house_castles`
--

CREATE TABLE `house_castles` (
  `house_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `house_name` varchar(50) NOT NULL,
  `rent_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rent_by_name` varchar(100) NOT NULL,
  `rent_to` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `new` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ip_bans`
--

CREATE TABLE `ip_bans` (
  `ip` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `market_history`
--

CREATE TABLE `market_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `expires_at` bigint(20) UNSIGNED NOT NULL,
  `inserted` bigint(20) UNSIGNED NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `market_offers`
--

CREATE TABLE `market_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `npc_sell_log`
--

CREATE TABLE `npc_sell_log` (
  `id` int(11) NOT NULL,
  `time` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `price_unit` int(11) NOT NULL,
  `price_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paygol_payments`
--

CREATE TABLE `paygol_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `shortcode` varchar(20) NOT NULL,
  `keyword` varchar(20) NOT NULL,
  `message` varchar(50) NOT NULL,
  `sender` varchar(30) NOT NULL,
  `operator` varchar(20) NOT NULL,
  `country` varchar(3) NOT NULL,
  `account_name` varchar(25) NOT NULL,
  `price` varchar(5) NOT NULL,
  `currency` varchar(4) NOT NULL,
  `acc_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(3) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` int(11) NOT NULL DEFAULT '0',
  `soul` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `onlinetime` int(11) DEFAULT '0',
  `deletion` bigint(15) DEFAULT '0',
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `offlinetraining_time` int(5) NOT NULL DEFAULT '43200',
  `offlinetraining_skill` int(11) NOT NULL DEFAULT '-1',
  `stamina` int(11) NOT NULL DEFAULT '2520',
  `marriage` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `marrystatus` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `promotion` int(11) NOT NULL DEFAULT '0',
  `deleted` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `nick_verify` int(11) NOT NULL DEFAULT '0',
  `old_name` varchar(255) NOT NULL DEFAULT '',
  `hide_char` int(11) NOT NULL DEFAULT '0',
  `comment` text,
  `worldtransfer` int(11) DEFAULT NULL,
  `rep` int(11) NOT NULL DEFAULT '0' COMMENT 'Cyber''s REPSystem © OTLand.net',
  `auction_balance` int(11) NOT NULL DEFAULT '0',
  `goals` int(11) NOT NULL DEFAULT '0',
  `wins` int(11) NOT NULL DEFAULT '0',
  `total` int(11) NOT NULL DEFAULT '0',
  `messages` varchar(10000) NOT NULL DEFAULT '',
  `flag` int(3) DEFAULT NULL,
  `cast` tinyint(4) NOT NULL DEFAULT '0',
  `castViewers` int(11) NOT NULL DEFAULT '0',
  `castDescription` varchar(255) DEFAULT NULL,
  `castPassword` varchar(100) DEFAULT NULL,
  `skill_fist` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_fist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_club` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_club_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_sword` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_sword_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_axe` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_axe_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_dist` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_dist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_shielding` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_shielding_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_fishing` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_fishing_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `prey_rerolls` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `account_id_original` int(11) DEFAULT NULL,
  `rank_id` int(11) NOT NULL DEFAULT '0',
  `guildnick` varchar(255) NOT NULL DEFAULT '',
  `online_mobile` int(11) NOT NULL DEFAULT '0',
  `lastip_temp` int(11) DEFAULT NULL,
  `marriage_status` tinyint(1) NOT NULL DEFAULT '0',
  `marriage_spouse` int(11) DEFAULT NULL,
  `autoloot` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Triggers `players`
--
DELIMITER $$
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players` FOR EACH ROW BEGIN DELETE FROM `bans` WHERE `type` = 2 AND `value` = OLD.`id`; UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`; END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `players_online`
--

CREATE TABLE `players_online` (
  `player_id` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_dayexperience`
--

CREATE TABLE `player_dayexperience` (
  `player_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `raw_exp` int(11) NOT NULL,
  `exp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range, eg. 0-100 is reserved for depot lockers and all above 100 will be normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_exphistory_day`
--

CREATE TABLE `player_exphistory_day` (
  `player_id` int(11) NOT NULL,
  `day_id` int(11) NOT NULL,
  `raw_exp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_inboxitems`
--

CREATE TABLE `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_iphistory`
--

CREATE TABLE `player_iphistory` (
  `player_id` int(11) NOT NULL,
  `ip` int(10) UNSIGNED NOT NULL,
  `last_login` int(11) NOT NULL,
  `login_count` int(11) NOT NULL DEFAULT '1',
  `first_login` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_killers`
--

CREATE TABLE `player_killers` (
  `death_id` int(10) UNSIGNED NOT NULL,
  `killer_id` int(10) NOT NULL,
  `damage` int(11) NOT NULL,
  `unjustified` tinyint(2) NOT NULL DEFAULT '0',
  `removed` tinyint(1) NOT NULL DEFAULT '0',
  `revenged` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT 'long name',
  `namelocked_at` bigint(20) NOT NULL DEFAULT '1404427132',
  `namelocked_by` int(11) DEFAULT NULL,
  `save_history` tinyint(1) NOT NULL DEFAULT '1',
  `need_accept` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_newdeaths`
--

CREATE TABLE `player_newdeaths` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `deathtime` int(10) UNSIGNED NOT NULL,
  `monster` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_oldnames`
--

CREATE TABLE `player_oldnames` (
  `player_id` int(11) NOT NULL,
  `old_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_preys`
--

CREATE TABLE `player_preys` (
  `player_id` int(11) NOT NULL,
  `slot_id` int(11) NOT NULL,
  `unlocked` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '3',
  `monster` varchar(100) DEFAULT NULL,
  `bonus_type` tinyint(1) DEFAULT NULL,
  `bonus_level` tinyint(2) DEFAULT NULL,
  `time_left` int(10) UNSIGNED DEFAULT NULL,
  `reroll_time` int(10) UNSIGNED NOT NULL,
  `list` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_report`
--

CREATE TABLE `player_report` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `reason` int(11) NOT NULL,
  `playerName` varchar(120) DEFAULT NULL,
  `comment` text,
  `translation` text,
  `statement_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_rewardchest`
--

CREATE TABLE `player_rewardchest` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `reward` text NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_rewards`
--

CREATE TABLE `player_rewards` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_statements`
--

CREATE TABLE `player_statements` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL DEFAULT '0',
  `text` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `key` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `points` int(10) UNSIGNED NOT NULL,
  `created_at` int(11) UNSIGNED NOT NULL,
  `used_at` int(10) UNSIGNED DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(35) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `server_motd`
--

CREATE TABLE `server_motd` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `server_record`
--

CREATE TABLE `server_record` (
  `record` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `server_reports`
--

CREATE TABLE `server_reports` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '1',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL DEFAULT '0',
  `report` text NOT NULL,
  `reads` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_depotitems`
-- (See below for the actual view)
--
CREATE TABLE `view_depotitems` (
`player_id` int(11)
,`name` varchar(255)
,`account_id` int(11)
,`itemtype` int(11)
,`offer_name` varchar(100)
,`cnt` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_inboxitems`
-- (See below for the actual view)
--
CREATE TABLE `view_inboxitems` (
`player_id` int(11)
,`name` varchar(255)
,`account_id` int(11)
,`itemtype` smallint(6)
,`offer_name` varchar(100)
,`cnt` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_items`
-- (See below for the actual view)
--
CREATE TABLE `view_items` (
`player_id` int(11)
,`name` varchar(255)
,`account_id` int(11)
,`itemtype` int(11)
,`offer_name` varchar(100)
,`cnt` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `web_char_auctions`
--

CREATE TABLE `web_char_auctions` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `bid` int(10) UNSIGNED DEFAULT NULL,
  `bidder` int(11) DEFAULT NULL,
  `bid_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `previous_bidder` int(11) DEFAULT NULL,
  `creation_time` int(10) UNSIGNED NOT NULL,
  `finish_time` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_fortumo_payments`
--

CREATE TABLE `web_fortumo_payments` (
  `id` int(11) NOT NULL,
  `message_id` varchar(200) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `keyword` varchar(100) DEFAULT NULL,
  `sender` varchar(30) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `revenue` float DEFAULT NULL,
  `currency` varchar(4) DEFAULT NULL,
  `service_id` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `test` varchar(10) DEFAULT NULL,
  `sig` varchar(100) DEFAULT NULL,
  `saved` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_forum_posts`
--

CREATE TABLE `web_forum_posts` (
  `id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `first_post` int(11) DEFAULT NULL,
  `topic` varchar(100) DEFAULT NULL,
  `text` text NOT NULL,
  `smile` tinyint(1) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_on` int(11) NOT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `edited_on` int(11) DEFAULT NULL,
  `last_post` int(11) DEFAULT NULL,
  `locked` int(11) NOT NULL DEFAULT '0',
  `censored` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_forum_sections`
--

CREATE TABLE `web_forum_sections` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_news_ticker`
--

CREATE TABLE `web_news_ticker` (
  `id` int(10) UNSIGNED NOT NULL,
  `text` text NOT NULL,
  `created_on` int(11) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_paygol_payments`
--

CREATE TABLE `web_paygol_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(20) NOT NULL,
  `account_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `method` varchar(20) DEFAULT NULL,
  `shortcode` varchar(4) DEFAULT NULL,
  `keyword` varchar(10) NOT NULL,
  `message` int(11) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `operator` varchar(20) DEFAULT NULL,
  `country` varchar(3) NOT NULL,
  `points` int(11) NOT NULL,
  `price` float NOT NULL,
  `currency` varchar(5) NOT NULL,
  `saved` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_paypal_payments`
--

CREATE TABLE `web_paypal_payments` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `payment_amount` int(2) NOT NULL,
  `payment_currency` varchar(3) NOT NULL,
  `txn_id` varchar(100) NOT NULL,
  `receiver_email` varchar(100) NOT NULL,
  `payer_email` varchar(100) NOT NULL,
  `saved` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transfer` tinyint(4) NOT NULL DEFAULT '1',
  `invalid` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_shop_categories`
--

CREATE TABLE `web_shop_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(150) NOT NULL,
  `store_icons` varchar(100) NOT NULL,
  `display_type` tinyint(1) NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_shop_offers`
--

CREATE TABLE `web_shop_offers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `points` int(11) NOT NULL,
  `reward1_value` int(11) NOT NULL,
  `reward1_count` int(11) NOT NULL,
  `reward2_value` int(11) NOT NULL DEFAULT '0',
  `reward2_count` int(11) NOT NULL DEFAULT '0',
  `offer_order` int(11) NOT NULL DEFAULT '500',
  `deal_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `deal_baseprice` int(11) NOT NULL DEFAULT '0',
  `store_description` varchar(300) NOT NULL,
  `store_icons` varchar(100) NOT NULL,
  `display_type` tinyint(1) NOT NULL DEFAULT '3',
  `enabled` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_shop_offer_categories`
--

CREATE TABLE `web_shop_offer_categories` (
  `category_id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_shop_orders`
--

CREATE TABLE `web_shop_orders` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '1',
  `player_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  `completed_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_shop_points_history`
--

CREATE TABLE `web_shop_points_history` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `time` int(10) UNSIGNED NOT NULL,
  `message` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `view_depotitems`
--
DROP TABLE IF EXISTS `view_depotitems`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_depotitems`  AS  select `player_depotitems`.`player_id` AS `player_id`,`players`.`name` AS `name`,`players`.`account_id` AS `account_id`,`player_depotitems`.`itemtype` AS `itemtype`,`web_shop_offers`.`name` AS `offer_name`,count(`player_depotitems`.`player_id`) AS `cnt` from ((`player_depotitems` join `players` on((`player_depotitems`.`player_id` = `players`.`id`))) join `web_shop_offers` on((`player_depotitems`.`itemtype` = `web_shop_offers`.`reward1_value`))) where `player_depotitems`.`itemtype` in (select `web_shop_offers`.`reward1_value` from `web_shop_offers` where (`web_shop_offers`.`reward1_value` not in (2640,2160))) group by `player_depotitems`.`player_id`,`player_depotitems`.`itemtype` order by `cnt` desc ;

-- --------------------------------------------------------

--
-- Structure for view `view_inboxitems`
--
DROP TABLE IF EXISTS `view_inboxitems`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_inboxitems`  AS  select `player_inboxitems`.`player_id` AS `player_id`,`players`.`name` AS `name`,`players`.`account_id` AS `account_id`,`player_inboxitems`.`itemtype` AS `itemtype`,`web_shop_offers`.`name` AS `offer_name`,count(`player_inboxitems`.`player_id`) AS `cnt` from ((`player_inboxitems` join `players` on((`player_inboxitems`.`player_id` = `players`.`id`))) join `web_shop_offers` on((`player_inboxitems`.`itemtype` = `web_shop_offers`.`reward1_value`))) where `player_inboxitems`.`itemtype` in (select `web_shop_offers`.`reward1_value` from `web_shop_offers` where (`web_shop_offers`.`reward1_value` not in (2640,2160))) group by `player_inboxitems`.`player_id`,`player_inboxitems`.`itemtype` order by `cnt` desc ;

-- --------------------------------------------------------

--
-- Structure for view `view_items`
--
DROP TABLE IF EXISTS `view_items`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_items`  AS  select `player_items`.`player_id` AS `player_id`,`players`.`name` AS `name`,`players`.`account_id` AS `account_id`,`player_items`.`itemtype` AS `itemtype`,`web_shop_offers`.`name` AS `offer_name`,count(`player_items`.`player_id`) AS `cnt` from ((`player_items` join `players` on((`player_items`.`player_id` = `players`.`id`))) join `web_shop_offers` on((`player_items`.`itemtype` = `web_shop_offers`.`reward1_value`))) where `player_items`.`itemtype` in (select `web_shop_offers`.`reward1_value` from `web_shop_offers` where (`web_shop_offers`.`reward1_value` not in (2640,2160))) group by `player_items`.`player_id`,`player_items`.`itemtype` order by `cnt` desc ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `ref_by` (`ref_by`),
  ADD KEY `email_sent` (`email_verified`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `account_bans`
--
ALTER TABLE `account_bans`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Indexes for table `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Indexes for table `account_box`
--
ALTER TABLE `account_box`
  ADD KEY `item_id` (`item_id`,`ip`,`time`);

--
-- Indexes for table `account_iphistory`
--
ALTER TABLE `account_iphistory`
  ADD PRIMARY KEY (`account_id`,`ip`);

--
-- Indexes for table `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_id_2` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `world_id` (`world_id`);

--
-- Indexes for table `account_vouchers`
--
ALTER TABLE `account_vouchers`
  ADD PRIMARY KEY (`account_id`,`code`),
  ADD KEY `issued_at` (`issued_at`),
  ADD KEY `used_at` (`used_at`);

--
-- Indexes for table `acc_serialy`
--
ALTER TABLE `acc_serialy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serial` (`serial`);

--
-- Indexes for table `auction_system`
--
ALTER TABLE `auction_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`value`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `bugtracker`
--
ALTER TABLE `bugtracker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters_auctions`
--
ALTER TABLE `characters_auctions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uni` (`char_id`,`state`,`finish_time`),
  ADD KEY `finish_time` (`finish_time`);

--
-- Indexes for table `chat_bans`
--
ALTER TABLE `chat_bans`
  ADD PRIMARY KEY (`account_id`,`channelId`);

--
-- Indexes for table `chat_channels`
--
ALTER TABLE `chat_channels`
  ADD PRIMARY KEY (`channelMessageId`);

--
-- Indexes for table `chat_conversations`
--
ALTER TABLE `chat_conversations`
  ADD PRIMARY KEY (`hash`),
  ADD KEY `lastMessageId` (`lastMessageId`);

--
-- Indexes for table `chat_ignore_list`
--
ALTER TABLE `chat_ignore_list`
  ADD PRIMARY KEY (`account_id`,`player_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversationHash` (`conversationHash`),
  ADD KEY `senderGuid` (`senderGuid`);

--
-- Indexes for table `chat_participants`
--
ALTER TABLE `chat_participants`
  ADD PRIMARY KEY (`conversationHash`,`participantGuid`);

--
-- Indexes for table `chat_push_tokens`
--
ALTER TABLE `chat_push_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `event_time`
--
ALTER TABLE `event_time`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exphistory_day`
--
ALTER TABLE `exphistory_day`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_storage`
--
ALTER TABLE `global_storage`
  ADD PRIMARY KEY (`key`),
  ADD KEY `key` (`key`);

--
-- Indexes for table `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`world_id`),
  ADD UNIQUE KEY `name_2` (`name`,`world_id`),
  ADD KEY `avg_lvl` (`avg_lvl`),
  ADD KEY `count` (`count`);

--
-- Indexes for table `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warid` (`warid`);

--
-- Indexes for table `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD UNIQUE KEY `player_id` (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indexes for table `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `rank_id` (`rank_id`);

--
-- Indexes for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indexes for table `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild1`),
  ADD KEY `enemy_id` (`guild2`);

--
-- Indexes for table `g_countries`
--
ALTER TABLE `g_countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD UNIQUE KEY `id` (`id`,`world_id`);

--
-- Indexes for table `house_castles`
--
ALTER TABLE `house_castles`
  ADD PRIMARY KEY (`house_id`);

--
-- Indexes for table `house_lists`
--
ALTER TABLE `house_lists`
  ADD KEY `house_id` (`house_id`);

--
-- Indexes for table `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD PRIMARY KEY (`ip`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Indexes for table `market_history`
--
ALTER TABLE `market_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`,`sale`);

--
-- Indexes for table `market_offers`
--
ALTER TABLE `market_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale` (`sale`,`itemtype`),
  ADD KEY `created` (`created`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `npc_sell_log`
--
ALTER TABLE `npc_sell_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `paygol_payments`
--
ALTER TABLE `paygol_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`deleted`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `castPassword` (`castPassword`),
  ADD KEY `online_mobile` (`online_mobile`),
  ADD KEY `marriage_spouse` (`marriage_spouse`),
  ADD KEY `online` (`online`);

--
-- Indexes for table `players_online`
--
ALTER TABLE `players_online`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `player_dayexperience`
--
ALTER TABLE `player_dayexperience`
  ADD KEY `player_id` (`player_id`,`time`);

--
-- Indexes for table `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_exphistory_day`
--
ALTER TABLE `player_exphistory_day`
  ADD PRIMARY KEY (`player_id`,`day_id`),
  ADD KEY `rexp` (`raw_exp`),
  ADD KEY `day_id` (`day_id`);

--
-- Indexes for table `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_iphistory`
--
ALTER TABLE `player_iphistory`
  ADD PRIMARY KEY (`player_id`,`ip`);

--
-- Indexes for table `player_items`
--
ALTER TABLE `player_items`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_killers`
--
ALTER TABLE `player_killers`
  ADD PRIMARY KEY (`death_id`,`killer_id`),
  ADD KEY `damage` (`damage`),
  ADD KEY `killer_id` (`killer_id`),
  ADD KEY `revenged` (`revenged`);

--
-- Indexes for table `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_newdeaths`
--
ALTER TABLE `player_newdeaths`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_oldnames`
--
ALTER TABLE `player_oldnames`
  ADD UNIQUE KEY `id_name` (`player_id`,`old_name`);

--
-- Indexes for table `player_preys`
--
ALTER TABLE `player_preys`
  ADD PRIMARY KEY (`player_id`,`slot_id`);

--
-- Indexes for table `player_report`
--
ALTER TABLE `player_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player_rewardchest`
--
ALTER TABLE `player_rewardchest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indexes for table `player_spells`
--
ALTER TABLE `player_spells`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`name`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_statements`
--
ALTER TABLE `player_statements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `player_storage`
--
ALTER TABLE `player_storage`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`key`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `server_config`
--
ALTER TABLE `server_config`
  ADD UNIQUE KEY `config` (`config`);

--
-- Indexes for table `server_motd`
--
ALTER TABLE `server_motd`
  ADD UNIQUE KEY `id` (`id`,`world_id`),
  ADD UNIQUE KEY `id_2` (`id`,`world_id`);

--
-- Indexes for table `server_record`
--
ALTER TABLE `server_record`
  ADD UNIQUE KEY `record` (`record`,`world_id`,`timestamp`),
  ADD UNIQUE KEY `timestamp` (`timestamp`,`record`,`world_id`);

--
-- Indexes for table `server_reports`
--
ALTER TABLE `server_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `world_id` (`world_id`),
  ADD KEY `reads` (`reads`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `world_id_2` (`world_id`);

--
-- Indexes for table `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- Indexes for table `web_char_auctions`
--
ALTER TABLE `web_char_auctions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `bidder` (`bidder`),
  ADD KEY `previous_bidder` (`previous_bidder`);

--
-- Indexes for table `web_fortumo_payments`
--
ALTER TABLE `web_fortumo_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `message_id` (`message_id`),
  ADD KEY `message` (`account_id`),
  ADD KEY `points` (`points`);

--
-- Indexes for table `web_forum_posts`
--
ALTER TABLE `web_forum_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `first_post` (`first_post`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `created_on` (`created_on`),
  ADD KEY `edited_by` (`edited_by`),
  ADD KEY `edited_on` (`edited_on`),
  ADD KEY `topic` (`topic`),
  ADD KEY `last_post` (`last_post`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `web_forum_sections`
--
ALTER TABLE `web_forum_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `web_news_ticker`
--
ALTER TABLE `web_news_ticker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `web_paygol_payments`
--
ALTER TABLE `web_paygol_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `web_paypal_payments`
--
ALTER TABLE `web_paypal_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_shop_categories`
--
ALTER TABLE `web_shop_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_shop_offers`
--
ALTER TABLE `web_shop_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_shop_offer_categories`
--
ALTER TABLE `web_shop_offer_categories`
  ADD PRIMARY KEY (`category_id`,`offer_id`),
  ADD KEY `offer_id` (`offer_id`);

--
-- Indexes for table `web_shop_orders`
--
ALTER TABLE `web_shop_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offer_id` (`offer_id`,`player_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `web_shop_points_history`
--
ALTER TABLE `web_shop_points_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `message` (`message`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10038911;
--
-- AUTO_INCREMENT for table `account_ban_history`
--
ALTER TABLE `account_ban_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1175;
--
-- AUTO_INCREMENT for table `acc_serialy`
--
ALTER TABLE `acc_serialy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auction_system`
--
ALTER TABLE `auction_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bugtracker`
--
ALTER TABLE `bugtracker`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `characters_auctions`
--
ALTER TABLE `characters_auctions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chat_channels`
--
ALTER TABLE `chat_channels`
  MODIFY `channelMessageId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42045;
--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4571;
--
-- AUTO_INCREMENT for table `event_time`
--
ALTER TABLE `event_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `exphistory_day`
--
ALTER TABLE `exphistory_day`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=722;
--
-- AUTO_INCREMENT for table `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1263;
--
-- AUTO_INCREMENT for table `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4542;
--
-- AUTO_INCREMENT for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4189;
--
-- AUTO_INCREMENT for table `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;
--
-- AUTO_INCREMENT for table `g_countries`
--
ALTER TABLE `g_countries`
  MODIFY `id` tinyint(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `market_history`
--
ALTER TABLE `market_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=406754;
--
-- AUTO_INCREMENT for table `market_offers`
--
ALTER TABLE `market_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319707;
--
-- AUTO_INCREMENT for table `npc_sell_log`
--
ALTER TABLE `npc_sell_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2168649;
--
-- AUTO_INCREMENT for table `paygol_payments`
--
ALTER TABLE `paygol_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35304;
--
-- AUTO_INCREMENT for table `player_newdeaths`
--
ALTER TABLE `player_newdeaths`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=556993;
--
-- AUTO_INCREMENT for table `player_report`
--
ALTER TABLE `player_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `player_rewardchest`
--
ALTER TABLE `player_rewardchest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `player_statements`
--
ALTER TABLE `player_statements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;
--
-- AUTO_INCREMENT for table `server_reports`
--
ALTER TABLE `server_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `web_char_auctions`
--
ALTER TABLE `web_char_auctions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1366;
--
-- AUTO_INCREMENT for table `web_fortumo_payments`
--
ALTER TABLE `web_fortumo_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5541;
--
-- AUTO_INCREMENT for table `web_forum_posts`
--
ALTER TABLE `web_forum_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61804;
--
-- AUTO_INCREMENT for table `web_forum_sections`
--
ALTER TABLE `web_forum_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `web_news_ticker`
--
ALTER TABLE `web_news_ticker`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `web_paygol_payments`
--
ALTER TABLE `web_paygol_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=624;
--
-- AUTO_INCREMENT for table `web_paypal_payments`
--
ALTER TABLE `web_paypal_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5398;
--
-- AUTO_INCREMENT for table `web_shop_categories`
--
ALTER TABLE `web_shop_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `web_shop_offers`
--
ALTER TABLE `web_shop_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=543;
--
-- AUTO_INCREMENT for table `web_shop_orders`
--
ALTER TABLE `web_shop_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25200;
--
-- AUTO_INCREMENT for table `web_shop_points_history`
--
ALTER TABLE `web_shop_points_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115951;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`ref_by`) REFERENCES `accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `account_bans`
--
ALTER TABLE `account_bans`
  ADD CONSTRAINT `account_bans_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD CONSTRAINT `account_ban_history_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `account_iphistory`
--
ALTER TABLE `account_iphistory`
  ADD CONSTRAINT `account_iphistory_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `account_vouchers`
--
ALTER TABLE `account_vouchers`
  ADD CONSTRAINT `account_vouchers_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat_conversations`
--
ALTER TABLE `chat_conversations`
  ADD CONSTRAINT `chat_conversations_ibfk_1` FOREIGN KEY (`lastMessageId`) REFERENCES `chat_messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat_ignore_list`
--
ALTER TABLE `chat_ignore_list`
  ADD CONSTRAINT `chat_ignore_list_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`conversationHash`) REFERENCES `chat_conversations` (`hash`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat_participants`
--
ALTER TABLE `chat_participants`
  ADD CONSTRAINT `chat_participants_ibfk_1` FOREIGN KEY (`conversationHash`) REFERENCES `chat_conversations` (`hash`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat_push_tokens`
--
ALTER TABLE `chat_push_tokens`
  ADD CONSTRAINT `chat_push_tokens_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_push_tokens_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD CONSTRAINT `guildwar_kills_ibfk_1` FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_3` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_4` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD CONSTRAINT `guild_membership_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD CONSTRAINT `guild_wars_ibfk_1` FOREIGN KEY (`guild1`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_wars_ibfk_2` FOREIGN KEY (`guild2`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD CONSTRAINT `ip_bans_ibfk_1` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `market_history`
--
ALTER TABLE `market_history`
  ADD CONSTRAINT `market_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `market_offers`
--
ALTER TABLE `market_offers`
  ADD CONSTRAINT `market_offers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `npc_sell_log`
--
ALTER TABLE `npc_sell_log`
  ADD CONSTRAINT `npc_sell_log_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `players_ibfk_3` FOREIGN KEY (`marriage_spouse`) REFERENCES `players` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `player_dayexperience`
--
ALTER TABLE `player_dayexperience`
  ADD CONSTRAINT `player_dayexperience_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_exphistory_day`
--
ALTER TABLE `player_exphistory_day`
  ADD CONSTRAINT `player_exphistory_day_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_exphistory_day_ibfk_2` FOREIGN KEY (`day_id`) REFERENCES `exphistory_day` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_iphistory`
--
ALTER TABLE `player_iphistory`
  ADD CONSTRAINT `player_iphistory_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_killers`
--
ALTER TABLE `player_killers`
  ADD CONSTRAINT `player_killers_ibfk_1` FOREIGN KEY (`death_id`) REFERENCES `player_newdeaths` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_killers_ibfk_2` FOREIGN KEY (`killer_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_newdeaths`
--
ALTER TABLE `player_newdeaths`
  ADD CONSTRAINT `player_newdeaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_preys`
--
ALTER TABLE `player_preys`
  ADD CONSTRAINT `player_preys_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_rewardchest`
--
ALTER TABLE `player_rewardchest`
  ADD CONSTRAINT `player_rewardchest_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD CONSTRAINT `player_rewards_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_statements`
--
ALTER TABLE `player_statements`
  ADD CONSTRAINT `player_statements_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD CONSTRAINT `promo_codes_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `server_reports`
--
ALTER TABLE `server_reports`
  ADD CONSTRAINT `server_reports_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `web_char_auctions`
--
ALTER TABLE `web_char_auctions`
  ADD CONSTRAINT `web_char_auctions_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `web_char_auctions_ibfk_2` FOREIGN KEY (`bidder`) REFERENCES `accounts` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `web_char_auctions_ibfk_3` FOREIGN KEY (`previous_bidder`) REFERENCES `accounts` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `web_forum_posts`
--
ALTER TABLE `web_forum_posts`
  ADD CONSTRAINT `web_forum_posts_ibfk_1` FOREIGN KEY (`first_post`) REFERENCES `web_forum_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `web_forum_posts_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `web_forum_posts_ibfk_3` FOREIGN KEY (`edited_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `web_forum_posts_ibfk_4` FOREIGN KEY (`section_id`) REFERENCES `web_forum_sections` (`id`);

--
-- Constraints for table `web_news_ticker`
--
ALTER TABLE `web_news_ticker`
  ADD CONSTRAINT `web_news_ticker_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `web_shop_offer_categories`
--
ALTER TABLE `web_shop_offer_categories`
  ADD CONSTRAINT `web_shop_offer_categories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `web_shop_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `web_shop_offer_categories_ibfk_2` FOREIGN KEY (`offer_id`) REFERENCES `web_shop_offers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `web_shop_orders`
--
ALTER TABLE `web_shop_orders`
  ADD CONSTRAINT `web_shop_orders_ibfk_1` FOREIGN KEY (`offer_id`) REFERENCES `web_shop_offers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `web_shop_orders_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `web_shop_orders_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `web_shop_points_history`
--
ALTER TABLE `web_shop_points_history`
  ADD CONSTRAINT `web_shop_points_history_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


