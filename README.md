# SQL-course

## Домашнее задание №1

Спроектируйте схему базы данных для приложения, моделирующего работу информационной системы некоторой компании, осуществляющей пассажирские железнодорожные перевозки. Ниже более подробно описанапредметная область.

### Предметная область

Существуют следующие виды сущностей:

1. Станция
    - Название
    - Расписание
        - Номер поезда
	    - Время

2. Поезд
    - Номер
    - Станции следования
    - Количество мест

3. Пассажир
    - Имя
    - Фамилия
    - Дата рождения
   
4. Билет
    - Номер поезда
    - Пассажир