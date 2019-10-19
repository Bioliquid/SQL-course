insert into Passengers(name, lastName, birthDate)
values
    ("Ivan"  , "Ivanov"  , "1998-04-13"),
    ("Ivan"  , "Ivanov"  , "1998-04-13"),
    ("Sergey", "Hodunov" , "2007-10-27"),
    ("Roman" , "Kramer"  , "1990-01-05"),
    ("Anna"  , "Smirnova", "1993-03-15"),
    ("Alena" , "Kozlova" , "1996-12-11"),
    ("Alina" , "Stupina" , "1994-09-17");
    
insert into Trains(trainId, stationId, seatsNum)
values
    (1, 1, 2),
    (1, 2, 2),
    (2, 2, 2),
    (2, 3, 2),
    (3, 2, 2),
    (3, 1, 2);

insert into Schedules(stationId, trainId, time)
values
    (1, 1, "12:00:00"),
    (1, 2, "12:30:00"),
    (2, 2, "17:00:00"),
    (2, 3, "18:30:00"),
    (3, 1, "14:00:00"),
    (3, 2, "09:00:00"),
    (3, 3, "10:00:00");
    
insert into Stations(name)
values
    ("A"),
    ("B"),
    ("C");
    
insert into Tickets(trainId, passengerId)
values
    (1, 1),
    (1, null),
    (2, 5),
    (2, null),
    (3, 6),
    (3, 7);

-- Procedures
-- find train
drop procedure if exists findTrain;
delimiter $$

create procedure findTrain(startStation nvarchar(100), endStation nvarchar(100), startTime time, endTime time)
begin
    select distinct sc.trainId from Schedules as sc 
    inner join Stations as st on st.stationId = sc.stationId && st.name = startStation && sc.time between startTime and endTime
    inner join Trains as tr on tr.trainId = sc.trainId && tr.stationId = (select stationId from Stations as st2 where st2.name = endStation);
end $$

delimiter ;

-- train schedule
drop procedure if exists findSchedule;
delimiter $$

create procedure findSchedule(station nvarchar(100))
begin
    select distinct sc.trainId, sc.time from Schedules as sc
    inner join Stations as st on st.stationId = sc.stationId && st.name = station;
end $$

delimiter ;

-- add schedule
drop procedure if exists addSchedule;
delimiter $$

create procedure addSchedule(stationName nvarchar(100), trainId int, time time)
begin
    insert into Schedules(stationId, trainId, time)
	values ((select st.stationId from Stations as st where st.name = stationName), trainId, time);
end $$

delimiter ;

-- add station
drop procedure if exists addStation;
delimiter $$

create procedure addStation(stationName nvarchar(100))
begin
    -- This is inappropriate way to insert station
    -- Though we should be able to add stations before adding schedules, so...
    SET FOREIGN_KEY_CHECKS = 0;
    insert into Stations(name)
	values (stationName);
    SET FOREIGN_KEY_CHECKS = 1;
end $$

delimiter ;

-- add train
drop procedure if exists addTrain;
delimiter $$

create procedure addTrain(trainId int, stationId int, seatsNum int)
begin
    insert into Trains(trainId, stationId, seatsNum)
	values (trainId, stationId, seatsNum);
end $$

delimiter ;

-- view people by train
drop procedure if exists viewPeopleByTrain;
delimiter $$

create procedure viewPeopleByTrain(trainId int)
begin
    select pas.passengerId, pas.name, pas.lastName, pas.birthDate, tic.ticketId from Passengers as pas
    inner join Tickets as tic on tic.passengerId is not null && pas.passengerId = tic.passengerId && tic.trainId = trainId;
end $$

delimiter ;

-- view trains
drop procedure if exists viewTrains;
delimiter $$

create procedure viewTrains()
begin
    select * from Trains;
end $$

delimiter ;
