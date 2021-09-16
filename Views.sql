-- Основная информация о фильме
create view movie_main_info as
	select 
	m.title as name, 
	m.tagline as tagline, 
	m.`year` as `year`
	from movies m
	order by `year`;
	

-- Список фильмов отсортированных по рейтингу
create view movie_rating as
	select
	m.title as name,
	r.stars as rating
from 
	movies m
	join
	rating r
	on m.id = r.movie
	order by r.stars desc;