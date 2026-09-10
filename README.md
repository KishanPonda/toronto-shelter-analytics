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

<pre>
toronto-shelter-analytics/
│
├── notebooks/
│   ├── phase1_clean.ipynb       # Data cleaning pipeline
│   ├── phase2_mysql.ipynb       # MySQL load and view creation
│   └── phase3_forecast.ipynb    # Prophet forecasting model
│
├── sql/
│   └── shelter_db.sql           # Database setup and queries
│
├── dashboard/
│   └── Toronto_Shelter_Dashboard.pbix   # Power BI dashboard
│
└── requirements.txt
</pre>

## How to Run

### Prerequisites
- Python 3.8+
- MySQL 8.0
- Power BI Desktop
- MySQL ODBC 8.0 Connector

### Setup

**1. Install Python dependencies**
```bash
pip install -r requirements.txt
```

**2. Run the cleaning pipeline**

Open and run all cells in `notebooks/phase1_clean.ipynb`

This produces `shelter_clean.csv` — 274,486 rows, 34 columns.

**3. Set up MySQL database**

```sql
CREATE DATABASE IF NOT EXISTS shelter_db;
```

Then run all cells in `notebooks/phase2_mysql.ipynb`

This loads the data and creates 3 analytical views:
- `vw_equity_gap`
- `vw_operator_benchmark`
- `vw_at_risk_programs`

**4. Run the forecasting model**

Open and run all cells in `notebooks/phase3_forecast.ipynb`

This trains Prophet models per sector and writes 300 forecast rows 
to MySQL.

**5. Open the dashboard**

Open `dashboard/Toronto_Shelter_Dashboard.pbix` in Power BI Desktop.

Configure your MySQL ODBC DSN named `ShelterDB` pointing to 
`localhost:3306/shelter_db`, then click Refresh.

### Password Setup

Never hardcode your MySQL password. When prompted in the notebooks:
- Type your password when the `input()` prompt appears, OR
- Set an environment variable before running:

```bash
# Windows
set MYSQL_PASSWORD=your_password

# Mac/Linux
export MYSQL_PASSWORD=your_password
```

## Data Source

**City of Toronto Open Data Portal**
Daily Shelter and Overnight Service Occupancy and Capacity

- Publisher: Toronto Shelter and Support Services (TSSS)
- Source system: SMIS (Shelter Management Information System)
- Licence: Open Government Licence — Toronto
- Link: https://open.toronto.ca/dataset/daily-shelter-overnight-service-occupancy-capacity/

## License

This project uses publicly available open government data from the 
City of Toronto. Code is available for educational and research 
purposes.
