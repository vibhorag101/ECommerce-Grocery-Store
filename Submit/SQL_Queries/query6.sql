SELECT customer.Customer_ID, customer.First_Name, customer.Last_Name
FROM customer
WHERE customer.Password NOT REGEXP '[0-9]'
UNION
SELECT seller.Seller_ID, seller.First_Name, seller.Last_Name
FROM seller
WHERE seller.Password NOT REGEXP '[0-9]'
UNION
SELECT delivery_boy.Delivery_Boy_ID, delivery_boy.First_Name, delivery_boy.Last_Name
FROM delivery_boy
WHERE delivery_boy.Password NOT REGEXP '[0-9]';
