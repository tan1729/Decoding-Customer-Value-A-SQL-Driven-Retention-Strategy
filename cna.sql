CREATE DATABASE customer_analytics;
USE customer_analytics;
SELECT * 
FROM customer_features
LIMIT 10;
DESCRIBE customer_features;
-- QUERY 1 — CUSTOMER COUNT BY TIER
SELECT
    customer_tier,
    COUNT(*) AS total_customers
FROM customer_features
GROUP BY customer_tier
ORDER BY total_customers DESC;
-- QUERY 2 — AVG SPEND BY TIER
SELECT
    customer_tier,
    ROUND(AVG(purchase_amount),2) AS avg_purchase,
    ROUND(AVG(previous_purchases),2) AS avg_previous_purchases,
    ROUND(AVG(loyalty_score),2) AS avg_loyalty_score
FROM customer_features
GROUP BY customer_tier
ORDER BY avg_loyalty_score DESC;
-- QUERY 3 — REVENUE CONTRIBUTION BY TIER
SELECT
    customer_tier,
    ROUND(SUM(purchase_amount),2) AS total_revenue
FROM customer_features
GROUP BY customer_tier
ORDER BY total_revenue DESC;
-- QUERY 4 — HIGH VALUE CUSTOMER ANALYSIS
SELECT
    high_value_customer,
    COUNT(*) AS total_customers,
    ROUND(AVG(loyalty_score),2) AS avg_loyalty,
    ROUND(AVG(estimated_annual_value),2) AS avg_annual_value
FROM customer_features
GROUP BY high_value_customer;
-- QUERY 5 — DISCOUNT USERS VS NON-DISCOUNT USERS
SELECT
    discount_applied,
    COUNT(*) AS total_customers,
    ROUND(AVG(purchase_amount),2) AS avg_purchase,
    ROUND(AVG(previous_purchases),2) AS avg_previous_purchases,
    ROUND(AVG(loyalty_score),2) AS avg_loyalty
FROM customer_features
GROUP BY discount_applied;
-- QUERY 6 — REVENUE CONTRIBUTION BY DISCOUNT STATUS
SELECT
    discount_applied,
    ROUND(SUM(purchase_amount),2) AS total_revenue
FROM customer_features
GROUP BY discount_applied;
-- QUERY 7 — CUSTOMER TIER DISTRIBUTION BY DISCOUNT USAGE
SELECT
    discount_applied,
    customer_tier,
    COUNT(*) AS total_customers
FROM customer_features
GROUP BY discount_applied, customer_tier
ORDER BY discount_applied, total_customers DESC;
-- QUERY 8 — PROMO CODE ANALYSIS
SELECT
    promo_code_used,
    ROUND(AVG(loyalty_score),2) AS avg_loyalty,
    ROUND(AVG(purchase_amount),2) AS avg_purchase,
    ROUND(AVG(estimated_annual_value),2) AS avg_annual_value
FROM customer_features
GROUP BY promo_code_used;
-- QUERY 9 — DISCOUNT DEPENDENCY RISK ANALYSIS
SELECT
    customer_tier,
    discount_applied,
    ROUND(AVG(loyalty_score),2) AS avg_loyalty,
    ROUND(AVG(previous_purchases),2) AS avg_repeat_purchases
FROM customer_features
GROUP BY customer_tier, discount_applied
ORDER BY customer_tier, avg_loyalty DESC;
-- QUERY 10 — TOP REVENUE LOCATIONS
SELECT
    location,
    ROUND(SUM(purchase_amount),2) AS total_revenue,
    ROUND(AVG(loyalty_score),2) AS avg_loyalty
FROM customer_features
GROUP BY location
ORDER BY total_revenue DESC
LIMIT 10;
-- QUERY 11 — CATEGORY PERFORMANCE ANALYSIS
SELECT
    category,
    ROUND(SUM(purchase_amount),2) AS total_revenue,
    ROUND(AVG(previous_purchases),2) AS avg_repeat_purchases,
    ROUND(AVG(loyalty_score),2) AS avg_loyalty
FROM customer_features
GROUP BY category
ORDER BY total_revenue DESC;
-- QUERY 12 — SUBSCRIPTION ANALYSIS
SELECT
    subscription_status,
    ROUND(AVG(loyalty_score),2) AS avg_loyalty,
    ROUND(AVG(estimated_annual_value),2) AS avg_annual_value,
    ROUND(SUM(purchase_amount),2) AS total_revenue
