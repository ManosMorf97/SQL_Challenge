drop table if exists doctors

if object_id(N'doctors','U') is null
create table doctors(
doctor_id int primary key identity(210,1),
doctor_name varchar(25),
degree varchar(10))

drop table if exists visits

if object_id(N'visits','U') is null
create table visits(
doctor_id int,
patient_name varchar(25),
vdate date,
foreign key (doctor_id) references doctors(doctor_id))

insert into doctors (doctor_name,degree) values
	('Dr. John Linga','MD  '),
    ('Dr. Peter Hall','MBBS'),
    ('Dr. Ke Gee    ','MD  '),
    ('Dr. Pat Fay   ','MD  ')


insert into visits values
	(210,'Julia Nayer ','2013-10-15'),
    (213,'TJ Olson    ','2013-10-14'),
    (211,'John Seo    ','2013-10-15'),
    (212,'James Marlow','2013-10-16'),
    (212,'Jason Mallin','2013-10-12'),
    (213,'Dean Hops   ','2013-10-18'),
    (212,'Peter Kent  ','2013-10-19'),
    (212,'Moody Hogs  ','2013-10-25')


select doctor_name,"Patients_Treated" from doctors join
(select doctor_id,count(*) "Patients_Treated" from visits
group by doctor_id) grouped on doctors.doctor_id=grouped.doctor_id
