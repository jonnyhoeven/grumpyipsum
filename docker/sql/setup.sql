FLUSH PRIVILEGES;

CREATE USER root@'172.%' IDENTIFIED BY 'docker';
GRANT ALL PRIVILEGES ON * . * TO root@'172.%';

CREATE USER root@'192.%' IDENTIFIED BY 'docker';
GRANT ALL PRIVILEGES ON * . * TO root@'192.%';

CREATE USER apache@'172.%' IDENTIFIED BY 'apache';
GRANT ALL PRIVILEGES ON grumpyipsum. * TO apache@'172.%';

FLUSH PRIVILEGES;

create schema grumpyipsum collate latin1_swedish_ci;
USE grumpyipsum;

CREATE TABLE IF NOT EXISTS  `sentences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accepted` bit(1) DEFAULT b'0',
  `text` varchar(300) DEFAULT NULL COMMENT 'grumpy sentence',
  `name` varchar(50) DEFAULT NULL COMMENT 'Name of submitting user',
  `email` varchar(150) DEFAULT NULL COMMENT 'E-mail adres of submitting user',
  `ip` varchar(45) DEFAULT NULL COMMENT 'IP adres of submitting user',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 COMMENT='Grumpy Sentences';

CREATE TABLE IF NOT EXISTS  `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sentence_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NOW(),
  `ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `votes_sentences_id_fk` (`sentence_id`),
  CONSTRAINT `votes_sentences_id_fk` FOREIGN KEY (`sentence_id`) REFERENCES `sentences` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (1, true, 'Want to see my favorite street sign? Goa Way!', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (2, true, 'Just go away, leave.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (3, true, 'Let''s hope you get disconnected forever.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (4, true, 'My new doormat says, Oh crap not you again.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (5, true, 'I like the titanic, my favourite character was the iceberg.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (6, true, 'Who let the dogs out, Me.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (7, true, 'Yep that''s me, where is my oscar?', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (8, true, 'Hit me baby one more time, with pleasure.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (9, true, 'All I want for Christmas is you to get hit by a reindeer.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (10, true, 'This girl is on fire, good let me get the marshmallows.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (11, true, 'Row, row, row your boat gently off a cliff.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (12, true, 'Good morning? no such thing.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (13, true, 'You must have been born on the highway, because thats where most accidents happen', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (14, true, 'Nope, you''ll never amount to anything.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (15, true, 'Nope... ', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (16, true, 'I shall destroy your happiness.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (17, true, 'When I see your face, I want to claw your eyes out.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (18, true, 'I disapprove, go figure out why.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (19, true, 'Go to hell.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (20, true, 'Your project will fail anyway, why try?', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (21, true, 'I purred once, I thought I was dying.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (22, true, 'Why don''t you slip into something more comfortable, like a coma?', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (23, true, 'It''s beginning to look a lot like, fuck this.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (24, true, 'Twinkle twinkle little star, I will hit you with my car.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (25, true, '70% of the planet is covered by water, the other 30% is covered by idiots.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (26, true, 'Some people just need a high-five, in the face. With a hammer.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (27, true, 'This layout looks horrible. ', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (28, true, 'Your color selection makes me sick.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (29, true, 'This font looks pretentious and empty, just like you.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (30, true, 'This isn''t even readable on mobile devices.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (31, true, 'Your design looks like someone tried to recreate a natural disaster, only yours is much worse.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (32, true, 'There will be no easter bunny this year, I ate it.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (33, true, 'You remind me of my chinese friend, Ug Lee.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (34, true, 'I''m not stubborn, I''m always right.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (35, true, 'I don''t believe in plastic surgery, but in your case. Go ahead.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (36, true, 'You''re gift is in the litter box.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (37, true, 'Today''s forecast, grumpy with a 100% chance of throat punches.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (38, true, 'There''s not enough coffee in the world to get me to rise and shine.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (39, true, 'Leave me alone.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (40, true, 'Your existence is meaningless, accept your fate.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (41, true, 'Free hugs, go hug a cactus.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (42, true, 'I love mondays, it makes people cry.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (43, true, 'You''re like a ray of sunshine, hurting peoples eyes and giving them skin disease.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (44, true, 'I''m listening, I just don''t care. ', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (45, true, 'My bloodtype is be negative.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (46, true, 'I love math... it makes people cry.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (47, true, 'I had fun once, it was awfull.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (48, true, 'Congrats, you know how to read. Great work.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (49, true, 'Smiles are contagious, don''t worry I''m vaccinated', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (50, true, 'Santa does not exist.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (51, true, 'Mike''s projects are like his wife, they both suck balls.', 'John Whiskers', 'j.whiskers@AppleLegalTeam.com', '127.0.0.1', '2018-07-27 14:15:14', '2018-07-27 14:15:14', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (52, true, 'Today is Grumpsday', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-07-27 14:15:14', '2018-07-27 14:15:14', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (53, true, 'I don''t even own my own name on the internet - somebody else bought it.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');
INSERT INTO grumpyipsum.sentences (id, accepted, text, name, email, ip, created_at, updated_at, deleted_at) VALUES (54, true, 'Have you ever had one of those days when you''re holding a stick and everyone looks like a Piñata.', 'Grumpy', 'Grumpy@GrumpyIpsum.com', '127.0.0.1', '2018-04-01 00:00:00', '2018-04-01 00:00:00', '2018-04-01 00:00:00');


CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(249) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `verified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `resettable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `roles_mask` int(10) unsigned NOT NULL DEFAULT '0',
  `registered` int(10) unsigned NOT NULL,
  `last_login` int(10) unsigned DEFAULT NULL,
  `force_logout` mediumint(7) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `users_confirmations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `email` varchar(249) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selector` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `selector` (`selector`),
  KEY `email_expires` (`email`,`expires`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `users_remembered` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `selector` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `selector` (`selector`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `users_resets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `selector` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `selector` (`selector`),
  KEY `user_expires` (`user`,`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `users_throttling` (
  `bucket` varchar(44) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `tokens` float unsigned NOT NULL,
  `replenished_at` int(10) unsigned NOT NULL,
  `expires_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bucket`),
  KEY `expires_at` (`expires_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
