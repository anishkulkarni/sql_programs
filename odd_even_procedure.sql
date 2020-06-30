drop procedure if exists odd_even;
delimiter $$
create procedure odd_even( in start int, in end int, out sum_even int, out sum_odd int)
begin
	declare i int default start;
	set sum_even=0;
	set sum_odd=0;
	while(i<=end) do
		if(i%2=0)
			then set sum_even=sum_even+i;
		else
			set sum_odd=sum_odd+i;
		end if;
		set i=i+1;
	end while;
end $$
delimiter ;

call odd_even(1,100,@se,@so);
select @se as "sum_even" , @so as "sum_odd";
