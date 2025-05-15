USE restaurant_db;

-- 1.View the menu_items table.

select *
from menu_items;

-- 2.Find the number of items on the menu.

select count(menu_item_id) as "Food Choices"
from menu_items;

-- 3.What are the least and most expensive items on the menu?
select item_name as "Most Expansive Item", price
from menu_items
where price = (
select max(price)
from menu_items);

select item_name as "Least Expansive Item", price
from menu_items
where price = (
select min(price)
from menu_items);


-- 4.How many Italian dishes are on the menu?
select count(item_name) as "Italian Dishes"
from menu_items
where category = "Italian";

-- 5.What are the least and most expensive Italian dishes on the menu?
select item_name as " The Most expansive Italian Dish", price, category
from menu_items
where price = (select max(price)
from menu_items
where category = "Italian" );

select item_name as " The Least expansive Italian Dish", price, category
from menu_items
where price in (select min(price)
from menu_items
where category = "Italian") and category = "Italian";

-- 6.How many dishes are in each category?

select category, count(item_name) as "Number of dishes"
from menu_items
group by category;

-- 7.What is the average dish price within each category?
select category, avg(price) as "Average Price"
from menu_items
group by category








