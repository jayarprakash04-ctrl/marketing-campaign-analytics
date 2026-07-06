CREATE DATABASE marketing_analytics;
USE marketing_analytics;
USE marketing_analytics;

CREATE TABLE IF NOT EXISTS customers (
    ID                  BIGINT PRIMARY KEY,
    Year_Birth          INT,
    Education           VARCHAR(50),
    Marital_Status      VARCHAR(50),
    Income              FLOAT,
    Kidhome             INT,
    Teenhome            INT,
    Dt_Customer         DATE,
    Recency             INT,
    MntWines            INT,
    MntFruits           INT,
    MntMeatProducts     INT,
    MntFishProducts     INT,
    MntSweetProducts    INT,
    MntGoldProds        INT,
    NumDealsPurchases   INT,
    NumWebPurchases     INT,
    NumCatalogPurchases INT,
    NumStorePurchases   INT,
    NumWebVisitsMonth   INT,
    AcceptedCmp3        INT,
    AcceptedCmp4        INT,
    AcceptedCmp5        INT,
    AcceptedCmp1        INT,
    AcceptedCmp2        INT,
    Response            INT,
    Complain            INT,
    Country             VARCHAR(50),
    Age                 INT,
    Customer_Tenure     INT,
    Total_Spend         FLOAT,
    Total_Purchases     INT,
    Children            INT,
    Seg_HighIncome          INT,
    Seg_YoungCustomer       INT,
    Seg_CampaignResponder   INT,
    Seg_HighWebEngagement   INT,
    Seg_FamilyCustomer      INT,
    Seg_HighSpender         INT
);

SELECT 'Table created successfully!' AS Status;
USE marketing_analytics;

LOAD DATA INFILE 'C:\Users\jayar\OneDrive\Desktop\marketing-campaign-analytics\data\marketing_data_cleaned.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID, Year_Birth, Education, Marital_Status, Income, Kidhome, Teenhome,
 Dt_Customer, Recency, MntWines, MntFruits, MntMeatProducts, MntFishProducts,
 MntSweetProducts, MntGoldProds, NumDealsPurchases, NumWebPurchases,
 NumCatalogPurchases, NumStorePurchases, NumWebVisitsMonth,
 AcceptedCmp3, AcceptedCmp4, AcceptedCmp5, AcceptedCmp1, AcceptedCmp2,
 Response, Complain, Country, Age, Customer_Tenure, Total_Spend,
 Total_Purchases, Children, Seg_HighIncome, Seg_YoungCustomer,
 Seg_CampaignResponder, Seg_HighWebEngagement, Seg_FamilyCustomer,
 Seg_HighSpender);

SELECT COUNT(*) AS Total_Rows_Loaded FROM customers;