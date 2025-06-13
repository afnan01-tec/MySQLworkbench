-- NORTHWIND DATABASE

DROP DATABASE IF EXISTS northwind;
CREATE DATABASE northwind;
USE northwind;

CREATE TABLE Customers (
    CustomerID VARCHAR(5) PRIMARY KEY,
    CompanyName VARCHAR(40) NOT NULL,
    ContactName VARCHAR(30),
    ContactTitle VARCHAR(30),
    Country VARCHAR(20)
);

CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(15),
    Description TEXT
);

CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    CompanyName VARCHAR(40),
    ContactName VARCHAR(30),
    ContactTitle VARCHAR(30),
    City VARCHAR(20),
    Country VARCHAR(20),
    Phone VARCHAR(20)
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(40),
    SupplierID INT,
    CategoryID INT,
    QuantityPerUnit VARCHAR(20),
    UnitPrice DECIMAL(10,2),
    UnitsInStock INT,
    UnitsOnOrder INT,
    ReorderLevel INT,
    Discontinued BOOLEAN,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Insert into Customers
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Country) VALUES
('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Sales Representative', 'Germany'),
('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Owner', 'Mexico'),
('ANTON', 'Antonio Moreno Taquería', 'Antonio Moreno', 'Owner', 'Mexico'),
('AROUT', 'Around the Horn', 'Thomas Hardy', 'Sales Representative', 'UK'),
('BERGS', 'Berglunds snabbköp', 'Christina Berglund', 'Order Administrator', 'Sweden'),
('BLAUS', 'Blauer See Delikatessen', 'Hanna Moos', 'Sales Representative', 'Germany'),
('BLONP', 'Blondel père et fils', 'Frédérique Citeaux', 'Marketing Manager', 'France'),
('BOLID', 'Bólido Comidas preparadas', 'Martín Sommer', 'Owner', 'Spain'),
('BONAP', 'Bon app', 'Laurence Lebihan', 'Owner', 'France'),
('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Accounting Manager', 'Canada');

