select transaction_id from customer inner join transaction on customer.customer_id=transaction.transaction_id where customer.customer_id=2;

select customer_id, product_id from transaction where transaction_id=3;

select sum(transaction_amount) from transaction;

select * from transaction order by transaction_id desc;

select customer_name from customer where customer_name like 'Scu%';

select transaction_id,transaction_amount from transaction where transaction_amount=(select max(transaction_amount) from transaction);

select * from transaction inner join customer on transaction.transaction_id=customer.customer_id where customer.customer_location='England' and transaction.transaction_time='2007-08-15 10:00:00';

update transaction set transaction_amount=0.95*transaction_amount where transaction_amount>100000;

insert into transaction values(10,10,10,10000376372,'2007-11-23 10:00:00');

delete from transaction where transaction.transaction_id=10;

select count(customer_id) from customer;

select customer_name, avg(transaction_amount) from customer inner join transaction on customer.customer_id=transaction.customer_id group by customer_name;

select customer_name, sum(transaction_amount) from customer inner join transaction on customer.customer_id=transaction.customer_id group by customer_name;

select day('1995-11-16'), month('1995-11-16'), year('1995-11-16');

select curdate(), curtime(), current_timestamp();

selct date_add(curdate(),interval -6 months) as '6 month previous', date_add(curdate(), interval 6 months) as '6 moths forward';

select customer_location, sum(transaction_amount) from transaction inner join customer on transaction.transaction_id=customer.customer_id group by customer_location;

select * from transaction where date(transaction_time)=curdate();

select product_name from product where product_name not like 'Mercedes%';

select * from product where product_id in (3,5,2);

select product_name from product inner join transaction on product.product_id=transaction.transaction_id where transaction_amount > (select transaction_amount from transaction inner join product on product.product_id=transaction.product_id  where product_name='Mclaren Engine');