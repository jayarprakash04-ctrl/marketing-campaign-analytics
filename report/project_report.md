# Marketing Campaign Analysis — Project Report

## 1. Problem Statement
A retail company ran multiple marketing campaigns and recorded detailed 
information about customers including demographics, spending across product 
categories, channel-wise purchases, and campaign acceptance. The goal was 
to identify the most valuable customer segments, understand what drives 
campaign acceptance, and provide actionable recommendations.

## 2. Approach

### Step 1: Data Understanding & Cleaning (Python)
- Loaded marketing_campaign_data.csv (56,000 rows, 28 columns)
- No missing values or duplicate rows found
- Cleaned Marital_Status: merged YOLO, Absurd, Alone → Single
- Removed 6 outlier rows (age > 90 or income > 200,000)
- Converted Dt_Customer to datetime format

### Step 2: Feature Engineering
- Age = 2024 - Year_Birth
- Customer_Tenure = days since enrollment (reference: 2024-12-31)
- Total_Spend = sum of all Mnt* columns
- Total_Purchases = sum of all channel purchase columns
- Children = Kidhome + Teenhome

### Step 3: Rule-Based Segmentation
| Segment | Rule | Count | % |
|---|---|---|---|
| High Income | Income > 75,000 | 19,776 | 35.32% |
| High Spender | Total_Spend > 90th percentile | 5,597 | 10.00% |
| Campaign Responder | Response = 1 | 8,264 | 14.76% |
| High Web Engagement | NumWebVisitsMonth > 5 | 29,969 | 53.52% |
| Family Customer | Children > 0 | 38,220 | 68.26% |
| Young Customer | Age < 30 | 1,325 | 2.37% |

### Step 4: SQL Data Modeling
- Created marketing_analytics database in MySQL
- Loaded 55,994 rows into customers table
- Created 8 analytical views for dashboard support
- Wrote 10 analytical queries covering KPIs, segments, channels

### Step 5: Power BI Dashboard
Built 4-page interactive dashboard connected to cleaned CSV:
- Page 1: Customer Overview
- Page 2: Campaign Performance
- Page 3: Spending Analysis
- Page 4: Segment Insights

## 3. Key Findings

### Customer Profile
- Average age: 52 years
- Average income: $57,230
- Average total spend: $640
- Most customers are from Spain (largest group)
- 68% are family customers (have children)

### Campaign Performance
- Overall response rate: 14.76%
- Australia has highest response rate (20%)
- Canada has lowest response rate (11.5%)
- Graduation-level customers respond most (17%)
- Widowed and divorced customers respond more than married ones
- Campaign 5 had highest acceptance rate among all campaigns

### Spending Patterns
- Wine is the top spending category by far
- Meat products are second highest
- High income customers spend significantly more across all categories
- Graduation and Master degree holders spend the most
- Divorced and Widow customers have higher average spend

### Channel Usage
- Store purchases are the most popular channel
- Web purchases are second most popular
- High income customers use catalog channel more than regular customers
- Spain has highest web visits per month

## 4. Actionable Recommendations

1. **Target Australia and India for future campaigns** — they show the 
   highest response rates (20% and 18.7%) and should receive priority 
   campaign budgets.

2. **Focus on Graduation-level customers** — they have both the highest 
   response rate (17%) and high average spend. Tailor messaging to this 
   segment.

3. **Re-engage Widow and Divorced segments** — they respond better to 
   campaigns than married customers, suggesting they are more open to 
   offers. Create personalized campaigns for them.

4. **Prioritize Store and Web channels** — these are the most used 
   purchase channels. Invest in in-store promotions and website UX 
   improvements to maximize conversions.

5. **Upsell Wine and Meat products to High Income segment** — these are 
   the top spending categories and high income customers spend 
   significantly more. Premium product bundles could increase revenue.

6. **Re-engage Canada and Spain** — these markets have the lowest 
   response rates but large customer bases. Targeted discount campaigns 
   or loyalty programs could improve engagement.

## 5. Project Deliverables
- Python Notebook: 01_data_cleaning_eda.ipynb (6 cells, 10 charts)
- SQL Scripts: 01_create_table.sql, 02_analytical_queries.sql, 
  03_views.sql
- Power BI Dashboard: marketing_campaign_dashboard.pbix (4 pages)
- Project Report: project_report.md