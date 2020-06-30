use the_engine_company;

select * from salary;
select * from net_salary;

drop procedure if exists salary;
delimiter $$
create procedure salary()
begin
update salary inner join net_salary on salary.eno=net_salary.eno
set salary.da=0.59*salary.basic,
salary.hra=500,
salary.it=0.02*salary.basic,
net_salary.total_allowance=salary.basic+salary.da+salary.hra,
net_salary.total_deduction=salary.it;
update net_salary
set net_salary.net_pay=net_salary.total_allowance-net_salary.total_deduction;
end $$
delimiter ;

call salary();
select * from salary;
select * from net_salary;

drop procedure if exists inc;
delimiter $$
create procedure inc()
begin
update salary
set basic=1.15*basic;
end $$
delimiter ;

call inc();
call salary();

select * from salary;
select * from net_salary;

drop procedure if exists maxemp;
delimiter $$
create procedure maxemp()
begin
select emp.ename as "Employee with max pay",net_salary.net_pay as "Pay of employee" from emp innner join net_salary on emp.eno=net_salary.eno where net_salary.net_pay=(select max(net_pay) from net_salary);
end $$
delimiter ;

call maxemp();
