SELECT * FROM timepass.shipping_ecommerce;

-- Display total and average values of Discount_offered for all the combinations of 
-- 'Mode_of_Shipment' (display this feature) and 'Warehouse_block' (display this feature also) 
-- for all male ('M') and 'High' Product_importance. Also sort the values in descending order of 
-- Mode_of_Shipment and ascending order of Warehouse_block.
SELECT Mode_of_shipment,Warehouse_block, COUNT(Discount_offered), AVG(Discount_offered)
FROM shipping_ecommerce
WHERE Gender = "M" AND Product_importance = 'high'
GROUP BY Mode_of_Shipment,Warehouse_block
ORDER BY Mode_of_shipment DESC, Warehouse_block ASC;
