
-- 1). Имена всех пользователей.
select DisplayName from Users;

-- 2). Заголовок, текст и имя создателя для 100 последних созданных вопросов.
select top 100 Title, Body, OwnerDisplayName from Posts
where PostTypeId = 1
order by CreationDate desc;

-- 3). Количество зарегистрированных пользователей, вопросов, ответов и тэгов.
select count(Id) from Users;

select count(Id) from Posts 
where PostTypeID = 1;

select count(Id) from Posts 
where PostTypeID = 2;

select count(Id) from Tags;

-- 4). Имена и места проживания (Location) пользователей, зарегистрированных в 2015 году.
select DisplayName, Location from Users
where Year(CreationDate) = 2015;

-- 5). Количество пользователей, зарегистрированных в 2015 году.
select count(CreationDate) from Users
where Year(CreationDate) = 2015;

-- 6). Количество пользователей, у которых в качестве места проживания указана страна Germany.
select count(Id) from Users
where CHARINDEX('Germany',Location) > 0;

-- 7). Места проживания и количество пользователей, указавших соответствующее место проживания в своём профиле.
select Location, count(Location) from Users
group by Location;

-- 8). Первых 10 пользователей с максимальной репутацией, а также количество вопросов, созданных ими.
select top 10 U.DisplayName, count(P.Id) from Users as U
left join Posts as P on P.OwnerUserId = U.Id and P.PostTypeId = 1
group by U.DisplayName, U.Reputation
order by U.Reputation desc;