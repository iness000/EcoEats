-- Insert users
INSERT INTO User VALUES (1, '123-456-7890', 'password123', 'user1@example.com', 'John', NULL, 'Doe', '1990-01-01', '123 Main St');
INSERT INTO User VALUES (2, '987-654-3210', 'pass456', 'user2@example.com', 'Jane', 'A', 'Doe', '1985-05-15', '456 Oak St');
INSERT INTO User VALUES (3, '555-123-4567', 'pass789', 'user3@example.com', 'Mike', 'B', 'Smith', '1988-09-20', '789 Maple Ln');
INSERT INTO User VALUES (4, '222-333-4444', 'qwerty123', 'user4@example.com', 'Emily', NULL, 'Johnson', '1995-12-10', '321 Elm St');
INSERT INTO User VALUES (5, '777-888-9999', 'letmein456', 'user5@example.com', 'Chris', 'C', 'Brown', '1980-04-05', '555 Pine Ave');
INSERT INTO User VALUES (6, '111-222-3333', 'password789', 'user6@example.com', 'Samantha', NULL, 'Williams', '1992-07-18', '987 Cedar Rd');

-- Insert foods
INSERT INTO Food VALUES (101, 'Burger', 8.99, true, 4.5, 50, 'Delicious beef burger');
INSERT INTO Food VALUES (102, 'Pizza', 12.99, true, 4.8, 30, 'Margherita pizza with fresh tomatoes and mozzarella');
INSERT INTO Food VALUES (103, 'Salad', 7.49, true, 4.2, 40, 'Fresh garden salad with mixed greens and vinaigrette');
INSERT INTO Food VALUES (104, 'Sushi Roll', 15.99, true, 4.9, 25, 'Assorted sushi rolls with wasabi and soy sauce');
INSERT INTO Food VALUES (105, 'Chicken Alfredo', 14.50, true, 4.7, 35, 'Creamy Alfredo sauce with grilled chicken and fettuccine pasta');
INSERT INTO Food VALUES (106, 'Fish Tacos', 10.75, true, 4.4, 30, 'Battered fish tacos with coleslaw and chipotle mayo');

-- Insert restaurants
INSERT INTO Restaurant VALUES (201, 'Tasty Grill', '2000-07-15', '789 Park Ave', 4.2, 'Classic American cuisine');
INSERT INTO Restaurant VALUES (202, 'Italiano Eats', '1995-03-20', '567 Olive St', 4.5, 'Authentic Italian dishes');
INSERT INTO Restaurant VALUES (203, 'Spicy Bites', '2010-11-25', '456 Redwood Blvd', 4.4, 'Diverse menu with spicy cuisines');
INSERT INTO Restaurant VALUES (204, 'Asian Fusion', '2005-08-12', '789 Sakura Ln', 4.6, 'Blend of Asian flavors with a modern twist');
INSERT INTO Restaurant VALUES (205, 'Mediterranean Delight', '2018-04-02', '111 Olive Ave', 4.8, 'Fresh and healthy Mediterranean dishes');
INSERT INTO Restaurant VALUES (206, 'Tex-Mex Grill', '2002-06-15', '222 Pepper St', 4.3, 'Texan and Mexican fusion dishes');

-- Insert customer service inquiries
INSERT INTO CustomerService VALUES (301, 'user1@example.com', 'John', 'Issue with order delivery', 'Open', '2023-01-10');
INSERT INTO CustomerService VALUES (302, 'user2@example.com', 'Jane', 'Billing inquiry', 'Closed', '2023-02-05');
INSERT INTO CustomerService VALUES (303, 'user3@example.com', 'Mike', 'Quality concern with the food', 'Open', '2023-04-20');
INSERT INTO CustomerService VALUES (304, 'user4@example.com', 'Emily', 'Feedback on recent order', 'Closed', '2023-05-02');
INSERT INTO CustomerService VALUES (305, 'user5@example.com', 'Chris', 'Missing item in the delivery', 'Open', '2023-05-10');

-- Insert order history
INSERT INTO OrderHistory VALUES (401, 1, 21.98, '2023-03-01');
INSERT INTO OrderHistory VALUES (402, 2, 31.98, '2023-03-05');
INSERT INTO OrderHistory VALUES (403, 3, 22.49, '2023-03-10');
INSERT INTO OrderHistory VALUES (404, 4, 45.25, '2023-03-15');
INSERT INTO OrderHistory VALUES (405, 5, 35.25, '2023-03-20');

-- Insert products for orders
INSERT INTO Products VALUES (501, 1, 401, 'Burger');
INSERT INTO Products VALUES (502, 2, 402, 'Pizza');
INSERT INTO Products VALUES (503, 3, 403, 'Salad');
INSERT INTO Products VALUES (504, 4, 404, 'Sushi Roll');
INSERT INTO Products VALUES (505, 5, 405, 'Chicken Alfredo');

-- Insert interactions
INSERT INTO Interacts VALUES (601, 301, 1);
INSERT INTO Interacts VALUES (602, 302, 2);
INSERT INTO Interacts VALUES (603, 305, 5);

