SELECT cart.Offer_ID, offer.Promo_Code,count(cart.Cart_ID) AS No_Of_Times_Offer_Applied ,sum(cart.Total_Value-cart.Final_Amount) AS Combined_Discount_Availed
FROM cart
JOIN offer
WHERE cart.Offer_ID = offer.Offer_ID
GROUP BY cart.Offer_ID;
