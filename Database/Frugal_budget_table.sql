create table if not exists budget(
budget_id int(10),
description text,
project_id int(10),
projected_amount int(10),
actual_amount int(10),
primary key (budget_id));

insert into budget values('401', 'buget for 401', '201', '10000', '12000');
insert into budget values('402', 'buget for 402', '202', '10000', '9000');