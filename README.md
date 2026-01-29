# SQL-Based Clinical Cohort Analysis (MIT Critical Data)

## Overview
This repository contains SQL-based cohort analysis exercises developed as part of **MIT Critical Data coursework (HST.953)**. The project focuses on applying core healthcare analytics concepts using de-identified, MIMIC- and eICU-style electronic health record (EHR) schemas.

The work is instructional in nature and is intended to demonstrate analytical reasoning, cohort discipline, and temporal logic commonly used in clinical analytics and EHR-based research. It does not reproduce or report study results.

---

## Project Structure and Approach

The analysis is organized as a stepwise pipeline. Each SQL file represents a distinct analytical decision point, progressing from population definition to data quality validation.

### 1. Define Study Population
**File:** `01_define_population.sql`

- Identifies adult ICU patients
- Applies basic inclusion criteria (age, ICU admission, minimum length of stay)
- Ensures required baseline data are available
- Establishes a clean base population for downstream analysis

---

### 2. Define Exposure Window
**File:** `02_define_exposure_window.sql`

- Defines an early ICU exposure window (e.g., first 24 hours)
- Establishes time boundaries for physiologic measurements
- Prepares data structures for time-weighted exposure classification

---

### 3. Define Outcomes
**File:** `03_define_outcomes.sql`

- Specifies outcome definitions and observation windows
- Illustrates how acute clinical events can be assessed following exposure
- Separates outcome logic from exposure logic for clarity and reuse

---

### 4. Temporal Alignment
**File:** `04_temporal_alignment.sql`

- Ensures correct temporal ordering between exposure and outcomes
- Confirms that exposure windows precede outcome assessment
- Demonstrates awareness of timing-related biases (e.g., immortal time bias)

---

### 5. Data Quality Checks
**File:** `05_data_quality_checks.sql`

- Identifies missing or incomplete records
- Detects duplicate inflation due to joins
- Validates temporal consistency of clinical events
- Provides basic safeguards to support reliable analysis

---

## Data Context
- Queries are written against **MIMIC-/eICU-style schemas** commonly used in critical care analytics education.
- Data structures are representative of real EHR systems but are **de-identified** and used for instructional purposes.
- Execution may require environment-specific setup and is not the primary focus of this repository.

---

## Scope and Notes
- This repository reflects **coursework exercises**, not original research.
- No protected health information (PHI) is included.
- The emphasis is on **analytical patterns and reasoning**, not study outcomes or conclusions.

---

## Skills Demonstrated
- SQL cohort definition and filtering  
- Temporal exposure and outcome windowing  
- Defensive joins and aggregation  
- Data quality awareness in clinical datasets  
- Translation of clinical questions into analytic logic  

---

## Author
**Azza Omer**  
Healthcare Analytics | SQL | EHR Data | Clinical Cohort Analysis
