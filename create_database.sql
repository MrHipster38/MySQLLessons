drop database if exists movies;
create database movies;
use movies;

CREATE TABLE `Actors` (
  `id` bigint AUTO_INCREMENT NOT NULL UNIQUE,
  `name` varchar(255) DEFAULT NULL,
  `birth_date` date NOT NULL,
  `description` text NOT NULL,
  `photo` text NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Categories` (
  `id` bigint AUTO_INCREMENT NOT NULL UNIQUE,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Directors` (
  `id` bigint AUTO_INCREMENT NOT NULL UNIQUE,
  `name` varchar(255) DEFAULT NULL,
  `birth_date` date NOT NULL,
  `description` text NOT NULL,
  `photo` text NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `genre` (
  `id` bigint AUTO_INCREMENT NOT NULL UNIQUE,
  `name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `users` (
  `id` bigint AUTO_INCREMENT NOT NULL UNIQUE,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `birth_date` date NOT NULL,
  `city` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `movies` (
  `id` bigint AUTO_INCREMENT NOT NULL UNIQUE,
  `title` varchar(255) DEFAULT NULL,
  `tagline` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `poster` text NOT NULL,
  `year` date NOT NULL,
  `country` varchar(255) NOT NULL,
  `director` bigint NOT NULL,
  `actors` bigint NOT NULL,
  `genre` bigint NOT NULL,
  `world_premiere` date NOT NULL,
  `budget` bigint NOT NULL,
  `fees_in_USA` bigint NOT NULL,
  `fees_in_world` bigint NOT NULL,
  `category` bigint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `movies_director_Directors_id_foreign` FOREIGN KEY (`director`) REFERENCES `Directors` (`id`),
  CONSTRAINT `movies_actors_Actors_id_foreign` FOREIGN KEY (`actors`) REFERENCES `Actors` (`id`),
  CONSTRAINT `movies_genre_genre_id_foreign` FOREIGN KEY (`genre`) REFERENCES `genre` (`id`),
  CONSTRAINT `movies_category_Categories_id_foreign` FOREIGN KEY (`category`) REFERENCES `Categories` (`id`)
);

CREATE TABLE `Reviews` (
  `id` bigint AUTO_INCREMENT NOT NULL UNIQUE,
  `user` bigint DEFAULT NULL,
  `movie` bigint DEFAULT NULL,
  `text` text,
  `grade` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `Reviews_movie_movies_id_foreign` FOREIGN KEY (`movie`) REFERENCES `movies` (`id`),
  CONSTRAINT `Reviews_user_users_id_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
);

CREATE TABLE `movieshots` (
  `id` bigint AUTO_INCREMENT NOT NULL UNIQUE,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `movie` bigint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `movieshots_movie_movies_id_foreign` FOREIGN KEY (`movie`) REFERENCES `movies` (`id`)
);

CREATE TABLE `rating` (
  `id` bigint AUTO_INCREMENT NOT NULL UNIQUE,
  `stars` tinyint DEFAULT 0 NOT NULL,
  `movie` bigint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `rating_movie_movies_id_foreign` FOREIGN KEY (`movie`) REFERENCES `movies` (`id`)
);

CREATE TABLE `Comments` (
  `id` bigint AUTO_INCREMENT NOT NULL UNIQUE,
  `user` bigint DEFAULT NULL,
  `review` bigint DEFAULT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `Comments_user_users_id_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`),
  CONSTRAINT `Comments_review_Reviews_id_foreign` FOREIGN KEY (`review`) REFERENCES `Reviews` (`id`)
);