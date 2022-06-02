use INVOICE3;
delimiter //
create function price_range(price int)
returns varchar(6)
deterministic
begin
if price<=10 then 
return 'Low';
elseif price<=60 then
return 'Medium';
else
return 'High';
end if;
end //
delimiter ;
select p_id,pname,price,price_range(price) from product;



