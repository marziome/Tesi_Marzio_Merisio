alter table airline
add constraint xfkairline$airport
	foreign key(base_airport)
	references airport
go

alter table flight
add constraint xpkflight
	primary key(flight_id)
go

alter table flight
add constraint xieflight$from_airport
	foreign key(from_airport)
	references airport
go

alter table flight
add constraint xieflight$to_airport
	foreign key(to_airport)
	references airport
go

alter table flight
add constraint xieflight$airline
	foreign key(airline_id)
	references airline
go

alter table flight
add constraint xieflight$airplane
	foreign key(airplane_id)
	references airplane
go

alter table viaggio
add constraint xfkviaggio$persona
	foreign key(persona)
	references persona
go

alter table biglietto
add constraint xfkbiglietto$viaggio
	foreign key(persona,viaggio)
	references viaggio
go

alter table biglietto
add constraint xfkbiglietto$flight
	foreign key(flight)
	references flight
go
