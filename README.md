# Sales Raport Project - Data Analysis
This repository contains portfolio of data science projects for the purpouse of self learnig and hobby.
![image](https://github.com/GeeHouseCode/SalesRaportProject_DataAnalysis/assets/110656951/4ab4d34c-3e2b-40d3-b731-ae0270cd9e20)
## Example data analysis for business
The report I created is a sample sales-related business order for sales executives.
### Preparing data for the purpose of creating a report (SQL)
Description of the activities performed when creating the report...
Below are the SQL queries used to transform the necessary data.

#### #CustomersTableT
```SQL
USE AdventureWorksDW2022
SELECT 
  c.CustomerKey AS CustomerKey, 
  c.FirstName AS [First Name], 
  c.LastName AS [Last Name], 
  c.FirstName + ' ' + LastName AS [Full Name], 
  CASE c.Gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender, -- changing gender markers to full names
  c.DateFirstPurchase AS DateFirstPurchase, 
  g.City AS [Customer City] 
FROM 
  AdventureWorksDW2022.dbo.DimCustomer AS c 
  LEFT JOIN dbo.DimGeography AS g ON g.GeographyKey = c.GeographyKey -- city to the customer
ORDER BY 
  CustomerKey ASC
```

#### #DateTableT
```SQL
SELECT 
  DateKey, 
  FullDateAlternateKey as Date, 
  EnglishDayNameOfWeek as Day, 
  WeekNumberOfYear as WeeekNr, 
  EnglishMonthName as Month, 
  LEFT(EnglishMonthName, 3) as MonthShort, 
  MonthNumberOfYear as MonthNr, 
  CalendarQuarter as Quarter, 
  CalendarYear as Year 
FROM 
  AdventureWorksDW2022.dbo.DimDate 
WHERE 
  CalendarYear >= 2019

```

#### #FactlnternetSalesTableT
```SQL
SELECT 
  ProductKey, 
  OrderDateKey, 
  DueDateKey, 
  ShipDateKey, 
  CustomerKey, 
  SalesOrderNumber, 
  SalesAmount 
FROM 
  AdventureWorksDW2022.dbo.FactInternetSales 
where 
  LEFT (OrderDateKey, 4) >= YEAR(Getdate()) - 4
Order BY 
  OrderDateKey ASC
```

#### #ProductTableT
```SQL
USE AdventureWorksDW2022 
SELECT 
  p.ProductKey, 
  p.ProductAlternateKey AS [Product Item Code], 
  p.EnglishProductName AS [Product Name], 
  ps.EnglishProductSubcategoryName AS [Sub Category], 
  pc.EnglishProductCategoryName AS [Product Category], 
  p.Color AS [Product Color], 
  p.Size AS [Product Size], 
  p.ProductLine AS [Product Line], 
  p.ModelName AS [Product Model Name], 
  p.EnglishDescription AS [Product Description], 
  ISNULL (p.Status, 'Outdated') AS [Product Status] -- replacing null values, to better visualize the data in the future
FROM 
  AdventureWorksDW2022.dbo.DimProduct AS p 
  LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey --
  LEFT JOIN dbo.DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey -- product data that may be useful for analysis
order by 
  p.ProductKey asc
```
