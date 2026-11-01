-- Veda Technology Task 32: OTT Content Trend Analysis
-- Compatible with SQLite 3. Use cleaned CSV as the source table.
-- Import data/processed/ott_titles_cleaned.csv into a table named ott_titles.

CREATE TABLE IF NOT EXISTS ott_titles (
    show_id TEXT PRIMARY KEY,
    type TEXT,
    title TEXT,
    director TEXT,
    cast TEXT,
    country TEXT,
    date_added TEXT,
    release_year INTEGER,
    rating TEXT,
    duration TEXT,
    listed_in TEXT,
    description TEXT,
    added_year INTEGER,
    added_month INTEGER,
    duration_value REAL,
    duration_unit TEXT
);

-- 1. Overall format split
SELECT type, COUNT(*) AS title_count
FROM ott_titles GROUP BY type ORDER BY title_count DESC;

-- 2. Content by release year
SELECT release_year, COUNT(*) AS title_count
FROM ott_titles GROUP BY release_year ORDER BY release_year;

-- 3. Top countries (country field is first-listed country in this sample)
SELECT country, COUNT(*) AS title_count
FROM ott_titles WHERE country <> 'Unknown'
GROUP BY country ORDER BY title_count DESC LIMIT 10;

-- 4. Rating mix
SELECT rating, COUNT(*) AS title_count
FROM ott_titles GROUP BY rating ORDER BY title_count DESC;

-- 5. Top genre/category labels
SELECT listed_in AS genre, COUNT(*) AS title_count
FROM ott_titles GROUP BY listed_in ORDER BY title_count DESC LIMIT 10;

-- 6. Average movie runtime
SELECT ROUND(AVG(duration_value), 1) AS avg_movie_runtime_minutes,
       ROUND(MIN(duration_value), 1) AS min_runtime,
       ROUND(MAX(duration_value), 1) AS max_runtime
FROM ott_titles WHERE type='Movie' AND duration_unit='min';

-- 7. TV show season profile
SELECT duration_value AS seasons, COUNT(*) AS show_count
FROM ott_titles WHERE type='TV Show' AND duration_unit LIKE 'Season%'
GROUP BY duration_value ORDER BY seasons;

-- 8. Additions by year
SELECT added_year, COUNT(*) AS titles_added
FROM ott_titles WHERE added_year IS NOT NULL
GROUP BY added_year ORDER BY added_year;

-- 9. Country x format mix
SELECT country, type, COUNT(*) AS title_count
FROM ott_titles WHERE country <> 'Unknown'
GROUP BY country, type ORDER BY country, title_count DESC;

-- 10. Recently released titles (last five release years present in dataset)
SELECT release_year, type, COUNT(*) AS title_count
FROM ott_titles
WHERE release_year >= (SELECT MAX(release_year)-4 FROM ott_titles)
GROUP BY release_year, type ORDER BY release_year, type;
