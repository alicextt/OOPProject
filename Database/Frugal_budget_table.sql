create table if not exists Budget(
IdBudget int(10),
Description text,
IdProject int(10),
ProjectedAmount int(10),
ActualAmount int(10),
primary key (IdBudget));

insert into Budget values('401', 'Travel', '201', '1000', '1200');
insert into Budget values('402', 'Meals', '201', '500', '450');
insert into Budget values('403', 'Lodging', '202', '500', '600');	
insert into Budget values('404', 'Supplies', '202', '100', '50');	