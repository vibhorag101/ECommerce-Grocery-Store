CREATE VIEW deliverydata AS
SELECT cart.Cart_ID, cart.Final_Amount, orders.Order_ID, orders.Delivery_Boy_ID,  delivery_boy.First_Name, delivery_boy.Last_Name, cart.Total_Count 
FROM 
cart, orders, delivery_boy
WHERE cart.Cart_ID = orders.Cart_ID AND orders.Delivery_Boy_ID = delivery_boy.Delivery_Boy_ID;

SELECT deliverydata.Delivery_Boy_ID, deliverydata.First_Name, deliverydata.Last_Name , COUNT(deliverydata.Order_ID) AS No_of_unique_orders_delivered ,SUM(deliverydata.Total_Count) AS No_of_products_delivered, (deliverydata.Final_Amount) AS Total_Value_Of_Orders_Delivered
FROM deliverydata
GROUP BY Delivery_Boy_ID;
