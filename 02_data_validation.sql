-- ============================================================
-- PROJECT: FOOD DELIVERY DATA ANALYSIS
-- FILE: 02_data_validation.sql
-- PURPOSE: Data quality checks and validation
-- TABLE: food_delivery.delivery_data
-- NOTE: All queries are SELECT-only. No data is modified.
-- ============================================================

USE food_delivery;


-- 1. TOTAL NUMBER OF RECORDS
SELECT
    COUNT(*) AS total_records
FROM delivery_data;


-- 2. CHECK MISSING VALUES IN IMPORTANT COLUMNS
SELECT
    SUM(CASE WHEN Delivery_person_ID IS NULL THEN 1 ELSE 0 END) AS missing_delivery_person_id,
    SUM(CASE WHEN Delivery_person_Age IS NULL THEN 1 ELSE 0 END) AS missing_age,
    SUM(CASE WHEN Delivery_person_Ratings IS NULL THEN 1 ELSE 0 END) AS missing_ratings,
    SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS missing_order_date,
    SUM(CASE WHEN Time_Orderd IS NULL THEN 1 ELSE 0 END) AS missing_order_time,
    SUM(CASE WHEN Weatherconditions IS NULL THEN 1 ELSE 0 END) AS missing_weather,
    SUM(CASE WHEN Road_traffic_density IS NULL THEN 1 ELSE 0 END) AS missing_traffic,
    SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) AS missing_city,
    SUM(CASE WHEN `Time_taken(min)` IS NULL THEN 1 ELSE 0 END) AS missing_delivery_time
FROM delivery_data;


-- 3. CHECK DUPLICATE ORDER IDs
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT ID) AS unique_order_ids,
    COUNT(*) - COUNT(DISTINCT ID) AS duplicate_ids
FROM delivery_data;


-- 4. CHECK DELIVERY PERSON RATINGS
SELECT
    Delivery_person_Ratings,
    COUNT(*) AS total_records
FROM delivery_data
GROUP BY Delivery_person_Ratings
ORDER BY Delivery_person_Ratings;


-- 5. IDENTIFY SUSPICIOUS RATINGS ABOVE 5
SELECT
    ID,
    Delivery_person_ID,
    Delivery_person_Ratings,
    City,
    Road_traffic_density,
    `Time_taken(min)`
FROM delivery_data
WHERE Delivery_person_Ratings > 5
ORDER BY Delivery_person_Ratings DESC;


-- 6. CHECK DELIVERY TIME RANGE
SELECT
    MIN(`Time_taken(min)`) AS minimum_delivery_time,
    MAX(`Time_taken(min)`) AS maximum_delivery_time,
    AVG(`Time_taken(min)`) AS average_delivery_time
FROM delivery_data;


-- 7. CHECK NON-POSITIVE DELIVERY TIMES
SELECT
    COUNT(*) AS non_positive_delivery_times
FROM delivery_data
WHERE `Time_taken(min)` <= 0;


-- 8. IDENTIFY DELIVERIES TAKING MORE THAN 45 MINUTES
SELECT
    COUNT(*) AS deliveries_above_45_minutes
FROM delivery_data
WHERE `Time_taken(min)` > 45;


-- 9. CHECK CITY CATEGORIES
SELECT
    City,
    COUNT(*) AS total_records
FROM delivery_data
GROUP BY City
ORDER BY total_records DESC;


-- 10. CHECK ROAD TRAFFIC CATEGORIES
SELECT
    Road_traffic_density,
    COUNT(*) AS total_records
FROM delivery_data
GROUP BY Road_traffic_density
ORDER BY total_records DESC;


-- 11. CHECK WEATHER CATEGORIES
SELECT
    Weatherconditions,
    COUNT(*) AS total_records
FROM delivery_data
GROUP BY Weatherconditions
ORDER BY total_records DESC;


-- 12. CHECK VEHICLE CONDITION CATEGORIES
SELECT
    Vehicle_condition,
    COUNT(*) AS total_records
FROM delivery_data
GROUP BY Vehicle_condition
ORDER BY Vehicle_condition;


-- 13. CHECK ORDER AND VEHICLE TYPE CATEGORIES
SELECT
    'Order Type' AS category_type,
    Type_of_order AS category_value,
    COUNT(*) AS total_records
FROM delivery_data
GROUP BY Type_of_order

UNION ALL

SELECT
    'Vehicle Type' AS category_type,
    Type_of_vehicle AS category_value,
    COUNT(*) AS total_records
FROM delivery_data
GROUP BY Type_of_vehicle;


-- 14. CHECK ORDER DATE VALIDITY
SELECT
    COUNT(*) AS total_records,
    SUM(
        CASE
            WHEN STR_TO_DATE(Order_Date, '%c/%e/%Y') IS NULL
            THEN 1 ELSE 0
        END
    ) AS invalid_dates,
    MIN(STR_TO_DATE(Order_Date, '%c/%e/%Y')) AS earliest_order_date,
    MAX(STR_TO_DATE(Order_Date, '%c/%e/%Y')) AS latest_order_date
FROM delivery_data;


-- 15. CHECK ORDER TIME VALIDITY
SELECT
    COUNT(*) AS total_records,
    SUM(
        CASE
            WHEN STR_TO_DATE(Time_Orderd, '%h:%i:%s %p') IS NULL
            THEN 1 ELSE 0
        END
    ) AS invalid_order_times
FROM delivery_data
WHERE Time_Orderd IS NOT NULL
  AND TRIM(Time_Orderd) <> '';


-- 16. CHECK AGE RANGE
SELECT
    MIN(Delivery_person_Age) AS minimum_age,
    MAX(Delivery_person_Age) AS maximum_age,
    AVG(Delivery_person_Age) AS average_age
FROM delivery_data;


-- 17. CHECK INVALID AGE VALUES
SELECT
    COUNT(*) AS invalid_age_records
FROM delivery_data
WHERE Delivery_person_Age <= 0;


-- 18. CHECK RATINGS OUTSIDE THE 1-5 RANGE
SELECT
    COUNT(*) AS ratings_outside_expected_range
FROM delivery_data
WHERE Delivery_person_Ratings < 1
   OR Delivery_person_Ratings > 5;


-- 19. CHECK INVALID VEHICLE CONDITION CODES
SELECT
    Vehicle_condition,
    COUNT(*) AS total_records
FROM delivery_data
WHERE Vehicle_condition NOT IN (0, 1, 2, 3)
GROUP BY Vehicle_condition;


-- 20. CHECK INVALID MULTIPLE DELIVERY VALUES
SELECT
    multiple_deliveries,
    COUNT(*) AS total_records
FROM delivery_data
WHERE multiple_deliveries NOT IN (0, 1, 2, 3)
GROUP BY multiple_deliveries;


-- 21. IDENTIFY RECORDS WITH AGE 15
SELECT
    ID,
    Delivery_person_ID,
    Delivery_person_Age,
    City,
    Delivery_person_Ratings
FROM delivery_data
WHERE Delivery_person_Age = 15
ORDER BY ID;


-- 22. FINAL DATASET SUMMARY
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT ID) AS unique_order_ids,
    MIN(Delivery_person_Age) AS minimum_age,
    MAX(Delivery_person_Age) AS maximum_age,
    ROUND(AVG(Delivery_person_Ratings), 2) AS average_rating,
    ROUND(AVG(`Time_taken(min)`), 2) AS average_delivery_time
FROM delivery_data;


-- ============================================================
-- END OF DATA VALIDATION SCRIPT
-- ============================================================