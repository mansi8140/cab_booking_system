--inserting two news ride bookings for customers with IDs 10 and 13
insert into Fall22_S003_10_Books_Details (C_ID, V_Id, St_time, E_Time, Pickup_L, Drop_L, Book_dt, Price) values (1, 'V11', to_date('13:52','hh24:mi'), to_date('15:03','hh24:mi'), '0031', '0002', to_date('01-13-2022','MM-DD-YYYY'), 15);
insert into Fall22_S003_10_Books_Details (C_ID, V_Id, St_time, E_Time, Pickup_L, Drop_L, Book_dt, Price) values (13, 'V12', to_date('09:41','hh24:mi'), to_date('02:14','hh24:mi'), '0035', '0006', to_date('01-14-2022','MM-DD-YYYY'), 15);

insert into Fall22_S003_10_Goes_From (V_Id, Zipcode) values ('V11', '0031');
insert into Fall22_S003_10_Goes_From (V_Id, Zipcode) values ('V12', '0035');
insert into Fall22_S003_10_Goes_To (V_Id, Zipcode) Values ('V11', '0002');
insert into Fall22_S003_10_Goes_To (V_Id, Zipcode) Values ('V12', '0006');

--deleting records for ride booked by customer with C_ID=8, V_ID=V05 and price=10
delete from Fall22_S003_10_Books_Details where C_ID=8 and V_ID='V05' and price=10;
delete from Fall22_S003_10_Goes_From where V_ID='V05' and Zipcode='0039';
delete from Fall22_S003_10_Goes_To where V_ID='V05' and Zipcode='0005';

--updating names for two customers
UPDATE Fall22_S003_10_Customer SET Fname='Beatrix R' WHERE C_ID= 1;
UPDATE Fall22_S003_10_Customer SET Lname='Mattson' WHERE C_ID= 13;