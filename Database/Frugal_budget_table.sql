create table if not exists Budget(
IdBudget int(10),
Description text,
IdProject int(10),
ProjectedAmount int(10),
ActualAmount int(10),
primary key (IdBudget));

insert into Budget values('401', 'buget for 401', '201', '10000', '12000');
insert into Budget values('402', 'buget for 402', '202', '10000', '9000');