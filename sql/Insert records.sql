use ERMS;

/*****************************************
Clean tables
*****************************************/
SET SQL_SAFE_UPDATES = 0;

delete from Deployment;
delete from Requests;
delete from Repairs;
delete from ResourceESF;
delete from Capability;
delete from Company;
delete from GvnAgency;
delete from Municipality;
delete from Individual;
delete from Incident;
delete from Resource;
delete from CostPerTime;
delete from refESF;
delete from MasterUser;


/*****************************************
Insert ESFs
*****************************************/
Start Transaction;

insert into refESF (ESFName) Values ('#1 - Transportation');
insert into refESF (ESFName) Values ('#2 - Communications');
insert into refESF (ESFName) Values ('#3 - Public Works and Engineering');
insert into refESF (ESFName) Values ('#4 - Firefighting');
insert into refESF (ESFName) Values ('#5 - Emergency Management');
insert into refESF (ESFName) Values ('#6 - Mass Care, Emergency Assistance, Housing, and Human Services');
insert into refESF (ESFName) Values ('#7 - Logistics Management and Resource Support');
insert into refESF (ESFName) Values ('#8 - Public Health and Medical Services');
insert into refESF (ESFName) Values ('#9 - Search and Rescue');
insert into refESF (ESFName) Values ('#10 - Oil and Hazardous Materials Response');
insert into refESF (ESFName) Values ('#11 - Agriculture and Natural Resources');
insert into refESF (ESFName) Values ('#12 - Energy');
insert into refESF (ESFName) Values ('#13 - Public Safety and Security');
insert into refESF (ESFName) Values ('#14 - Long-Term Community Recovery');
insert into refESF (ESFName) Values ('#15 - External Affairs');

Commit;


/*****************************************
Insert Usrs
*****************************************/
#Individual;

#1
Start Transaction;

insert into MasterUser (UserName,Name,Password,UserType) Values ('HarryPt', 'Harry Potter', 'Hogwalz00','I');
insert into Individual (UserName,JobTitle,Sys_Ent_Date) Values ('HarryPt','Analyst', Curdate());

Commit;

#2
Start Transaction;

insert into MasterUser (UserName,Name,Password,UserType) Values ('Smeagol', 'S AKA Gollum', 'LOR00','I');
insert into Individual (UserName,JobTitle,Sys_Ent_Date) Values ('Smeagol','Project Manager', Curdate());

Commit;


#3

Start Transaction;

insert into MasterUser(UserName,Name,Password,UserType) Values ('Test','TestDBA','T00','I');
insert into Individual(UserName,JobTitle,Sys_Ent_Date) Values('Test', 'DBA', Curdate());

Commit;


#Municipality

#1
Start Transaction;

insert into MasterUser (UserName,Name,Password,UserType) Values ('GilbertA', 'City Gilbert,Arizona', 'GB00','M');
insert into Municipality (UserName,Population) Values ('GilbertA','10000');

Commit;

#2
Start Transaction;

insert into MasterUser (UserName,Name,Password,UserType) Values ('SanDiegoC', 'City SanDiego,Arizona', 'SD00','M');
insert into Municipality (UserName,Population) Values ('SanDiegoC','15000');

Commit;


#gvnagency

#1
Start Transaction;

insert into MasterUser (UserName,Name,Password,UserType) Values ('AmeriCorps', 'AmeriCorps', 'Ameri00','G');
insert into GvnAgency (UserName,Jurisdiction) Values ('AmeriCorps','Federal');

Commit;


#Company

#1
Start Transaction;

insert into MasterUser (UserName,Name,Password,UserType) Values ('TNavigation', 'TNavigation', 'TNavy00','C');
insert into Company (UserName,Headquarters) Values ('TNavigation','Los Angeles');

Commit;

