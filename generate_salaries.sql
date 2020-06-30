use the_engine_company;

drop table if exists salary;

create table salary
(
	eno int,
	basic int,
	da int,
	hra int,
	it int
);

drop table if exists emp;

create table emp
(
	eno int not null auto_increment,
	ename varchar(20),
	addresss varchar(50),
	city varchar(10)
);

drop table if exists net_salary;

create table net_salary
(
	eno int,
	total_allowance int,
	total_deduction int,
	net_pay int
);

insert into salary values(1,3441,2030,500,69);
insert into salary values(2,6883,4061,500,138);
insert into salary values(3,8260,4873,500,165);
insert into salary values(4,5507,3249,500,110);
insert into salary values(5,5854,3454,500,117);

insert into net_salary values(1,5971,69,5902);
insert into net_salary values(2,11444,138,11306);
insert into net_salary values(3,13633,165,13468);
insert into net_salary values(4,9256,110,9146);
insert into net_salary values(5,9808,117,9691);
