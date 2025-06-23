## Flight-data-analysis
Exploratory Data Analysis of Airline Flight Delays using PostgreSQL

---
## Project Overview 
This project performs exploratory data analysis (EDA) on historical flight data from the Data source: [Kaggle Flights Dataset](https://www.kaggle.com/datasets/mahoora00135/flights) using PostgreSQL.  
The analysis focuses on flight delays, airline performance, and time-based trends.

---
## Data Description 
The dataset contains flight records with fields such as departure/arrival times, delays (in minutes), origin/destination airports, carriers, etc.

---
## Setup Instructions
1. Import the dataset into your PostgreSQL database by running the SQL script:  
   `Flight Analysis.sql`
   
3. This single script includes the following sections which you can run step-by-step or all at once:

   - Table creation and data import setup.
   - Basic queries (e.g., top airlines by flight count).
   - Time-based analysis (e.g., average delays by month and hour).
   - Airline and route performance analysis (e.g., delays by airline and frequent delay routes).
   - Additional analysis such as correlation between departure and arrival delays.

4. You can run the entire script or execute the queries individually to explore the data.

---

**Note:**  
If you want to run queries separately, you can copy and paste the desired query sections from the script file

---

## Key Insights
- Morning flights have lower average delays compared to evenings.
- Airline F9 tends to have the highest departure delays.
- The routes with the highest average departure delays are
- **EWR to TYS** with an average delay of **41.82 minutes** over **323 flights**.
  - **EWR to CAE** with an average delay of **36.34 minutes** over **104 flights**.
  - **EWR to TUL** with an average delay of **34.91 minutes** over **315 flights**.
  - **EWR to OKC** with an average delay of **30.57 minutes** over **346 flights**.
  - **LGA to BHM** with an average delay of **29.78 minutes** over **296 flights**.
---
