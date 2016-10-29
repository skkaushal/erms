Use ERMS;

/***************************************************************
Arrange Repairs;

We pick two cases where Incident Owner is the same as the
Resource Owner

select a.IncidentID,
	   a.IncidentDate,
       a.Description,
       b.ResourceID,
       a.LatI,
       a.LongI,
       b.LatR,
       b.LongR,
       a.Ownername as I_Ownername,
       b.OwnerName as R_Ownername       
from Incident a
join Resource b
on a.Ownername = b.Ownername;

Case one: ResourceID: 77, IncidentID: 28;
Case two: ResourceID: 84, IncidentID: 31;

***************************************************************/
Call arrgRepairs(77,28);

Call arrgRepairs(84,31);


/***************************************************************
Arrange Deployment;

We pick two cases where Incident Owner is the same as the
Resource Owner, and the Resource has to be available

select a.IncidentID,
	   a.IncidentDate,
       a.Description,
       b.ResourceID,
       a.LatI,
       a.LongI,
       b.LatR,
       b.LongR,
       a.Ownername as I_Ownername,
       b.OwnerName as R_Ownername       
from Incident a
join Resource b
on a.Ownername = b.Ownername
where b.Status = 'Available';

Case one: ResourceID: 79, IncidentID:41;
Case two: ResourceID: 109, IncidentID:44;

***************************************************************/
select arrgDeployForSelf(79,41);

select arrgDeployForSelf(109,44);

/***************************************************************
Arrange Requests;

The requested resource is either available or in use,
the owner of the resource should be different with
the owner of the incident

select a.IncidentID,
	   a.IncidentDate,
       a.Description,
       b.ResourceID,
       a.LatI,
       a.LongI,
       b.LatR,
       b.LongR,
       a.Ownername as I_Ownername,
       b.OwnerName as R_Ownername       
from Incident a
join Resource b
on a.Ownername <> b.Ownername
where b.Status in ('Available','In Use');

Case one: ResourceID: 102, IncidentID: 31;
Case two: ResourceID: 78, IncidentID: 28;

***************************************************************/
select arrgRequest(102,31);

select arrgRequest(78,28);
