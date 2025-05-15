USE restaurant_db;
-- 1. Combine the menu_items and order_details tables into a single table.
select *
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id;
-- 2. What were the least and most ordered items? What categories were they in?
select  item_name, category, count(order_details_id) "num_purchase"
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by count(order_details_id)
limit 1;


select  item_name, category, count(order_details_id) "num_purchase"
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by count(order_details_id) desc
limit 1;

-- 3. What were the top 5 orders that spent the most money?

select order_id, sum(price) as "Total Spend"
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
group by order_id
order by sum(price) desc
limit 5
;

-- 4. View the details of the highest spend order. What insights can you gather from the order

select category, count(item_id)
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
where order_id = 440     -- through the code above, I found that the highest money spent order is 440 order_id
group by category;
-- 5. View the details of the top 5 highest spend orders. What insights can you gather fro

select order_id, category, count(item_id)
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
where order_id in (440, 2070, 1957, 330, 2675) -- top 5 higest money spent orders, found in 3rd question
group by order_id, category;

