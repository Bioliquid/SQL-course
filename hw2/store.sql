DROP TABLE IF EXISTS AudioTrackStore;

-- Таблица AudioTrackStore содержит данные для магазина музыки с возможностью
-- оформления заказов на доставку музыкальных композиций
-- на пластинках до определённого адреса

-- Описание колонок таблицы:
--  ArtistId               Id исполнителя 
--  ArtistName             Имя исполнителя
--  AlbumId                Id альбома
--  AlbumTitle             Название альбома
--  TrackId                Id композиции
--  TrackName              Название композиции
--  TrackLength            Продолжительность композиции в секундах
--  TrackGenre             Жанр композиции
--  TrackPrice             Цена за композицию
--  OrderId                Id заказа
--  CustomerId             Id заказчика
--  CustomerName           Имя заказчика
--  CustomerEmail          E-mail заказчика
--  OrderDate              Дата получения заказа
--  DeliveryAddress        Адрес доставки заказа


CREATE TABLE AudioTrackStore (
  ArtistId int NOT NULL,
  ArtistName varchar(120) NOT NULL,
  AlbumId int NOT NULL,
  AlbumTitle varchar(120) NOT NULL,
  TrackId int NOT NULL,
  TrackName varchar(200) NOT NULL,
  TrackLength bigint NOT NULL,
  TrackGenre varchar(120) NOT NULL,
  TrackPrice decimal(10,2) NOT NULL,
  OrderId int NOT NULL,
  CustomerId int NOT NULL,
  CustomerName varchar(60) NOT NULL,
  CustomerEmail varchar(60) NOT NULL,
  OrderDate date NOT NULL,
  DeliveryAddress varchar(70) NOT NULL
);
