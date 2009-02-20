CREATE TABLE `agendas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `endereco` text,
  `nascimento` date DEFAULT NULL,
  `contato` varchar(255) DEFAULT NULL,
  `observacao` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `login` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO schema_migrations (version) VALUES ('20090123124727');

INSERT INTO schema_migrations (version) VALUES ('20090126174911');

INSERT INTO schema_migrations (version) VALUES ('20090126183557');

INSERT INTO schema_migrations (version) VALUES ('20090126185202');

INSERT INTO schema_migrations (version) VALUES ('20090126210139');

INSERT INTO schema_migrations (version) VALUES ('20090127205839');