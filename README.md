# ServiceNow Ticket Analysis – Data Cleaning & Power BI Dashboard

This project analyzes IT service tickets to understand trends, agent performance, and resolution efficiency.  
The workflow includes **raw data → SQL cleaning → Power BI visualization**.

---

## 📁 Project Structure

data/
tickets_raw.csv
cleaned_tickets.csv
sql/
Servicenow_project.sql
dashboard/
Analysis.pbix
README.md


---

## 📝 Project Overview

The goal of this project is to clean, transform, and visualize ticketing data similar to ServiceNow logs.  
The process involved:

### **1. Raw Data**
- Contains ticket details such as ticket ID, category, priority, created date, agent name, and resolution time.

### **2. Data Cleaning (SQL)**
The `Servicenow_project.sql` script performs:
- Creates database & table
- Loads raw CSV with LOAD DATA LOCAL INFILE
- Standardizes text (priority → lowercase)
- Fixes missing data:
    - category → Unknown
    - agent_name → Unassigned
- Converts date to proper DATE format
- Adds speed_category column
- **Classifies tickets**: Fast / Medium / Slow / N/A

The cleaned output is exported as `cleaned_tickets.csv`.

### **3. Power BI Dashboard**
The `Analysis.pbix` file includes visuals such as:
- **Bar chart** – Tickets by category  
- **Line chart** – Ticket trend over time  
- **Pie chart** – Priority distribution
- **Slicers** - Priority and agent filters
- **KPIs** - Total Tickets, Average Resolution Time  

---

## 📊 Key Insights
- Identified categories with the highest and lowest ticket counts
- Observed overall ticket trends over time
- Highlighted priority distribution to understand workload mix
- Summarized total tickets and average resolution time using KPIs
- Enabled flexible filtering using category, priority, and agent slicers 

---

## 🛠️ Tools & Technologies
- **SQL** for data cleaning  
- **Power BI** for dashboard creation  
- **Excel/CSV** for raw and processed data  
- **GitHub** for version control  

---

## 🚀 How to Use This Project
1. Use `tickets_raw.csv` as input for SQL.
2. Run the `Servicenow_project.sql` script in your SQL environment.
3. Export the cleaned result as `cleaned_tickets.csv`.
4. Open `Analysis.pbix` in Power BI Desktop to explore the dashboard.

---

## 👩‍💻 Author
**Gayatri Sundaram**  
Data Analyst | SQL | Power BI | Python | Statistics  
