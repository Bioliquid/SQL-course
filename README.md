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

|passengerId|name|lastName|birthDate|
|1|Ivan|Ivanov|1998-04-13|
|2|Sergey|Hodunov|2007-10-27|
|3|Roman|Kramer|1990-01-05|
|4|Anna|Smirnova|1993-03-15|
|5|Alena|Kozlova|1996-12-11|
|6|Alina|Stupina|1994-09-17|

### Trains

|trainId|stationId|seatsNum|
|1|1|10|
|1|2|20|
|2|2|5|
|2|3|5|
|3|1|3|
|3|2|2|

### Schedules

|stationId|trainId|time|
|1|1|12:00:00|
|3|1|14:00:00|
|1|2|12:30:00|
|2|2|17:00:00|
|3|2|09:00:00|
|2|3|18:30:00|
|3|3|10:00:00|

### Stations
|stationId|name|
|1|A|
|2|B|
|3|C|

## Functionality

### For clients

- поиск поезда, проходящего от станции Aдо станции Bв заданный промежуток времени;

```
select distinct sc.trainId from Schedules as sc
inner join Stations as st on sc.time between "12:00:00" and "12:27:00"
inner join Trains as tr on tr.stationId = 1;
```