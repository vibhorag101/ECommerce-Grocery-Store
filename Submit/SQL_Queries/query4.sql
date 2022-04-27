SELECT sells.Seller_ID,seller.First_Name,seller.Last_Name,count(product.Category_ID) AS No_Of_Categories_Sold, SUM(sells.No_of_Product_Sold) as Total_Products_Sold,SUM(Product.price*sells.No_of_Product_Sold) AS Total_Sales_Done, AVG(Product.price*sells.No_of_Product_Sold) AS Average_Sale_Per_Order , rating_table.Average_Rating AS Average_Rating_of_Products_Sold
FROM sells
JOIN seller
JOIN product
JOIN rating_table
WHERE sells.Seller_ID=seller.Seller_ID AND product.Product_ID=sells.Product_ID AND rating_table.Product_ID=sells.Product_ID
GROUP BY Seller_ID
ORDER BY Seller_ID;
