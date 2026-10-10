# 📊 Marketing Campaign Analytics

An end-to-end customer analytics project that cleans retail marketing data, segments customers with business rules, models the data in SQL, and serves insights through an interactive **Streamlit** dashboard.

> **Domain:** Marketing Analytics / Customer Analytics
> **Program:** GUVI × HCL — Data Science / Analytics

---

## 🎯 Problem Statement

A retail company has run multiple marketing campaigns and recorded customer demographics, product-category spending, channel-wise purchases, and campaign acceptance. Management wants to know **who the best customers are, what drives campaign acceptance, and how segments behave across products and channels.**

### Business Questions Answered

1. Which segments respond best to campaigns (overall and per campaign: `AcceptedCmp1–5`, `Response`)?
2. How does spending on wine, fruits, meat, fish, sweets, and gold vary by age, income, marital status, and country?
3. Which channels (web, store, catalog, deals) do high-value customers use most, and how often do they visit the website?
4. Which segments are under-served (low spend, high visits, low response)?
5. What do "ideal target customers" look like (age, income band, family composition, country)?

---

## 🧰 Tech Stack

| Layer | Tools |
|---|---|
| Data cleaning & EDA | Python, Pandas, NumPy, Matplotlib, Seaborn / Plotly |
| Database | MySQL (DDL, DML, analytical queries, views) |
| Dashboard | Streamlit |
| Version control | Git & GitHub |

---

## 📁 Project Structure

```
marketing-campaign-analytics/
│
├── data/
│   ├── marketing_data.csv              # Raw customer-level data
│   ├── marketing_data_dictionary.csv   # Field descriptions
│   └── marketing_data_clean.csv        # Cleaned output (generated)
│
├── notebooks/
│   └── marketing_analysis.ipynb        # Cleaning, EDA, features, segmentation
│
├── sql/
│   ├── 01_create_tables.sql            # DDL
│   ├── 02_load_data.sql                # DML
│   └── 03_analysis_queries.sql         # KPIs, segment summaries, views
│
├── app/
│   ├── app.py                          # Streamlit dashboard
│   └── config.py                       # DB / path configuration
│
├── report/
│   └── Project_Report.pdf              # Findings & recommendations
│
├── requirements.txt
└── README.md
```

> Adjust folder and file names to match your repository.

---

## 🗂️ Dataset

- **`marketing_data.csv`** — one row per customer (`ID`)
- **`marketing_data_dictionary.csv`** — field names and meanings

| Group | Columns |
|---|---|
| Demographics | `ID`, `Year_Birth`, `Education`, `Marital_Status`, `Income`, `Kidhome`, `Teenhome`, `Country` |
| Relationship | `Dt_Customer`, `Recency` |
| Spending (last 2 yrs) | `MntWines`, `MntFruits`, `MntMeatProducts`, `MntFishProducts`, `MntSweetProducts`, `MntGoldProds` |
| Channels | `NumDealsPurchases`, `NumWebPurchases`, `NumCatalogPurchases`, `NumStorePurchases`, `NumWebVisitsMonth` |
| Campaigns | `AcceptedCmp1–5`, `Response` |
| Other | `Complain` |

---

## 🧹 Data Cleaning & Feature Engineering

- Parsed `Dt_Customer` to datetime and derived **`Customer_Tenure`** (days/months from a reference date)
- Handled missing values (e.g., `Income`) and fixed data types
- Treated outliers such as unrealistic ages and extreme incomes
- Derived features:

| Feature | Definition |
|---|---|
| `Age` | Reference year − `Year_Birth` |
| `Total_Spend` | Sum of all `Mnt*` columns |
| `Total_Purchases` | Sum of Web + Catalog + Store (+ Deals) purchases |
| `Children` | `Kidhome` + `Teenhome` |
| `Age_Band`, `Income_Band` | Binned with `pd.cut()` |

---

## 🧩 Rule-Based Segmentation

| Segment | Rule |
|---|---|
| High Income | `Income > ₹75,000` |
| Young Customer | `Age < 30` |
| Campaign Responder | `Response = 1` |
| High Web Engagement | `NumWebVisitsMonth > 5` |
| Family Customer | `Children > 0` |
| High Spender | `Total_Spend` > 90th percentile |

Segments are built in Python (`if-else` / `pd.cut()`) and summarised in SQL using `CASE` statements.

---

## 🗄️ SQL Layer

- **Schema:** main `customers` table with primary key, proper data types, and optional derived tables/views for segments and campaign KPIs
- **Queries:** response rate, average spend and visits per segment, summaries by education / marital status / country / age band / income band, window-function rankings
- **Views:** feed the dashboard directly

---

## 📈 Dashboard Features

- Sidebar filters: **Country, Education, Marital Status, Age Band, Income Band**
- KPI cards: total customers, average spend, response rate, average web visits
- Campaign performance (`AcceptedCmp1–5`, `Response`)
- Product spending breakdown by demographic
- Channel usage for high-value customers
- Segment explorer with under-served customer view

---

## ⚙️ Setup & Installation

### 1. Clone the repository
```bash
git clone https://github.com/<your-username>/marketing-campaign-analytics.git
cd marketing-campaign-analytics
```

### 2. Create a virtual environment
```bash
python -m venv venv
source venv/bin/activate        # Windows: venv\Scripts\activate
```

### 3. Install dependencies
```bash
pip install -r requirements.txt
```

Suggested `requirements.txt`:
```
pandas
numpy
matplotlib
seaborn
plotly
streamlit
sqlalchemy
pymysql
jupyter
```

### 4. Set up the database
```bash
mysql -u <user> -p < sql/01_create_tables.sql
mysql -u <user> -p < sql/02_load_data.sql
mysql -u <user> -p < sql/03_analysis_queries.sql
```

Then update your credentials in `app/config.py`.

---

## ▶️ How to Run

**Notebook**
```bash
jupyter notebook notebooks/marketing_analysis.ipynb
```
Run all cells in order: load → clean → EDA → features → segmentation → export.

**Dashboard**
```bash
streamlit run app/app.py
```
Opens at `http://localhost:8501`.

---

## 🔍 Key Findings

> Replace with your results after analysis.

- **Most valuable segment:** _e.g., high-income customers with no kids spend X× more_
- **Most responsive segment:** _e.g., …_
- **Top products / channels:** _e.g., wine and meat drive most revenue; store and web lead channel usage_
- **Under-served segment:** _e.g., high visits but low spend and response_

---

## 💡 Recommendations

> Provide 4–6 data-backed actions.

1. Target _[segment]_ with _[offer]_ — _[supporting metric]_
2. Prioritise _[channel]_ for high-value customers
3. Re-engage under-served _[segment]_ with _[tactic]_
4. Tailor product promotions by _[income/age/family composition]_
5. …

---

## 🚀 Future Improvements

- Predictive model for campaign response
- RFM and K-Means segmentation
- Deployment to Streamlit Community Cloud

---

## 👤 Author

Jayaprakash R

---

## 📄 License

For academic and learning purposes.
