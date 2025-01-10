--- Create Master key first
CREATE MASTER KEY 
ENCRYPTION BY PASSWORD = 'YourPassword!';

--- Create Database Credential
CREATE DATABASE SCOPED CREDENTIAL cred_bharat
WITH
 IDENTITY = 'Managed Identity'

--- Create External Data Sources
--- we need two external data sources 1. for silver to access data. 2. for gold for destination.
CREATE EXTERNAL DATA SOURCE source_silver
WITH(
    LOCATION = 'https://datalakeName.blob.core.windows.net/silver',
    CREDENTIAL = cred_bharat
)

CREATE EXTERNAL DATA SOURCE destination_gold
WITH(
    LOCATION = 'https://datalakeName.blob.core.windows.net/gold',
    CREDENTIAL = cred_bharat
)

--- Create External File Format
CREATE EXTERNAL FILE FORMAT format_parquet
WITH(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)


--- Create External Tables
CREATE EXTERNAL TABLE extSales
WITH(
    LOCATION = 'ExtSales',
    DATA_SOURCE = destination_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.sales

CREATE EXTERNAL TABLE extCust
WITH(
    LOCATION = 'ExtCust',
    DATA_SOURCE = destination_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.customers

CREATE EXTERNAL TABLE extCal
WITH(
    LOCATION = 'ExtCal',
    DATA_SOURCE = destination_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.calendar

CREATE EXTERNAL TABLE extProd
WITH(
    LOCATION = 'ExtProd',
    DATA_SOURCE = destination_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.products

CREATE EXTERNAL TABLE extProdSub
WITH(
    LOCATION = 'ExtProdSub',
    DATA_SOURCE = destination_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.subcat

CREATE EXTERNAL TABLE extRet
WITH(
    LOCATION = 'ExtRet',
    DATA_SOURCE = destination_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.returns

CREATE EXTERNAL TABLE extTer
WITH(
    LOCATION = 'ExtTer',
    DATA_SOURCE = destination_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.territories