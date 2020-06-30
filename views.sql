drop view if exists product_view;

create view product_view as select product_id, product_name from product;

select * from product_view;

insert into product_view values(22,'hi');

select * from product_view;

update product_view set product_name='welcome' where product_id='22';

select * from product_view;

delete from product_view where product_id='22';

select * from product_view;
