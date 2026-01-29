-- Data quality checks
-- Identify missing or incomplete records
-- Detect duplicate inflation due to joins
-- Validate temporal consistency of clinical events

/*
Purpose:
Perform basic data quality checks to ensure cohort integrity
and reliable temporal alignment.
*/

-- Check for missing key timestamps
SELECT
    COUNT(*) AS missing_timestamp_records
FROM icu_population
WHERE
    icu_admit_time IS NULL
    OR icu_discharge_time IS NULL;

-- Check for duplicate encounter inflation
SELECT
    patient_id,
    encounter_id,
    COUNT(*) AS row_count
FROM icu_population
GROUP BY patient_id, encounter_id
HAVING COUNT(*) > 1;

-- Validate logical timestamp ordering
SELECT
    COUNT(*) AS invalid_time_order_records
FROM icu_population
WHERE
    icu_discharge_time <= icu_admit_time;

