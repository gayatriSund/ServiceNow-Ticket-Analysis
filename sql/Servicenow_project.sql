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

-- Enable LOCAL loading if needed
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/Gayatri V S/OneDrive/Documents/tickets.csv'
INTO TABLE support_tickets
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ticket_id, category, priority, @created_date, agent_name, resolution_time)
SET created_date = STR_TO_DATE(@created_date, '%d-%m-%Y');

UPDATE support_tickets SET priority = LOWER(priority) WHERE ticket_id > 0;

ALTER TABLE support_tickets ADD COLUMN speed_category VARCHAR(20);

UPDATE support_tickets
SET speed_category = 
    CASE 
        WHEN resolution_time < 24 THEN 'Fast'
        WHEN resolution_time BETWEEN 24 AND 48 THEN 'Medium'
        ELSE 'Slow'
    END
WHERE ticket_id > 0;

SELECT category, COUNT(*) FROM support_tickets GROUP BY category;

SELECT MAX(resolution_time), MIN(resolution_time) FROM support_tickets;

SELECT agent_name, COUNT(*) AS total_tickets
FROM support_tickets
GROUP BY agent_name
ORDER BY total_tickets DESC
LIMIT 3;

SELECT category, ROUND(AVG(resolution_time),2) AS avg_time
FROM support_tickets
GROUP BY category;

