drop table if exists topics

if object_id(N'topics','U') is null
create table topics(
topic_id int,
writer_id int,
rated_by int,
date_of_rating date)

insert into topics values
  (10001,504,507,'2020-07-17'),
  (10003,502,503,'2020-09-22'),
  (10001,503,507,'2020-02-07'),
  (10002,501,507,'2020-05-13'),
  (10002,502,502,'2020-04-10'),
  (10002,504,502,'2020-11-16'),
  (10003,501,502,'2020-10-05'),
  (10001,507,507,'2020-12-23'),
  (10004,503,501,'2020-08-28'),
  (10003,505,504,'2020-12-21')

select writer_id from topics as "Author rated on own topic" where writer_id=rated_by

