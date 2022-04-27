SELECT product.Product_ID, product.Name, product.Brand, product.Price
FROM product
WHERE NOT EXISTS (
           		SELECT associated_with.Cart_ID
           		FROM associated_with
           		WHERE associated_with.Product_ID=product.Product_ID
           		AND EXISTS (
              		SELECT orders.Order_ID
             		FROM orders
             		WHERE orders.Cart_ID=associated_with.Cart_ID
              		)
         		);
