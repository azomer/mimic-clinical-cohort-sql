-- Define outcomes
-- Outcome definitions and timing windows
-- Example: acute events within defined post-exposure windows

/*
Purpose:
Define outcome events and their associated observation windows
following the exposure period.
*/

WITH outcome_window AS (
    SELECT
        e.patient_id,
        e.encounter_id,
        e.exposure_end_time,
        TIMESTAMP_ADD(e.exposure_end_time, INTERVAL 48 HOUR) AS outcome_window_end
    FROM exposure_window e
)

SELECT
    patient_id,
    encounter_id,
    exposure_end_time,
    outcome_window_end
FROM outcome_window;
