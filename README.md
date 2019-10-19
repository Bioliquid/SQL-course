# Домашнее задание №1

Спроектируйте схему базы данных для приложения, моделирующего работу информационной системы некоторой компании, осуществляющей пассажирские железнодорожные перевозки. Ниже более подробно описанапредметная область.

### Предметная область

Существуют следующие виды сущностей:

- Станция
    - Название
    - Расписание
        - Номер поезда
        - Время
- Поезд
    - Номер
    - Станции следования
    - Количество мест
- Пассажир
    - Имя
    - Фамилия
    - Дата рождения
- Билет
    - Номер поезда
    - Пассажир
	
## Database generated with filldata.sql

### Passengers

| passengerId | name | lastName | birthDate |
| --- | --- | --- | --- |
| 1 | Ivan | Ivanov| 1998-04-13 |
| 2 | Ivan | Ivanov| 1998-04-13 |
| 3 | Sergey | Hodunov| 2007-10-27 |
| 4 | Roman | Kramer| 1990-01-05 |
| 5 | Anna | Smirnova| 1993-03-15 |
| 6 | Alena | Kozlova| 1996-12-11 |
| 7 | Alina | Stupina| 1994-09-17 |

### Trains

| trainId | stationId | seatsNum |
| --- | --- | --- |
| 1 | 1 | 10 |
| 1 | 2 | 20 |
| 2 | 2 | 5 |
| 2 | 3 | 5 |
| 3 | 1 | 3 |
| 3 | 2 | 2 |

### Schedules

| stationId | trainId | time |
| --- | --- | --- |
| 1 | 1 | 12:00:00 |
| 3 | 1 | 14:00:00 |
| 1 | 2 | 12:30:00 |
| 2 | 2 | 17:00:00 |
| 3 | 2 | 09:00:00 |
| 2 | 3 | 18:30:00 |
| 3 | 3 | 10:00:00 |

### Stations
| stationId | name |
| --- | --- |
| 1 | A |
| 2 | B |
| 3 | C |

## Functionality

### For clients

- поиск поезда, проходящего от станции A до станции B в заданный промежуток времени

```
procedure findTrain(startStation nvarchar(100), endStation nvarchar(100), startTime time, endTime time) -- filldata.sql

select distinct sc.trainId from Schedules as sc 
inner join Stations as st on st.stationId = sc.stationId && st.name = startStation && sc.time between startTime and endTime
inner join Trains as tr on tr.trainId = sc.trainId && tr.stationId = (select stationId from Stations as st2 where st2.name = endStation);
```

- расписание поездов по станции отправления

```
procedure findSchedule(station nvarchar(100)) -- filldata.sql

select distinct sc.trainId, sc.time from Schedules as sc
inner join Stations as st on st.stationId = sc.stationId && st.name = station;
```