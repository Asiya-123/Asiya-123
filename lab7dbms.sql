use INVOICE3;
desc customer;
create table cust_up(cust_id int primary key auto_increment,address varchar(30),city varchar(30),phn_no int,cust_name varchar(20));
delimiter //
create trigger cust_update1
after update
on customer for each row
begin
insert into cust_update1
set cust_id=old.cust_id,address=old.address,city=old.city,phn_no=old.phn_no,cust_name=old.cust_name;
end
//
delimiter ;
select * from customer;
update customer set address='pp house' where cust_id=101;
select * from customer;
select * from cust_update1;
delimiter //;
create trigger min_price
before insert
on product for each row
begin
if new.price<=5 then set new.price=10;
end if;
end
//
delimiter ;
select * from product;
insert into product values(206,"Scale",2);









