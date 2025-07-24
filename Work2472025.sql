--กิติธัช ไชยสัจ 67040249108
select * from Employees
select ProductID as รหัสสินค้า , ProductName as ชื่อสินค้า, UnitsInStock as จำนวนสินค้า,unitprice as ราคาสินค้า,
Unitprice  * Unitsinstock as StockValue from Products

select productID as รหัส,ProductName as สินค้า,
UnitsInStock + UnitsOnOrder as จำนวนคงเหลือทั้งหมด, ReorderLevel as จุดคำสั่ง
from Products
where (UnitsInStock + UnitsOnOrder) < ReorderLevel

select ProductID,ProductName, UnitPrice,ROUND(unitprice * 0.07,4) as Vat7 from Products

select EmployeeID,TitleOfCourtesy+firstname+space(2)+lastname as [Employee Name]
from Employees

select orderID,ProductID,UnitPrice,Quantity,Discount,
		unitprice * Quantity * (1-Discount) as Netprice
from [Order Details] where orderID = 10250

select orderID,ProductID,UnitPrice,Quantity,Discount,
ROUND(unitprice * Quantity * (1-Discount),2) as Netprice
from [Order Details] where orderID = 10250

select count(*) as จำนวนสินค้า
from Products where unitsinstock < 15

select COUNT(*) from Employees
select COUNT(*) from Customers where Country = 'Brazil'
select COUNT(*) from [Order Details] where OrderID = 10250
select COUNT(*) from Orders where ShipCountry = 'japan'

select min(unitprice) as ราคาต่ำสุด ,max(unitprice) as ราคาสูงสุด, avg(unitprice) as ราคาเฉลี่ย
from Products

select AVG(unitprice) as ราคาเฉลี่ย,max(unitprice),min(unitprice)
from [Order Details] where ProductID = 5

select * from [Order Details] where ProductID=3

select country,COUNT(*) as [Num of country]
from Customers group by Country

select country,COUNT(*) as จำนวนลูกค้า from Customers
group by Country,city having COUNT(*) > 1

select country,COUNT(*) as จำนวนลูกค้า from Customers
group by Country, city
order by (จำนวนลูกค้า) desc

select shipcountry, COUNT(*) จำนวนใบสั่งซื้อ
from Orders group by ShipCountry
having COUNT(*)>100

select shipcountry,COUNT(*) จำนวนใบสั่งซื้อ
from orders
where YEAR(orderdate) = 1997 group by ShipCountry
having COUNT(*)<5

select ProductID, sum(Quantity) as จำนวนที่ขายได้
		,max(unitprice) ราคาสูงสุด, min(unitprice) ราคาต่ำสุด,avg(unitprice) ราคาเฉลี่ย
from [Order Details]
group by ProductID
order by ProductID

select orderID,
		sum(unitprice * Quantity * (1-Discount)) as Totalprice
from [Order Details]
group by OrderID