# Individual;
insert into MasterUser (UserName,Name,Password,UserType) Values ('Limei', 'Li mei', 'limei123','I');
insert into MasterUser (UserName,Name,Password,UserType) Values ('Zhangsan', 'Zhang san', 'sansansan','I');
insert into MasterUser (UserName,Name,Password,UserType) Values ('Lisi', 'Li si', 'lililisisisi','I');
insert into MasterUser (UserName,Name,Password,UserType) Values ('Lily', 'Lily Ma', 'lilymapass','I');
insert into MasterUser (UserName,Name,Password,UserType) Values ('Tom', 'Tom hanks', 'passtom','I');
insert into MasterUser (UserName,Name,Password,UserType) Values ('Jack', 'Jack cruse', 'passjack','I');
insert into MasterUser (UserName,Name,Password,UserType) Values ('Rose', 'Rose Anne', 'rosefighting','I');
insert into MasterUser (UserName,Name,Password,UserType) Values ('Mary', 'Mary jane', 'marygoodgirl','I');

insert into Individual (UserName,JobTitle,Sys_Ent_Date) Values ('Limei','Project Manager', '2016-10-11');
insert into Individual (UserName,JobTitle,Sys_Ent_Date) Values ('Zhangsan','Department Manager', '2016-10-12');
insert into Individual (UserName,JobTitle,Sys_Ent_Date) Values ('Lisi','Officer', '2016-10-13');
insert into Individual (UserName,JobTitle,Sys_Ent_Date) Values ('Lily','Inventory Manager', '2016-10-14');
insert into Individual (UserName,JobTitle,Sys_Ent_Date) Values ('Tom','security guard', '2016-10-15');
#insert into Individual (UserName,JobTitle,Sys_Ent_Date) Values ('Smeagol','Project Manager', '2016-10-16');
insert into Individual (UserName,JobTitle,Sys_Ent_Date) Values ('Jack','software engineer', '2016-10-17');
insert into Individual (UserName,JobTitle,Sys_Ent_Date) Values ('Rose','dancer', '2016-10-18');
insert into Individual (UserName,JobTitle,Sys_Ent_Date) Values ('Mary','Data analyst', '2016-10-19');
#insert into Individual (UserName,JobTitle,Sys_Ent_Date) Values ('Luna','singer','2016-10-11');

#Municipality;

insert into MasterUser (UserName,Name,Password,UserType) Values ('AlbanyNY', 'city,Albany,NY', 'AlbanyNY123','M');
insert into MasterUser (UserName,Name,Password,UserType) Values ('AmsterdamNY', 'city,Amsterdam,NY', 'AmsterdamNY123','M');
insert into MasterUser (UserName,Name,Password,UserType) Values ('BeaconNY', 'city,Beacon,NY', 'BeaconNY123','M');
insert into MasterUser (UserName,Name,Password,UserType) Values ('BinghamtonNY', 'city,Binghamton,NY', 'BinghamtonNY123','M');
insert into MasterUser (UserName,Name,Password,UserType) Values ('BuffaloNY', 'city,Buffalo,NY', 'BuffaloNY123','M');
insert into MasterUser (UserName,Name,Password,UserType) Values ('CorningNY', 'city,Corning,NY', 'CorningNY123','M');
insert into MasterUser (UserName,Name,Password,UserType) Values ('FultonNY', 'city,Fulton,NY', 'FultonNY123','M');
insert into MasterUser (UserName,Name,Password,UserType) Values ('GenevaNY', 'city,Geneva,NY', 'GenevaNY123','M');
insert into MasterUser (UserName,Name,Password,UserType) Values ('HudsonNY', 'city,Hudson,NY', 'HudsonNY123','M');
insert into MasterUser (UserName,Name,Password,UserType) Values ('KingstonNY', 'city,Kingston,NY', 'KingstonNY123','M');
insert into MasterUser (UserName,Name,Password,UserType) Values ('NewyorkNY', 'city,Newyork,NY', 'NewyorkNY123','M');

insert into Municipality (UserName,Population) Values ('AlbanyNY','97660');
insert into Municipality (UserName,Population) Values ('AmsterdamNY','18507');
insert into Municipality (UserName,Population) Values ('BeaconNY','15565');
insert into Municipality (UserName,Population) Values ('BinghamtonNY','46996');
insert into Municipality (UserName,Population) Values ('BuffaloNY','261025');
insert into Municipality (UserName,Population) Values ('CorningNY','11187');
insert into Municipality (UserName,Population) Values ('FultonNY','11906');
insert into Municipality (UserName,Population) Values ('GenevaNY','13324');
insert into Municipality (UserName,Population) Values ('HudsonNY','6657');
insert into Municipality (UserName,Population) Values ('KingstonNY','23887');
insert into Municipality (UserName,Population) Values ('NewyorkNY','8550405');


