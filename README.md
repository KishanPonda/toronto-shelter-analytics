# Toronto Shelter System: Equity Gap & Capacity Analytics

A data-driven decision support system for Toronto Shelter and Support 
Services (TSSS), built as part of the BIA 5450 Capstone Project at 
Humber Polytechnic.

## Project Overview

Toronto's overnight shelter system serves 278 programs across 5 
population sectors through 41 operators — yet had no systematic tool 
to monitor equity gaps, benchmark operator performance, or forecast 
capacity pressure. This project fills that gap.

Built on 274,486 daily occupancy records spanning January 2021 to 
June 2026, the solution delivers:

- **Equity gap analysis** across 5 population sectors (2021–2026)
- **Operator benchmarking** scoring all 41 operators on reliability 
  and overcrowding frequency
- **At-risk program flagging** — 117 programs flagged as chronically 
  overcrowded or underutilized
- **60-day occupancy forecasting** using Facebook Prophet 
  (MAE: 1.92–2.61% for 4 of 5 sectors)
- **Interactive 5-page Power BI dashboard** connected to MySQL

## Key Findings

| Metric | Value |
|--------|-------|
| System-wide avg occupancy rate | 95.81% |
| Program-days above 90% crisis threshold | 86.6% |
| Women sector avg occupancy | 97.6% (peaks 98.7% in October) |
| Families sector avg occupancy | 71.1% |
| Avg funded-to-actual capacity gap | 1.8 beds/program/night |
| At-risk programs flagged | 117 out of 278 (42%) |

## Tech Stack

| Tool | Purpose |
|------|---------|
| Python 3 + Pandas | Data cleaning and pipeline |
| MySQL + SQLAlchemy | Relational database and analytical views |
| Facebook Prophet | Time-series occupancy forecasting |
| Power BI Desktop | Interactive dashboard |
| Jupyter Notebooks | End-to-end reproducible workflow |
| DBeaver | Database validation and querying |

## Project Structure
