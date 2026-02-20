create database joins;
use joins;
create table Customers(
CustomerID int,
CustomerName varchar(50),
City varchar(50));
insert into Customers (CustomerID,CustomerName,City)
values
(1,'John Smith','New York'),
(2,'Mary Johnson','Chicago'),
(3,'Peter Adams','Los Angeles'),
(4,'Nancy Miller','Houston'),
(5,'Robert White','Miami');
create table Orders(
OrderID int,
CustomerID int,
OrderDate date,
Amount int);
insert into Orders (OrderID,CustomerID,OrderDate,Amount)
values
(101,1,'2024-10-01', 250),
(102,2,'2024-10-05',300),
(103,1,'2024-10-07',150),
(104,3,'2024-10-10',450),
(105,3,'2024-10-12',400);
create table Payments(
PaymentID varchar(50),
CustomerID int,
PaymentDate date,
Amount int);
insert into  Payments (PaymentID,CustomerID,PaymentDate,Amount)
values
('P001',1,'2024-10-02',250),
('P002',2,'2024-10-06',300),
('P003',3,'2024-10-11',450),
('P004',4,'2024-10-15',200); 
create table Employees(
EmployeeID INT,
EmployeeName VARCHAR(100),
ManagerID VARCHAR(50));
insert into Employees (EmployeeID,EmployeeName,ManagerID)
values
(1,'Alex Green','NULL'),
(2,'Brian Lee',1),
(3,'Carol Ray',1),
(4,'David Kim',2),
(5,'Eva Smith',2);
-- Question 1. Retrieve all customers who have placed at least one order.
SELECT DISTINCT c.CustomerID,c.CustomerName,c.City from Customers c inner join Orders o on c.CustomerID=o.CustomerID;
-- Question 2. Retrieve all customers and their orders, including customers who have not placed any orders.
select c.*,o.* from Customers c left join Orders o on c.CustomerID= o.CustomerID;
-- Question 3. Retrieve all orders and their corresponding customers, including orders placed by unknown customers
select o.*,c.* from Orders o left join Customers c on o.CustomerID = c.CustomerID
-- Question 4. Display all customers and orders, whether matched or not.
SELECT  c.*,o.* from Customers c left join Orders o on c.CustomerID= o.CustomerID
union 
select c.*,o.* from Customers c right join Orders o on c.CustomerID= o.CustomerID;
-- Question 5. Find customers who have not placed any orders.
SELECT C.* FROM Customers c left join Orders o on c.CustomerID= o.CustomerID WHERE o.CustomerID is null 
-- Question 6. Retrieve customers who made payments but did not place any orders.
SELECT DISTINCT c.*
FROM Customers c
INNER JOIN Payments p
ON c.CustomerID = p.CustomerID
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL ;
-- Question 7. Generate a list of all possible combinations between Customers and Orders.
SELECT c.*, o.*
FROM Customers c
CROSS JOIN Orders o;
-- Question 8. Show all customers along with order and payment amounts in one table.
SELECT c.CustomerName,
       o.Amount AS OrderAmount,
       p.Amount AS PaymentAmount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p
ON c.CustomerID = p.CustomerID;
-- Question 9. Retrieve all customers who have both placed orders and made payments.
SELECT DISTINCT c.*
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
INNER JOIN Payments p
ON c.CustomerID = p.CustomerID;
