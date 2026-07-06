USE marketing_analytics;
SELECT 
    COUNT(*) AS Total_Customers,
    SUM(Response) AS Total_Responders,
    ROUND(SUM(Response) / COUNT(*) * 100, 2) AS Response_Rate_Pct
FROM customers;
SELECT 
    Education,
    COUNT(*) AS Total_Customers,
    SUM(Response) AS Responders,
    ROUND(SUM(Response) / COUNT(*) * 100, 2) AS Response_Rate_Pct,
    ROUND(AVG(Total_Spend), 2) AS Avg_Total_Spend,
    ROUND(AVG(Income), 2) AS Avg_Income
FROM customers
GROUP BY Education
ORDER BY Response_Rate_Pct DESC;


SELECT 
    Country,
    COUNT(*) AS Total_Customers,
    SUM(Response) AS Responders,
    ROUND(SUM(Response) / COUNT(*) * 100, 2) AS Response_Rate_Pct,
    ROUND(AVG(Income), 2) AS Avg_Income,
    ROUND(AVG(Total_Spend), 2) AS Avg_Total_Spend
FROM customers
GROUP BY Country
ORDER BY Response_Rate_Pct DESC;


SELECT 
    CASE 
        WHEN Seg_HighIncome = 1 THEN 'High Income'
        ELSE 'Regular Income'
    END AS Customer_Type,
    ROUND(AVG(NumWebPurchases), 2) AS Avg_Web,
    ROUND(AVG(NumStorePurchases), 2) AS Avg_Store,
    ROUND(AVG(NumCatalogPurchases), 2) AS Avg_Catalog,
    ROUND(AVG(NumDealsPurchases), 2) AS Avg_Deals,
    ROUND(AVG(NumWebVisitsMonth), 2) AS Avg_Web_Visits
FROM customers
GROUP BY Seg_HighIncome;

SELECT 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 45 THEN '30-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE 'Above 60'
    END AS Age_Band,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Income), 2) AS Avg_Income,
    ROUND(AVG(Total_Spend), 2) AS Avg_Total_Spend,
    ROUND(SUM(Response) / COUNT(*) * 100, 2) AS Response_Rate_Pct
FROM customers
GROUP BY Age_Band
ORDER BY Age_Band;

SELECT 
    CASE 
        WHEN Income < 25000 THEN 'Low (< 25k)'
        WHEN Income BETWEEN 25000 AND 75000 THEN 'Middle (25k-75k)'
        ELSE 'High (> 75k)'
    END AS Income_Band,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Total_Spend), 2) AS Avg_Total_Spend,
    ROUND(SUM(Response) / COUNT(*) * 100, 2) AS Response_Rate_Pct,
    ROUND(AVG(NumWebVisitsMonth), 2) AS Avg_Web_Visits
FROM customers
GROUP BY Income_Band
ORDER BY Avg_Total_Spend DESC;

SELECT 
    'Campaign 1' AS Campaign, ROUND(AVG(AcceptedCmp1) * 100, 2) AS Acceptance_Rate_Pct FROM customers
UNION ALL
SELECT 'Campaign 2', ROUND(AVG(AcceptedCmp2) * 100, 2) FROM customers
UNION ALL
SELECT 'Campaign 3', ROUND(AVG(AcceptedCmp3) * 100, 2) FROM customers
UNION ALL
SELECT 'Campaign 4', ROUND(AVG(AcceptedCmp4) * 100, 2) FROM customers
UNION ALL
SELECT 'Campaign 5', ROUND(AVG(AcceptedCmp5) * 100, 2) FROM customers
UNION ALL
SELECT 'Last Campaign (Response)', ROUND(AVG(Response) * 100, 2) FROM customers;

SELECT 
    'High Income' AS Segment, 
    SUM(Seg_HighIncome) AS Count,
    ROUND(AVG(CASE WHEN Seg_HighIncome=1 THEN Total_Spend END), 2) AS Avg_Spend,
    ROUND(AVG(CASE WHEN Seg_HighIncome=1 THEN Response END) * 100, 2) AS Response_Rate
FROM customers
UNION ALL
SELECT 'High Spender',
    SUM(Seg_HighSpender),
    ROUND(AVG(CASE WHEN Seg_HighSpender=1 THEN Total_Spend END), 2),
    ROUND(AVG(CASE WHEN Seg_HighSpender=1 THEN Response END) * 100, 2)
FROM customers
UNION ALL
SELECT 'Campaign Responder',
    SUM(Seg_CampaignResponder),
    ROUND(AVG(CASE WHEN Seg_CampaignResponder=1 THEN Total_Spend END), 2),
    ROUND(AVG(CASE WHEN Seg_CampaignResponder=1 THEN Response END) * 100, 2)
FROM customers
UNION ALL
SELECT 'Family Customer',
    SUM(Seg_FamilyCustomer),
    ROUND(AVG(CASE WHEN Seg_FamilyCustomer=1 THEN Total_Spend END), 2),
    ROUND(AVG(CASE WHEN Seg_FamilyCustomer=1 THEN Response END) * 100, 2)
FROM customers
UNION ALL
SELECT 'High Web Engagement',
    SUM(Seg_HighWebEngagement),
    ROUND(AVG(CASE WHEN Seg_HighWebEngagement=1 THEN Total_Spend END), 2),
    ROUND(AVG(CASE WHEN Seg_HighWebEngagement=1 THEN Response END) * 100, 2)
FROM customers;
