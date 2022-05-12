create database INVOICE3;
use INVOICE3;
show databases;
create table student(id int primary key auto_increment,name varchar(20), age int, city varchar(30));
desc student;
alter table student add dob date;
desc student;                                                                             
alter table student modify dob year;
desc student;
alter table student drop city;
desc student;
create table customer(cust_id int primary key auto_increment, address varchar(30),city varchar(30),phn_no int);
desc customer;
create table product(p_id int primary key auto_increment,pname varchar(20),price int default'0');
desc product;
create table invoice_master(inv_id int primary key auto_increment,cust_id int,constraint cust_id foreign key(cust_id)references customer(cust_id),inv_date date);
desc invoice_master;
create table invoice_item(inv_id int, constraint inv_id foreign key(inv_id) references invoice_master(inv_id),p_id int,constraint p_id foreign key(p_id) references product(p_id),quantity int);
desc invoice_item;
show tables;
alter table customer add cust_name varchar(20);
desc customer;
truncate student;
drop table student;
show tables;
insert into customer values(101,"thoppil house","Kottayam",956251651,"Anu");
insert into customer values(102,"mleveettyl","Pathanamthitta",NULL,"Appu");
insert into customer values(103,"Chirackal","Ranni",763851462,"Siya");
insert into customer values(104,"Thottakuzhi","Ranni",NULL,"Kiran");
insert into customer values(105,"Thoppil","Erumeli",860668429,"Adan");
select * from customer;
insert into product value(200,"Soap",50);
insert into product value(201,"Rice",500);
insert into product value(202,"Bag",750);
insert into product value(203,"Book",50);
insert into product value(204,"Pen",10);
select * from product;
insert into invoice_master values(111,101,'2018-02-01');
insert into invoice_master values(112,102,'2021-03-11');
insert into invoice_master values(113,103,'2018-02-03');
insert into invoice_master values(114,104,'2019-11-04');
insert into invoice_master values(115,105,'2020-07-25');
select * from invoice_master;
insert into invoice_item values(111,200,4);
insert into invoice_item values(112,201,5);
insert into invoice_item values(113,202,3);
insert into invoice_item values(114,203,2);
insert into invoice_item values(115,204,6);
select * from invoice_item;
update customer set city='Kozhikkodu' where cust_id=101;
select * from customer;
update customer set phn_no=949722980 where cust_id=102;
select * from customer;
delete from invoice_item where inv_id=111;
select * from invoice_item;
delete from invoice_master where inv_id=111;
select * from invoice_master;
select * from customer;
select pname,price from product;
select distinct p_id from invoice_item;
select price from product where price between 50 and 150;
select * from customer where city in ('Erumeli','Ranni');
select * from invoice_master where inv_date between '2021-01-01' and '2021-03-31';
select * from customer where city not in('Ranni');
select cust_name from customer where phn_no is NULL;
select cust_name from customer order by cust_name desc;
select * from customer order by city asc,cust_name desc;
select cust_name from customer where cust_name like binary 'A%';
select cust_name from customer where cust_name like binary '%e%' or cust_name like binary '%a%';
select cust_name from customer where cust_name like '___%';
select cust_name from customer where cust_name like binary '_n%'; 
select cust_name from customer where cust_name like binary 'A__%';
select pname,price from product where pname!='Soap';
select min(price),max(price),avg(price) from product;
select city,count(city) as count from customer group by city;
select city,count(city) as count from customer group by city having count(city)>3;
select concat(cust_name,' live in ',city) as 'who,where' from customer;
select cust_name from customer where cust_id in(select cust_id from invoice_master where inv_date='2018-02-03');
select pname,price from product where p_id in(select p_id from invoice_item);
select pname from product where p_id in(select p_id from invoice_item where quantity>3);
select pname from product where p_id not in(select p_id from invoice_item);
select cust_name from customer where cust_id in(select cust_id from invoice_master where inv_id in(select inv_id from invoice_item where p_id in(select p_id from product where pname="Book") and (select p_id from product where pname="Pen")));
select * from invoice_item where inv_id in(select inv_id from invoice_master where cust_id in(select cust_id from customer where cust_name='Siya'));
select distinct cust_name from customer where cust_id in(select cust_id from invoice_master where inv_id in(select inv_id from invoice_item where quantity>=2));











































































































































































































































































































































































































.

















































































































































