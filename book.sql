-- Create database
CREATE DATABASE bookstore;

USE bookstore;

-- Bookstore Database Schema with Tables

-- Country Table 
CREATE TABLE Country (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100)
);

-- Publisher Table
CREATE TABLE Publisher (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(100),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

-- Book Table
CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    publication_year DATE,
    publisher_id INT,
    price DECIMAL(10, 2),
    quantity INT,
    FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id)
);

-- Author Table
CREATE TABLE Author (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100)
);

-- Book_Author Table
CREATE TABLE Book_Author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

-- Book_Language Table
CREATE TABLE Book_Language (
    language_id INT PRIMARY KEY,
    language_name VARCHAR(50)
);

-- Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone INT
);

-- Address_Status Table
CREATE TABLE Address_Status (
    status_id INT PRIMARY KEY,
    status_name VARCHAR(50)
);

-- Address Table
CREATE TABLE Address (
    address_id INT PRIMARY KEY,
    city VARCHAR(100),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

-- Customer_Address Table
CREATE TABLE Customer_Address (
    customer_address VARCHAR(255) PRIMARY KEY,
    address_id INT,
    customer_id INT,
    status_id INT,
    country_id INT,
    FOREIGN KEY (address_id) REFERENCES Address(address_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (status_id) REFERENCES Address_Status(status_id),
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

-- Shipping_Method Table
CREATE TABLE Shipping_Method (
    shipping_method_id INT PRIMARY KEY,
    method_name VARCHAR(50)
);

-- Order_Status Table
CREATE TABLE Order_Status (
    status_id INT,
    status_name VARCHAR(50),
    
    FOREIGN KEY (status_id) REFERENCES Address_Status(status_id),
    FOREIGN KEY (status_name) REFERENCES Address_Status(status_name)
);

-- Cust_Order Table
CREATE TABLE Cust_Order (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    shipping_method_id INT,
    status_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES Shipping_Method(shipping_method_id),
    FOREIGN KEY (status_id) REFERENCES Order_Status(status_id)
);

-- Order_Line Table
CREATE TABLE Order_Line (
    order_line_id INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Cust_Order(order_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

-- Order_History Table
CREATE TABLE Order_History (
    history_id INT PRIMARY KEY,
    order_id INT,
    status_id INT,
    order_time timestamp,
    
    FOREIGN KEY (order_id) REFERENCES Cust_Order(order_id),
    FOREIGN KEY (status_id) REFERENCES Order_Status(status_id)
);


-- creating users

-- user one was Cynthia
CREATE USER'admin1'@'%'
IDENTIFIED BY 'name123';

GRANT ALL PRIVILEGES ON bookstore_db.* TO'admin1'@'%' WITH GRANT OPTION;

-- user two was Enock
CREATE USER'admin2'@'%'
IDENTIFIED BY 'name100';

GRANT ALL PRIVILEGES ON bookstore_db.* TO'admin2'@'%' WITH GRANT OPTION;