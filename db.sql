-- creating table entities
CREATE TABLE Users (
    id int primary key,
    full_name varchar(200),
    username varchar(200),
    password varchar(200),
    email varchar(200),
    phone_number int,
    role enum ('user', 'admin')
);

CREATE TABLE Categories (
    id int primary key,
    name varchar(200)
);


CREATE TABLE Items (
    id int primary key,
    name varchar(200) NOT NULL,
    size enum ('small', 'medium', 'large'),
    price int,
    category_id int,
    created_at timestamp,
    FOREIGN key(category_id) REFERENCES Categories (id)
);



CREATE TABLE Orders (
    id int,
    userId int,
    itemId int,
    order_date timestamp,
    status enum ('Succesfull', 'Failed', 'Pending'),
    FOREIGN key (userId) REFERENCES Users (id),
    FOREIGN key(itemId) REFERENCES Items (id)
);

--Inserting table values
INSERT INTO Users
(id, full_name, username, email, phone_number, role)
VALUES (001, 'Jonah Attah', 'attahjonah001', 'attahjonah93@gmail', 0888777, admin),
       (002, 'Robert Kusu', 'robert111', 'kusu@yahoomail.com', 077444, user),
       (003, 'Agnes Job', 'agnes247', 'agnesjob@gmail.com', 111222, user)

--Select all Users
SELECT * FROM Users
SELECT full_name FROM Users

--Updating User details
UPDATE Users
SET username = 'robert666',
    phone_number = 222563
WHERE id = 002

--Deleting a User
DELETE FROM Users
WHERE id = 003


INSERT INTO Categories
    (id, name)
VALUES(101, 'Puma'),
      (102, 'Gucci') 

INSERT INTO Items 
    (id, name, size, price, category_id)
VALUES (001, 'T-shirt', 'large', 3500, 102),
       (002, 'Slipper', 'small', 1500, 102),
       (003, 'Cap', 'medium', 1200, 101)


INSERT INTO Orders 
    (id, userId, itemId, status)
VALUES(001, 001, 001, Pending)
      (002, 001, 003, Failed) 

-- Getting record from two or more entries
-- Get all items and categories

SELECT
    Items.name,
    Items.price,
    Items.size,
    Categories.name
FROM
    Items
    JOIN Categories ON Categories.id = Items.category_id

-- Details about all orders
SELECT
    Orders.id AS order_id,
    Users.full_name AS full_name,
    Users.email AS user_email,
    Items.name AS item_name,
    Items.price AS item_price,
    Orders.status,
    Categories.name AS category,
    Orders.order_date
FROM
    Orders
    JOIN Users ON Orders.userId = Users.id,
    JOIN Items ON Orders.itemId = Items.id,
    JOIN Categories ON Items.category_id = Categories.id