# Deployment / Reproducibility Configuration

This is a local analytics project; no paid cloud service or production database is required.

## Reproducible deployment
1. Use Python 3.10 or later.
2. Install the pinned minimum dependencies from `requirements.txt`.
3. Keep the source CSV in `data/raw/`.
4. Run `python src/clean_data.py`.
5. Execute the notebook top-to-bottom.
6. Store exported charts and cleaned CSV under `data/processed/` (do not overwrite raw input).

## Configuration
- Input: `data/raw/ott_titles_sample.csv`
- Output: `data/processed/ott_titles_cleaned.csv`
- SQL dialect: SQLite 3
- Notebook kernel: Python 3

## Validation checks
- Confirm the raw file exists and contains `show_id` and `title`.
- Confirm output row count matches distinct `show_id` count.
- Confirm the notebook generates all seven visualizations without errors.
- Confirm SQL table row count matches cleaned CSV row count.
