# Veda Technology – Task 32
## OTT Streaming Content Trend Analysis (Netflix / Prime / Hotstar)

### Project objective
Explore an OTT content catalog to understand content format, genre mix, release-year patterns, ratings, country representation and runtime. Turn the analysis into actionable content strategy recommendations.

### Tools
- Python: Pandas, NumPy, Matplotlib, Seaborn
- SQL: SQLite-compatible queries
- Excel: pivot-ready CSV
- Jupyter Notebook

### Dataset – please read
`data/raw/ott_titles_sample.csv` is a **synthetic practice dataset with 650 rows** created to make this project runnable immediately. It is not an official Netflix/Prime/Hotstar dataset and its numbers must not be represented as platform facts.

For the real-data version, download the public Kaggle dataset **Netflix Movies and TV Shows** by Shivam Bansal:
https://www.kaggle.com/datasets/shivamb/netflix-shows
Place the downloaded `netflix_titles.csv` in `data/raw/` and update `RAW` in `src/clean_data.py` and the `RAW` variable in the notebook to point to it. The commonly used schema includes `show_id, type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description`.

### Folder structure
```text
Veda_Technology_Task_32_OTT_Streaming_Analysis/
├── data/
│   ├── raw/ott_titles_sample.csv
│   └── processed/ott_titles_cleaned.csv
├── excel/ott_titles_pivot_ready.csv
├── notebooks/OTT_Content_Trend_Analysis.ipynb
├── reports/content_strategy_memo.md
├── sql/ott_analysis_queries.sql
├── src/clean_data.py
├── deployment/
│   ├── DEPLOYMENT.md
│   ├── requirements.txt
│   └── rollback_evidence.md
├── README.md
└── requirements.txt
```

### Run in VS Code
1. Extract the ZIP.
2. Open the extracted folder in VS Code.
3. Create a virtual environment:
   - Windows: `py -m venv venv`
   - Activate: `venv\\Scripts\\activate`
4. Install packages: `pip install -r requirements.txt`
5. Run cleaning: `python src/clean_data.py`
6. Open `notebooks/OTT_Content_Trend_Analysis.ipynb` and select the project venv kernel.
7. Run all notebook cells from top to bottom.

### SQL
Import `data/processed/ott_titles_cleaned.csv` into SQLite as `ott_titles`, then run `sql/ott_analysis_queries.sql`. For DB Browser for SQLite, use **File → Import → Table from CSV**.

### Excel
Open `excel/ott_titles_pivot_ready.csv` in Excel. Create PivotTables using `type`, `listed_in`, `country`, `rating`, `release_year` and `added_year`.

### Deliverables
- EDA notebook with 7 visualizations
- SQL queries for core aggregations
- Content strategy memo with 3 recommendations
- Cleaned CSV and Excel-ready CSV
- README, dependency list, deployment and rollback notes
