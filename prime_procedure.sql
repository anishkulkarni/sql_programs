drop procedure if exists prime;
delimiter $$
create procedure prime( in num int, out status varchar(3))
begin
	declare i int default 1;
	declare factors int default 0;
	set status="no";
	while(i<=num) do
		if(num%i=0)
			then set factors=factors+1;
		end if;
		set i=i+1;
	end while;
	if(factors=2)
		then set status="yes";
	end if;
end $$
delimiter ;
call prime(5,@status);
select 5 as "input" , @status as "is_prime";

drop procedure prime_range;
delimiter $$
create procedure prime_range(in start int, in end int)
begin
	declare i int default start;
	declare status varchar(3);
	while(i<=end) do
		call prime(i,status);
		if(status="yes")
			then select i as "next_prime";
		end if;
		set i=i+1;
	end while;
end $$
delimiter ;

call prime_range(1,100);
