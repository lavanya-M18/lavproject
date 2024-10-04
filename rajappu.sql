create database project;
use project;
create table customers
(
customer_id int,customer_name varchar(50),email_id varchar(50),location varchar(50)
);
desc customers;
alter table customers
add primary key(customer_id);
select*from customers;
create index in_customer on
customers(customer_id);
---------
create table orders
(
order_id varchar(20),customer_id int,pizza_id varchar(20),order_time time,
quantity int,price_per_unit int,payment_method varchar(20));
alter table orders
add constraint foreign key (customer_id) references customers(customer_id);
ALTER TABLE orders
ADD CONSTRAINT FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id);
desc orders;
select*from orders;
--------
create table pizzas
(pizza_id varchar(20) ,pizza_name varchar(50), size varchar(20),price int);

create index in_pizza
on pizzas(pizza_id);
select*from pizzas;
-----
CREATE TABLE pizza_type (
    pizza_id VARCHAR(20),
    category VARCHAR(50),
    toppings VARCHAR(50)
);
ALTER TABLE pizza_type
ADD CONSTRAINT FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id);
select*from pizza_type;
select*from customers;
select*from orders;
select*from pizzas;

-----------------------------
SELECT customer_name, location
FROM customers;
select distinct location from customers;
select sum(quantity*price_per_unit) as total_revenue from orders;
select distinct payment_method from orders;

SELECT pt.toppings ,p.pizza_name
FROM pizza_type pt
JOIN pizzas p ON pt.pizza_id = p.pizza_id
WHERE pt.toppings='Onions';

SELECT payment_method, COUNT(*) AS total_orders 
FROM orders 
GROUP BY payment_method;

SELECT SUM(quantity ) AS total_quantity
FROM orders;

SELECT pizza_name, price as high_cast
FROM pizzas 
ORDER BY price DESC 
LIMIT 1;
SELECT COUNT(order_id) ,location
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY location;
SELECT c.location, 
    MIN(o.order_id) AS order_id, 
    MIN(o.order_time) AS order_time, 
    MIN(o.pizza_id) AS pizza_id, 
    SUM(o.quantity) AS total_quantity, 
    AVG(o.price_per_unit) AS avg_price_per_unit
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.location;
select count(order_id) as total_orders from orders;

select orders.pizza_id,order_time,pizza_name ,count(*) from orders
join pizzas on 
orders.pizza_id=pizzas.pizza_id
group by pizza_name;

select orders.pizza_id,size from orders
join pizzas on
orders.pizza_id=pizzas.pizza_id
order by size desc;
select orders.customer_id,orders.pizza_id,category from orders
join pizza_type on
orders.pizza_id=pizza_type.pizza_id
group by(customer_id);
call customer(3);













