-- SalesPerRegion
SELECT SUM(sales), region
FROM superstore
GROUP BY region
ORDER BY 1 DESC
;
-- salesPerSegment
SELECT SUM(sales), segment
FROM superstore
GROUP BY segment
ORDER BY 1 DESC ;


-- salesPerMonth
SELECT SUM(sales), DATE_FORMAT(Order_Date, '%Y-%m') AS order_yearMonth
FROM superstore
GROUP BY 2
ORDER BY 2;

SELECT *
FROM superstore
WHERE Quantity > 0 AND Sales = 0
;
-- discount analysis
SELECT  region,  SUM(IF(Discount = 0, Sales, 0))                        AS no_discount_sales,
       ROUND(SUM(IF(Discount = 0, Profit, 0)),2)                         AS no_discount_profit,
       SUM(IF(Discount > 0 AND Discount < 0.2, Sales, 0))                AS low_discount_sales,
       ROUND(SUM(IF(Discount > 0 AND Discount < 0.2, Profit, 0)) ,2)     AS low_discount_profit,
       SUM(IF(Discount >= 0.2 AND Discount <= 0.5, Sales, 0))            AS high_discount_sales,
       ROUND(SUM(IF(Discount >= 0.2 AND Discount <= 0.5, Profit, 0)) ,2)  AS high_discount_profit,
       SUM(IF(Discount > 0.5 , Sales, 0))                                 AS clearance_sales,
       ROUND(SUM(IF(Discount > 0.5 ,Profit, 0)),2)                         AS clearance_profit

FROM superstore
GROUP BY 1
ORDER BY  9
;
-- shipping
SELECT Ship_Mode, ROUND(AVG(DATEDIFF(Ship_Date,Order_Date)),1) AS timeline, Region
FROM superstore
GROUP BY Ship_Mode, 3
ORDER BY 3, 2  DESC
;
-- shippingVsSales
SELECT sub_category, SUM(Sales) SS, ROUND(SUM(Profit),2) total_loss
FROM superstore
WHERE Shipping_Cost > Sales
GROUP BY sub_category
;
SELECT Ship_Mode, ROUND(AVG(DATEDIFF(Ship_Date,Order_Date)),1) AS timeline
FROM superstore
WHERE ship_mode = 'Same day'
GROUP BY Ship_Mode
;
-- one time customer
WITH  order_cal AS ( SELECT  Customer_ID, COUNT(DISTINCT order_id) order_freq
FROM superstore
GROUP BY Customer_ID
    )
SELECT COUNT(CASE WHEN order_freq = 1 THEN 1 END ) AS one_time_customer, COUNT(*) AS total_customer,
    ROUND(COUNT(CASE WHEN order_freq = 1 THEN 1 END )/ COUNT(*) * 100, 2) AS percnet_onetime
FROM order_cal
;


