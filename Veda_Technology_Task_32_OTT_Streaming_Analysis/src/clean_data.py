from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
RAW = ROOT / "data" / "raw" / "ott_titles_sample.csv"
OUT = ROOT / "data" / "processed" / "ott_titles_cleaned.csv"

def clean_data(path=RAW):
    df = pd.read_csv(path)
    df.columns = [c.strip().lower().replace(" ", "_") for c in df.columns]
    df = df.drop_duplicates(subset=["show_id"])
    df["date_added"] = pd.to_datetime(df["date_added"], errors="coerce")
    df["release_year"] = pd.to_numeric(df["release_year"], errors="coerce")
    for col in ["director", "cast", "country", "rating", "duration"]:
        df[col] = df[col].fillna("Unknown")
    df["type"] = df["type"].fillna("Unknown").str.strip()
    df["listed_in"] = df["listed_in"].fillna("Unknown")
    df["added_year"] = df["date_added"].dt.year
    df["added_month"] = df["date_added"].dt.month
    df["duration_value"] = pd.to_numeric(df["duration"].str.extract(r"(\d+)")[0], errors="coerce")
    df["duration_unit"] = df["duration"].str.extract(r"(min|Season)", expand=False).fillna("Unknown")
    OUT.parent.mkdir(parents=True, exist_ok=True)
    df.to_csv(OUT, index=False)
    return df

if __name__ == "__main__":
    cleaned = clean_data()
    print(f"Saved {len(cleaned):,} rows to {OUT}")
