use Sales;

#Total  Sales , Profit , Quantity , Average Discount

Select 
Round(Sum(Sales)) As Total_Sale,
Round(Sum(Profit)) As Total_Profit ,
Round(Sum(Quantity)) As Total_Quantity,
Round(Avg(Discount),2) As Average_Discount 
from usa_data 
Group By 'Total_Sale','Total_profit';

#Unprofitable Discount 
Select Discount , 
Round(Avg(Sales), 2) As Avg_Sales,
Round(Avg(Profit), 2) As Avg_Profit
From usa_data
Group By Discount
Order By Discount ;

#Low-Performing Regions/Segments
select Region, Segment,
Round(sum(Sales), 2) AS Total_Sales,
Round(sum(Profit), 2) AS Total_Profits
from usa_data
Group By Region , Segment
Order By Total_Profits ASC;

#Inefficient Shipping Methods
SELECT Ship_Mode, 
       COUNT(*) AS Total_Orders,
       round(AVG(DATEDIFF(STR_TO_DATE(Ship_Date, '%m/%d/%Y'), STR_TO_DATE(Order_Date, '%m/%d/%Y'))), 2) AS Avg_Delivery_Days,
       round(SUM(Profit), 2) AS Total_Profit
FROM usa_data
GROUP BY Ship_Mode;

 #Overstocked/Understocked products
 Select Sub_Category ,
 Sum(Quantity) As Total_Units_Sold,
 Count(Distinct Product_ID) As Product_Count
 From usa_data
 group by Sub_Category;
 
 