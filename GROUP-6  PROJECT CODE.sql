create database Carzz_insurance;
use carzz_insurance;

-- TABLE 1

create table Grp6_____CUSTOMER
(
	Customer_ID varchar(200) not null,
    Customer_FIRSTNAME varchar(50) not null,
    Customer_LATSTNAME varchar(50) not null,
    Customer_GENDER varchar(10) not null,
    Customer_DOB date not null,
    Customer_Age int not null,
    Customer_EmailId varchar(50) not null,
    Customer_Number int not null,
    Customer_Address varchar(500) not null,
    CONSTRAINT CUSTOMER PRIMARY KEY (Customer_Id)
 );
CREATE UNIQUE INDEX CUSTOMER ON Grp6_____CUSTOMER (Customer_ID ASC);


-- TABLE 2

CREATE TABLE  Grp6_____INCIDENT
(
Incident_Id VARCHAR(100) not null ,
Incident_Date date not null,
Incident_place varchar(100),
NO_OF_Deaths int null,
NO_OF_INJURIES int null,
Damage_rate varchar(100) not null,	
CONSTRAINT INCIDENT PRIMARY KEY (Incident_Id)
);
CREATE UNIQUE INDEX INCIDENT ON Grp6_____INCIDENT (Incident_Id ASC);


-- TABLE 3

