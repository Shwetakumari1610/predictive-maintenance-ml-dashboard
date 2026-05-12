-- =========================================
-- Predictive Maintenance SQL Analysis
-- =========================================

-- View first 5 rows
SELECT * FROM machine_data
LIMIT 5;

-- Total records
SELECT COUNT(*) AS total_records
FROM machine_data;

-- Total failures
SELECT COUNT(*) AS failure_count
FROM machine_data
WHERE failure = 1;

-- Machine-wise failure count
SELECT 
    machine_type, 
    COUNT(*) AS failure_count
FROM machine_data
WHERE failure = 1
GROUP BY machine_type;

-- Shift-wise machine distribution
SELECT 
    shift, 
    COUNT(*) AS total_machines
FROM machine_data
GROUP BY shift;

-- High pressure failure cases
SELECT *
FROM machine_data
WHERE pressure > 150 AND failure = 1;

-- High temperature machines
SELECT *
FROM machine_data
WHERE temperature > 80;

-- Failure percentage
SELECT 
    COUNT(CASE WHEN failure = 1 THEN 1 END) * 100.0 / COUNT(*) AS failure_rate
FROM machine_data;