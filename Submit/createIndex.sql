CREATE INDEX priceindex on product (price);
CREATE INDEX totalcount on cart(Total_count);
CREATE INDEX finalvalue on cart(Final_Amount);
CREATE INDEX customerpassword on customer(Password);
CREATE INDEX deliveryboyavgrating on delivery_boy(Average_Rating);
CREATE INDEX ordermode on orders(Mode);
CREATE INDEX productreview on product_feedback(Rating,Product_ID);
CREATE INDEX customerratingdeliveryboy on rates_order_delivery(Customer_ID,Rating_Given);