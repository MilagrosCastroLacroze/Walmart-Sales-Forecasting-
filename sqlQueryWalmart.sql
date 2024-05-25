
--sales with characteristics: 
--- we select the characteristics: temperature, fuel_price
SELECT 
	t.Store, t.Dept, t.Date, t.Weekly_Sales, t.IsHoliday, 
    f.Temperature, f.Fuel_Price, f.CPI, f.Unemployment, f.MarkDown1, f.MarkDown2, f.MarkDown3, f.MarkDown4, f.MarkDown5
FROM	
	train as t 
LEFT JOIN 
		features as f ON t.Store= f.Store and t.Date=f.Date



--Calculate average sales by store and store type
SELECT	
	t.Store, s.Type, avg(cast(Weekly_Sales as float)) as Avg_Weekly_Sales 
FROM 
	train as t 
LEFT JOIN 
	stores as s on t.Store= s.Store
GROUP BY  t.Store, s.Type
ORDER BY t.Store asc


---Identify the correlation between sales and external factors:
SELECT 
    t.Weekly_Sales, f.Temperature, f.Fuel_Price, f.CPI, f.Unemployment, f.Date
FROM 
    train t
LEFT JOIN 
    features f ON t.Store = f.Store AND t.Date = f.Date;


--Sales on holidays vs. non-holidays:
SELECT 
    t.IsHoliday, AVG(cast(t.Weekly_Sales as float)) AS Avg_Weekly_Sales
FROM 
    train t
GROUP BY 
    t.IsHoliday;

	
--Analysis of sales by store size:
SELECT 
    s.Size, AVG(cast(t.Weekly_Sales as float)) AS Avg_Weekly_Sales
FROM 
    train t
LEFT JOIN 
    stores s ON t.Store = s.Store
GROUP BY 
    s.Size;

