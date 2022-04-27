CREATE VIEW productsoldstats AS
SELECT product.Product_ID, product.Name, COUNT(associated_with.Product_ID)*product.Price AS total_sale_done_from_this_product
FROM product
JOIN associated_with
WHERE product.Product_ID = associated_with.Product_ID
GROUP BY Product_ID
ORDER BY Product_ID;

CREATE VIEW categorystats AS
SELECT product.Category_ID, category.Category_Name, product.Product_ID, productsoldstats.total_sale_done_from_this_product AS sale_from_this_product
FROM category
JOIN product
JOIN rating_table
JOIN productsoldstats
WHERE product.Category_ID=category.Category_ID AND productsoldstats.Product_ID=product.Product_ID
GROUP BY Product_ID
ORDER BY Product_ID;


CREATE VIEW totalSold AS
SELECT categorystats.Category_ID, categorystats.Category_Name,COUNT(associated_with.Product_ID) AS No_of_products_sold
FROM categorystats
JOIN associated_with
WHERE associated_with.Product_ID=categorystats.Product_ID
GROUP BY Category_ID;

SELECT categorystats.Category_ID , categorystats.Category_Name , SUM(categorystats.sale_from_this_product) AS sale_from_this_category , totalsold.No_of_products_sold
    FROM categorystats
    JOIN totalsold
    ON categorystats.Category_ID = totalsold.Category_ID
    GROUP BY categorystats.Category_ID;
