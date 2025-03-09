--1-- Retrieve customer id of all customers who have paid more than $12 as total fare for all their rides.
   -- Also list total fare amount for each customer in descending order and display bottom 10 total fares only

SELECT C.C_ID,SUM(B.Price)
FROM Fall22_S003_10_Customer C, Fall22_S003_10_Books_Details B
WHERE  C.C_ID= B.C_ID
GROUP BY B.C_ID
HAVING SUM(B.PRICE)>12
ORDER BY SUM(B.PRICE) ASC
FETCH FIRST 10 ROWS ONLY;

--2-- Retrieve the zipcode and its type of location which are booked as drop locations more than 2 times

Select count(GT.v_id),GT.Zipcode,
     (SELECT L.L_Type 
     FROM Fall22_S003_10_Location L
     WHERE L.ZIPCODE = GT.ZIPCODE) AS Location_Type
FROM Fall22_S003_10_Goes_To GT 
GROUP BY Zipcode 
HAVING  count(GT.v_id) >=2;


--3-- Get a list of customer ID and Customer names who have booked rides with the pickup locations
   -- which are falling under the location type which has the most popular pickup zipcode amongst all rides.
   -- Also retrieve the pickup zipcodes fulfilling the above conditions.
   -- A most popular zipcode is one which has had more than or equal to 12 pickup rides.


SELECT C.C_ID,FNAME, Pickup_L
FROM Fall22_S003_10_CUSTOMER C, Fall22_S003_10_Books_Details B
WHERE C.C_ID=B.C_ID AND Pickup_L IN (
  		SELECT ZIPCODE
        FROM Fall22_S003_10_Location
        WHERE L_TYPE IN (
   			SELECT L_TYPE
            FROM Fall22_S003_10_Location
            WHERE ZIPCODE IN (
   				SELECT Pickup_L
                FROM Fall22_S003_10_Books_Details
                GROUP BY Pickup_L
                HAVING COUNT(C_ID) >=12)))
ORDER BY C_ID ASC;


--4-- Retrieve summary of customer ID, Pass ID and price of ride for each customer using Rollup.

SELECT C.C_ID, Pass_ID, SUM(Price)
FROM Fall22_S003_10_Customer C, Fall22_S003_10_Pass P, Fall22_S003_10_Books_Details B
WHERE C.C_ID=P.C_ID and C.C_ID=B.C_ID GROUP BY ROLLUP (C.C_ID, Pass_ID);

--5-- Retrieve sumamry report of each vehicle, pickup and drop locations and sum total of revenue for them using Cube 

SELECT V.V_ID, Pickup_L,Drop_L, SUM(Price)
FROM Fall22_S003_10_Vehicle V, Fall22_S003_10_Books_Details B
WHERE V.V_ID=B.V_ID GROUP BY CUBE(V.V_ID, Pickup_L, Drop_L);


--6-- Retrive Location type as well as pickup location and Price of each vehicle booked, based on its pickup location, find out the average price for each with the help of over clause for windowing opeartion.
SELECT L.L_Type, B.Pickup_L, B.Price, 
AVG(B.Price) OVER(PARTITION by B.Pickup_L) AS AVG_Price 
FROM Fall22_S003_10_Books_Details B, Fall22_S003_10_Location L 
WHERE L.Zipcode = B.Pickup_L ;
