import mysql.connector
conn = mysql.connector.connect(
    host="localhost",
    database="Inventory_Management",
    user ="root",
    password="Hari@123")
cor = conn.cursor() 

-- Create a database called “Inventory_Management” with different tables like “manufacture”, “goods”, “purchase”, “sale” etc.
 manfacture_table ='create table  manufacture (manufacture_id INT PRIMARY KEY,product_name VARCHAR(50) NOT NULL,color VARCHAR(20) NOT NULL,number_of_items INT NOT NULL, date_of_manufacture DATE NOT NULL, defective_item BOOLEAN NOT NULL)'
 cor.execute(manfacture_table)
 goods_table='CREATE TABLE goods (goods_id INT PRIMARY KEY,product_name VARCHAR(50) NOT NULL, color VARCHAR(20) NOT NULL,number_of_items INT NOT NULL,date_of_manufacture DATE NOT NULL, price DECIMAL(10,2) NOT NULL, discount DECIMAL(3,2) NOT NULL)'
 cor.execute(goods_table) 
 purchase ="CREATE TABLE purchase ( purchase_id INT PRIMARY KEY,product_name VARCHAR(50) NOT NULL, color VARCHAR(20) NOT NULL,number_of_items INT NOT NULL,date_of_purchase DATE NOT NULL, store_name VARCHAR(50) NOT NULL,purchase_amount DECIMAL(10,2) NOT NULL)"
 cor.execute(purchase) 
 sale ="CREATE TABLE sale (sale_id INT PRIMARY KEY,product_name VARCHAR(50) NOT NULL,color VARCHAR(20) NOT NULL, number_of_items INT NOT NULL,date_of_sale DATE NOT NULL,  store_name VARCHAR(50) NOT NULL, selling_price DECIMAL(10,2) NOT NULL,profit_margin DECIMAL(3,2) NOT NULL)"
 cor.execute(sale)
 
 -- Insert multiple entries to these different tables - “manufacture”, “goods”, “purchase” and “sale”.
insert_into_manufacture ="INSERT INTO manufacture (manufacture_id, product_name, color, number_of_items, date_of_manufacture, defective_item)VALUES (1, 'Wooden Chair', 'Brown', 50, '2022-12-01', 0),(2, 'Wooden Table', 'Brown', 20, '2023-01-05', 0),(3, 'Red Toy Car', 'Red', 100, '2023-02-10', 0),(4, 'Blue Toy Car', 'Blue', 50, '2023-03-15', 1),(5, 'White T-Shirt', 'White', 200, '2023-04-20',0),(6, 'Black T-Shirt', 'Black', 150, '2023-04-25', 0),(7, 'Red Toy Car', 'Red', 50, '2023-05-01', 0)"
cor.execute(insert_into_manufacture) 
insert_into_goods = "INSERT INTO goods (goods_id, product_name, color, number_of_items, date_of_manufacture, price, discount)VALUES (1, 'Wooden Chair', 'Brown', 50, '2022-12-01', 100.00, 0.10),       (2, 'Wooden Table', 'Brown', 20, '2023-01-05', 500.00, 0.20),       (3, 'Red Toy Car', 'Red', 100, '2023-02-10', 10.00, 0.05),       (4, 'Blue Toy Car', 'Blue', 50, '2023-03-15', 10.00,0.05)"
cor.execute(insert_into_goods)
insert_into_purchase = "INSERT INTO purchase (purchase_id, product_name, color, number_of_items, date_of_purchase, store_name, purchase_amount)VALUES (1, 'Chair', 'Black', 10, '2023-04-01', 'Furniture Mart', 500.00),(2, 'Table', 'Brown', 5, '2023-03-15', 'MyCare', 750.00),(3, 'Sofa', 'Blue', 3, '2023-05-01', 'Furniture World', 1200.00),(4, 'Bed', 'White', 2, '2023-04-25', 'Home Decor', 1500.00),(5, 'Bookshelf', 'Mahogany', 7, '2023-04-10', 'Book Nook', 300.00);"
cor.execute(insert_into_purchase) 
insert_into_sale ="INSERT INTO purchase (purchase_id, product_name, color, number_of_items, date_of_purchase, store_name, purchase_amount)VALUES (1, 'Chair', 'Black', 10, '2023-04-01', 'Furniture Mart', 500.00),(2, 'Table', 'Brown', 5, '2023-03-15', 'MyCare', 750.00),(3, 'Sofa', 'Blue', 3, '2023-05-01', 'Furniture World', 1200.00),(4, 'Bed', 'White', 2, '2023-04-25', 'Home Decor', 1500.00),(5, 'Bookshelf', 'Mahogany', 7, '2023-04-10', 'Book Nook', 300.00)"
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
dlelte_oray ="DELETE FROM purchase WHERE product_name = 'shirt' AND store_name = 'ORay' AND date_of_purchase = '2023-04-01'"
cor.execute(dlelte_oray)  
show_purchase = "select * from purchase"
cor.execute(show_purchase)  


-- Update the manufacture details of all the red-colored toys which are purchased by the “MyKids” store.
update_manufacure ="UPDATE manufacture SET nu mber_of_items_required = 100 WHERE product_name = 'toy' AND color = 'red' AND manufacture_id IN (  SELECT manufacture_id   FROM goods   WHERE store_name = 'MyKids')"
cor.execute(update_manufacure)  
show_manufacture= "select * from manufacture"
cor.execute(show_manufacture) 


-- Display all the “wooden chair” items that were manufactured before the 1st May 2023. 
display_wooden ="SELECT *FROM goods WHERE product_name = 'chair' AND material = 'wooden' AND manufactured_date < '2023-05-01'"
cor.execute(display_wooden)  


--  Display the profit margin amount of the “wooden table” that was sold by the “MyCare” store, manufactured by the “SS Export” company. 
profit_margin ="SELECT profit_margin FROM sale WHERE product_name = 'table' AND material = 'wooden' AND store_name = 'MyCare' AND manufacture_id IN (  SELECT manufacture_id  FROM manufacture  WHERE company_name = 'SS Export')"
cor.execute(profit_margin)

show_sale = "select * from sale"
cor.execute(show_sale)



