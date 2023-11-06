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