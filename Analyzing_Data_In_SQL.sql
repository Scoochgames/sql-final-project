SELECT fare_conditions, AVG(amount) AS avg_price
FROM ticket_flights
GROUP BY fare_conditions
ORDER BY avg_price DESC;

SELECT a.airport_code,
       a.city,
       COUNT(f.flight_id) AS total_departures
FROM airports_data a
JOIN flights f ON a.airport_code = f.departure_airport
GROUP BY a.airport_code, a.city
ORDER BY total_departures DESC;

SELECT 
    status,
    COUNT(*) AS count
FROM flights
GROUP BY status;

SELECT ac.model,
       COUNT(f.flight_id) AS flights_operated
FROM aircrafts_data ac
JOIN flights f ON ac.aircraft_code = f.aircraft_code
GROUP BY ac.model
ORDER BY flights_operated DESC;

WITH durations AS (
    SELECT flight_id,
           flight_no,
           departure_airport,
           arrival_airport,
           (julianday(scheduled_arrival) - julianday(scheduled_departure)) * 24 AS hours
    FROM flights
)
SELECT *
FROM durations
ORDER BY hours DESC
LIMIT 1;