#Company

insert into MasterUser (UserName,Name,Password,UserType) Values ('GoogleNY', 'Google', 'GoogleNY234','C');
insert into MasterUser (UserName,Name,Password,UserType) Values ('AmazonNY', 'Amazon', 'AmazonNY234','C');
insert into MasterUser (UserName,Name,Password,UserType) Values ('GrubhubNY', 'Grubhub', 'GrubhubNY234','C');
insert into MasterUser (UserName,Name,Password,UserType) Values ('SASNY', 'SAS', 'SASNY234','C');
insert into MasterUser (UserName,Name,Password,UserType) Values ('GMCA', 'GM', 'GMCA234','C');
insert into MasterUser (UserName,Name,Password,UserType) Values ('AirbnbCA', 'Airbnb', 'AirbnbCA234','C');
insert into MasterUser (UserName,Name,Password,UserType) Values ('CourseraCA', 'Coursera', 'CourseraCA234','C');
insert into MasterUser (UserName,Name,Password,UserType) Values ('VMwareCA', 'VMware', 'VMwareCA234','C');
insert into MasterUser (UserName,Name,Password,UserType) Values ('ShisedoCA', 'Shisedo', 'ShisedoCA234','C');
insert into MasterUser (UserName,Name,Password,UserType) Values ('BitTigerCA', 'BitTiger', 'BitTigerCA234','C');

insert into Company (UserName,Headquarters) Values ('GoogleNY','New York City');
insert into Company (UserName,Headquarters) Values ('AmazonNY','New York City');
insert into Company (UserName,Headquarters) Values ('GrubhubNY','New York City');
insert into Company (UserName,Headquarters) Values ('SASNY','New York City');
insert into Company (UserName,Headquarters) Values ('GMCA','Los Angeles');
insert into Company (UserName,Headquarters) Values ('AirbnbCA','Los Angeles');
insert into Company (UserName,Headquarters) Values ('CourseraCA','Los Angeles');
insert into Company (UserName,Headquarters) Values ('VMwareCA','Los Angeles');
insert into Company (UserName,Headquarters) Values ('ShisedoCA','Los Angeles');
insert into Company (UserName,Headquarters) Values ('BitTigerCA','Los Angeles');


#gvnagency
insert into MasterUser (UserName,Name,Password,UserType) Values ('DEA', 'Drug Enforcement Agency', 'DEA123','G');
insert into MasterUser (UserName,Name,Password,UserType) Values ('FBI', 'Federal Bureau of Investigation', 'FBI123','G');
insert into MasterUser (UserName,Name,Password,UserType) Values ('NASA', 'NASA Local Facility', 'NASA123','G');
insert into MasterUser (UserName,Name,Password,UserType) Values ('SmallBusinessAD', 'Small Business Administration', 'SmallBusinessAD123','G');
insert into MasterUser (UserName,Name,Password,UserType) Values ('CustomsService', 'Customs Service at NWK', 'CustomsService123','G');
insert into MasterUser (UserName,Name,Password,UserType) Values ('511NY', '551NY', '511NY123','G');
insert into MasterUser (UserName,Name,Password,UserType) Values ('AdirondackPA', 'Adirondack park agency', 'AdirondackPA123','G');
insert into MasterUser (UserName,Name,Password,UserType) Values ('AuthoritiesBudget', 'Authorities Budget office', 'AuthoritiesBudget123','G');
insert into MasterUser (UserName,Name,Password,UserType) Values ('BatteryParkCityAuthority', 'Battery Park City Authority', 'BatteryParkCity123','G');
insert into MasterUser (UserName,Name,Password,UserType) Values ('BPLNY', 'Brooklyn Public Library', 'BPLNY123','G');
insert into MasterUser (UserName,Name,Password,UserType) Values ('CFBNY', 'Campaign Finance Board', 'CFBNY123','G');
insert into MasterUser (UserName,Name,Password,UserType) Values ('CEONY', 'Center for Economic Opportunity', 'CEONY123','G');
insert into MasterUser (UserName,Name,Password,UserType) Values ('BICNY', 'Business Integrity Commission', 'BICNY123','G');
insert into MasterUser (UserName,Name,Password,UserType) Values ('ActuaryNYC', 'Actuary, NYC OFFICE OF THE NYCOA', 'ActuaryNYC123','G');


