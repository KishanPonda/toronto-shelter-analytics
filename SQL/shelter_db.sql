CREATE DATABASE IF NOT EXISTS shelter_db;
USE shelter_db;

SELECT COUNT(DISTINCT PROGRAM_NAME) FROM daily_occupancy;

SELECT COUNT(DISTINCT PROGRAM_ID) FROM daily_occupancy;

# Checking for Nulls with Program ID

SELECT 
    PROGRAM_ID,
    PROGRAM_NAME,
    ORGANIZATION_NAME,
    SECTOR,
    OCCUPANCY_DATE
FROM daily_occupancy
WHERE PROGRAM_ID IS NULL
LIMIT 10;

# Delete an extra null row created during merging files

DELETE FROM daily_occupancy
WHERE PROGRAM_ID IS NULL;

# Checking if any more nulls are left

SELECT COUNT(*) FROM daily_occupancy
WHERE PROGRAM_ID IS NULL;

# Total Row Count

SELECT COUNT(*) FROM daily_occupancy;

# Checking Distinct Programs

SELECT 
    PROGRAM_ID,
    COUNT(*) as appearances,
    GROUP_CONCAT(PROGRAM_NAME) as names
FROM vw_at_risk_programs
GROUP BY PROGRAM_ID
HAVING COUNT(*) > 1;
