-- Drop the existing tables if they exist to avoid errors
DROP TABLE IF EXISTS Shippings;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

-- Create the Customers table with correct columns
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    Email TEXT,
    Phone TEXT
);

-- Insert sample customers data
INSERT INTO Customers (FirstName, LastName, Email, Phone) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678'),
('Michael', 'Johnson', 'michael.johnson@example.com', '555-8765'),
('Robert', 'Luna', 'robert.luna@example.com', '555-1122'),
('David', 'Robinson', 'david.robinson@example.com', '555-3344');

-- Create the Orders table with the foreign key referencing Customers
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INTEGER PRIMARY KEY AUTOINCREMENT,
    Item TEXT NOT NULL,
    Amount INTEGER NOT NULL,
    CustomerID INTEGER,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample orders data
INSERT INTO Orders (Item, Amount, CustomerID) VALUES
('Keyboard', 400, 4),
('Mouse', 300, 4),
('Monitor', 12000, 3),
('Keyboard', 400, 1),
('Mousepad', 250, 2);

-- Create the Shippings table with the foreign key referencing Customers
CREATE TABLE IF NOT EXISTS Shippings (
    ShippingID INTEGER PRIMARY KEY AUTOINCREMENT,
    CustomerID INTEGER,
    ShippingAddress TEXT NOT NULL,
    ShippingDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample shipping data for customers
INSERT INTO Shippings (CustomerID, ShippingAddress) VALUES
(1, '123 Elm St, Springfield'),
(2, '456 Oak St, Springfield'),
(3, '789 Pine St, Springfield'),
(4, '101 Maple St, Springfield'),
(5, '202 Birch St, Springfield');

-- Example: Query to get all customers with their orders
SELECT c.FirstName, c.LastName, o.Item, o.Amount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Example: Query to get all shipping information for customers
SELECT s.ShippingAddress, s.ShippingDate, c.FirstName, c.LastName
FROM Shippings s
JOIN Customers c ON s.CustomerID = c.CustomerID;

-- Example: Query to get all orders and total amount per customer
SELECT c.FirstName, c.LastName, SUM(o.Amount) AS TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

-- Example: Update a customer's phone number
UPDATE Customers
SET Phone = '555-987-6543'
WHERE CustomerID = 1;

-- Example: Delete an order
DELETE FROM Orders
WHERE OrderID = 2;

