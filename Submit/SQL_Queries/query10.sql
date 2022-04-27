SELECT product_feedback.Review_Body, product_feedback.Rating, product_feedback.Review_Date,product.Name, product.Brand,product.Price
FROM product_feedback
JOIN product
ON product_feedback.Product_ID = product.Product_ID
WHERE product_feedback.Rating=1 OR product_feedback.Rating=5
GROUP BY product_feedback.Product_ID
ORDER BY MIN(product_feedback.Rating) DESC;
