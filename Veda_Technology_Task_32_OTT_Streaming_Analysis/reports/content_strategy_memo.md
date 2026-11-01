# Content Strategy Memo
**To:** Content Acquisition & Strategy Team  
**From:** Data Analytics Intern  
**Subject:** OTT catalog analysis – findings and recommended next steps

## Executive summary
This project demonstrates an exploratory workflow for understanding a streaming content catalog. The included 650-row dataset is synthetic and is used to test the analysis pipeline. Therefore, the observations below are analytical recommendations and must be recalculated against the official public Netflix/Kaggle dataset before being treated as platform findings.

## Three actionable recommendations
1. **Balance formats using audience and engagement evidence.** Compare the movie/TV-show split with watch time, completion rate and repeat viewing. Acquire more of the format that is underrepresented among high-performing titles rather than simply copying the catalog majority.
2. **Use genre gaps to guide acquisition tests.** Rank genres by title count, then join them to engagement and acquisition cost. Pilot a small number of titles in under-served genres where audience demand is strong; avoid assuming that high catalog volume means high popularity.
3. **Localize by country and audience segment.** Review country-level title availability alongside regional viewing hours, language preferences and subscriber growth. Prioritize localized content where demand is rising and catalog depth is weak.

## Metrics to add before an investment decision
- Watch hours, unique viewers, completion rate and 30-day retention by title
- Acquisition/licensing cost and cost per viewing hour
- Country, language and age-segment performance
- Release cohort performance (first 7/30/90 days)

## Limitations
- The bundled practice CSV is synthetic, not an official Netflix, Prime Video or Hotstar export.
- Genre and country labels are simplified to one value per row in this practice file.
- Catalog presence alone does not measure popularity, quality or profitability.
- The analysis does not include subscriber, viewership, cost or rights-window data.

## Next step
Replace the sample file with the public Kaggle **Netflix Movies and TV Shows** dataset (Shivam Bansal), rerun the notebook and SQL queries, then rewrite the memo with the measured figures and source attribution.
