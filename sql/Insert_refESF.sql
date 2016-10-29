USE ERMS;

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


