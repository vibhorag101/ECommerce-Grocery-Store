CREATE OR REPLACE VIEW Rating_Table AS
SELECT AVG(product_feedback.Rating) AS Average_Rating, product_feedback.Product_ID
FROM product_feedback
GROUP BY product_feedback.Product_ID;


SELECT product.Name, product.Brand, Category.Category_Name
FROM product
JOIN category
ON product.Category_ID = category.Category_ID
WHERE product.Product_ID IN (
                    			SELECT rating_table.Product_ID
                    			FROM rating_table
                    			WHERE rating_table.Average_Rating>=3
                   			 );
