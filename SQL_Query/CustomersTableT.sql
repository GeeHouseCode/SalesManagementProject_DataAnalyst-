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