insert into GvnAgency (UserName,Jurisdiction) Values ('DEA','Federal');
insert into GvnAgency (UserName,Jurisdiction) Values ('FBI','Federal');
insert into GvnAgency (UserName,Jurisdiction) Values ('NASA','Federal');
insert into GvnAgency (UserName,Jurisdiction) Values ('SmallBusinessAD','Federal');
insert into GvnAgency (UserName,Jurisdiction) Values ('CustomsService','Federal');
insert into GvnAgency (UserName,Jurisdiction) Values ('511NY','State');
insert into GvnAgency (UserName,Jurisdiction) Values ('AdirondackPA','State');
insert into GvnAgency (UserName,Jurisdiction) Values ('AuthoritiesBudget','State');
insert into GvnAgency (UserName,Jurisdiction) Values ('BatteryParkCityAuthority','State');
insert into GvnAgency (UserName,Jurisdiction) Values ('BPLNY','Local');
insert into GvnAgency (UserName,Jurisdiction) Values ('CFBNY','Local');
insert into GvnAgency (UserName,Jurisdiction) Values ('CEONY','Local');
insert into GvnAgency (UserName,Jurisdiction) Values ('BICNY','Local');
insert into GvnAgency (UserName,Jurisdiction) Values ('ActuaryNYC','Local');


/*****************************************
Insert Resources
*****************************************/

#CostPer;
Start Transaction;

insert into CostPerTime (CostUnit) Values ('Hour');
insert into CostPerTime (CostUnit) Values ('Day');
insert into CostPerTime (CostUnit) Values ('Week');

Commit;

#Insert Resource;

#1;
Start Transaction;

insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('2015 Hummer', 'Available','Hummer', 48, 115, 'GilbertA', 250, 'Hour');

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'GilbertA';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#5 - Emergency Management', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#4 - Firefighting', 'Additional');
               
insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#8 - Public Health and Medical Services', 'Additional');
               
insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#9 - Search and Rescue', 'Additional');               
               
insert into Capability(ResourceID,CapabilityName)
			   Values (@ResourceID, 'GPS');

insert into Capability(ResourceID,CapabilityName)
			   Values (@ResourceID, 'Patrolling');
               

Commit;



#2;

Start Transaction;

insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('Ambulance', 'Available','Ambulance', 50, 120, 'Smeagol', 100, 'Day');

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'Smeagol';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#4 - Firefighting', 'Additional');
               
insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#12 - Energy', 'Additional');
               
insert into Capability(ResourceID,CapabilityName)
			   Values (@ResourceID, 'GPS');

insert into Capability(ResourceID,CapabilityName)
			   Values (@ResourceID, 'Magic');
               

Commit;




insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('2011 Hummer', 'Available','Hummer', 48, 115, 'Limei', 50, 'Hour');



Start Transaction;
Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'Limei';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#4 - Firefighting', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#12 - Energy', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'GPS');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'Two seats');

Commit;







insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('advanced tractor ', 'Available','tractor', 30, 100, 'Zhangsan', 25, 'Hour');
/*****************************************
Insert ResourceESF
*****************************************/

Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'Zhangsan';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#4 - Firefighting', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#10 - Oil and Hazardous Materials Response','Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'GPS');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'four seats');

Commit;





insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('2014 tractor', 'Available','tractor', 47, 120, 'Lisi', 250, 'Day');
/*****************************************
Insert ResourceESF
*****************************************/

Start Transaction;
Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'Lisi';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#3 - Public Works and Engineering','Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#12 - Energy', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'GPS');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'with coach');

Commit;





insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('2016 tractor', 'Available','tractor', 46, 115, 'Lily', 100, 'Day');
/*****************************************
Insert ResourceESF
*****************************************/

Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'Lily';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#3 - Public Works and Engineering','Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#12 - Energy', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'drag 10000kg things');
insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'easy to drive');

Commit;





insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('portable fire unit ', 'Available','fire unit', 45, 130, 'Tom', 500, 'Week');
/*****************************************
Insert ResourceESF
*****************************************/

Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'Tom';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#4 - Firefighting', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#9 - Search and Rescue', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#13 - Public Safety and Security','Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'for a room');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'easy to carry');

Commit;





insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('large fire unit', 'Available','fire unit', 44, 140, 'Jack', 400, 'Week');
/*****************************************
Insert ResourceESF
*****************************************/

Start Transaction;


Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'Jack';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#4 - Firefighting', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#4 - Firefighting', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#13 - Public Safety and Security', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'used for a room');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'easy to operate');

Commit;






insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('tent for four', 'Available','tent', 43, 90, 'Rose', 300, 'Day');
/*****************************************
Insert ResourceESF
*****************************************/

Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'Rose';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#6 - Mass Care, Emergency Assistance, Housing, and Human Services','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#8 - Public Health and Medical Services', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#5 - Emergency Management', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'hold four person');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'with table and chairs');

Commit;







insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('tent for two', 'Available','tent', 42, 114, 'Mary', 80, 'Day');
/*****************************************
Insert ResourceESF
*****************************************/

Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'Mary';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#6 - Mass Care, Emergency Assistance, Housing, and Human Services','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#5 - Emergency Management', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#8 - Public Health and Medical Services', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'hold two person');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'have sleep bags');

Commit;









insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('advanced crane', 'Available','crane', 32, 114, 'AlbanyNY', 200, 'Day');

/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'AlbanyNY';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#9 - Search and Rescue','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#5 - Emergency Management', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#8 - Public Health and Medical Services', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'hold two person');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'have sleep bags');

Commit;







insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('2015 grabexcavator', 'Available','grabexcavator', 33, 112, 'AmsterdamNY', 280, 'Day');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'AmsterdamNY';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#9 - Search and Rescue','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#5 - Emergency Management', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#8 - Public Health and Medical Services', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'tear buildings');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'good condition');

Commit;







insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('2014 crane', 'Available','crane', 34, 113, 'BeaconNY', 180, 'Day');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'BeaconNY';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#9 - Search and Rescue','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#5 - Emergency Management', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#8 - Public Health and Medical Services', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'hold two person');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'have sleep bags');

Commit;







insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('advanced grabexcavator', 'Available','grabexcavator', 35, 115, 'BinghamtonNY', 200, 'Day');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'BinghamtonNY';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#9 - Search and Rescue','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#3 - Public Works and Engineering', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#11 - Agriculture and Natural Resources', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'good at digging');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, '100kg per time');

Commit;





insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('small crane', 'Available','crane', 36, 116, 'BuffaloNY', 270, 'Day');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'BuffaloNY';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#9 - Search and Rescue','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#5 - Emergency Management', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#8 - Public Health and Medical Services', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'hold two person');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'have sleep bags');

Commit;






insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('small grabexcavator', 'Available','grabexcavator', 37, 116, 'CorningNY', 200, 'Week');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'CorningNY';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#9 - Search and Rescue','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#3 - Public Works and Engineering', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#11 - Agriculture and Natural Resources', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'good at digging');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, '100kg per time');

Commit;







insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('midium crane', 'Available','crane', 46, 113, 'FultonNY', 500, 'Week');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'FultonNY';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#9 - Search and Rescue','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#5 - Emergency Management', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#8 - Public Health and Medical Services', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'hold two person');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'have sleep bags');

Commit;






/***
insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('2016 stirrer', 'Available','stirrer', 45, 114, 'GenevaNY', 80, 'Hour');
insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('2014 stirrer', 'Available','stirrer', 41, 110, 'HudsonNY', 76, 'Hour');
**/





insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('bus for twenty', 'Available','bus', 24, 109, 'KingstonNY', 90, 'Hour');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'KingstonNY';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#5 - Emergency Management', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#15 - External Affairs', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'small bus');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'good engine');

