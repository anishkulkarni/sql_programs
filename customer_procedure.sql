use the_engine_company

drop procedure if exists customer_proc;

delimiter $$
create procedure customer_proc()
begin
	select * from customer;
end $$
delimiter ;

call customer_proc();

drop procedure if exists price_increase;

delimiter $$
create procedure price_increase()
begin
	update transaction set transaction_amount = 1.2 * transaction_amount;
end $$
delimiter ;

call customer_proc();

call price_increase();
