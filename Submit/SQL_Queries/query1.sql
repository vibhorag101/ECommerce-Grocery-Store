SELECT customer.Customer_ID, customer.First_Name, customer.Last_Name
FROM customer
WHERE customer.Customer_ID IN (SELECT associated_with.Customer_ID
                                                          FROM associated_with
                                                          WHERE associated_with.Cart_ID IN (SELECT orders.Cart_ID
                                                  						  FROM orders
                                                                  				  WHERE orders.Amount>=300
                                                  			 )
                       	   		      );