-- Insert purchases
INSERT INTO Buys VALUES (701, 1, 101);
INSERT INTO Buys VALUES (702, 2, 102);
INSERT INTO Buys VALUES (703, 3, 103);
INSERT INTO Buys VALUES (704, 4, 104);
INSERT INTO Buys VALUES (705, 5, 105);

-- Insert menu items
INSERT INTO Sells VALUES (801, 201, 101);
INSERT INTO Sells VALUES (802, 202, 102);
INSERT INTO Sells VALUES (803, 203, 103);
INSERT INTO Sells VALUES (804, 204, 104);
INSERT INTO Sells VALUES (805, 205, 105);
INSERT INTO Sells VALUES (806, 206, 106);

-- Update user information
UPDATE User SET address = '456 New St' WHERE userID = 1;

-- Update food availability
UPDATE Food SET availability = false WHERE itemID = 101;

-- Update restaurant rating
UPDATE Restaurant SET rating = 4.4 WHERE restaurantID = 201;

-- Update customer service status
UPDATE CustomerService SET status = 'Resolved' WHERE csID = 301;

-- Update order total price
UPDATE OrderHistory SET total_price = 25.99 WHERE orderID = 401;

-- Update product information
UPDATE Products SET product = 'Deluxe Burger' WHERE productID = 501;

-- Update interaction details
UPDATE Interacts SET csID = 302 WHERE InteractID = 601;

-- Update purchase information
UPDATE Buys SET foodID = 102 WHERE BuysID = 701;

-- Update menu item price
UPDATE Sells SET foodID = 103 WHERE SellsID = 801;

-- Delete a user
DELETE FROM User WHERE userID = 1;

-- Delete a food item
DELETE FROM Food WHERE itemID = 101;

-- Delete a restaurant
DELETE FROM Restaurant WHERE restaurantID = 201;

-- Delete a customer service inquiry
DELETE FROM CustomerService WHERE csID = 301;

-- Delete an order and associated products
DELETE FROM OrderHistory WHERE orderID = 401;

-- Delete a product from an order
DELETE FROM Products WHERE productID = 501;

-- Delete an interaction
DELETE FROM Interacts WHERE InteractID = 601;

-- Delete a purchase
DELETE FROM Buys WHERE BuysID = 701;

-- Delete a menu item
DELETE FROM Sells WHERE SellsID = 801;

-- Select users who made an order
SELECT first_name, last_name
FROM User
WHERE userID IN (SELECT userID FROM OrderHistory);

-- Name of unpurchased food item
SELECT name
FROM Food
WHERE itemID NOT IN (SELECT foodID FROM Buys);

-- Retrieve customer service forms written by John
SELECT csID, name, inquiry, status, submission_date
FROM CustomerService
WHERE csID IN (SELECT csID FROM Interacts WHERE userID = (SELECT userID FROM User WHERE first_name = 'John'));

-- Best-rated food items
SELECT name, rating
FROM Food
WHERE rating = (SELECT MAX(rating) FROM Food);

-- Most food ordered by a user
SELECT User.userID, User.first_name, User.last_name,
       Products.product, COUNT(Products.product) AS order_count
FROM User, Products
WHERE User.userID = Products.userID
GROUP BY User.userID, User.first_name, User.last_name, Products.product
ORDER BY order_count DESC
LIMIT 1;

-- Most rated food in all restaurants
SELECT Restaurant.restaurantID, Restaurant.name AS restaurant_name,
       Food.name AS food_name, Food.rating
FROM Restaurant, Sells, Food
WHERE Restaurant.restaurantID = Sells.restaurantID
  AND Sells.foodID = Food.itemID
  AND Food.rating = (SELECT MAX(rating) FROM Food);

-- Most rated food item in a specific restaurant
SELECT Restaurant.restaurantID, Restaurant.name AS restaurant_name,
       Food.name AS food_name, Food.rating
FROM Restaurant, Sells, Food
WHERE Restaurant.restaurantID = Sells.restaurantID
  AND Sells.foodID = Food.itemID
  AND Restaurant.name = 'Tasty Grill'
  AND Food.rating = (SELECT MAX(rating) FROM Food WHERE itemID IN (SELECT foodID FROM Sells WHERE restaurantID = Restaurant.restaurantID));
  
-- Find the average price of all available food items
SELECT AVG(price) AS average_price
FROM Food
WHERE availability = true;

-- Retrieve the names of customers who have ordered from more than one restaurant
SELECT DISTINCT User.first_name, User.last_name
FROM User, Buys, Sells, Restaurant 
WHERE User.userID = Buys.userID
  AND Buys.foodID = Sells.foodID
  AND Sells.restaurantID = Restaurant.restaurantID
GROUP BY User.userID
HAVING COUNT(DISTINCT Restaurant.restaurantID) > 1;

-- The users who have not interacted with customer service:
SELECT userID, first_name, last_name
FROM User
WHERE userID NOT IN (SELECT DISTINCT userID FROM Interacts);



