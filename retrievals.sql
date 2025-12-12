create database Ola;
Use Ola;
show tables;

-- 1. Retrieve all successful bookings:
CREATE VIEW Successful_Booking AS
SELECT * FROM olabookings WHERE booking_status = "success";

-- 2. Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance)  as avg_distance
FROM olabookings 
GROUP BY(Vehicle_Type);

-- 3. Get the total number of cancelled rides by customers:
CREATE VIEW Cancelled_rides_by_customer AS
SELECT COUNT(Canceled_Rides_By_Customer) FROM olabookings
WHERE  Canceled_Rides_By_Customer IS NOT null;

select * from Cancelled_rides_by_customer;

-- 4. List the top 5 customers who booked the highest number of rides:
Create view top_5_customers as
SELECT (Customer_ID) , COUNT(Booking_ID) as total_rides 
FROM olabookings
GROUP BY CUSTOMER_ID
ORDER BY total_rides DESC limit 5; 

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(Canceled_Rides_by_Driver) 
from olabookings
where Canceled_Rides_by_Driver = "Personal & Car related issue";

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select max(Driver_Ratings) , min(Driver_Ratings) 
from olabookings
where Vehicle_Type = "Prime Sedan";

-- 7. Retrieve all rides where payment was made using UPI:
Select * from olabookings
where Payment_Method = "UPI";

-- 8. Find the average customer rating per vehicle type:
select avg(Customer_Rating) ,  Vehicle_type
from olabookings
group by Vehicle_type;

-- 9. Calculate the total booking value of rides completed successfully:
select sum(Booking_Value) 
from olabookings
where Booking_Status = "Success";

-- 10. List all incomplete rides along with the reason:
Select Booking_ID, Incomplete_Rides_Reason
from olabookings
where Incomplete_Rides ="Yes";