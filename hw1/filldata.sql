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
    (1, 1, 10),
    (1, 2, 20),
    (2, 2, 5),
    (2, 3, 5),
    (3, 2, 2),
    (3, 1, 3);

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
