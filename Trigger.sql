drop table if exists comments_logs;
create table comments_logs (
	`user` varchar(255),
	created_at datetime DEFAULT current_timestamp) ENGINE=ARCHIVE;


-- лог комментариев пользователей
delimiter //
drop trigger if exists comments_log//
create trigger comments_log after insert on comments
for each row 
begin
	insert into comments_logs set  `user` = (select concat(name, surname) from users u
													where id = new.id); 
end//

delimiter ;