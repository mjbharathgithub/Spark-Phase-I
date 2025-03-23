-- 1. Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order.
select o.OrderID,c.*
from orders o
inner join customers c
on o.CustomerID= c.CustomerID;

-- 2. Write an SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue.
SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalRevenue
FROM orderdetails od
JOIN products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;

-- 3. Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information .
select concat(c.FirstName,' ',c.LastName) Name, c.Phone
from Customers c
join Orders o
on c.CustomerID=o.CustomerID;

-- 4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered.
select p.ProductName, sum(od.Quantity) TotalQuantity
from orderdetails od
join products p on od.ProductID = p.ProductID
group by p.ProductName
order by TotalQuantity desc
limit 1;

-- 5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.
 SELECT ProductName, Description AS Category FROM products;

-- 6. Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value.
 select c.FirstName, c.LastName, avg(o.TotalAmount) as AverageOrderValue
from customers c
join orders o on c.CustomerID = o.CustomerID
group by c.CustomerID;

-- 7. Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.
select o.orderid,concat(c.firstName,' ',c.lastName) Name, c.email,c.phone,c.address,o.TotalAmount
from orders o
join customers c
on o.CustomerID= c.CustomerID
where o.TotalAmount=(select max(TotalAmount) from orders);

-- 8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered.
select p.ProductName, count(od.OrderDetailID) as TimesOrdered
from products p
join orderdetails od on p.ProductID = od.ProductID
group by p.ProductID;

-- 9. Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter.
select c.CustomerID, c.FirstName, c.LastName, c.Email
from customers c
join orders o on c.CustomerID = o.CustomerID
join orderdetails od on o.OrderID = od.OrderID
join products p on od.ProductID = p.ProductID
where p.ProductName = ‘Smartphone’;

-- 10. Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters.
select sum(TotalAmount) as TotalRevenue
from orders
where OrderDate between ‘2025-03-20 11:15:24’ AND ‘2025-03-22 12:00:24’;
