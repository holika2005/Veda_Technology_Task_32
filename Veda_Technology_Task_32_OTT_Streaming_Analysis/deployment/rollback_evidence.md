# Rollback Evidence / Recovery Procedure

## Versioning approach
The raw input is immutable. Cleaning writes a separate file to `data/processed/`. This separation provides a simple rollback path.

## Rollback procedure
1. Stop the notebook/kernel.
2. Move or delete the generated `data/processed/ott_titles_cleaned.csv`.
3. Restore the previous project ZIP or Git commit if source files were changed.
4. Re-run `python src/clean_data.py` to regenerate the cleaned output from the unchanged raw CSV.
5. Re-run notebook validation cells.

## Evidence checklist
- [x] Raw input retained separately from processed output.
- [x] Cleaning script is reproducible and does not modify the raw CSV.
- [x] Output path is deterministic.
- [x] Dependency manifest included.
- [ ] Production deployment rollback tested (not applicable to this local-only internship exercise).

**Note:** No live production deployment was performed. This document records the local recovery design and avoids claiming an unperformed production rollback.
