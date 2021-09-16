select 
	c.name as category,
	g.name as genre,
	m.title as movie,
	m.description as movie_dexcription	
from 
	categories c
	join
	genre g
	join
	movies m
	join
	rating r
on 
	m.category = c.id and m.genre = g.id
where m.id = 15 limit 1;



select 
	m.title as movie,
	r.stars as rating
from 
	movies m
	join
	rating r
on r.movie = m.id 
where m.category = (select id from categories c where c.name = 'provident');