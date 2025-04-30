create index xieairport$name on airport(name)
create index xieairport$iata on airport(iata)
go

create index xieairline$airport on airline(base_airport)
go

create index xieflight$from_airport on flight(from_airport)
create index xieflight$to_airport on flight(to_airport)
create index xieflight$departure on flight(departure)
create index xieflight$arrival on flight(arrival)
create index xieflight$airline on flight(airline_id)
create index xieflight$airplane on flight(airplane_id)
go

create index xieflight$idx on flight(from_airport,departure)
go

create index xiebiglietto$numero on biglietto(numero)
go
