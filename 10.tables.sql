create table airport
	(airport_id smallint not null
	,iata char(3)
	,icao char(4) not null
	,name varchar(50) not null
	,city varchar(50)
	,country varchar(50)
	,latitude decimal(11,8)
	,longitude decimal(11,8)
	,altitude smallint
	,TZ varchar(100)
	,timezone decimal(4,2)
	,DST varchar(1)
	,constraint xpkairport
		primary key(airport_id)
	,constraint xakairport
		unique(icao)
	)
go

create table airline
	(airline_id smallint not null
	,iata char(2) not null
	,airlinename varchar(30)
	,base_airport smallint not null
	,constraint xpkairline
		primary key(airline_id)
	,constraint xakairline
		unique(iata)
	)
go

create table airplane_type
	(type_id int not null
	,identifier varchar(50)
	,description text
	,constraint xpkairplane_type
		primary key(type_id)
	)
go

create table airplane
	(airplane_id int not null
	,capacity int not null
	,type_id int not null
	,airline_id int not null
	,constraint xpkairplane
		primary key(airplane_id)
	)
go

create table flight
	(flight_id int not null
	,flightno varchar(8) not null
	,from_airport smallint not null
	,to_airport smallint not null
	,departure datetime not null
	,arrival datetime not null
	,airline_id smallint not null
	,airplane_id int not null
	,available_seats int
	,constraint xpkflight
		primary key(flight_id)
	,constraint xckflight$available_seats
		check(available_seats >= 0)
	)
go

create table persona
	(persona       int identity not null
	,nome          varchar(200) not null
	,middle        varchar(200)
	,cognome       varchar(200) not null
	,sesso         varchar(1)
	,nazionalita   varchar(200)
	,nato_a        varchar(200)
	,nato_il       date
	,passaporto    varchar(200)
	,rilasciato_da varchar(200)
	,rilasciato_il date
	,indirizzo     varchar(200)
	,mail          varchar(100)
	,telefono      varchar(100)
	,constraint xpkpersona
		primary key(persona)
	)
go

create table viaggio
	(viaggio   int identity not null
	,persona   int not null
	,constraint xpkviaggio
		primary key(persona,viaggio)
	,constraint xakviaggio$viaggio
		unique(viaggio)
	)
go

create table biglietto
	(persona   int not null
	,flight    int not null
	,viaggio   int not null
	,posto     varchar(10)
	,numero    varchar(20)
	,constraint xpkbiglietto
		primary key(persona,flight)
	)
go