create table Grp6_____VEHICLE
(
Vehicle_Id VARCHAR(50) not null,
Reg_number varchar(100) not null,
Policy_Id VARCHAR(100) not null,
Price int null ,
Vehicle_Type VARCHAR(25) not null ,
Manufacturer VARCHAR(30) not null ,
Chassis_Number VARCHAR(50) NOT NULL,
Yearofmanufacture int not null ,
Customer_ID VARCHAR(20) NOT NULL ,
CONSTRAINT Grp6_____VEHICLE PRIMARY KEY (Vehicle_Id,Customer_ID),
CONSTRAINT  FOREIGN KEY (Customer_ID) REFERENCES grp6_____customer (Customer_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX VEHICLE ON Grp6_____VEHICLE (Vehicle_Id ASC);


-- TABLE 4

create table Grp6_____NEW_CUSTOMER
(
	New_Cust_ID varchar(20) not null,
    FIRSTNAME varchar(50) not null,
    LATablesSTNAME varchar(50) not null,
    GENDER varchar(10) not null,
    DOB date not null,
    Age int not null,
    EmailId varchar(50) not null,
    Mob_Number int not null,
    Address varchar(500) not null,
	constraint Grp6_____NEW_CUSTOMER primary key (New_Cust_ID)
	);
    CREATE UNIQUE INDEX New_CUSTOMER ON Grp6_____NEW_CUSTOMER(New_Cust_ID ASC);


-- TABLE 5

create table GRP6_____Application_for_New_customer
(
NEW_Application_id varchar(20) not null,
Applicant_FIRST_Name varchar(50) not null,
Applicant_LAST_NAME varchar(50)  null,
APPLICANT_Age int not null,
APPLICANT_Address varchar(500) not null,
APPLICANT_MOB_NUMBER int not null,
VEHICLE_NAME char(100) not null,
TYPE_OF_VEHICLE varchar(20),
VEHICLE_MANUFACTURER varchar(100) not null,
VEHICLE_MODEL int not null,
CHASSIS_NO varchar(50) not null,
INSURANCE_TYPE varchar(100) not null,
INSURANCE_TERM int not null,
New_Cust_ID varchar(20),
CONSTRAINT GRP6_____Application_for_New_customer   PRIMARY KEY (NEW_Application_id),
CONSTRAINT FOREIGN KEY (New_Cust_ID) REFERENCES grp6_____new_customer (New_Cust_ID)
);
CREATE UNIQUE INDEX  Application_for_New_customer ON GRP6_____Application_for_New_customer ( NEW_Application_id ASC,New_Cust_ID ASC);



-- TABLE 6

CREATE TABLE  grp6_____incident_report
(
Incident_Report_Id VARCHAR(20) NOT NULL ,
Incident_Type CHAR(100) NULL , 
REPORT_INCHARGE VARCHAR(20) NULL , 
Incident_Cost INTEGER NULL ,
 Incident_DESCRIPTION VARCHAR(1000) NULL ,
Incident_Id VARCHAR(100) NOT NULL , 
 Customer_Id VARCHAR(200) NOT NULL , 
CONSTRAINT grp6_____incident_report PRIMARY KEY (Incident_Report_Id,Incident_Id,Customer_Id), 
CONSTRAINT FOREIGN KEY (Incident_Id) REFERENCES  grp6_____incident (Incident_Id) ON DELETE CASCADE ON UPDATE CASCADE, 
CONSTRAINT FOREIGN KEY (Customer_Id) REFERENCES  grp6_____customer (Customer_Id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX incident_report  ON grp6_____incident_report (Incident_Report_Id ASC,Incident_Id ASC);



-- TABLE 7

CREATE TABLE GRP6_____INSURANCE_COMPANY 
(
company_id varchar(100) ,
Company_Name VARCHAR(200) not null ,
Company_Address VARCHAR(200) null,
Contact_Number  int not null,
Email_id VARCHAR(100) null ,
Website VARCHAR(100) NULL ,
Incident_report_id varchar(100) not null,
NEW_Application_id varchar(20) null,
CONSTRAINT FOREIGN KEY (NEW_Application_id) REFERENCES grp6_____application_for_new_customer (NEW_Application_id),
CONSTRAINT GRP6_____INSURANCE_COMPANY  PRIMARY KEY (Company_id),
CONSTRAINT  FOREIGN KEY (Incident_Report_Id) REFERENCES grp6_____incident_report (Incident_Report_Id)
);
CREATE UNIQUE INDEX  INSURANCE_COMPANY  ON GRP6_____INSURANCE_COMPANY (  Incident_Report_Id ASC);

 
-- TABLE 8

Create table GRP6_____DEPARTMENT
(
Department_ID VARCHAR(100) not null,
Department_Name VARCHAR(100) not null,
Department_Staff VARCHAR(100) not null ,
Company_id VARCHAR(200) not null,
CONSTRAINT DEPARTMENT PRIMARY KEY (Department_Name,Department_ID,company_id),
CONSTRAINT FOREIGN KEY (company_id)
REFERENCES grp6_____insurance_company (company_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX DEPARTMENT ON GRP6_____DEPARTMENT (Department_Name ASC,Department_ID ASC);


-- TABLE 9

CREATE TABLE GRP6_____Service_station 
(
Service_station_Name Varchar(50) not null ,
Address varchar(50) not null,
contact_No varchar(50) not null ,
service_station_Incharge varchar(50) not null,
Department_Name VARCHAR(200) NOT NULL ,
CONSTRAINT GRP6_____SERVICE_station PRIMARY KEY (Service_station_Name,Department_name),
CONSTRAINT FOREIGN KEY (Department_Name) REFERENCES grp6_____department (Department_Name) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX Service_station  ON GRP6_____Service_station ( Service_station_Name ASC,Department_Name ASC);


-- TABLE 10

CREATE TABLE GRP6_____PREMIUM_PAYMENT
(
Premium_Payment_Id VARCHAR(200) NOT NULL ,
Policy_Number VARCHAR(200) NOT NULL ,
Premium_Amount INTEGER NOT NULL ,
Payment_Schedule DATE NOT NULL ,
Receipt_Id VARCHAR(10) NOT NULL ,
Customer_ID VARCHAR(20) NOT NULL ,
CONSTRAINT PRIMARY KEY GRP6_____PREMIUM_PAYMENT (Premium_Payment_Id,Customer_ID),
CONSTRAINT  FOREIGN KEY (Customer_ID) REFERENCES grp6_____customer (Customer_ID)
);
CREATE UNIQUE index PREMIUM_PAYMENT ON GRP6_____PREMIUM_PAYMENT (Premium_Payment_Id ASC,Customer_ID ASC);


-- TABLE 11

CREATE TABLE GRP6_____PAYMENT_RECEIPT
(
Receipt_Id VARCHAR(20) NOT NULL ,
Time DATE NOT NULL ,
Cost INTEGER NOT NULL ,
Premium_Payment_Id VARCHAR(20) NOT NULL ,
 Customer_ID VARCHAR(20) NOT NULL ,
CONSTRAINT GRP6_____PAYMENT_RECEIPT PRIMARY KEY (Receipt_Id,Premium_Payment_Id,Customer_ID),
CONSTRAINT  FOREIGN KEY (Premium_Payment_Id, Customer_ID) REFERENCES grp6_____premium_payment (Premium_Payment_Id, Customer_ID)
);
CREATE UNIQUE INDEX PAYMENT_RECEIPT ON GRP6_____PAYMENT_RECEIPT (Receipt_Id ASC,Premium_Payment_Id ASC,Customer_ID ASC);


-- TABLE 12

CREATE TABLE  GRP6_____application_for_insurance_claim
(
Application_Id VARCHAR(20) NOT NULL ,
Vehicle_Id VARCHAR(50) NOT NULL ,
Application_Status CHAR(50) NOT NULL ,
Coverage VARCHAR(50) NOT NULL ,
Customer_ID VARCHAR(100) NOT NULL ,
CONSTRAINT GRP6_____application_for_insurance_claim PRIMARY KEY (Application_Id,Customer_ID),
CONSTRAINT  FOREIGN KEY (Customer_ID) REFERENCES grp6_____customer (Customer_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX application_for_insurance_claim ON GRP6_____application_for_insurance_claim (Application_Id ASC,Customer_ID ASC);


-- TABLE 13

CREATE TABLE GRP6_____INSURANCE_POLICY
(
Agreement_id VARCHAR(20) NOT NULL ,
Department_Name VARCHAR(20) NULL ,
Policy_Number VARCHAR(20) NULL ,
Start_Date DATE NULL ,
Expiry_Date DATE NULL ,
Term_Condition VARCHAR(100) NULL ,
Application_Id VARCHAR(20) NOT NULL ,
Customer_ID VARCHAR(20) NOT NULL ,
CONSTRAINT GRP6_____INSURANCE_POLICY PRIMARY KEY(Agreement_id,Application_Id,Customer_ID),
CONSTRAINT  FOREIGN KEY (Application_Id) REFERENCES grp6_____application_for_insurance_claim (Application_Id),
CONSTRAINT  FOREIGN KEY (Customer_ID) REFERENCES grp6_____customer ( Customer_ID)
);
CREATE UNIQUE INDEX  INSURANCE_POLICY ON GRP6_____INSURANCE_POLICY (Agreement_id ASC,Application_Id ASC,Customer_ID ASC);


-- TABLE 14

CREATE TABLE GRP6_____policy_renewable 
(
Policy_Renewable_Id varchar(100) not null ,
Date_Of_Renewal date not null ,
Type_Of_Renewal char(50) not null,
Agreement_id varchar(50) not null ,
Application_Id varchar(100) not null ,
 Customer_ID varchar(100) not null ,
CONSTRAINT  GRP6_____policy_renewable PRIMARY KEY(Policy_Renewable_Id,Agreement_id,Application_Id,Customer_ID),
CONSTRAINT FOREIGN KEY (Agreement_id)REFERENCES grp6_____insurance_policy (Agreement_id),
CONSTRAINT  FOREIGN KEY (Application_Id) REFERENCES grp6_____application_for_insurance_claim (Application_Id),
CONSTRAINT  FOREIGN KEY (Customer_ID) REFERENCES grp6_____customer ( Customer_ID)
);
CREATE UNIQUE INDEX policy_renewable ON GRP6_____policy_renewable (Policy_Renewable_Id ASC,Agreement_id ASC,Application_Id
ASC,Customer_ID ASC);


-- TABLE 15

create table GRP6_____Insurance_membership
(
Membership_Id VARCHAR(20) NOT NULL ,
Membership_Type CHAR(15) NOT NULL ,
Company VARCHAR(20) NULL,
Customer_ID VARCHAR(20) NOT NULL ,
CONSTRAINT GRP6_____Insurance_membership PRIMARY KEY
(Membership_Id,Customer_ID),
CONSTRAINT  FOREIGN KEY (Customer_ID) REFERENCES grp6_____customer (Customer_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX Insurance_membership ON GRP6_____Insurance_membership  (Membership_Id ASC,Customer_ID ASC);


-- TABLE 16

CREATE TABLE GRP6_____Company_STAFF
(
Staff_id varchar(200) not null,
FIRST_NAME varchar(50) not null,
LAST_NAME varchar(50) not null,
Gender varchar(10) not null,
Age int null,
Mob_number int not null,
Staff_address varchar(200) not null,
company_id VARCHAR(400) NOT NULL , 
CONSTRAINT GRP6_____Company_STAFF  PRIMARY KEY (Staff_Id),
CONSTRAINT FOREIGN KEY (company_id) REFERENCES grp6_____insurance_company (company_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE  INDEX Company_STAFF ON GRP6_____Company_STAFF (Staff_Id ASC,company_id ASC);


-- TABLE 17

create table GRP6_____products_details 
( 
Product_Number varchar(100) not null,
Product_Price int null ,
Product_Type char(40) not null, 
company_id varchar(100) not null , 
CONSTRAINT GRP6_____products_details PRIMARY KEY (Product_Number,company_id), 
CONSTRAINT FOREIGN KEY (company_id) REFERENCES grp6_____insurance_company (company_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX products_details ON GRP6_____products_details (Product_Number ASC,company_id ASC);


-- TABLE 18

create table GRP6_____Coverage 
( 
Coverage_Id varcharacter(100) not null , 
Coverage_Amount int not null, 
Coverage_Type char(50) not null , 
Coverage_Status char(50) not null , 
Product_Id varchar(100) not null , 
Coverage_Description varchar(40) not null, 
company_id varchar(200)  , 
CONSTRAINT  GRP6_____Coverage PRIMARY KEY
(Coverage_Id,company_id),
CONSTRAINT  FOREIGN KEY (company_id) REFERENCES grp6_____insurance_company (company_id) 
);
CREATE UNIQUE INDEX Coverage ON GRP6_____Coverage (Coverage_Id ASC,company_id ASC);


-- TABLE 19

create  table  GRP6_____Policy_coverage
(
Agreement_id VARCHAR(20) NOT NULL ,
Application_Id varchar(20) not null ,
Customer_ID VARCHAR(20) NOT NULL ,
Coverage_Id VARCHAR(20) NOT NULL ,
company_id VARCHAR(20) NOT NULL ,
CONSTRAINT GRP6_____Policy_coverage PRIMARY KEY (Agreement_id,Application_Id,Coverage_Id,company_id,Customer_ID),
CONSTRAINT FOREIGN KEY (Agreement_id ) REFERENCES grp6_____insurance_policy (Agreement_id),
CONSTRAINT FOREIGN KEY ( Application_Id ) REFERENCES  GRP6_____application_for_insurance_claim (Application_Id),
CONSTRAINT FOREIGN KEY (Customer_ID ) REFERENCES grp6_____customer (Customer_ID),
CONSTRAINT  FOREIGN KEY (Coverage_Id)  REFERENCES grp6_____coverage (Coverage_Id),
CONSTRAINT  FOREIGN KEY ( company_id)  REFERENCES GRP6_____INSURANCE_COMPANY ( company_id)
);
CREATE UNIQUE INDEX Policy_coverage ON GRP6_____Policy_coverage (Agreement_id ASC,Application_Id ASC,Customer_ID ASC,Coverage_Id ASC,company_id ASC);



-- TABLE 20

create table GRP6____policy_claim
(
Claim_Id VARCHAR(20) NOT NULL ,
Agreement_Id VARCHAR(20) NOT NULL ,
Claim_Amount INTEGER NOT NULL ,
Date_Of_Claim DATE NOT NULL ,
Claim_Status CHAR(100) NOT NULL ,
Customer_ID VARCHAR(200) NOT NULL ,
Incident_Report_Id varchar(20) ,
CONSTRAINT GRP6____policy_claim PRIMARY KEY (Claim_Id,Customer_ID,Incident_Report_Id),
CONSTRAINT FOREIGN KEY (Customer_ID) REFERENCES grp6_____customer(Customer_ID),
CONSTRAINT FOREIGN KEY (Incident_Report_Id) REFERENCES grp6_____incident_report (Incident_Report_Id)
);
CREATE UNIQUE INDEX policy_claim ON GRP6____policy_claim (Claim_Id ASC,Incident_Report_Id asc);


-- TABLE 21

create table GRP6_____Claim_settlement
(
Claim_Settlement_Id VARCHAR(20) NOT NULL ,
Vehicle_Id VARCHAR(20) NOT NULL ,
Date_Settled DATE NOT NULL ,
Amount_Paid INTEGER NOT NULL ,
Coverage_Id VARCHAR(20) NOT NULL ,
 Customer_ID VARCHAR(20) NOT NULL ,
 Incident_Report_Id varchar (200) not null,
Claim_Id VARCHAR(20) NOT NULL ,
CONSTRAINT GRP6_____Claim_settlement PRIMARY KEY (Claim_Settlement_Id,Claim_Id,Customer_ID,Incident_Report_Id),
CONSTRAINT  FOREIGN KEY (Claim_Id,Customer_ID,Incident_Report_Id) REFERENCES grp6____policy_claim (Claim_Id,Customer_ID,Incident_Report_Id) 

);
CREATE UNIQUE INDEX  Claim_settlement ON GRP6_____Claim_settlement(Claim_Settlement_Id ASC,Claim_Id ASC);