-- Insert into Categories
INSERT INTO Categories (CategoryName, Description) VALUES
('Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
('Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
('Confections', 'Desserts, candies, and sweet breads'),
('Dairy Products', 'Cheeses'),
('Grains/Cereals', 'Breads, crackers, pasta, and cereal'),
('Meat/Poultry', 'Prepared meats'),
('Produce', 'Dried fruit and bean curd'),
('Seafood', 'Seaweed and fish'),
('Snacks', 'Chips and light snacks'),
('Frozen Foods', 'Frozen prepared foods');

-- Insert into Suppliers
INSERT INTO Suppliers (CompanyName, ContactName, ContactTitle, City, Country, Phone) VALUES
('Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', 'London', 'UK', '171-555-2222'),
('New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'New Orleans', 'USA', '100-555-4822'),
('Grandma Kelly’s Homestead', 'Regina Murphy', 'Sales Representative', 'Ann Arbor', 'USA', '313-555-5735'),
('Tokyo Traders', 'Yoshi Nagase', 'Marketing Manager', 'Tokyo', 'Japan', '03-3555-5011'),
('Cooperativa de Quesos', 'Antonio del Valle', 'Export Administrator', 'Oviedo', 'Spain', '985-555-2929'),
('Mayumi’s', 'Mayumi Ohno', 'Marketing Representative', 'Osaka', 'Japan', '06-431-7877'),
('Pavlova Ltd.', 'Ian Devling', 'Marketing Manager', 'Melbourne', 'Australia', '03-444-2343'),
('Specialty Biscuits Ltd.', 'Peter Wilson', 'Sales Representative', 'Manchester', 'UK', '0161-555-4448'),
('PB Knäckebröd AB', 'Lars Peterson', 'Sales Agent', 'Göteborg', 'Sweden', '031-555-1234'),
('Refrescos Americanas LTDA', 'Carlos Diaz', 'Marketing Manager', 'Sao Paulo', 'Brazil', '011-555-4640');

-- Insert into Products
INSERT INTO Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued) VALUES
('Chai', 1, 1, '10 boxes x 20 bags', 18.00, 39, 0, 10, FALSE),
('Chang', 1, 1, '24 - 12 oz bottles', 19.00, 17, 40, 25, FALSE),
('Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10.00, 13, 70, 25, FALSE),
('Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22.00, 53, 0, 0, FALSE),
('Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.35, 0, 0, 0, TRUE),
('Grandma''s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25.00, 120, 0, 25, FALSE),
('Uncle Bob''s Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', 30.00, 15, 0, 10, FALSE),
('Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40.00, 6, 0, 0, FALSE),
('Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97.00, 29, 0, 0, TRUE),
('Ikura', 4, 8, '12 - 200 ml jars', 31.00, 31, 0, 0, FALSE);


-- PUBS DATABASE

DROP DATABASE IF EXISTS pubs;
CREATE DATABASE pubs;
USE pubs;

CREATE TABLE Publishers (
    pub_id VARCHAR(10) PRIMARY KEY,
    pub_name VARCHAR(50),
    city VARCHAR(20),
    state VARCHAR(2),
    country VARCHAR(20)
);

CREATE TABLE Authors (
    au_id VARCHAR(11) PRIMARY KEY,
    au_lname VARCHAR(40),
    au_fname VARCHAR(20),
    phone VARCHAR(12),
    address VARCHAR(40),
    city VARCHAR(20),
    state VARCHAR(2),
    zip VARCHAR(5),
    contract BOOLEAN
);

CREATE TABLE Titles (
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(80),
    type VARCHAR(20),
    pub_id VARCHAR(10),
    price DECIMAL(10,2),
    pubdate DATE,
    FOREIGN KEY (pub_id) REFERENCES Publishers(pub_id)
);

-- Insert into Publishers
INSERT INTO Publishers (pub_id, pub_name, city, state, country) VALUES
('0736', 'New Moon Books', 'Boston', 'MA', 'USA'),
('0877', 'Binnet & Hardley', 'Washington', 'DC', 'USA'),
('1389', 'Algodata Infosystems', 'Berkeley', 'CA', 'USA'),
('1622', 'Sams Publishing', 'San Mateo', 'CA', 'USA'),
('1756', 'IT Books', 'Dallas', 'TX', 'USA'),
('1860', 'Beta Books', 'Austin', 'TX', 'USA'),
('1900', 'Gamma Publications', 'Denver', 'CO', 'USA'),
('1991', 'Delta Press', 'Seattle', 'WA', 'USA'),
('2001', 'Epsilon Books', 'Chicago', 'IL', 'USA'),
('2100', 'Omega Publications', 'Miami', 'FL', 'USA');

-- Insert into Authors
INSERT INTO Authors (au_id, au_lname, au_fname, phone, address, city, state, zip, contract) VALUES
('172-32-1176', 'White', 'Johnson', '4084967223', '10932 Bigge Rd.', 'Menlo Park', 'CA', '94025', TRUE),
('213-46-8915', 'Green', 'Marjorie', '4084967223', '78 Fourth Street', 'Boston', 'MA', '02110', TRUE),
('238-95-7766', 'Carson', 'Cheryl', '4153547123', '1956 Oak St.', 'Berkeley', 'CA', '94705', TRUE),
('267-41-2394', 'O''Leary', 'Michael', '4082862428', '9 Green Rd.', 'Santa Clara', 'CA', '95051', TRUE),
('274-80-9391', 'Gringlesby', 'Burt', '4159867020', '67 Seventh Av.', 'San Francisco', 'CA', '94130', TRUE),
('341-22-1782', 'Dull', 'Ann', '4158367123', '1335 First Street', 'San Jose', 'CA', '95110', TRUE),
('409-56-7008', 'Hunter', 'Sheryl', '4082892818', '892 Central St.', 'Mountain View', 'CA', '94043', TRUE),
('427-17-2319', 'McBadden', 'Heather', '4156589934', '2222 Harbor Rd.', 'Redwood City', 'CA', '94065', TRUE),
('472-27-2349', 'Locksley', 'Charlene', '4156440705', '1235 Broadway', 'Oakland', 'CA', '94607', TRUE),
('527-72-3246', 'Smith', 'Meghan', '4082135472', '78 Valencia Ave.', 'Palo Alto', 'CA', '94301', TRUE);

-- Insert into Titles
INSERT INTO Titles (title_id, title, type, pub_id, price, pubdate) VALUES
('BU1032', 'The Busy Executive''s Database Guide', 'business', '0877', 19.99, '1991-06-12'),
('MC2222', 'Cooking with Computers', 'popular_comp', '0877', 11.95, '1992-06-09'),
('PC8888', 'Secrets of Silicon Valley', 'business', '0736', 20.00, '1994-09-12'),
('PS1372', 'Straight Talk About Computers', 'popular_comp', '0736', 14.99, '1993-06-22'),
('TC3218', 'Advanced SQL Programming', 'tech', '1389', 34.99, '1995-03-01'),
('DB5555', 'Intro to Databases', 'tech', '1756', 29.95, '1990-10-01'),
('WD7777', 'Web Design Basics', 'tech', '2001', 22.50, '2001-01-15'),
('DS1010', 'Data Science Handbook', 'tech', '1900', 45.00, '2020-06-10'),
('ML2020', 'Machine Learning 101', 'tech', '1860', 49.99, '2021-05-20'),
('AI3030', 'AI for Everyone', 'tech', '2100', 39.99, '2022-11-11');
