use the_engine_company;

drop procedure if exists product_list;

delimiter $$
create procedure product_list(inout plist varchar(5000))
begin
	declare is_done int default 0;
	declare pname varchar(100) default '';
	declare pcursor cursor for select product_name from product;
	declare continue handler for not found set is_done=1;
	open pcursor;
		concatenator:loop
			fetch pcursor into pname;
			if is_done=1 then
				leave concatenator;
			end if;
			set plist = concat(pname,';',plist);
		end loop concatenator;
	close pcursor;
end $$
delimiter ;

set @list='';

call product_list(@list);

select @list;

drop procedure if exists amount_increase;

delimiter $$
create procedure amount_increase()
begin
	declare is_done int default 0;
	declare id int default 0;
	declare pcursor cursor for select transaction_id from transaction;
	declare continue handler for not found set is_done=1;
	open pcursor;
		inc:loop
			fetch pcursor into id;
			if is_done=1 then
				leave inc;
			end if;
			update transaction
			set transaction_amount=transaction_amount+500
			where transaction_id=id;
		end loop inc;
	close pcursor;	
end $$
delimiter ;

select * from transaction;

call amount_increase();

select * from transaction;
