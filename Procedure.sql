
-- Поиск фильма по названию
drop procedure if exists find_movie;

delimiter //

create procedure find_movie (in name text)
	begin
		set @name = name;
		select 
			m.title , 
			m.tagline, 
			m.`year` , 
			r.stars, 
			rev.`text`
		from 
			movies m
			join
			rating r 
			join 
			reviews rev
		on r.movie = m.id and rev.movie = m.id and rev.movie = r.movie 
		where m.title = @name;
		
	end//

delimiter ;









