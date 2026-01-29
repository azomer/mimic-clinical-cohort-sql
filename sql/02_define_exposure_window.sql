-- Define exposure window
-- Early ICU exposure window (e.g., first 24 hours)
-- Time-weighted physiologic measurements
-- Define exposure window
-- Early ICU exposure window (e.g., first 24 hours)
-- Time-weighted physiologic measurements

/*
Purpose:
Define an early ICU exposure window to support time-based
classification of physiologic variables.
*/

WITH exposure_window AS (
    SELECT
        patient_id,
        encounter_id,
        icu_admit_time,
        TIMESTAMP_ADD(icu_admit_time, INTERVAL 24 HOUR) AS exposure_end_time
    FROM icu_population
)

SELECT
    patient_id,
    encounter_id,
    icu_admit_time,
    exposure_end_time
FROM exposure_window;
