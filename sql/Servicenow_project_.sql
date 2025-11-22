-- Create a clean database and table
DROP DATABASE IF EXISTS ticket_system;
CREATE DATABASE ticket_system;
USE ticket_system;

DROP TABLE IF EXISTS support_tickets;

CREATE TABLE support_tickets (
    ticket_id INT PRIMARY KEY,
    category VARCHAR(50),
    priority VARCHAR(20),
    created_date DATE,
    agent_name VARCHAR(50),
    resolution_time INT
);

-- Enable local file loading
SET GLOBAL local_infile = 1;

-- Import data from CSV
LOAD DATA LOCAL INFILE "C:\\Data_projects\\Project_Servicenow\\tickets_raw.csv"
INTO TABLE support_tickets
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ticket_id, category, priority, @created_date, agent_name, resolution_time)
SET created_date = STR_TO_DATE(@created_date, '%d-%m-%Y');

-- Data cleaning — handle text casing and missing data

SET SQL_SAFE_UPDATES = 0;

-- Convert all priorities to lowercase for consistency
UPDATE support_tickets 
SET priority = LOWER(priority) 
WHERE ticket_id > 0;

-- Replace NULL categories with 'Unknown'
UPDATE support_tickets
SET category = 'Unknown'
WHERE category IS NULL OR category = '';

-- Replace NULL agent names with 'Unassigned'
UPDATE support_tickets
SET agent_name = 'Unassigned'
WHERE agent_name IS NULL OR agent_name = '';

-- Add derived column for speed classification
ALTER TABLE support_tickets ADD COLUMN speed_category VARCHAR(10);

UPDATE support_tickets
SET speed_category = CASE 
		WHEN agent_name = 'Unassigned' THEN 'N/A'
        WHEN resolution_time < 24 THEN 'Fast'
        WHEN resolution_time BETWEEN 24 AND 48 THEN 'Medium'
        ELSE 'Slow'
    END
WHERE ticket_id > 0;

-- Analysis Queries

-- Total tickets per category
SELECT category, COUNT(*) AS total_tickets 
FROM support_tickets 
GROUP BY category;

-- Highest and lowest resolution times
SELECT MAX(resolution_time) AS highest_time, MIN(resolution_time) AS lowest_time 
FROM support_tickets;

-- Top 3 agents with most tickets
SELECT agent_name, COUNT(*) AS total_tickets
FROM support_tickets
GROUP BY agent_name
ORDER BY total_tickets DESC
LIMIT 3;

-- Average resolution time per category (rounded to 2 decimals)
SELECT category, ROUND(AVG(resolution_time),2) AS avg_time
FROM support_tickets
GROUP BY category;

-- Final cleaned dataset
SELECT * FROM support_tickets;
