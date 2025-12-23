-- query one join concept

SELECT
  booking_id,
  name AS user_name,
  vehicle_name,
  start_date,
  end_date,
  status
FROM
  bookings AS b
  JOIN users AS u USING (user_id)
  JOIN vehicles AS v USING (vehicle_id);


-- query two not exists concept 

SELECT
  *
FROM
  vehicles
WHERE
  NOT EXISTS (
    SELECT
      1
    FROM
      bookings
    WHERE
      vehicles.vehicle_id = bookings.vehicle_id
  );


-- query three select where concept

SELECT * FROM vehicles WHERE type='car';

-- query four group by having count

SELECT
  v.vehicle_name,
  COUNT(v.vehicle_id) AS total_bookings
FROM
  vehicles AS v
  JOIN bookings USING (vehicle_id)
GROUP BY
  vehicle_id
HAVING
  COUNT(vehicle_id) > 2;