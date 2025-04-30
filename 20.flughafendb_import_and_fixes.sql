-- import data using SQL Server Management Studio

update airport
set iata = null
where iata = '\N'
go

update airline set base_airport =8330 where airline_id =15;
insert into airport (airport_id, iata, icao, name) values(1418, 'i4', 'iou', 'international air link');
insert into airport (airport_id, iata, icao, name) values(452, 'f4', 'waf', 'air flamenco');
go
