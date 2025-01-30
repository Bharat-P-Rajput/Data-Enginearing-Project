# 🚀 Azure Data Pipeline: From Ingestion to Visualization

This project demonstrates an **end-to-end data pipeline** using **Azure Data Factory, Azure Data Lake, Azure Synapse Analytics, and Power BI** to ingest, process, store, and visualize data.

---

## 📌 Architecture Overview

Below is the **high-level architecture** of the project:

![Architecture Diagram](screenshots/final_data_map.png)

🔹 **Key Components:**
- **Data Source:** External HTTP data source  
- **Azure Data Factory (ADF):** Ingests raw data into Azure Data Lake  
- **Azure Data Lake Gen2:** Stores both raw and processed data  
- **Azure Databricks:** Transforms raw data  
- **Azure Synapse Analytics:** Enables analytics and querying  
- **Power BI:** Creates reports and dashboards  

---

## 🚀 Step-by-Step Implementation

### 1️⃣ Data Ingestion with Azure Data Factory (ADF)
- **Objective:** Fetch raw data from an HTTP source and store it in **Azure Data Lake Gen2**.
- **Process:**
  - Create a **Linked Service** in ADF to connect to the HTTP source.
  - Set up a **pipeline** to transfer the data into a raw storage container.
  - Execute the pipeline and monitor its progress.

📷 **Screenshot:** *Azure Data Factory Pipeline Configuration*  
![ADF Pipeline](screenshots/adf_pipeline.png)

📷 **Screenshot:** *Monitoring ADF Pipeline Execution*  
![ADF Monitoring](screenshots/adf_monitoring.png)

---

### 2️⃣ Raw Data Storage in Azure Data Lake Gen2
- **Objective:** Store raw files in **Azure Data Lake** for further processing.
- **Process:**
  - Navigate to **Azure Data Lake Storage**.
  - Verify that the raw data is stored in the correct **container**.

📷 **Screenshot:** *Raw Data Stored in Azure Data Lake*  
![Raw Data Lake](screenshots/raw_data_lake.png)

---

### 3️⃣ Data Transformation using Azure Databricks
- **Objective:** Process and clean raw data using **Apache Spark in Azure Databricks**.
- **Process:**
  - Create a **Databricks notebook** to read raw data from Azure Data Lake.
  - Apply transformations (cleaning, filtering, aggregations).
  - Store the transformed data back into Azure Data Lake.

📷 **Screenshot:** *Databricks Notebook with Transformation Code*  
![Databricks Notebook](screenshots/databricks_notebook.png)

📷 **Screenshot:** *Transformed Data Stored in Azure Data Lake*  
![Transformed Data](screenshots/transformed_data_lake.png)

---

### 4️⃣ Data Analytics using Azure Synapse Analytics
- **Objective:** Load transformed data into **Azure Synapse Analytics** for querying.
- **Process:**
  - Create an **External Table** in Synapse to read data from Azure Data Lake.
  - Run SQL queries to analyze the transformed data.

📷 **Screenshot:** *Azure Synapse Analytics Workspace*  
![Synapse Workspace](screenshots/synapse_workspace.png)

📷 **Screenshot:** *SQL Query Execution in Synapse*  
```sql
SELECT TOP 10 * FROM transformed_data_table ORDER BY timestamp DESC;
