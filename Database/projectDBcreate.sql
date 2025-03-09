
-- Customer Table
CREATE TABLE Fall22_S003_10_Customer( 
    C_ID     int    not null, 
    FName    varchar(30)    not null, 
    LName    varchar(30)    not null, 
    Acct_St_dt date not null, 
    DOB  date not null, 
    primary key(C_ID)
);


-- Customer Phone Number Table
CREATE TABLE Fall22_S003_10_Customer_Ph_no(
    C_ID     int   not null, 
    Ph_No  varchar(25)  , 
    foreign key(C_ID) references Fall22_S003_10_Customer(C_ID)  on delete cascade, 
    primary key(C_ID,Ph_No), unique(Ph_No)
);


-- Driver Table
CREATE TABLE Fall22_S003_10_Driver(
    License_No     varchar(30)    not null, 
    DName    varchar(30)    not null, 
    D_Ph_No varchar(30) not null, 
    DOB  date not null, 
    primary key(License_No), 
    unique(D_Ph_No)
);


-- Vehicle Table
CREATE TABLE Fall22_S003_10_Vehicle( 
    V_Id varchar(30) not null, 
    Category varchar(30) not null, 
    License_No     varchar(30)    not null,  
    primary key(V_Id), unique(License_No), 
    foreign key(License_No) references Fall22_S003_10_Driver(License_No) on delete cascade
);


-- Pass Table
CREATE TABLE Fall22_S003_10_Pass( 
    Pass_Id  varchar(30) not null, 
    C_ID     int    not null, 
    P_St_dt date not null, 
    P_End_dt date not null, 
    primary key(Pass_Id), 
    foreign key(C_ID) references Fall22_S003_10_Customer(C_ID) on delete cascade, 
    unique(C_ID)
);


-- Location Table
CREATE TABLE Fall22_S003_10_Location( 
    Zipcode varchar(30) not null, 
    L_Type varchar(30) not null, 
    primary key(Zipcode)
);


-- Goes From Table
CREATE TABLE Fall22_S003_10_Goes_From( 
    V_Id varchar(30) not null, 
    Zipcode varchar(30) not null, 
    foreign key(Zipcode) references Fall22_S003_10_Location(Zipcode) on delete cascade, 
    foreign key(V_Id) references Fall22_S003_10_Vehicle(V_Id) on delete cascade ,
    primary key(Zipcode, V_Id)
);


-- Goes To Table
CREATE TABLE Fall22_S003_10_Goes_To( 
    V_Id varchar(30) not null, 
    Zipcode varchar(30) not null, 
    foreign key(Zipcode) references Fall22_S003_10_Location(Zipcode)  on delete cascade, 
    foreign key(V_Id) references Fall22_S003_10_Vehicle(V_Id) on delete cascade, 
    primary key(Zipcode, V_Id)
);


-- Booking Table Table
CREATE TABLE Fall22_S003_10_Books_Details(
    C_ID INT not null, 
    V_Id varchar(25) not null, 
    St_Time date not null, 
    E_Time date not null, 
    Pickup_L varchar(30) not null, 
    Drop_L varchar(30) not null, 
    Book_dt date not null, 
    Price Number(10,2) not null, 
    foreign key(C_ID) references Fall22_S003_10_Customer(C_ID) on delete cascade, 
    foreign key(V_Id) references Fall22_S003_10_Vehicle(V_Id) on delete cascade,
    primary key(C_ID, V_Id, St_Time, E_Time, Pickup_L, Drop_L, Book_dt, Price)
);



