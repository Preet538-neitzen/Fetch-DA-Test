# Fetch Data Analytics Exercise

## Overview

This is a data analytics internship coding exercise for Fetch. **The SQL Dialect used is SQL Standard.**

## Problem Statement

1. **First: Review Existing Data and Diagram a New Structured Relational Data Model**

   Answer: The ER diagram has been attached as a pdf file.

   Notes:

   The Users table and the Receipts table are related through the USER_ID column, the Receipts table and the Receipt_items table are related through the ID column, and the Receipt_items table and the Brands table are related through the BRAND_CODE column. This means that we can join the data in these tables to access information from multiple tables in one query.

2. The SQL queries for each of the question are as follows:
   **Which brand saw the most dollars spent in the month of June?**

   ```sql
   SELECT b.NAME as brand_name, SUM(r.TOTAL_SPENT) as total_spent
   FROM brands b
   JOIN receipt_items ri ON b.BRAND_CODE = ri.BRAND_CODE -- Join tables brands and receipt items
   JOIN receipts r ON ri.REWARDS_RECEIPT_ID = r.ID -- Join tables receipts and rewards receipts
   WHERE MONTH(r.PURCHASE_DATE) = 6 -- Month of June
   GROUP BY b.NAME
   ORDER BY total_spent DESC
   LIMIT 1 -- Find max by limit 1 and order by total_spent in DESC
   ```

2. **Which user spent the most money in the month of August?**

   ```sql
   SELECT u.ID, SUM(r.TOTAL_SPENT) as total_spent
   FROM users u
   JOIN receipts r ON u.ID = r.USER_ID -- Group users and receipts table based on User ID
   WHERE MONTH(r.PURCHASE_DATE) = 8 -- Month of August
   GROUP BY u.ID
   ORDER BY total_spent DESC -- Sort in descending order
   LIMIT 1 -- Get the top value
   ```

3. **What user bought the most expensive item?**

   ```sql
   SELECT u.ID, MAX(ri.TOTAL_FINAL_PRICE) as most_expensive_item
   FROM users u
   JOIN receipts r ON u.ID = r.USER_ID -- Join tables uses and receipts on User ID
   JOIN receipt_items ri ON r.ID = ri.REWARDS_RECEIPT_ID -- Join tables receipt_items and receipts on Receipt ID
   GROUP BY u.ID
   ORDER BY most_expensive_item DESC -- order by DESC to find higher expenses first
   LIMIT 1 -- LIMIT 1 to find the top user
   ```

4. **What is the name of the most expensive item purchased?**

   ```sql
   SELECT b.NAME as brand_name, MAX(ri.TOTAL_FINAL_PRICE) as most_expensive_item
   FROM brands b
   JOIN receipt_items ri ON b.BRAND_CODE = ri.BRAND_CODE -- Join brands and receipt_items on Brand Code
   GROUP BY b.NAME
   ORDER BY most_expensive_item DESC -- Reverse sort to find max first
   LIMIT 1 -- Get the top most value
   ```

5. **How many users scanned in each month?**

   ```sql
   SELECT MONTH(CREATED_DATE) AS MONTH_OF_SCAN, COUNT(*) AS NUMBER_OF_USERS
   FROM USERS
   GROUP BY MONTH_OF_SCAN
   ORDER BY MONTH_OF_SCAN ASC;
   ```

## Section 3: Note to stakeholders

Greetings,

I've been working on the analysis of finding the most ideal source for attracting new users to use Fetch rewards. I want to update my progress and get clarity on some questions.

I found that the most number of sign ups we have on the platform as of now have come through apple devices. This can help us understand our user base better. Moreover, we can target sales campaigns across other platforms to get more sign ups. Some other sign up platforms are:

```
Platform	Users
Apple		33
Facebook	16
Email		26
Google		12
```

Moreover, I also tried to understand what is the most popular and beneficial store for us in terms for store lifetime value. Upon doing some analysis, I found the following to be our top 5 stores in terms of overall sales. This could help us target advertisement revenue to these particular stores to maximize output. 

| BURLINGTON                 | 155066.32          |
| -------------------------- | ------------------ |
| 380 LENOX MEAT CORPORATION | 125640.19000000002 |
| THE HOME DEPOT             | 96364.78000000004  |
| PIONEER SUPERMARKETS       | 63031.34000000001  |
| CHASE                      | 57238.89           |

**Code for the advanced analysis is in the advanced folder.**

Questions I want to clarify:

1. Data Definition Clarification For The Analysis:

In the current analysis, I’m assuming that **Finished = Accepted** because there are no rows where rewardsReceiptStatus is **Accepted**. Correct me if I am wrong, and I will update the analysis.

1. Data Format:

The current data is not well structured. For example, rewardsReceiptItemList contains a blob of information, is there a way we can more efficiently store this data? This format would cost a lot of time for data wrangling in the future when we scale to millions of rows. It would be helpful for us to spend time discussing restructuring the current data frame so that we could work more efficiently in the future.

1. Data Quality Issues - Missing Value and Outliers:

After drawing box plots, looking at numerical data distributions, and calculating the null value percentage, I found that there are some missing values in the Users, Brands, and Receipts tables. There is a disproportionately large number of null values in the `rewardsReceiptItemList` column. Could you let me know what the data collection process was, so we can brainstorm methods to improve data quality and reduce the number of null values in the future? There are also lots of outliers in the dataset. For example, a few transactions earned 6000+ points, and spent 4000+ dollars. This could lead to extended standard deviations in our analysis.

Some `userId` from the Receipts table don’t match the `_id` in the Users table. This might happen because our customer/user database isn’t large enough yet. It would be helpful for us to discuss some alternative methods to collect more user information. Having sufficient customer/user data will help further customer analysis. Another data issue I want to address is that there are a lot of brand codes in the Receipts table that do not exist in the Brands data. This could be problematic when we are doing analysis on a brand level.

Thanks!

Best Regards, Preet
