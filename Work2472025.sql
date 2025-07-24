-- แบบฝึกหัดคำสั่ง SQL ใช้ฐานข้อมูล Northwind
--1. ต้องการรหัสพนักงาน คำนำหน้า ชื่อ นามสกุล ของพนักงานที่อยู่ในเมือง London
select * from Employees
select EmployeeID, titleofcourtesy , FirstName , LastName from Employees where City = 'London'
--2. ต้องการข้อมูลสินค้าที่มีรหัสประเภท 1,2,4,8 และมีราคา ช่วง 50-100$
select * from Products where CategoryID in (1,2,4,6) and UnitPrice between 50 and 100 
--3. ต้องการประเทศ เมือง ชื่อบริษัทลูกค้า ชื่อผู้ติดต่อ เบอร์โทร ของลูกค้าทั้งหมด
select country,city,companyname,contactname,Phone from Customers 
order by 1,2,3
--4. ข้อมูลของสินค้ารหัสประเภทที่ 1 ราคาไม่เกิน 50 หรือสินค้ารหัสประเภทที่ 8 ราคาไม่เกิน 75
select * from Products where (CategoryID=1 and UnitPrice <= 50) or (CategoryID=8 and UnitPrice <= 75)
--5. ชื่อบริษัทลูกค้า ที่อยู่ใน ประเทศ USA ที่ไม่มีหมายเลข FAX  เรียงตามลำดับชื่อบริษัท 
select companyname from Customers where fax is null and country = 'USA'
--6. ต้องการรหัสลูกค้าชื่อบริษัท และ ชื่อผู้ติดต่อ เฉพาะชื่อบริษัทที่มีคำว่า 'con'
select customerID, companyname, contactName from Customers where CompanyName like '%con%'

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