# Marketing Campaign Analytics

## Project Structure
- `data/` — raw and cleaned CSV files
- `notebook/` — Jupyter notebook and EDA charts
- `sql/` — SQL scripts for schema, queries, and views
- `dashboard/` — Power BI dashboard (.pbix)
- `report/` — Project report

## How to Run

### Python Notebook
1. Activate venv: `venv\Scripts\activate`
2. Open `notebook/01_data_cleaning_eda.ipynb` in VS Code
3. Run all cells in order

### SQL
1. Open MySQL Workbench
2. Connect to localhost
3. Run scripts in order:
   - `sql/01_create_table.sql`
   - `sql/02_analytical_queries.sql`
   - `sql/03_views.sql`

### Dashboard
1. Open `dashboard/marketing_campaign_dashboard.pbix`
   in Power BI Desktop
2. Data is pre-loaded from cleaned CSV

## Tools Used
- Python 3.12, Pandas, NumPy, Matplotlib, Seaborn
- MySQL Workbench
- Power BI Desktop