FROM customer_features
GROUP BY subscription_status;
-- QUERY 13 — EXECUTIVE KPIs
SELECT
    COUNT(*) AS total_customers,
    ROUND(SUM(purchase_amount),2) AS total_revenue,
    ROUND(AVG(purchase_amount),2) AS avg_order_value,
    ROUND(AVG(loyalty_score),2) AS avg_loyalty_score,
    
    ROUND(
        100 * SUM(high_value_customer)/COUNT(*),
        2
    ) AS high_value_customer_percentage
FROM customer_features;



-- =========================================
-- QUERY 1 INSIGHT
-- Customer Count by Tier
-- =========================================

-- Insight:
-- Quartile-based segmentation successfully created balanced customer groups,
-- enabling fair comparison across different loyalty segments.


-- =========================================
-- QUERY 2 INSIGHT
-- Average Spend by Tier
-- =========================================

-- Insight:
-- Higher customer tiers demonstrate significantly stronger spending behavior,
-- repeat purchase activity, and loyalty scores, validating the effectiveness
-- of the loyalty scoring framework.


-- =========================================
-- QUERY 3 INSIGHT
-- Revenue Contribution by Tier
-- =========================================

-- Insight:
-- Platinum customers generate the highest overall revenue contribution,
-- indicating that customer loyalty is strongly associated with long-term
-- business value and profitability.


-- =========================================
-- QUERY 4 INSIGHT
-- High Value Customer Analysis
-- =========================================

-- Insight:
-- High-value customers exhibit substantially higher loyalty scores and annual
-- customer value, making them strategic retention targets for premium loyalty
-- and personalization initiatives.


-- =========================================
-- QUERY 5 INSIGHT
-- Discount Users vs Non-Discount Users
-- =========================================

-- Insight:
-- Customers using discounts show slightly higher repeat purchase behavior
-- and loyalty scores, suggesting that promotions help improve customer
-- engagement and retention.


-- =========================================
-- QUERY 6 INSIGHT
-- Revenue Contribution by Discount Status
-- =========================================

-- Insight:
-- Non-discount customers contribute significantly higher total revenue,
-- indicating that organic purchasing behavior is more profitable than
-- promotion-driven purchasing.


-- =========================================
-- QUERY 7 INSIGHT
-- Customer Tier Distribution by Discount Usage
-- =========================================

-- Insight:
-- Discount usage is present even among Platinum and Gold customers,
-- suggesting that promotional incentives influence purchasing behavior
-- across all loyalty segments.


-- =========================================
-- QUERY 8 INSIGHT
-- Promo Code Analysis
-- =========================================

-- Insight:
-- Promo code users demonstrate slightly stronger loyalty behavior but do not
-- generate substantially higher annual customer value, indicating limited
-- long-term profitability impact from promotional campaigns.


-- =========================================
-- QUERY 9 INSIGHT
-- Discount Dependency Risk Analysis
-- =========================================

-- Insight:
-- Even highly loyal customers continue to engage heavily with discounts,
-- indicating the presence of promotion-conditioned loyalty within the
-- customer base.


-- =========================================
-- QUERY 10 INSIGHT
-- Top Revenue Locations
-- =========================================

-- Insight:
-- States such as Montana, Illinois, and California generate the highest
-- overall revenue contribution, indicating strong regional purchasing
-- behavior and monetization potential in these markets.


-- =========================================
-- QUERY 11 INSIGHT
-- Category Performance Analysis
-- =========================================

-- Insight:
-- Clothing contributes the highest total revenue, while Accessories and
-- Footwear demonstrate slightly higher loyalty and repeat purchase behavior,
-- suggesting strong cross-selling and retention potential within these categories.


-- =========================================
-- QUERY 12 INSIGHT
-- Subscription Analysis
-- =========================================

-- Insight:
-- Subscribed customers demonstrate significantly higher loyalty scores and
-- slightly higher annual customer value, indicating that subscription programs
-- positively influence long-term customer engagement and retention behavior.


-- =========================================
-- QUERY 13 INSIGHT
-- Executive KPI Summary
-- =========================================

-- Insight:
-- The business maintains a stable customer base of 3900 customers with
-- total revenue exceeding 233K USD. Approximately 25% of customers are
-- classified as high-value customers, representing a strong opportunity
-- for targeted retention and premium loyalty initiatives.


