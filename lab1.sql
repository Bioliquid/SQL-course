drop database if exists lab1;

create database if not exists lab1;
use lab1;

create table if not exists Languages (
	langId int not null auto_increment,
    langName nvarchar(100) not null,
    primary key (langId)
);

create table if not exists Types (
	typeId int not null auto_increment,
    typeName nvarchar(100) not null,
    primary key (typeId)
);

create table if not exists Elements (
	elementId int not null auto_increment,
    langId int not null,
    typeId int not null,
    primary key (elementId),
    foreign key (langId) references Languages(langId),
    foreign key (typeId) references Types(typeId)
);

create table if not exists Translations (
	elementId int not null,
    langId int not null,
    textText nvarchar(100) not null,
    foreign key (elementId) references Elements(elementId),
    foreign key (langId) references Languages(langId)
);