Commit;







insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('bus for forty', 'Available','bus', 3, 108, 'NewyorkNY', 100, 'Hour');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'NewyorkNY';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#5 - Emergency Management', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#15 - External Affairs', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'large bus');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'good engine');
         
commit;







insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('small bus', 'Available','bus', 32, 90, 'GoogleNY', 100, 'Hour');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'GoogleNY';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#5 - Emergency Management', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#15 - External Affairs', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'small bus');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'good engine');
commit;







insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('2015 tractor', 'Available','tractor', 33, 91, 'AmazonNY', 50, 'Hour');
/*****************************************
Insert ResourceESF
*****************************************/

Start Transaction;
Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'AmazonNY';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#4 - Firefighting', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#12 - Energy', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'GPS');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'Two seats');

Commit;







insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('large bus', 'Available','bus', 34, 92, 'GrubhubNY', 80, 'Hour');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'GrubhubNY';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#5 - Emergency Management', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#15 - External Affairs', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'small bus');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'good engine');

Commit;







insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('advanced grabexcavator', 'Available','grabexcavator', 35, 93, 'SASNY', 200, 'Day');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'SASNY';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#9 - Search and Rescue','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#3 - Public Works and Engineering', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#11 - Agriculture and Natural Resources', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'good at digging');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, '100kg per time');

Commit;







insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('medium bus', 'Available','bus', 36, 94, 'GMCA', 200, 'Day');

/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'GMCA';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#5 - Emergency Management', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#15 - External Affairs', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'small bus');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'good engine');
commit;



/**
insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('small stirrer', 'Available','stirrer', 37, 95, 'AirbnbCA', 300, 'Week');
**/





insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('advanced fire unit', 'Available','fire unit', 38, 69, 'CourseraCA', 300, 'Week');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'CourseraCA';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#4 - Firefighting', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#9 - Search and Rescue', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#13 - Public Safety and Security','Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'for a room');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'easy to carry');
commit;        
 
 
 
 
 
 
 
 /**
insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('2015 crane', 'Available','crane', 39, 96, 'VMwareCA', 400, 'Week');
**/




insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('portable fire unit', 'Available','fire unit', 31, 97, 'ShisedoCA', 100, 'Hour');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'ShisedoCA';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#4 - Firefighting', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#9 - Search and Rescue', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#13 - Public Safety and Security','Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'for a room');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'easy to carry');
commit;







insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('bus for thirty', 'Available','bus', 43, 156, 'BitTigerCA', 200, 'Day');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'KingstonNY';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#5 - Emergency Management', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#15 - External Affairs', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'medium bus');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'like new');

Commit;








insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('large tent', 'Available','tent', 20, 156, 'DEA', 200, 'Day');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'DEA';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#6 - Mass Care, Emergency Assistance, Housing, and Human Services','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#8 - Public Health and Medical Services', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#5 - Emergency Management', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'hold four person');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'with table and chairs');

Commit;









insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('small tent', 'Available','tent', 21, 100, 'FBI', 100, 'Day');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'FBI';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#6 - Mass Care, Emergency Assistance, Housing, and Human Services','Primay');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#8 - Public Health and Medical Services', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#5 - Emergency Management', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'hold four person');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'with table and chairs');

Commit;







insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('Ambulancer', 'Available','Ambulance', 22, 105, 'NASA', 150, 'Day');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'NASA';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#4 - Firefighting', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#12 - Energy', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'GPS');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'Two Beds');

Commit;







insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('Ambulance', 'Available','Ambulance', 23, 110, 'SmallBusinessAD', 180, 'Day');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'SmallBusinessAD';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#4 - Firefighting', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#12 - Energy', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'GPS');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'Two Beds');

Commit;









insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('advanced tractor', 'Available','tractor', 24, 115, 'CustomsService', 200, 'Week');
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'CustomsService';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#4 - Firefighting', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#10 - Oil and Hazardous Materials Response','Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'GPS');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'drag a car');

Commit;





insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('small tractor', 'Available','tractor', 25, 160, '511NY', 400, 'Week');
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = '511NY';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#4 - Firefighting', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#10 - Oil and Hazardous Materials Response','Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'GPS');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'drag a car');

