create table if not exists Project(
	IdProject int(10), 
	Name varchar(40), 
	Description text, 
	StartDate Date, 
	EndDate Date, 
	LastModifiedDate Date, 
	ProjectOutcome text, 
	ProjectStatus varchar(20),  
	primary key (IdProject));

insert into Project values('201', 'Energy Made in Uganda', 'Energy Made in Uganda description', '2014-01-01', '2015-01-01', '2014-06-01', 'outcome unknown','In progress');

insert into Project values('202', 'Dynamic Poverty Heat Map', 'Dynamic Poverty Heat Map description', '2014-01-01', '2015-01-01', '2014-06-01', 'outcome unknown','In progress');
