drop table if exists mov_direction_test;
drop table if exists movie_test;
drop table if exists director_test;
drop table if exists actor_test;

create table if not exists actor_test(
act_id int not null primary key auto_increment,
act_name varchar(20) not null)auto_increment=101;

create table if not exists director_test(
dir_id int not null primary key auto_increment,
dir_name varchar(20) not null)auto_increment=201;

create table if not exists movie_test(
mov_id int not null primary key auto_increment,
movie_name varchar(20) not null)auto_increment=901;

create table if not exists mov_direction_test(
dir_id int not null,
mov_id int not null,
act_id int not null,
primary key (dir_id,mov_id,act_id),
foreign key (dir_id) references director_test(dir_id),
foreign key (mov_id) references movie_test(mov_id),
foreign key (act_id) references actor_test(act_id));

insert into actor_test (act_name) values
('James Stewart    '),
('Deborah Kerr     '),
('Peter OToole     '),
('Robert De Niro   '),
('F. Murray Abraham'),
('Harrison Ford    '),
('Bill Paxton      '),
('Stephen Baldwin  '),
('Jack Nicholson   '),
('Mark Wahlberg    ');

insert into director_test (dir_name) values
('Alfred Hitchcock' ),
('Jack Clayton    ' ),
('James Cameron   ' ),
('Michael Cimino  ' ),
('Milos Forman    ' ),
('Ridley Scott    ' ),
('Stanley Kubrick ' ),
('Bryan Singer    ' ),
('Roman Polanski  ' );

insert into movie_test (movie_name) values
('Vertigo            '),
('Aliens             '),
('Lawrence of Arabia '),
('The Deer Hunter    '),
('True Lies          '),
('Blade Runner       '),
('Eyes Wide Shut     '),
('Titanic            '),
('Chinatown          '),
('Ghosts of the Abyss');


insert into mov_direction_test values
(201,901,101),
(203,902,107),
(204,904,104),
(203,905,107),
(206,906,106),
(203,908,107),
(209,909,109),
(203,910,107);


select act_name,dir_name from mov_direction_test as mdt 
left join actor_test as at on mdt.act_id=at.act_id
left join director_test as dt on mdt.dir_id=dt.dir_id
left join movie_test as mt on mdt.mov_id=mt.mov_id
group by dir_name,act_name having count(*)>=3;