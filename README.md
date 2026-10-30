# Food Delivery Data Analysis Using SQL

## Project Overview

This project analyzes food delivery operations using **MySQL** to identify factors associated with delivery time, understand operational patterns, and generate practical business recommendations.

The analysis focuses on traffic conditions, weather, vehicle conditions, order types, delivery personnel, festivals, cities, and delivery duration.

## Project Details

| Category | Details |
|---|---|
| Project | Food Delivery Data Analysis |
| Domain | Food Delivery / Operations Analytics |
| Database | MySQL |
| SQL Environment | MySQL Workbench 8.0 |
| Dataset Size | 45,593 records |
| Analysis Period | February 11 – April 6, 2022 |
| Primary Objective | Analyze delivery performance and identify operational insights |

## Tools and Technologies

- **MySQL 8.0:** Data querying and analysis
- **MySQL Workbench:** SQL development environment
- **GitHub:** Project documentation and version control

## Business Questions and Analysis

The project explores 20 analytical areas:

1. Overall dataset exploration
2. Average age of delivery personnel
3. Average delivery-person ratings
4. Distribution of road traffic conditions
5. Average delivery time by traffic condition
6. Average delivery time by weather condition
7. Delivery time by vehicle condition
8. Delivery time by order type
9. Impact of multiple deliveries on delivery duration
10. Delivery performance across cities
11. Delivery time during festivals
12. Order volume and delivery time by hour
13. Delivery performance by weekday
14. Delivery time by vehicle type
15. Combined analysis of weather and traffic
16. Combined analysis of vehicle condition and traffic
17. Combined analysis of city and traffic
18. Relationship between delivery ratings and delivery time
19. Daily order volume and delivery duration
20. Delivery-person workload analysis

## Key Business Insights

### 1. Traffic Conditions

| Traffic Condition | Average Delivery Time |
|---|---:|
| Jam | 31.18 minutes |
| High | 27.24 minutes |
| Medium | 26.69 minutes |
| Low | 21.27 minutes |

Deliveries during traffic jams took approximately **9.91 minutes longer** on average than deliveries under low-traffic conditions.

### 2. Weather Conditions

| Weather | Average Delivery Time |
|---|---:|
| Cloudy | 28.92 minutes |
| Fog | 28.92 minutes |
| Windy | 26.12 minutes |
| Sandstorms | 25.88 minutes |
| Stormy | 25.87 minutes |
| Sunny | 22.22 minutes |

Cloudy and foggy conditions had the highest average delivery times.

### 3. Multiple Deliveries

| Multiple Deliveries | Average Delivery Time |
|---|---:|
| 0 | 22.87 minutes |
| 1 | 26.86 minutes |
| 2 | 40.45 minutes |
| 3 | 47.82 minutes |

The average delivery time increased as the multiple-delivery count increased.

### 4. Festival Impact

- Festival deliveries: **45.52 minutes**
- Non-festival deliveries: **25.91 minutes**

Festival deliveries took approximately 19.61 minutes longer on average.

### 5. Hourly Performance

- Highest order volume: **9 PM (4,686 orders)**
- Longest average delivery time: **8 PM (31.19 minutes)**
- Shortest average delivery time: **10 AM (19.48 minutes)**

### 6. City Performance

| City | Average Delivery Time | Records |
|---|---:|---:|
| Semi-Urban | 49.73 minutes | 164 |
| Metropolitian | 27.32 minutes | 34,093 |
| Urban | 22.89 minutes | 11,336 |

The Semi-Urban result should be interpreted cautiously because its sample size is much smaller.

### 7. Vehicle Type

Motorcycles had an average delivery time of 27.61 minutes, while scooters and electric scooters averaged approximately 24.48 minutes.

## Data Validation and Quality Checks

Before conducting the business analysis, the dataset was checked for data-quality issues.

| Validation Check | Result |
|---|---|
| Total records | 45,593 |
| Duplicate IDs | 0 |
| NULL values in 9 checked columns | 0 |
| Invalid date values | 0 |
| Invalid order-time values | 0 |
| Non-positive delivery times | 0 |
| Ratings outside the expected 1–5 range | 53 |
| Delivery-person age of 15 | 38 records |
| Delivery times above 45 minutes | 1,562 records |

### Suspicious Records

- **53 records** contain a rating of 6.0, outside the expected 1–5 rating scale.
- **38 records** contain a delivery-person age of 15 and were flagged for review.
- Delivery durations above 45 minutes were retained rather than automatically classified as errors.

The original dataset was not modified. Suspicious values were preserved for transparency and further investigation.

## Business Recommendations

Based on the findings, the following recommendations could help improve delivery operations:

1. **Traffic-aware routing:** Consider traffic conditions when assigning delivery routes and estimating delivery times.
2. **Weather-sensitive planning:** Adjust delivery-time estimates during foggy and cloudy conditions.
3. **Multiple-order management:** Review the number of simultaneous deliveries assigned to each delivery person.
4. **Festival preparation:** Increase operational readiness and delivery capacity during festivals.
5. **Evening staffing:** Review staffing and delivery-person availability during peak evening hours.
6. **Semi-Urban investigation:** Investigate delivery challenges in Semi-Urban areas while considering the smaller sample size.
7. **Vehicle maintenance:** Investigate the relationship between vehicle condition and delivery performance.

## Important Limitations

- The analysis identifies associations, not proof of causation.
- The dataset covers February 11 to April 6, 2022.
- Semi-Urban and Bicycle records have relatively small sample sizes.
- The meanings of the numeric vehicle-condition codes were not verified.
- Distance was not controlled for in the delivery-time comparisons.
- Suspicious records were retained rather than automatically corrected.

## Conclusion

This SQL project demonstrates how structured data analysis can reveal operational patterns and support business decision-making.

The findings suggest that traffic conditions, weather, multiple deliveries, and festivals are important factors associated with delivery duration.

The project also demonstrates the importance of data validation before drawing business conclusions.

---

**Project Status:** SQL analysis and business insights completed. Portfolio documentation in progress.
