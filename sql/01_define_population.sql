-- Define study population
-- Adult ICU patients with required baseline data
/*
Purpose:
Identify the base adult ICU population suitable for downstream
exposure and outcome analyses.
*/

WITH icu_population AS (
    SELECT
        icu.patient_id,
        icu.encounter_id,
        icu.icu_admit_time,
        icu.icu_discharge_time,
        pat.date_of_birth
    FROM icu_stays icu
    JOIN patients pat
        ON icu.patient_id = pat.patient_id
)

SELECT
    patient_id,
    encounter_id,
    icu_admit_time,
    icu_discharge_time
FROM icu_population
WHERE
    -- Adult patients (≥18 years at ICU admission)
    DATE_DIFF(icu_admit_time, date_of_birth, YEAR) >= 18

    -- Required baseline ICU duration (≥24 hours)
    AND TIMESTAMP_DIFF(
        icu_discharge_time,
        icu_admit_time,
        HOUR
    ) >= 24;
