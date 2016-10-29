
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