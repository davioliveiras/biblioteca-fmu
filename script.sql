/**
 * 
 * Faculdades Metropolitanas Unidas
 * Davi Silva Oliveira 1810510
 * Data de criação 09/04/2024
 * 
 */


create database if not exists library;
use library;

create table writer (
	id varchar(36) primary key,
	name varchar(80) not null,
	description varchar(100) not null
);

create table genre (
	id varchar(36) primary key,
	name varchar(50) not null,
	description varchar(100) not null
);

create table book (
	id varchar(36) primary key,
	title varchar(100) not null,
	description varchar(200) not null,
	writer_id varchar(36) not null,
	
	constraint writer_book_id_fk foreign key (writer_id) references writer (id) on delete cascade
);

create table book_genres (
	id int primary key auto_increment,
	genre_id varchar(36) not null,
	book_id varchar(36) not null,
	
	constraint book_genres_genres_id_fk foreign key (genre_id) references genre (id) on delete cascade,
	constraint book_genres_book_id_fk foreign key (book_id) references book (id) on delete cascade
);

create table users (
	id varchar(36) primary key,
	name varchar(80) not null,
	e_mail varchar(80) not null unique,
	pass_word varchar(128) not null,
	roles int not null
);



/*** * ***/

insert into writer values ("82931009-6111-49a6-8582-1380958af0ea", "George Orwell", "Eric Arthur Blair, 
mais conhecido pelo pseudónimo George Orwell, foi um escritor.");

insert into book values ("4a166e68-0ac9-4c14-a9ab-fdaa43631615", 1984, "Um livro que, apesar do nome, foi publicado em 1949.",
"82931009-6111-49a6-8582-1380958af0ea");

insert into genre values ("a3657466-2576-4e28-b9bf-f1e68be578d0", "Política", "Pessoas e sociedade.");

insert into genre values ("a0027c29-f2aa-4cfa-b5bd-35ca3c415dd0", "Ficcção", "Mundo irreal.");

insert into book_genres values (default, "a3657466-2576-4e28-b9bf-f1e68be578d0", "4a166e68-0ac9-4c14-a9ab-fdaa43631615");
insert into book_genres values (default, "a0027c29-f2aa-4cfa-b5bd-35ca3c415dd0", "4a166e68-0ac9-4c14-a9ab-fdaa43631615");



/*** * ***/

select b.title título, b.description descrição, w.name escritor, g.name gênero
from book b inner join writer w inner join book_genres bg inner join genre g
where b.writer_id = w.id and bg.book_id = b.id and g.id = bg.genre_id;



/*** * ***/



/*** drop database library; ***/