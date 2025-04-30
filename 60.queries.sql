-- ricerca di un volo diretto
-- da MXP a JFK
-- in data 2015-06-10
-- con almeno quattro posti liberi
select
	 flight_id       = x.flight_id
	,flightno        = x.flightno
	,airplane        = u.identifier
	,departure_utc   = x.departure
	,departure_loc   = dateadd(hh,f.timezone,x.departure)
	,from_iata       = f.iata
--	,from_icao       = f.icao
	,from_name       = f.name
	,from_TZ         = f.TZ
	,arrival_utc     = x.arrival
	,arrival_loc     = dateadd(hh,t.timezone,x.arrival)
	,to_iata         = t.iata
--	,to_icao         = t.icao
	,to_name         = t.name
	,to_TZ           = t.TZ
from flight x
join airport f
	on  f.airport_id = x.from_airport
join airport t
	on  t.airport_id = x.to_airport
join airplane p
	on  p.airplane_id = x.airplane_id
join airplane_type u
	on  u.type_id = p.type_id
where 0=0
  and f.iata = 'MXP'
  and t.iata = 'JFK'
  and x.departure >= '2015-06-10'
  and x.departure <  '2015-06-11'
  and x.available_seats >= 4
order by x.departure

-- ricerca di un volo con uno scalo
-- da MXP a JFK
-- in data 2015-06-10
-- con almeno quattro posti liberi
select
	 flight_id_1       = x.flight_id
	,flightno_1        = x.flightno
	,airplane_1        = u.identifier
	,flight_id_2       = y.flight_id
	,flightno_2        = y.flightno
	,airplane_2        = v.identifier
	,departure_utc     = x.departure
	,departure_loc     = dateadd(hh,f.timezone,x.departure)
	,from_iata         = f.iata
--	,from_icao       = f.icao
	,from_name       = f.name
	,from_TZ           = f.TZ
	,arrival_utc       = x.arrival
	,arrival_loc       = dateadd(hh,t.timezone,x.arrival)
	,to_iata           = t.iata
--	,to_icao         = t.icao
	,to_name         = t.name
	,to_TZ             = t.TZ
	,mid_iata          = m.iata
--	,mid_icao          = m.icao
	,mid_name          = m.name
	,mid_TZ            = m.TZ
	,mid_arrival_utc   = x.arrival
	,mid_arrival_loc   = dateadd(hh,m.timezone,x.arrival)
	,mid_departure_utc = y.departure
	,mid_departure_loc = dateadd(hh,m.timezone,y.departure)
from flight x
join airport f
	on  f.airport_id = x.from_airport
join airport m
	on  m.airport_id = x.to_airport
join flight y
	on  y.from_airport = m.airport_id
join airport t
	on  t.airport_id = y.to_airport
join airplane p
	on  p.airplane_id = x.airplane_id
join airplane_type u
	on  u.type_id = p.type_id
join airplane q
	on  q.airplane_id = y.airplane_id
join airplane_type v
	on  v.type_id = q.type_id
where 0=0
  and f.iata = 'MXP'
  and t.iata = 'JFK'
  and datediff(hh,x.arrival,y.departure) between 1 and 5
  and x.departure >= '2015-06-10'
  and x.departure <  '2015-06-11'
  and x.available_seats >= 4
  and y.available_seats >= 4
order by x.departure

-- tutti i biglietti di persone di cognome Merisio
select
	 b.numero
	,b.persona
	,z.nome
	,z.cognome
	,flight_id       = x.flight_id
	,flightno        = x.flightno
	,airplane        = u.identifier
	,departure_utc   = x.departure
	,departure_loc   = dateadd(hh,f.timezone,x.departure)
	,from_iata       = f.iata
--	,from_icao       = f.icao
	,from_name       = f.name
	,from_TZ         = f.TZ
	,arrival_utc     = x.arrival
	,arrival_loc     = dateadd(hh,t.timezone,x.arrival)
	,to_iata         = t.iata
--	,to_icao         = t.icao
	,to_name         = t.name
	,to_TZ           = t.TZ
from biglietto b
join persona z
	on  z.persona = b.persona
join flight x
	on  x.flight_id = b.flight
join airport f
	on  f.airport_id = x.from_airport
join airport t
	on  t.airport_id = x.to_airport
join airplane p
	on  p.airplane_id = x.airplane_id
join airplane_type u
	on  u.type_id = p.type_id
where z.cognome = 'Merisio'
order by b.persona,x.departure

-- verifica validità del biglietto A1234
select
	 b.numero
	,b.persona
	,z.nome
	,z.cognome
	,flight_id       = x.flight_id
	,flightno        = x.flightno
	,airplane        = u.identifier
	,departure_utc   = x.departure
	,departure_loc   = dateadd(hh,f.timezone,x.departure)
	,from_iata       = f.iata
--	,from_icao       = f.icao
	,from_name       = f.name
	,from_TZ         = f.TZ
	,arrival_utc     = x.arrival
	,arrival_loc     = dateadd(hh,t.timezone,x.arrival)
	,to_iata         = t.iata
--	,to_icao         = t.icao
	,to_name         = t.name
	,to_TZ           = t.TZ
from biglietto b
join persona z
	on  z.persona = b.persona
join flight x
	on  x.flight_id = b.flight
join airport f
	on  f.airport_id = x.from_airport
join airport t
	on  t.airport_id = x.to_airport
join airplane p
	on  p.airplane_id = x.airplane_id
join airplane_type u
	on  u.type_id = p.type_id
where b.numero = 'A1234'
order by b.persona,x.departure
go

-- tutti i voli di giugno che partono da Malpensa
select
	 flight_id       = x.flight_id
	,flightno        = x.flightno
	,airplane        = u.identifier
	,departure_utc   = x.departure
	,departure_loc   = dateadd(hh,f.timezone,x.departure)
	,from_iata       = f.iata
--	,from_icao       = f.icao
	,from_name       = f.name
	,from_TZ         = f.TZ
	,arrival_utc     = x.arrival
	,arrival_loc     = dateadd(hh,t.timezone,x.arrival)
	,to_iata         = t.iata
--	,to_icao         = t.icao
	,to_name         = t.name
	,to_TZ           = t.TZ
from flight x
join airport f
	on  f.airport_id = x.from_airport
join airport t
	on  t.airport_id = x.to_airport
join airplane p
	on  p.airplane_id = x.airplane_id
join airplane_type u
	on  u.type_id = p.type_id
where 0=0
  and f.iata = 'MXP'
  and x.departure >= '2015-06-01'
  and x.departure <  '2015-07-01'
order by x.departure

