drop trigger if exists price_trigger;

delimiter $$

create trigger price_trigger before insert on transaction
for each row
begin
	if new.transaction_amount<0
		then set new.transaction_amount=0;
	end if;
end $$

delimiter ;
