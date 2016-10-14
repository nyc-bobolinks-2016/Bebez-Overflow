-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'users'
--
-- ---

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `username` VARCHAR NULL DEFAULT NULL,
  `email` VARCHAR NULL DEFAULT NULL,
  `password_digest` VARCHAR NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'comments'
--
-- ---

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `text` VARCHAR NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `commentable_id` INTEGER NULL DEFAULT NULL,
  `commentable_type` VARCHAR NULL DEFAULT NULL,
  `commenter_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'answers'
--
-- ---

DROP TABLE IF EXISTS `answers`;

CREATE TABLE `answers` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `content` VARCHAR NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `responder_id` INTEGER NULL DEFAULT NULL,
  `question_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'questions'
--
-- ---

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `title` VARCHAR NULL DEFAULT NULL,
  `body` VARCHAR NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `user_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'votes'
--
-- ---

DROP TABLE IF EXISTS `votes`;

CREATE TABLE `votes` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `voter_id` INTEGER NULL DEFAULT NULL,
  `voteable_type` VARCHAR NULL DEFAULT NULL,
  `voteable_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `comments` ADD FOREIGN KEY (commentable_id) REFERENCES `questions` (`id`);
ALTER TABLE `comments` ADD FOREIGN KEY (commentable_id) REFERENCES `answers` (`id`);
ALTER TABLE `comments` ADD FOREIGN KEY (commenter_id) REFERENCES `users` (`id`);
ALTER TABLE `answers` ADD FOREIGN KEY (responder_id) REFERENCES `users` (`id`);
ALTER TABLE `answers` ADD FOREIGN KEY (question_id) REFERENCES `questions` (`id`);
ALTER TABLE `questions` ADD FOREIGN KEY (user_id) REFERENCES `users` (`id`);
ALTER TABLE `votes` ADD FOREIGN KEY (voter_id) REFERENCES `users` (`id`);
ALTER TABLE `votes` ADD FOREIGN KEY (voteable_id) REFERENCES `comments` (`id`);
ALTER TABLE `votes` ADD FOREIGN KEY (voteable_id) REFERENCES `answers` (`id`);
ALTER TABLE `votes` ADD FOREIGN KEY (voteable_id) REFERENCES `questions` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `comments` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `answers` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `questions` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `votes` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `users` (`id`,`username`,`email`,`password_digest`,`created_at`,`updated_at`) VALUES
-- ('','','','','','');
-- INSERT INTO `comments` (`id`,`text`,`created_at`,`updated_at`,`commentable_id`,`commentable_type`,`commenter_id`) VALUES
-- ('','','','','','','');
-- INSERT INTO `answers` (`id`,`content`,`created_at`,`updated_at`,`responder_id`,`question_id`) VALUES
-- ('','','','','','');
-- INSERT INTO `questions` (`id`,`title`,`body`,`created_at`,`updated_at`,`user_id`) VALUES
-- ('','','','','','');
-- INSERT INTO `votes` (`id`,`created_at`,`updated_at`,`voter_id`,`voteable_type`,`voteable_id`) VALUES
-- ('','','','','','');
