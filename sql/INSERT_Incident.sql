USE ERMS;

/*****************************************
Insert Incident
*****************************************/


insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate()-3, 'Hurricane Nicole', 40, 100, 'Limei');

insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate()-3, 'Hurricane close to Chandler', 38, 99, 'Zhangsan');

insert into Incident (IncidentDate, Description, LatI, LongI, OwnerName) Values
            (Curdate(), 'Flash Floods in F County', 50, 100, 'Lisi');
