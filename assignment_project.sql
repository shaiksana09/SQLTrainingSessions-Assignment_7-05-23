import mysql.connector
conn = mysql.connector.connect(
    host="localhost",
    database="Inventory_Management",
    user ="root",
    password="Hari@123")
cor = conn.cursor() 

-- Create a database called “Inventory_Management” with different tables like “manufacture”, “goods”, “purchase”, “sale” etc.
 manfacture_table ='create table  manufacture (manufacture_id int primary key ,product_name varchar(50) not null, color varchar(20) NOT NULL,number_of_items int not null, date_of_manufacture date not null, defective_item boolean not null)'
 cor.execute(manfacture_table)
 goods_table='create table goods (goods_id int primary key, product_name varchar(50) not null, color varchar(20) not null,number_of_items int not null, date_of_manufacture date not null, price DECIMAL(10,2) not null, discount DECIMAL(3,2) not null)'
 cor.execute(goods_table) 
 purchase ="create table purchase ( purchase_id int primary key, product_name varchar(50) not null, color varchar(20) not null,number_of_items int not null, date_of_purchase date not null, store_name varchar(50) not null,purchase_amount DECIMAL(10,2) not null)"
 cor.execute(purchase) 
 sale ="creaet table sale (sale_id int primary key, product_name varchar(50) not null, color varchar(20) not null, number_of_items int not null,date_of_sale date not null, store_name varchar(50) not null, selling_price DECIMAL(10,2) not null,profit_margin DECIMAL(3,2) not null)"
 cor.execute(sale)
 
 -- Insert multiple entries to these different tables - “manufacture”, “goods”, “purchase” and “sale”.
insert_into_manufacture ="insert into manufacture (manufacture_id, product_name, color, number_of_items, date_of_manufacture, defective_item) values (1, 'Wooden Chair', 'Brown', 50, '2022-12-01', 0),(2, 'Wooden Table', 'Brown', 20, '2023-01-05', 0),(3, 'Red Toy Car', 'Red', 100, '2023-02-10', 0),(4, 'Blue Toy Car', 'Blue', 50, '2023-03-15', 1),(5, 'White T-Shirt', 'White', 200, '2023-04-20',0),(6, 'Black T-Shirt', 'Black', 150, '2023-04-25', 0),(7, 'Red Toy Car', 'Red', 50, '2023-05-01', 0)"
cor.execute(insert_into_manufacture) 
insert_into_goods = "insert into goods (goods_id, product_name, color, number_of_items, date_of_manufacture, price, discount) values (1, 'Wooden Chair', 'Brown', 50, '2022-12-01', 100.00, 0.10), (2, 'Wooden Table', 'Brown', 20, '2023-01-05', 500.00, 0.20), (3, 'Red Toy Car', 'Red', 100, '2023-02-10', 10.00, 0.05), (4, 'Blue Toy Car', 'Blue', 50, '2023-03-15', 10.00,0.05)"
cor.execute(insert_into_goods)
insert_into_purchase = "insert into purchase (purchase_id, product_name, color, number_of_items, date_of_purchase, store_name, purchase_amount) values (1, 'Chair', 'Black', 10, '2023-04-01', 'Furniture Mart', 500.00),(2, 'Table', 'Brown', 5, '2023-03-15', 'MyCare', 750.00),(3, 'Sofa', 'Blue', 3, '2023-05-01', 'Furniture World', 1200.00),(4, 'Bed', 'White', 2, '2023-04-25', 'Home Decor', 1500.00),(5, 'Bookshelf', 'Mahogany', 7, '2023-04-10', 'Book Nook', 300.00);"
cor.execute(insert_into_purchase) 
insert_into_sale ="insert into purchase (purchase_id, product_name, color, number_of_items, date_of_purchase, store_name, purchase_amount) values (1, 'Chair', 'Black', 10, '2023-04-01', 'Furniture Mart', 500.00),(2, 'Table', 'Brown', 5, '2023-03-15', 'MyCare', 750.00),(3, 'Sofa', 'Blue', 3, '2023-05-01', 'Furniture World', 1200.00),(4, 'Bed', 'White', 2, '2023-04-25', 'Home Decor', 1500.00),(5, 'Bookshelf', 'Mahogany', 7, '2023-04-10', 'Book Nook', 300.00)"
cor.execute(insert_into_sale) 


-- In the “manufacture” table, one should be able to see all the products that need to be manufactured, and defective items during the manufacture with different entries like manufacture id, number of items required, etc. 
show_manufacture= "select * from manufacture"
cor.execute(show_manufacture) 


-- In the “goods” table, it should include different items that are manufactured by the company along with the goods id, manufactured date, etc. 
show_goods = "select * from goods"
cor.execute(show_goods) 


-- In the “purchase” table, it should include all the purchase details that are purchased in different online and offline stores, along with the purchase id, purchase amount, etc. 
show_purchase = "select * from purchase"
cor.execute(show_purchase)  


-- In the “sale” table, it should include all the items got sold in different stores with the sale date, profit margin, etc
show_sale = "select * from sale"
cor.execute(show_sale)  


-- Delete the defective item, e.g., the shirt which was accidentally purchased by the “ORay” store, manufactured on the date ‘01-04-23  
dlelte_oray ="delete from purchase where product_name = 'shirt' and store_name = 'ORay' and date_of_purchase = '2023-04-01'"
cor.execute(dlelte_oray)  
show_purchase = "select * from purchase"
cor.execute(show_purchase)  


-- Update the manufacture details of all the red-colored toys which are purchased by the “MyKids” store.
update_manufacure ="update manufacture set number_of_items_required = 100 where product_name = 'toy' and color = 'red' and manufacture_id in (  select manufacture_id from goods where store_name = 'MyKids')"
cor.execute(update_manufacure)  
show_manufacture= "select * from manufacture"
cor.execute(show_manufacture) 


-- Display all the “wooden chair” items that were manufactured before the 1st May 2023. 
display_wooden ="select * from goods where product_name = 'chair' and material = 'wooden' and manufactured_date < '2023-05-01'"
cor.execute(display_wooden)  


--  Display the profit margin amount of the “wooden table” that was sold by the “MyCare” store, manufactured by the “SS Export” company. 
profit_margin ="select profit_margin from sale where product_name = 'table' and material = 'wooden' AND store_name = 'MyCare' and manufacture_id in (select manufacture_id  FROM manufacture  where company_name = 'SS Export')"
cor.execute(profit_margin)

show_sale = "select * from sale"
cor.execute(show_sale)



