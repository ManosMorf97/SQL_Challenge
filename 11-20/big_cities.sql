drop table if exists cities; 
create table if not exists cities_test(
city_name varchar(20) primary key,
country varchar(20) not null,
city_population bigint not null,
city_area bigint not null);


INSERT INTO cities_test VALUES ('Tokyo	 		','Japan		',	13515271,	2191	);	
INSERT INTO cities_test VALUES ('Delhi	 		','India		',	16753235,	1484	);	
INSERT INTO cities_test VALUES ('Shanghai	 	','China		',	24870895,	6341	);	
INSERT INTO cities_test VALUES ('Sao Paulo	 	','Brazil		',	12252023,	1521	);	
INSERT INTO cities_test VALUES ('Mexico City	','Mexico		',	9209944,	1485	);	
INSERT INTO cities_test VALUES ('Cairo	 		','Egypt		',	9500000,	3085	);	
INSERT INTO cities_test VALUES ('Mumbai	 		','India		',	12478447,	603		);	
INSERT INTO cities_test VALUES ('Beijing	 	','China		',	21893095,	16411	);	
INSERT INTO cities_test VALUES ('Osaka	 		','Japan		',	2725006,	225		);	
INSERT INTO cities_test VALUES ('New York	 	','United States',	8398748,	786		);	
INSERT INTO cities_test VALUES ('Buenos Aires	','Argentina	',	3054300,	203		);	
INSERT INTO cities_test VALUES ('Chongqing	 	','China		',	32054159,	82403	);	
INSERT INTO cities_test VALUES ('Istanbul	 	','Turkey		',	15519267,	5196	);	
INSERT INTO cities_test VALUES ('Kolkata	 	','India		',	4496694,	205		);	
INSERT INTO cities_test VALUES ('Manila	 		','Philippines	',	1780148,	43		);	

select * from cities_test where city_population>15000000 or city_area>50000;