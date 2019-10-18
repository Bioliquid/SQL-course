-- Schedule
create table if not exists Schedule (
        stationId int not null,
        trainId int not null,
        time time not null,
        primary key (stationId)
);

-- Stations
create table if not exists Stations (
        stationId int auto_increment not null,
        name nvarchar(100) not null,
        primary key (stationId),
        foreign key (stationId) references Schedule(stationId)
);

-- Trains
create table if not exists Trains (
        trainId int not null,
        stationId int not null,
        seatsNum int not null,
        primary key (trainId),
        foreign key (stationId) references Stations(stationId)
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
