create table if not exists project(
	project_id int(10), 
	name varchar(40), 
	description text, 
	start_date Date, 
	end_date Date, 
	last_Modified_date Date, 
	outcome text, 
	status varchar(20), 
	budget int(8), 
	primary key (project_id));

insert into project values('201', 'Energy Made in Uganda', 'Energy Made in Uganda description', '2014-01-01', '2015-01-01', '2014-06-01', 'outcome unknown','In progress', '10000');

insert into project values('202', 'Dynamic Poverty Heat Map', 'Dynamic Poverty Heat Map description', '2014-01-01', '2015-01-01', '2014-06-01', 'outcome unknown','In progress', '10000');
