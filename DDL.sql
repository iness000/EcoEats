-- Entities
CREATE TABLE User (
    userID INT PRIMARY KEY,
    phone_number VARCHAR(15),
    password VARCHAR(255),
    email VARCHAR(255),
    first_name VARCHAR(50),
    middle_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    address VARCHAR(255)
);

CREATE TABLE Food (
    itemID INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    availability BOOLEAN,
    rating FLOAT,
    quantity INT,
    description TEXT
);

CREATE TABLE Restaurant (
    restaurantID INT PRIMARY KEY,
    name VARCHAR(100),
    founding_date DATE,
    address VARCHAR(255),
    rating FLOAT,
    description TEXT
);

CREATE TABLE CustomerService (
    csID INT PRIMARY KEY,
    email VARCHAR(255),
    name VARCHAR(100),
    inquiry TEXT,
    status VARCHAR(50),
    submission_date DATE
);

-- Weak Entity
CREATE TABLE OrderHistory (
    orderID INT PRIMARY KEY,
    userID INT,
    total_price DECIMAL(10, 2),
    order_date DATE,
    FOREIGN KEY (userID) REFERENCES User(userID)
);

-- Multivalued Attribute
CREATE TABLE Products (
    productID INT PRIMARY KEY,
    userID INT,
    orderID INT,
    product VARCHAR(255),
    FOREIGN KEY (userID) REFERENCES User(userID),
    FOREIGN KEY (orderID) REFERENCES OrderHistory(orderID)
);

-- Relationships
CREATE TABLE Interacts (
    InteractID INT PRIMARY KEY,
    csID INT,
    userID INT,
    FOREIGN KEY (csID) REFERENCES CustomerService(csID),
    FOREIGN KEY (userID) REFERENCES User(userID)
);

CREATE TABLE Buys (
    BuysID INT PRIMARY KEY,
    userID INT,
    foodID INT,
    FOREIGN KEY (userID) REFERENCES User(userID),
    FOREIGN KEY (foodID) REFERENCES Food(itemID)
);

CREATE TABLE Sells (
    SellsID INT PRIMARY KEY,
    restaurantID INT,
    foodID INT,
    FOREIGN KEY (restaurantID) REFERENCES Restaurant(restaurantID),
    FOREIGN KEY (foodID) REFERENCES Food(itemID)
);
