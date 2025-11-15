-- Create Database
Create Database Online_Book_Store;

-- Switch to th Database
Use Online_Book_Store;

-- Create Table
Drop Table if exists Books;
Create Table Books (
Book_ID int,
Constraint BI_PK Primary Key(Book_ID),
Title Varchar(100),
Author Varchar(100),
Genre Varchar(50),
Published_Year Int,
Price Numeric(10,2),
Stock Int
);

Drop Table if exists Customers;
Create table Customers (
Customer_ID int,
Constraint CI_PK primary key(Customer_ID),
Name Varchar(100),
Email Varchar(100),
Phone varchar(15),
City Varchar(50),
Country Varchar(150)
);

Drop Table if exists Orders;
Create Table Orders (
Order_ID serial,
Constraint OI_PK Primary Key (Order_ID),
Customer_ID int References customers (Customer_ID),
Book_ID Int References books (Book_ID),
Order_Date Date,
Quantity int,
Total_Amount numeric(10,2)
);

-- Import Data into Books Table
LOAD DATA LOCAL INFILE 'D:/SQL Project 1/Books.csv'
INTO TABLE Books
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Book_ID, Title, Author, Genre, Published_Year, Price, Stock);

-- Import Data into Customers Table
LOAD DATA LOCAL INFILE 'D:/SQL Project 1/Customers.csv'
INTO TABLE Books
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Customer_ID, Name, Email, Phone, City, Country);

-- Import Data into Orders Table
LOAD DATA LOCAL INFILE 'D:/SQL Project 1/Orders.csv'
INTO TABLE Books
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount);

-- Q1: Retrieve all books in the "Fiction" genre
Select Title From Books where Genre = 'Fiction';

-- Q2: Find books published after the year 1950
Select Title From Books where Published_Year > 1950;

-- Q3: List all customers from the Canada
Select Name from Customers Where Country = 'Canada';

-- Q4: Show orders placed in November 2023
Select * from Orders where Order_Date Between '2023-10-31' and '2023-12-01';

-- Q5: Retrieve the total stock of books available
Select Sum(Stock) as "Total Stocks" from books;

-- Q6:  Find the details of the most expensive book
Select * from Books Order by Price desc Limit 1;
Select * from books Where Price = (select max(Price) from Books);

-- Q7:  Show all customers who ordered more than 1 quantity of a book
select Name from customers where Customer_ID in (Select Customer_ID from orders where Quantity > 1);
Select c.Name
from Customers c
Join Orders o
on c.Customer_ID = o.Customer_ID
Where o.Quantity > 1;

-- Q8: Retrieve all orders where the total amount exceeds $20
Select * From orders Where Total_Amount > 20;

-- Q9:  List all genres available in the Books table
Select Distinct Genre from Books;

-- Q10: Find the book with the lowest stock
Select * from books where Stock = (select min(Stock) from books);
Select * from books order by Stock Limit 1;

-- Q11: Calculate the total revenue generated from all orders
Select sum(Total_Amount) as "Total Revenue" from orders;

-- Q12: Retrieve the total number of books sold for each genre
Select b.genre, sum(o.quantity) As "Total Books Sold"
From Orders o
Join Books b
on o.Book_ID = b.Book_ID
Group By b.genre;

-- Q13  Find the average price of books in the "Fantasy" genre
Select avg(Price) As 'Average Price' from Books Where Genre = "Fantasy";

-- Q14  List customers who have placed at least 2 orders
Select c.Customer_ID, c.Name, Count(o.Order_id) as 'Order Count'
from customers c
Join orders o
on c.Customer_ID = o.Customer_ID
Group by c.Customer_ID
Having Count(o.Order_id) > 1;

-- Q15 Find the most frequently ordered book
Select b.Book_ID, b.Title, count(o.Order_id) as Order_frequency
From books b
Join orders o
on b.Book_ID = o.Book_ID
Group by o.Book_ID
Order by Order_Frequency desc
Limit 1;

-- Q16 Show the top 3 most expensive books of 'Fantasy' Genre
Select Book_ID, Title, Price from Books
Where Genre = "Fantasy"
Order By Price desc
Limit 3;

-- Q17 Retrieve the total quantity of books sold by each author
Select b.author, sum(o.quantity) as `Total Unit sold`
from books b
Join orders o
on b.book_Id = o.book_Id
group by b.author
Order by `Total Unit sold` desc;

-- Q18 List the cities where customers who spent over $30 are located
Select distinct c.city
from Customers c
join Orders o
on c.customer_ID = o.customer_ID
where o.Total_amount > 30;

-- Q19 Find the customer who spent the most on order
Select C.Name, sum(o.Total_Amount) as `Total Spent`
From Customers c
Join Orders o
on C.Customer_ID = o.Customer_ID
Group by C.Name
order by `Total Spent` 
desc Limit 1;

-- Q20 Calculate the stock remaining after fulfilling all order
select b.book_ID, b.Title, b.stock, coalesce(sum(o.quantity),0) as Order_Quantity, 
(b.stock - coalesce(sum(o.quantity),0)) as Stock_Remaining
From books b
Left Join orders o
on b.Book_ID = o.Book_ID
Group by B.Book_ID;