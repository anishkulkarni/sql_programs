create database if not exists the_engine_company;

use the_engine_company;

create table if not exists customer
(
	customer_id int auto_increment not null,
	customer_name varchar(50),
	customer_initiation_date date,
	customer_website varchar(50),
	customer_email varchar(50),
	customer_phone bigint(10),
	customer_location varchar(20),
	primary key (customer_id)
);

create table if not exists product
(
	product_id int auto_increment not null,
	product_name varchar(50),
	product_manufacturing_date date,
	product_description varchar(100),
	primary key (product_id)
);

create table if not exists transaction
(
	transaction_id int auto_increment not null,
	product_id int,
	customer_id int,
	transaction_amount bigint,
	transaction_time datetime,
	primary key (transaction_id)
);
