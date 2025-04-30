create or alter procedure fix_available_seats
as
begin
	with seats as (
		select flight,cnt = count(*)
		from biglietto
		group by flight
		)
	update f
	set available_seats = a.capacity - coalesce(s.cnt,0)
	from flight f
	join airplane a
		on  a.airplane_id = f.airplane_id
	left join seats s
		on  s.flight = f.flight_id
end
go

exec fix_available_seats
go

create or alter trigger trg_biglietto
on biglietto
for insert,update,delete
as
begin
	;with cte as (select flight,n=count(*) from inserted group by flight)
	update f
	set available_seats -= x.n
	from flight f
	join cte x
		on  x.flight = f.flight_id

	;with cte as (select flight,n=count(*) from deleted group by flight)
	update f
	set available_seats += x.n
	from flight f
	join cte x
		on  x.flight = f.flight_id
end
go
