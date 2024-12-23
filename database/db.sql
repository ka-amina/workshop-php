drop database if exists blogs_db;
create database blogs_db;
use blogs_db;
CREATE TABLE users(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20)not null,
    email VARCHAR(255) not null unique,
    password_hash VARCHAR(255)not null,
    bio TEXT,
    profile_picture_url VARCHAR(255)
);
CREATE TABLE Categories (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name text not null
);
CREATE TABLE Tags (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) not null
);

create table articles(
id bigint primary key auto_increment,
title varchar(255) not null,
slug varchar(255) not null,
content text not null,
meta_description varchar(160),
category_id bigint not null,
featured_image varchar(255),
status enum('draft','published') not null,
scheduled_date datetime,
author_id bigint,
created_at timestamp,
updated_at timestamp,
views int,
foreign key (category_id)  references categories(id) on delete cascade,
foreign key (author_id)  references users(id) on delete cascade

);
CREATE TABLE article_tags (
  article_id bigint ,
  tag_id bigint,
  FOREIGN KEY (Article_id) REFERENCES Articles(id) on delete cascade,
  FOREIGN KEY (Tag_id) REFERENCES Tags(id) on delete cascade
);