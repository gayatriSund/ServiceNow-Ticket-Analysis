# ServiceNow Ticket Analysis – Data Cleaning & Power BI Dashboard

This project analyzes IT service tickets to understand trends, agent performance, and resolution efficiency.  
The workflow includes **raw data → SQL cleaning → Power BI visualization**.

---

## 📁 Project Structure

dashboard/
Analysis.pbix
data/
raw/
tickets_raw.csv
cleaned/
cleaned_tickets.csv
sql/
Servicenow_project.sql
README.md


---

## 📝 Project Overview

The goal of this project is to clean, transform, and visualize ticketing data similar to ServiceNow logs.  
The process involved:

### **1. Raw Data**
- Contains ticket details such as ticket ID, category, priority, created date, agent name, and resolution time.

### **2. Data Cleaning (SQL)**
The `Servicenow_project.sql` script performs:
- Missing value handling  
- Standardizing priority levels  
- Formatting date fields  
- Removing duplicates  
- Creating calculated fields (e.g., fast/medium/slow ticket resolution categories)

The cleaned output is exported as `cleaned_tickets.csv`.

### **3. Power BI Dashboard**
The `Analysis.pbix` file includes visuals such as:
- **Bar chart** – Tickets by category  
- **Line chart** – Ticket trend over time  
- **Pie chart** – Priority distribution  
- **KPIs**  
  - Total Tickets  
  - Average Resolution Time  
  - Fast & Slow ticket counts  
  - Top-performing agents  

---

## 📊 Key Insights
- Identified ticket categories with the highest volume  
- Observed daily/weekly ticket trends  
- Compared agent performance using resolution time  
- Highlighted priority distribution to understand workload patterns  

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

## 📌 Future Enhancements
- Add DAX measures documentation  
- Add bookmarks and drilldowns in Power BI  
- Add an automated ETL pipeline (Python + SQL)

---

## 👩‍💻 Author
**Gayatri Sundaram**  
Data Analyst | SQL | Power BI | Python | Statistics  