Commit;





insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('advanced fire unit', 'Available','fire unit', 26, 156, 'AdirondackPA', 500, 'Week');
/*****************************************
Insert ResourceESF
*****************************************/

Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'AdirondackPA';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#4 - Firefighting', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#9 - Search and Rescue', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#13 - Public Safety and Security','Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'for a room');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'easy to carry');
commit;

/****
insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('bus for thirty', 'Available','bus', 27, 120, 'AuthoritiesBudget', 600, 'Week');
insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('bus for forty', 'Available','bus', 28, 113, 'BatteryParkCityAuthority', 50, 'Hour');
insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('2016 crane', 'Available','crane', 29, 114, 'BPLNY', 50, 'Hour');
insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('2014 crane', 'Available','crane', 32, 115, 'CFBNY', 40, 'Hour');
*****/
           
insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('Ambulance', 'Available','Ambulance', 33, 166, 'CEONY', 30, 'Hour');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'CEONY';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#4 - Firefighting', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#12 - Energy', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'GPS');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'Two Beds');

Commit;






		
insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('Ambulance', 'Available','Ambulance', 34, 123, 'BICNY', 100, 'Day');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'BICNY';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#1 - Transportation', 'Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#4 - Firefighting', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#12 - Energy', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'GPS');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'Two Beds');

Commit;






insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit) Values
           ('small grabexcavator', 'Available','grabexcavator', 35, 143, 'ActuaryNYC', 120, 'Day');
/*****************************************
Insert ResourceESF
*****************************************/
Start Transaction;

Select @ResourceID := max(ResourceID) from Resource where OwnerName = 'ActuaryNYC';

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#9 - Search and Rescue','Primary');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#3 - Public Works and Engineering', 'Additional');

insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values (@ResourceID, '#11 - Agriculture and Natural Resources', 'Additional');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, 'good at digging');

insert into Capability(ResourceID,CapabilityName)
         Values (@ResourceID, '50kg per time');

Commit;



/*****************************************
Insert Incident
*****************************************/


insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate()-3, 'Hurricane Nicole', 40, 100, 'GilbertA');

insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate()-3, 'Hurricane close to Chandler', 38, 99, 'HarryPt');

insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate(), 'Flash Floods in F County', 50, 100, 'TNavigation');
            
insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate(), 'Earthquake', 31.95, 90, 'Jack');
            
insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate(), 'Earthquake at neighhood', 32, 89.97, 'Lily');
            
insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values            
            (Curdate(), 'Serious Earthquake', 31.98, 89.95, 'NewyorkNY'); 
            
insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate(), 'Car Accident', 24, 108.99, 'KingstonNY');
            
insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate(), 'Highway Accident', 24.008, 108.99, 'Limei');   
            
insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate(), 'Highway Accident', 24.005, 109, 'AmazonNY'); 
            

insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate()-1, 'Fire', 26, 155.98, 'DEA');
            
insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate()-1, 'Fire', 25.99, 155.95, 'GMCA');
            
            
insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate()-1, 'Fire disaster', 26, 156.009, 'Test');
            
insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
			(Curdate(), 'Accident on the road', 24.007, 109, 'Test');
            
            
insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate(), 'Heat wave', 47.995, 115, 'Limei'); 
	
insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate(), 'Heat wave', 47.99, 115, 'GilbertA'); 
 
insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate(), 'Explosion', 25, 160.05, 'Zhangsan'); 
            
insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate(), 'Accident Explosion', 25, 160.001,'511NY');

insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate(), 'Blizzard', 34, 122.98,'Test');
            
insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate(), 'Wind and Snow', 34, 123.11,'BICNY');
            
insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate(), 'Coal mine accident', 50, 120.05,'Smeagol');
            
insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate(), 'Coal mine disaster', 49.995, 120.05,'FultonNY');
            

/*****************************************
Return to Safe update mode
*****************************************/
		            
SET SQL_SAFE_UPDATES = 1;

