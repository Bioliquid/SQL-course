-- clear before use
drop database if exists Hw1;
create database if not exists Hw1;
use Hw1;

drop table if exists Schedules, Stations, Trains, Passengers, Tickets;

-- Trains
create table if not exists Trains (
        trainId int not null,
        stationId int not null,
        seatsNum int not null,
        primary key (trainId, stationId)
);

-- Schedules
create table if not exists Schedules (
        stationId int not null,
        trainId int not null,
        time time not null,
        primary key (stationId, trainId, time),
        foreign key (trainId) references Trains(trainId)
);

-- Stations
create table if not exists Stations (
        stationId int not null,
        name nvarchar(100) not null,
        primary key (stationId),
        foreign key (stationId) references Schedules(stationId)
);

-- Passengers
create table if not exists Passengers (
        passengerId int auto_increment not null,
        name nvarchar(100) not null,
        lastName nvarchar(100) not null,
        birthDate date not null,
        primary key (passengerId)
);

-- Tickets
create table if not exists Tickets (
        trainId int not null,
        passengerId int not null,
        primary key (trainId, passengerId),
        foreign key (trainId) references Trains(trainId),
        foreign key (passengerId) references Passengers(passengerId)
);
