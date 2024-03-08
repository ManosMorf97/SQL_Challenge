drop table if exists bed;
create table if not exists bed(
bed_id int primary key auto_increment,
student_name varchar(20) not null)auto_increment=101;

insert into bed (student_name) values
  ('Alex')
  ,('Jhon')  
  ,('Pain')  
  ,('Danny') 
  ,('Paul')
  ,('Rex')  
  ,('Philip')
  ,('Josh')  
  ,('Evan')  
  ,('Green'); 




-- bed_id used to have
-- who owns it now
-- bed id
-- who owns it now
with new_order as(
select bed_id+(2*MOD(bed_id,2)-1) as bed_id,student_name as student_new from bed)
select bed.bed_id as original_bed_id,student_name,
new_order.bed_id,student_new from new_order 
join bed on student_new=bed.student_name
order by new_order.bed_id;

