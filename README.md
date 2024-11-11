# Bank Database Project

This project simulates a simple bank database with customers, orders, and shipping information. It uses SQL to create tables, insert data, and perform queries to interact with the data.

## Features
- Create `Customers`, `Orders`, and `Shippings` tables.
- Insert sample customer, order, and shipping data.
- Perform queries to retrieve customer details, order information, and shipping statuses.
- Update and delete records in the database.

## Project Structure

- `create_tables.sql`: SQL script to create the database tables.
- `sample_data.sql`: SQL script to insert sample data into the database.
- `queries.sql`: Example queries to demonstrate how to retrieve and manipulate data.

## Requirements

- A SQL database management system (e.g., MySQL, SQLite).
- SQL client to run the scripts (e.g., MySQL Workbench, SQLite DB Browser).

## How to Use

1. Download or clone the repository.

2. Open your SQL client and connect to your database.

3. Run the following commands in order:

   - Run `create_tables.sql` to create the tables.
   - Run `sample_data.sql` to insert sample data into the tables.

4. Use `queries.sql` to test various SQL queries and operations.

### Example Usage

```sql
-- Example query to get all customers and their orders
SELECT c.FirstName, c.LastName, o.Item, o.Amount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;
