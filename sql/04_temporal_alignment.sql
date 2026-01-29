-- Temporal alignment
-- Ensure exposure window precedes outcome window
-- Handle timing logic to avoid immortal time bias
/*
Purpose:
Verify that exposure windows occur before outcome assessment
and that temporal ordering is preserved.
*/

SELECT
    p.patient_id,
    p.encounter_id,
    p.icu_admit_time,
    e.exposure_end_time,
    o.outcome_window_end
FROM icu_population p
JOIN exposure_window e
    ON p.patient_id = e.patient_id
   AND p.encounter_id = e.encounter_id
JOIN outcome_window o
    ON e.patient_id = o.patient_id
   AND e.encounter_id = o.encounter_id
WHERE
    -- Ensure exposure precedes outcome assessment
    e.exposure_end_time < o.outcome_window_end;
