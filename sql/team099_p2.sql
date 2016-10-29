Create database if not exists ERMS;
Use ERMS;


Drop table if exists MasterUser;
Create table MasterUser
	(
	 UserName varchar(100) not null,
	 Name varchar(100) not null,
	 Password varchar(20) not null,
	 UserType char(1) not null,
	 PRIMARY KEY (UserName) 
	 )ENGINE=InnoDB
     ;


Drop table if exists Individual;
Create table Individual
	(
	 UserName varchar(100) not null unique,
	 JobTitle varchar(50) not null,
	 Sys_Ent_Date date not null,
	 FOREIGN KEY (UserName) REFERENCES MasterUser(UserName)
	)ENGINE=InnoDB
	;

Drop table if exists Municipality;  
Create table Municipality
	  (
	   UserName varchar(100) not null unique,
	   Population integer not null,
	   FOREIGN KEY (UserName) REFERENCES MasterUser(UserName),
	   CHECK (Population>0)
	  )ENGINE=InnoDB
	  ;
      
Drop table if exists GvnAgency;
CREATE TABLE GvnAgency
	(
	username VARCHAR(100) NOT NULL,
	Jurisdiction VARCHAR(100) NOT NULL,
	CONSTRAINT chkJurisdiction CHECK (Jurisdiction='Federal' OR Jurisdiction='State' OR Jurisdiction='Local'),
	PRIMARY KEY (username),
	FOREIGN KEY (username) REFERENCES MasterUser(username)
	)ENGINE=InnoDB
    ;

Drop table if exists Company;
Create table Company
      (
       UserName varchar(100) not null unique,
       Headquarters varchar(100) not null,
       FOREIGN KEY (UserName) REFERENCES MasterUser(UserName)
       )ENGINE=InnoDB
     ;


DROP TABLE IF EXISTS Incident;
CREATE TABLE Incident
(
IncidentID INTEGER NOT NULL AUTO_INCREMENT,
IncidentDate Date NOT NULL,
Description varchar(255) NOT NULL ,
LatI Decimal( 10,3 ) NOT NULL ,
LongI Decimal( 10, 3 ) NOT NULL ,
Ownername varchar(100) NOT NULL,
CHECK (LatI between -90 and 90),
CHECK (LongI between -180 and 180),
PRIMARY KEY (IncidentID ),
FOREIGN KEY (Ownername) REFERENCES MasterUser(username)
)ENGINE=InnoDB
;


DROP TABLE IF EXISTS CostPerTime;
CREATE TABLE CostPerTime
(
CostUnit varchar(20) NOT NULL,
PRIMARY KEY (CostUnit)
)ENGINE=InnoDB
;


DROP TABLE IF EXISTS Resource;
CREATE TABLE Resource
(
ResourceID INTEGER NOT NULL AUTO_INCREMENT,
ResourceName varchar(255) NOT NULL,
Status varchar(20) NOT NULL,
CHECK(Status = 'Available' OR Status = 'In Use' OR Status = 'In Repair'), 
Model varchar(50),
LatR Decimal(10,3) NOT NULL,
LongR Decimal( 10, 3 ) NOT NULL ,
OwnerName varchar(100) NOT NULL,
Cost Decimal (10,2) NOT NULL,
CostUnit varchar(20) NOT NULL,
CHECK (LatR between -90 and 90),
CHECK (LongR between -180 and 180),
CHECK (Cost>0),
PRIMARY KEY (ResourceID),
FOREIGN KEY (OwnerName) REFERENCES MasterUser(UserName),
FOREIGN KEY (CostUnit) REFERENCES CostPerTime(CostUnit)
)ENGINE=InnoDB
;

DROP TABLE IF EXISTS refESF;
CREATE TABLE refESF
(
ESFNum int auto_increment,
ESFName varchar(100) not null unique,
PRIMARY KEY (ESFNum)
)ENGINE=InnoDB
;

DROP TABLE IF EXISTS ResourceESF;
CREATE TABLE ResourceESF
(
ResourceID INTEGER NOT NULL,
EsfName varchar(100) NOT NULL,
EsfType  varchar(25) NOT NULL,
FOREIGN KEY (ResourceID) REFERENCES Resource(ResourceID ),
CONSTRAINT chkEsfType CHECK (EsfType='Primary' or EsfType='Additional' ),
FOREIGN KEY (ESFName) REFERENCES refESF(ESFName)
)ENGINE=InnoDB
;

DROP TABLE IF EXISTS Capability;
CREATE TABLE Capability
(
ResourceID INTEGER NOT NULL ,
CapabilityName varchar(255) NOT NULL ,
PRIMARY KEY (ResourceID, CapabilityName),
FOREIGN KEY (ResourceID) REFERENCES Resource(ResourceID)
)ENGINE=InnoDB 
;


DROP TABLE IF EXISTS Repairs;
CREATE TABLE Repairs
(
ResourceID INTEGER NOT NULL,
StartDt Date NOT NULL,
Readyby Date NOT NULL,
RepairStatus tinyint NOT NULL,
Check (RepairStatus = 1 or RepairStatus = 0 or RepairStatus = -1),
PRIMARY KEY (ResourceID,StartDt),
FOREIGN KEY (ResourceID ) REFERENCES Resource(ResourceID)
)ENGINE=InnoDB
;


DROP TABLE IF EXISTS Requests;
CREATE TABLE Requests
(
ResourceID INTEGER NOT NULL ,
IncidentID INTEGER NOT NULL,
Returnby Date NOT NULL,
RequestStatus tinyint NOT NULL
check(RequestStatus = 1 or RequestStatus = 0 or RequestStatus = -1),
PRIMARY KEY (ResourceID,IncidentID,Returnby),
FOREIGN KEY (ResourceID) REFERENCES Resource(ResourceID),
FOREIGN KEY (IncidentID) REFERENCES Incident(IncidentID)
) ENGINE=InnoDB
;

 
DROP TABLE IF EXISTS Deployment;
CREATE TABLE Deployment
(
ResourceID INTEGER NOT NULL ,
IncidentID INTEGER NOT NULL,
StartDt Date NOT NULL,
Returnby Date NOT NULL,
DeployStatus bit NOT NULL,
PRIMARY KEY (ResourceID,IncidentID,StartDt),
FOREIGN KEY (ResourceID) REFERENCES Resource(ResourceID),
FOREIGN KEY (IncidentID) REFERENCES Incident(IncidentID)
)ENGINE=InnoDB
;

/*****************************************
Drop tables if necessary in testing
*****************************************/
/*
DROP TABLE IF EXISTS Deployment;
DROP TABLE IF EXISTS Requests;
DROP TABLE IF EXISTS Repairs;
DROP TABLE IF EXISTS Capability;
DROP TABLE IF EXISTS ResourceESF;
DROP TABLE IF EXISTS refESF;
DROP TABLE IF EXISTS Resource;
DROP TABLE IF EXISTS Incident;
DROP TABLE IF EXISTS CostPerTime;
Drop table if exists Company;
Drop table if exists GvnAgency;
Drop table if exists Municipality;
Drop table if exists Individual;
Drop table if exists MasterUser;
*/
