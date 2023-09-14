create database zomato_project;
use zomato_project;
Create table gold_users(user_id int ,signup_date date);
INSERT INTO gold_users(user_id ,signup_date )
 VALUES (1,"2023-09-22"),
(3,"2021-11-20");

CREATE TABLE users(user_id integer,signup_date date);
INSERT INTO users(user_id,signup_date) 
 VALUES (1,"2020-11-22"),
(2,'2021-11-25'),
(3,'2022-11-19');
CREATE TABLE sales(userid int,registeration_date date,product_id int);
 INSERT INTO sales(userid,registeration_date,product_id) 
 VALUES(1,"2022-11-22",2),
 (1,'2019-12-25',2),
(3	,"2019-12-25",	1	),
(2	,"2021-12-25"	,3	),
(1,'2023-09-22',2),
(1,'2020-11-22',3),
(3,'2022-11-20',2),
(1,'2023-08-15',1),
(1,'2018-11-08',3),
(2,'2019-11-11',1),
(1,'2023-07-18',2),
(1,'2018-1-18',1),
(3,'2019-01-10',1),
(3,'2019-01-01',2),
(3,'2021-06-22',2),
(2,'2021-09-16',2),
(2,'2023-12-21',3);
CREATE TABLE product(product_id integer,product_name text,price integer); 

INSERT INTO product(product_id,product_name,price) 
 VALUES
(1,'p1',1000),
(2,'p2',6000),
(3,'p3',821);
Select*from gold_user;
Select*from users;
Select*from sales;

Select*from product;
--what is the total amount ordered on zomato 

select a.userid , a.product_id , b.price from sales a inner join product b  on a.product_id = b.product_id
  
  -- sum 
  
 select a.userid  ,sum( b.price) from sales a inner join product b  on a.product_id = b.product_id
group by a.userid;


--how many days each customer visited zomato
select userid ,count(distinct registeration_date) from sales group by userid;

-- most selling prodcut 
select product_id ,count(product_id)from sales 
group by product_id 
order by count(product_id)desc;

-- which product for each customer 

select*from
(select * ,rank() over(partition by userid order by cunt desc )rnk from
(select userid , product_id,count(product_id) cunt from sales group by userid,product_id)a)b
where rnk =1;


