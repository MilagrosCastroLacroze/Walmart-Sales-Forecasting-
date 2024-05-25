
--ventas con caracteristicas: 
--- seleccionamos las caracteristicas: temperature, fuel_price
select t.Store, t.Dept, t.Date, t.Weekly_Sales, t.IsHoliday, 
    f.Temperature, f.Fuel_Price, f.CPI, f.Unemployment, f.MarkDown1, f.MarkDown2, f.MarkDown3, f.MarkDown4, f.MarkDown5
from train as t 
left join features as f on t.Store= f.Store and t.Date=f.Date

--Calcular las ventas promedio por tienda y tipo de tienda

select t.Store, s.Type, avg(cast(Weekly_Sales as float)) as Avg_Weekly_Sales 
from train as t 
left join stores as s on t.Store= s.Store
group by t.Store, s.Type
order by t.Store asc

---Identificar la correlación entre ventas y factores externos:
SELECT 
    t.Weekly_Sales, f.Temperature, f.Fuel_Price, f.CPI, f.Unemployment, f.Date
FROM 
    train t
LEFT JOIN 
    features f ON t.Store = f.Store AND t.Date = f.Date;


--Ventas en días festivos vs no festivos:

SELECT 
    t.IsHoliday, AVG(cast(t.Weekly_Sales as float)) AS Avg_Weekly_Sales
FROM 
    train t
GROUP BY 
    t.IsHoliday;


--Análisis de las ventas por tamaño de tienda:

SELECT 
    s.Size, AVG(cast(t.Weekly_Sales as float)) AS Avg_Weekly_Sales
FROM 
    train t
LEFT JOIN 
    stores s ON t.Store = s.Store
GROUP BY 
    s.Size;


select top 5 * from features


SELECT 
    t.Weekly_Sales, f.Temperature
FROM 
    train t
LEFT JOIN 
    features f ON t.Store = f.Store AND t.Date = f.Date
order by  f.Temperature