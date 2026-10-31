/*
PROJECT: FOOD DELIVERY DATA ANALYSIS
SCRIPT: BUSINESS ANALYSIS
DATABASE: food_delivery
TOTAL RECORDS: 45,593

PURPOSE:
Analyze food delivery operations and identify
business insights using SQL.

NOTE:
This script contains SELECT queries only.
It does not modify the original dataset.
*/

USE food_delivery;

-- ==========================================
-- 01. OVERALL DATASET EXPLORATION
-- ==========================================

SELECT COUNT(*) AS total_orders
FROM food_delivery.delivery_data;


-- ==========================================
-- 02. AVERAGE DELIVERY PERSON AGE
-- ==========================================

SELECT ROUND(AVG(Delivery_person_Age), 2) AS average_age
FROM food_delivery.delivery_data;


-- ==========================================
-- 03. AVERAGE DELIVERY PERSON RATING
-- ==========================================

SELECT ROUND(AVG(Delivery_person_Ratings), 2) AS average_rating
FROM food_delivery.delivery_data;


-- ==========================================
-- 04. ORDER DISTRIBUTION BY TRAFFIC
-- ==========================================

SELECT Road_traffic_density,
       COUNT(*) AS total_orders
FROM food_delivery.delivery_data
GROUP BY Road_traffic_density
ORDER BY total_orders DESC;


-- ==========================================
-- 05. DELIVERY TIME BY TRAFFIC
-- ==========================================

SELECT Road_traffic_density,
       COUNT(*) AS total_orders,
       ROUND(AVG(`Time_taken(min)`), 2) AS average_delivery_time
FROM food_delivery.delivery_data
GROUP BY Road_traffic_density
ORDER BY average_delivery_time DESC;


-- ==========================================
-- 06. DELIVERY TIME BY WEATHER
-- ==========================================

SELECT Weatherconditions,
       COUNT(*) AS total_orders,
       ROUND(AVG(`Time_taken(min)`), 2) AS average_delivery_time
FROM food_delivery.delivery_data
GROUP BY Weatherconditions
ORDER BY average_delivery_time DESC;


-- ==========================================
-- 07. DELIVERY TIME BY VEHICLE CONDITION
-- ==========================================

SELECT Vehicle_condition,
       COUNT(*) AS total_orders,
       ROUND(AVG(`Time_taken(min)`), 2) AS average_delivery_time
FROM food_delivery.delivery_data
GROUP BY Vehicle_condition
ORDER BY average_delivery_time DESC;


-- ==========================================
-- 08. DELIVERY TIME BY ORDER TYPE
-- ==========================================

SELECT Type_of_order,
       COUNT(*) AS total_orders,
       ROUND(AVG(`Time_taken(min)`), 2) AS average_delivery_time
FROM food_delivery.delivery_data
GROUP BY Type_of_order
ORDER BY average_delivery_time DESC;


-- ==========================================
-- 09. IMPACT OF MULTIPLE DELIVERIES
-- ==========================================

SELECT multiple_deliveries,
       COUNT(*) AS total_orders,
       ROUND(AVG(`Time_taken(min)`), 2) AS average_delivery_time
FROM food_delivery.delivery_data
GROUP BY multiple_deliveries
ORDER BY average_delivery_time DESC;


-- ==========================================
-- 10. DELIVERY PERFORMANCE BY CITY
-- ==========================================

SELECT City,
       COUNT(*) AS total_orders,
       ROUND(AVG(`Time_taken(min)`), 2) AS average_delivery_time
FROM food_delivery.delivery_data
GROUP BY City
ORDER BY average_delivery_time DESC;


-- ==========================================
-- 11. FESTIVAL IMPACT
-- ==========================================

SELECT Festival,
       COUNT(*) AS total_orders,
       ROUND(AVG(`Time_taken(min)`), 2) AS average_delivery_time
FROM food_delivery.delivery_data
GROUP BY Festival
ORDER BY average_delivery_time DESC;


-- ==========================================
-- 12. HOURLY ORDER VOLUME AND DELIVERY TIME
-- ==========================================

