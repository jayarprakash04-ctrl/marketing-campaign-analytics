USE marketing_analytics;

-- VIEW 1: Response Rate by Education
CREATE OR REPLACE VIEW vw_response_by_education AS
SELECT 
    Education,
    COUNT(*) AS Total_Customers,
    SUM(Response) AS Responders,
    ROUND(SUM(Response) / COUNT(*) * 100, 2) AS Response_Rate_Pct,
    ROUND(AVG(Total_Spend), 2) AS Avg_Total_Spend,
    ROUND(AVG(Income), 2) AS Avg_Income
FROM customers
GROUP BY Education;

-- VIEW 2: Response Rate by Country
CREATE OR REPLACE VIEW vw_response_by_country AS
SELECT 
    Country,
    COUNT(*) AS Total_Customers,
    SUM(Response) AS Responders,
    ROUND(SUM(Response) / COUNT(*) * 100, 2) AS Response_Rate_Pct,
    ROUND(AVG(Income), 2) AS Avg_Income,
    ROUND(AVG(Total_Spend), 2) AS Avg_Total_Spend
FROM customers
GROUP BY Country;

-- VIEW 3: Response Rate by Marital Status
CREATE OR REPLACE VIEW vw_response_by_marital AS
SELECT 
    Marital_Status,
    COUNT(*) AS Total_Customers,
    SUM(Response) AS Responders,
    ROUND(SUM(Response) / COUNT(*) * 100, 2) AS Response_Rate_Pct,
    ROUND(AVG(Total_Spend), 2) AS Avg_Total_Spend
FROM customers
GROUP BY Marital_Status;

-- VIEW 4: KPIs by Age Band
CREATE OR REPLACE VIEW vw_kpi_by_age_band AS
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
GROUP BY Age_Band;

-- VIEW 5: KPIs by Income Band
CREATE OR REPLACE VIEW vw_kpi_by_income_band AS
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
GROUP BY Income_Band;

-- VIEW 6: Campaign Acceptance Rates
CREATE OR REPLACE VIEW vw_campaign_acceptance AS
SELECT 'Campaign 1' AS Campaign, ROUND(AVG(AcceptedCmp1)*100,2) AS Acceptance_Rate FROM customers
UNION ALL SELECT 'Campaign 2', ROUND(AVG(AcceptedCmp2)*100,2) FROM customers
UNION ALL SELECT 'Campaign 3', ROUND(AVG(AcceptedCmp3)*100,2) FROM customers
UNION ALL SELECT 'Campaign 4', ROUND(AVG(AcceptedCmp4)*100,2) FROM customers
UNION ALL SELECT 'Campaign 5', ROUND(AVG(AcceptedCmp5)*100,2) FROM customers
UNION ALL SELECT 'Last Campaign', ROUND(AVG(Response)*100,2) FROM customers;

-- VIEW 7: Segment Summary
CREATE OR REPLACE VIEW vw_segment_summary AS
SELECT 
    'High Income' AS Segment,
    SUM(Seg_HighIncome) AS Count,
    ROUND(AVG(CASE WHEN Seg_HighIncome=1 THEN Total_Spend END),2) AS Avg_Spend,
    ROUND(AVG(CASE WHEN Seg_HighIncome=1 THEN Response END)*100,2) AS Response_Rate
FROM customers
UNION ALL
SELECT 'High Spender',
    SUM(Seg_HighSpender),
    ROUND(AVG(CASE WHEN Seg_HighSpender=1 THEN Total_Spend END),2),
    ROUND(AVG(CASE WHEN Seg_HighSpender=1 THEN Response END)*100,2)
FROM customers
UNION ALL
SELECT 'Campaign Responder',
    SUM(Seg_CampaignResponder),
    ROUND(AVG(CASE WHEN Seg_CampaignResponder=1 THEN Total_Spend END),2),
    ROUND(AVG(CASE WHEN Seg_CampaignResponder=1 THEN Response END)*100,2)
FROM customers
UNION ALL
SELECT 'Family Customer',
    SUM(Seg_FamilyCustomer),
    ROUND(AVG(CASE WHEN Seg_FamilyCustomer=1 THEN Total_Spend END),2),
    ROUND(AVG(CASE WHEN Seg_FamilyCustomer=1 THEN Response END)*100,2)
FROM customers
UNION ALL
SELECT 'High Web Engagement',
    SUM(Seg_HighWebEngagement),
    ROUND(AVG(CASE WHEN Seg_HighWebEngagement=1 THEN Total_Spend END),2),
    ROUND(AVG(CASE WHEN Seg_HighWebEngagement=1 THEN Response END)*100,2)
FROM customers;

-- VIEW 8: Channel Usage
CREATE OR REPLACE VIEW vw_channel_usage AS
SELECT
    CASE WHEN Seg_HighIncome=1 THEN 'High Income' ELSE 'Regular Income' END AS Customer_Type,
    ROUND(AVG(NumWebPurchases),2) AS Avg_Web,
    ROUND(AVG(NumStorePurchases),2) AS Avg_Store,
    ROUND(AVG(NumCatalogPurchases),2) AS Avg_Catalog,
    ROUND(AVG(NumDealsPurchases),2) AS Avg_Deals,
    ROUND(AVG(NumWebVisitsMonth),2) AS Avg_Web_Visits
FROM customers
GROUP BY Seg_HighIncome;

SELECT 'All views created successfully!' AS Status;