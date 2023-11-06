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
