drop table if exists srno;
create table if not exists srno(
srno int primary key auto_increment,
col_val int not null);

insert into srno (col_val) values(56),(74),(15),(51),(9),(32);

select *, case when MOD(col_val,2)=0 THEN "Even" else "Odd" END as Even_Odd from srno