SELECT COUNT(product.Product_ID) AS Total_Additions, product.Admin_ID, admin.First_Name AS ForeName, admin.Last_Name AS SurName
FROM product
JOIN admin
ON product.Admin_ID = admin.Admin_ID
GROUP BY product.Admin_ID
ORDER BY count(product.Product_ID) DESC;
