drop table if exists tablefortest;

create table if not exists tablefortest(
srno int primary key auto_increment,
pos_neg_val int not null);

insert into tablefortest (pos_neg_val) values(56),(-74),(15),(-51),(-9),(32);

select *,-1*pos_neg_val as converted_single_value from tablefortest;