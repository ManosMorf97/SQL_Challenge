
drop table if exists treatment

drop table if exists specialist

drop table if exists patient




if object_id(N'patient','U') is null
create table patient(
patient_id int primary key identity(1001,1),
patient_name varchar(25))

if object_id(N'speciality','U') is null
create table speciality(
	specialist varchar(25) primary key
)

if object_id(N'treatment','U') is null
create table treatment(
patient_id int,
specialist_call varchar(25)
foreign key (patient_id) references patient(patient_id),
foreign key (specialist_call) references speciality(specialist)
)

insert into patient (patient_name) values
	  ('Gilbart Kane  '),
      ('Thomas Richi  '),
      ('Ricardo Grance'),
      ('Vanio Tishuma '),
      ('Charls Brown  ')

insert into speciality values
('medicine'),
('cardiology'),
('neurology'),
('hematology')

insert into treatment values
	  (1001,'medicine'),
      (1003,'medicine'),
      (1002,'cardiology'),
      (1001,'hematology'),
      (1004,'medicine'),
      (1003,'cardiology'),
      (1005,'neurology'),
      (1002,'neurology'),
      (1001,'cardiology'),
      (1005,'cardiology'),
      (1003,'cardiology'),
      (1005,'hematology'),
      (1004,'hematology'),
      (1005,'neurology'),
      (1002,'neurology'),
      (1001,'hematology')


with ps as
(select patient_id,patient_name,specialist from patient,speciality)
select ps.patient_id,patient_name,ps.specialist,sum(iif(treatment.patient_id is null,0,1)) from ps left join treatment on 
ps.patient_id=treatment.patient_id and ps.specialist=treatment.specialist_call
group by ps.patient_id,patient_name,ps.specialist
order by ps.patient_id,ps.specialist 



with ps as
(select patient_id,patient_name,specialist from patient,speciality)
select * from ps order by ps.patient_id,ps.specialist