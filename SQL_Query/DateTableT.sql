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