SELECT HOUR(STR_TO_DATE(Time_Orderd, '%h:%i:%s %p')) AS order_hour,
       COUNT(*) AS total_orders,
       ROUND(AVG(`Time_taken(min)`), 2) AS average_delivery_time
FROM food_delivery.delivery_data
WHERE Time_Orderd IS NOT NULL
GROUP BY HOUR(STR_TO_DATE(Time_Orderd, '%h:%i:%s %p'))
ORDER BY order_hour;


-- ==========================================
-- 13. DELIVERY PERFORMANCE BY WEEKDAY
-- ==========================================

SELECT DAYNAME(STR_TO_DATE(Order_Date, '%c/%e/%Y')) AS order_day,
       COUNT(*) AS total_orders,
       ROUND(AVG(`Time_taken(min)`), 2) AS average_delivery_time
FROM food_delivery.delivery_data
WHERE Order_Date IS NOT NULL
GROUP BY DAYOFWEEK(STR_TO_DATE(Order_Date, '%c/%e/%Y')),
         DAYNAME(STR_TO_DATE(Order_Date, '%c/%e/%Y'))
ORDER BY DAYOFWEEK(STR_TO_DATE(Order_Date, '%c/%e/%Y'));


-- ==========================================
-- 14. DELIVERY TIME BY VEHICLE TYPE
-- ==========================================

SELECT Type_of_vehicle,
       COUNT(*) AS total_orders,
       ROUND(AVG(`Time_taken(min)`), 2) AS average_delivery_time
FROM food_delivery.delivery_data
GROUP BY Type_of_vehicle
ORDER BY average_delivery_time DESC;


-- ==========================================
-- 15. WEATHER AND TRAFFIC COMBINED
-- ==========================================

SELECT Weatherconditions,
       Road_traffic_density,
       COUNT(*) AS total_orders,
       ROUND(AVG(`Time_taken(min)`), 2) AS average_delivery_time
FROM food_delivery.delivery_data
GROUP BY Weatherconditions, Road_traffic_density
ORDER BY average_delivery_time DESC;


-- ==========================================
-- 16. VEHICLE CONDITION AND TRAFFIC
-- ==========================================

SELECT Vehicle_condition,
       Road_traffic_density,
       COUNT(*) AS total_orders,
       ROUND(AVG(`Time_taken(min)`), 2) AS average_delivery_time
FROM food_delivery.delivery_data
GROUP BY Vehicle_condition, Road_traffic_density
ORDER BY average_delivery_time DESC;


-- ==========================================
-- 17. CITY AND TRAFFIC COMBINED
-- ==========================================

SELECT City,
       Road_traffic_density,
       COUNT(*) AS total_orders,
       ROUND(AVG(`Time_taken(min)`), 2) AS average_delivery_time
FROM food_delivery.delivery_data
GROUP BY City, Road_traffic_density
ORDER BY average_delivery_time DESC;


-- ==========================================
-- 18. RATINGS AND DELIVERY TIME
-- ==========================================

SELECT ROUND(Delivery_person_Ratings, 1) AS rating,
       COUNT(*) AS total_orders,
       ROUND(AVG(`Time_taken(min)`), 2) AS average_delivery_time
FROM food_delivery.delivery_data
WHERE Delivery_person_Ratings IS NOT NULL
GROUP BY ROUND(Delivery_person_Ratings, 1)
ORDER BY rating DESC;


-- ==========================================
-- 19. DAILY ORDER VOLUME AND DELIVERY TIME
-- ==========================================

SELECT STR_TO_DATE(Order_Date, '%c/%e/%Y') AS order_date,
       COUNT(*) AS total_orders,
       ROUND(AVG(`Time_taken(min)`), 2) AS average_delivery_time
FROM food_delivery.delivery_data
WHERE Order_Date IS NOT NULL
GROUP BY STR_TO_DATE(Order_Date, '%c/%e/%Y')
ORDER BY order_date;


-- ==========================================
-- 20. DELIVERY PERSON WORKLOAD
-- ==========================================

SELECT Delivery_person_ID,
       COUNT(*) AS total_orders,
       ROUND(AVG(`Time_taken(min)`), 2) AS average_delivery_time
FROM food_delivery.delivery_data
GROUP BY Delivery_person_ID
ORDER BY total_orders DESC
LIMIT 20;