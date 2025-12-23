# Project Name: [Vehicle Rental System - Database Design & SQL Queries]

## 📌 Overview
In this project, several queries were performed using PostgreSQL for a Vehicle Rental System. It demonstrates how to extract necessary information from the Customers, Vehicles, and Bookings tables using SQL queries. Additionally, an ERD (Entity Relationship Diagram) design has been created for this system. All queries performed according to the requirements are included in the `queries.sql` file.

## 🛠️ Technologies Used
* **Database engine:** [PostgreSQL]
* **Query Language:** SQL (PostgreSQL)
* **Tools:** [Beekeeper]

## 📂 Database Schema
Briefly describe the tables used in your queries:
* **Table users:** Stores customer information.
* **Table vehicles:** Stores vehicles information.
* **Table bookings:** Stores bookings information.

---

## 🔍 Query Explanations & Solutions
Each section below corresponds to a query found in `queries.sql`.

### 1. [Query Name, Retrieve booking information]
**Problem:** Retrieve booking information along with:
Customer name
Vehicle name
**SQL Solution:**
```sql
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
  JOIN vehicles AS v USING (vehicle_id).

```  
### 2. [Query Name, Find all vehicles]
**Problem:** Find all vehicles that have never been booked.
**SQL Solution:**
```sql
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
```  
### 3. [Query Name, Where]
**Problem:** Retrieve all available vehicles of a specific type (e.g. cars).
**SQL Solution:**
```sql
SELECT * FROM vehicles WHERE type='car';
