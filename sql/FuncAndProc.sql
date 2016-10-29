Use ERMS;

/**********************************************************
1. Produce per user report
**********************************************************/
Delimiter $$
Drop Procedure if exists getReport$$



CREATE PROCEDURE getReport 
    (
	IN UserNm varchar(100)
	) 
   Begin   

		select a.*
		from (
		select a.ESFNum as Num,
			   a.ESFName as Primary_Emergency_Support_Function,
			   ifnull(b.TotalResource, 0) Total_Resources,
			   ifnull(c.ResourceInUse, 0) Resource_In_Use
		from refESF a
		  left join
			  (
			  select a.ESFName,
					 count(*) as TotalResource
			  from (
					select a.ESFName,
						   b.OwnerName
					from ResourceESF a
					 join Resource b
					 on a.ResourceID = b.ResourceID
					where a.EsfType = 'Primary'
					  and b.OwnerName = UserNm		  
				   ) a
			group by a.ESFName 
			   ) b
			on a.ESFName = b.ESFName
		  left join
			  (
			   select a.ESFName,
					  count(*) as ResourceInUse
			 from (
				select a.ESFName,
					   b.OwnerName
				from ResourceESF a
				 join Resource b
				 on a.ResourceID = b.ResourceID
				where a.EsfType = 'Primary'
				  and b.OwnerName = UserNm
				  and b.Status = 'In Use'
			 ) a
		group by a.ESFName
			) c
		  on a.ESFName = c.ESFName
		order by a.ESFNum
		) a
		  
		Union all
			select Null as Num,
				   'Totals' as Primary_Emergency_Support_Function,
				   sum(t.Total_Resources) as Total_Resources,
				   sum(t.Resource_In_Use) as Resource_In_Use
			from 
		   (
		   select a.ESFNum as Num,
			   a.ESFName as Primary_Emergency_Support_Function,
			   ifnull(b.TotalResource, 0) Total_Resources,
			   ifnull(c.ResourceInUse, 0) Resource_In_Use
		from refESF a
		  left join
			  (
			  select a.ESFName,
					 count(*) as TotalResource
			  from (
					select a.ESFName,
						   b.OwnerName
					from ResourceESF a
					 join Resource b
					 on a.ResourceID = b.ResourceID
					where a.EsfType = 'Primary'
					  and b.OwnerName = UserNm		  
				   ) a
			group by a.ESFName 
			   ) b
			on a.ESFName = b.ESFName
		  left join
			  (
			   select a.ESFName,
					  count(*) as ResourceInUse
			 from (
				select a.ESFName,
					   b.OwnerName
				from ResourceESF a
				 join Resource b
				 on a.ResourceID = b.ResourceID
				where a.EsfType = 'Primary'
				  and b.OwnerName = UserNm
				  and b.Status = 'In Use'
			 ) a
		  group by a.ESFName
			) c
			on a.ESFName = c.ESFName
		   ) t;

  End $$
  
/**********************************************************
2. getDistance and getSearchResult
**********************************************************/  
 
 #Create getDistance function
  
DELIMITER ;;
  Drop FUNCTION if exists getDistance;;  
  
	
	Create FUNCTION getDistance(Lat1 decimal (10,3),
								Long1 decimal (10,3),
								Lat2 decimal (10,3),
								Long2 decimal (10,3))
	RETURNS Decimal(10,3)

	BEGIN

	   DECLARE Latdiff decimal(10,3);
	   DECLARE Longdiff decimal(10,3);
	   DECLARE Step1 decimal(10,3);
	   DECLARE Step2 decimal(10,3);
	   DECLARE Dist decimal(10,3);
	  
	   SET Latdiff = radians(Lat2-Lat1);
	   SET Longdiff = radians(Long2-Long1);
	   SET Step1 = power(sin(Latdiff/2),2) + cos(radians(Lat1))*(radians(Lat2))*power(sin(LongDiff/2),2);
	   SET Step2 = 2*atan2(sqrt(Step1),sqrt(1-Step1));
	   
	   SET Dist= 6371 * Step2;

	   RETURN Dist
       ;

	END;;
   
    
    DELIMITER ;;
  Drop procedure if exists getIncResource;;
  

  
  Create procedure getIncResource (In Inc_ID int,
								   In Dist decimal(10,3))
  Begin
  
	Declare Lat_I decimal(10,3);
    Declare Long_I decimal (10,3);
    
    select LatI into Lat_I
    from Incident where IncidentID = Inc_ID;
    
    select LongI into Long_I
    from Incident where IncidentID = Inc_ID;

    
     select a.*
     from 
      (
      select a.ResourceID as ID,
		     a.ResourceName as Name,
             a.OwnerName as Owner,
             a.Status,
             Concat(a.Cost,'/', a.CostUnit) as Cost,
             GetDistance(Lat_I,Long_I,a.LatR, a.LongR) as Distance,
             case when a.Status = 'Available' then Curdate()
                  when a.Status = 'In Use' then (select b.Returnby from Deployment b where b.ResourceID = a.ResourceID and b.DeployStatus = 1)
                  when a.status = 'In Repair' then (select c.Readyby from Repairs c where c.ResourceID = a.ResourceID and c.RepairStatus = 1)
                  end as NextAvailable             
	  from Resource a
      ) a
      where a.Distance <= Dist
      Order by a.Distance desc
      ;
  End;;
     
  
  /* Call getIncResource example
  
  Call getIncResource (28,3000)
  
  */

  
  
/**********************************************************
3. On Menu Form show Population, Jurisdiction, Headquarters
**********************************************************/  
  DELIMITER ;;
drop function if exists ERMSMenu;;



Create FUNCTION ERMSMenu(UserNm varchar(100))
RETURNS varchar(255)

BEGIN

   DECLARE UserTp char(1);
   DECLARE ShowValue varchar(255);
   SET UserTp := (select UserType from MasterUser where UserName = UserNm);

   IF UserTp = 'M' THEN
      SET ShowValue = (select Concat('Population: ', Population) from Municipality where UserName = UserNm);

   ELSEIF UserTp = 'G' THEN
      SET ShowValue = (select Concat('Jurisdiction: ', Jurisdiction) from Gvnagency where UserName = UserNm);

   ELSEIF UserTP = 'C' THEN
      SET ShowValue = (select Concat('Headquarters: ', Headquarters) from Company where UserName = UserNm);

   ELSE 
	  SET ShowValue = NULL;
   END IF;

   RETURN ShowValue;

END;; 

 
/**********************************************************
4. Search Resource by Keyword (name, model, capability),the select result is a dataset shown in Search Result Form.
**********************************************************/  
  DELIMITER ;;
Drop Procedure if exists getKeyResource;;



Create procedure getKeyResource(IN Kword varchar(255))
Begin
     select a.ResourceID as ID,
		    a.ResourceName as Name,
            a.OwnerName as Owner,
            a.Status,
            Concat(a.Cost,'/', a.CostUnit) as Cost
     from resource a
        
     where a.ResourceName like concat('%',Kword,'%')
	       or a.Model like concat('%',Kword,'%')
        
	 union 
	 
     select b.ResourceID as ID,
            b.ResourceName as Name,
            b.Ownername as Owner,
            b.Status,
            Concat(b.Cost,'/', CostUnit) as Cost
	 from resource b
       join  
            (
             select distinct ResourceID
             from Capability
             where CapabilityName like concat('%',Kword, '%')
			 ) c
	 on b.ResourceID = c.ResourceID         
	 ;
End;; 

/* call getKeyReource example

call getKeyResource('tent');

*/



/**********************************************************
5. Search Resource by ESF, the select result is a dataset shown in Search Result Form.
**********************************************************/  
 #Assume $ESF is input by user through the Application
   DELIMITER ;;
Drop procedure if exists getESFResource;;



Create procedure getESFResource (EsfNm varchar(100) )
 Begin
	  select distinct a.ResourceID as ID,
		     a.ResourceName as Name,
             a.OwnerName as Owner,
             a.Status,
             Concat(a.Cost,'/', a.CostUnit) as Cost
	  from Resource a
       join ResourceESF b
	  on a.ResourceID = b.ResourceID
      where b.EsfName = EsfNm
      ;
End;;

/* call getESFResource example

call getESFResource('#8 - Public Health and Medical Services');

*/
    
/**********************************************************
6. insert Resource
**********************************************************/  
Delimiter ;;

Drop function if exists insertResource;;

Create FUNCTION insertResource(R_Nm varchar(255),
                               Mdl varchar(50),
                               Lat_R Decimal(10,3),
                               Long_R Decimal(10,3),
                               OwnerNm varchar(100),
                               Cst Decimal(10,2),
                               CstUt varchar(20))
RETURNS int

BEGIN

   DECLARE getResourceID int;
   insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName, Cost, CostUnit)
               Values(R_Nm, 'Available', Mdl, Lat_R, Long_R, OwnerNm, Cst, CstUt);
               
   set getResourceID = (select max(ResourceID) from Resource where OwnerName = OwnerNm);
   
   RETURN getResourceID;

END;; 


/****************************************************************************
if you want to call the function:
select insertResource('Ambulance', '117', 35.44, 98.88, 'Smeagol', 100, 'Day');

the frontend clause should be:

select insertResource('$ResourceName', '$Model', 'LatR', '$LongR', '$OwnerName', '$Cost' '$CostUnit';

 ****************************************************************************/   
 

/**********************************************************
7. arrange repairs.
we might directly push a resource 'in repair' if it's availabel
or push it to 'Scheduled' if it's in use 
**********************************************************/  
DELIMITER ;;
Drop procedure if exists btnRepairs;;     

     
	  Create procedure btnRepairs(In R_ID int,
								   In I_ID int)
                                   
	  Begin
      DECLARE R_Status varchar(20);
	  Set R_Status = (select Status from Resource where ResourceID = R_ID);
	  IF (R_Status = 'Available')
      THEN
        Begin
         Insert into Repairs (
                              ResourceID, 
                              StartDt,
							  ReadyBy,
                              RepairStatus
                              )
		 Values (
                 R_ID,
                 Curdate(),
                 date_add(Curdate(),interval 5 Day),
                 1
                 );
		
         Update Resource a
         set a.Status = 'In Repair'
         where a.ResourceID = R_ID;
         End;
	  Elseif (R_Status = 'In Use')
      Then
         Begin
		  DECLARE D_Returnby Date;
          SET D_Returnby = (Select Returnby from Deployment where ResourceID = R_ID and IncidentID = I_ID and
                                                            DeployStatus = 1);
		  Insert into Repairs (
                               ResourceID,
							   StartDt,
                               ReadyBy,
                               RepairStatus
                               )
		  Values (
                  R_ID,
                  D_Returnby,
                  date_add(D_Returnby,interval 5 Day),
                  0
                  );
                               
         End;
          
      End if;     
		
        
	End;; 
 
/**********************************************************
8. Deployment for one's own
If the incident used the same resource in history, then deployment
cannot work, otherwise, when incident owner and resource owner
are the same the deployment can take into effect
**********************************************************/ 

Delimiter ;;

Drop function if exists btnDeployForSelf;;

  Create function btnDeployForSelf (R_ID int,
							         I_ID int
									)
  returns int
  
  Begin 
    Declare deployFlag int;
    Declare Priordeploy int;
    
    set Priordeploy = (select count(*) from deployment where ResourceID = R_ID and IncidentID = I_ID and DeployStatus = 0);
    
    If (Priordeploy > 0) then 
       Begin
           set deployFlag = 0;
		   return deployFlag;
       End;
	Else
       Begin
           /* insert new in deployment*/		   
           insert into Deployment
                     (ResourceID, IncidentID, StartDt, Returnby, DeployStatus)
			Values (R_ID, I_ID, Curdate(), Date_add(Curdate(), interval 10 day),1);
            
		   /* change the status of the resource*/           
           update Resource a
		   set a.Status = 'In Use'
			   where a.ResourceID = R_ID;	       
					  
           /* returns value*/
           set deployFlag = 1;
           return deployFlag;
       End;
    End if; 
  End;;
                              
/**********************************************************
9. Request 
If the incident used the same resource in history, i.e., has 
successful deployment before, then request cannot work, 
otherwise, when incident owner and resource owner
are the same the deployment can take into effect
**********************************************************/ 
 
Delimiter ;;

Drop function if exists btnRequest;;

  Create function btnRequest (R_ID int,
							   I_ID int
                              )
  returns int
  
  Begin
     Declare reqFlag int;
     Declare Priordeploy int;
  
     set Priordeploy = (select count(*) from deployment where ResourceID = R_ID and IncidentID = I_ID and DeployStatus = 0);
     
     If (Priordeploy > 0) then 
       Begin
        set reqFlag = 0;
		return reqFlag;
	   End;
	 Else 
	   Begin
		insert into Requests (ResourceID, IncidentID, Returnby, RequestStatus)
                    Values (R_ID,
                            I_ID,
                            date_add(Curdate(), interval 10 day),
                            0);
                            
		set reqFlag= 1;
        return reqFlag;
       End;
       
	  End if;
   
  End;;
  
  
/**********************************************************
10. Display "Resource in Use"
**********************************************************/ 
Delimiter ;;

Drop procedure if exists dispResourceInUse;;    

Create procedure dispResourceInUse (IN User_Nm varchar(100))

Begin
       select a.ResourceID as ID,
			  c.ResourceName,
              b.Description as Incident,
              c.OwnerName as Owner,
              a.StartDt,
              a.Returnby
		from Deployment a
           join Incident b
           on a.IncidentID = b.IncidentID
			   join Resource c
			   on a.ResourceID = c.ResourceID
                 where b.OwnerName = User_Nm
                 and a.DeployStatus = 1;

End;;


  
/**********************************************************
11. Display "Resources requested by me"
**********************************************************/ 
Delimiter ;;

Drop procedure if exists dispRequestsByMe;;

 create procedure dispRequestsByMe (IN User_Nm varchar(100))
 
 Begin
 select a.ResourceID as ID,
        c.ResourceName,
        b.Description as Incident,
        c.OwnerName as Owner,
        a.Returnby,
        c.Status /* added resource status, so that if it's 'in use' or 'in repair' then we hide deploy button*/
       from Requests a
         join Incident b
          on a.IncidentID = b.IncidentID
            join Resource c
             on a.ResourceId = c.ResourceID
              where a.RequestStatus = 0
               and b.OwnerName = User_Nm;
 End ;;
 
 
/**********************************************************
12. Display "Resources requests received by me"
**********************************************************/ 
 
Delimiter ;;

drop procedure if exists dispReceivedByMe;;

create procedure dispReceivedByMe (IN User_Nm varchar(100))

   Begin
     select a.ResourceID as ID,
            c.ResourceName,
            b.Description as Incident,
            b.OwnerName as Requestedby,
            a.Returnby
	   from Requests a
         join Incident b
          on a.IncidentID = b.IncidentID
           join Resource c
            on a.ResourceID = c.ResourceID
		where a.RequestStatus = 0
         and c.OwnerName = User_Nm;
    
   End;;
  
/**********************************************************
13. Display "Repairs Scheduled/In-progress"
**********************************************************/ 

Delimiter ;;

Drop procedure if exists dispInRepair;;

create procedure dispInRepair (IN User_Nm varchar(100))

   Begin
     select a.ResourceID as ID,
            b.ResourceName,
            a.StartDt,
            a.Readyby,
            case when a.RepairStatus = 0 then 'Scheduled' 
                 when a.RepairStatus = 1 then 'In Progress' end as Status
	   from Repairs a
         join Resource b
          on a.ResourceID = b.ResourceID
          where b.OwnerName = User_Nm
          and RepairStatus in (0,1);
    End;;
 


/**********************************************************
14. Return button (Action in Resource in Use)
**********************************************************/ 

Delimiter ;;

Drop procedure if exists btnReturnResource;;

create procedure btnReturnResource (IN R_ID int,
									In I_ID int)

   Begin
     Update Deployment a
            set a.DeployStatus =0
            where a.IncidentID = I_ID
			 and a.ResourceID = R_ID
             and a.DeployStatus = 1;
             
	
     Update Resource a
            set a.Status = 'Available'
            where a.ResourceID = R_ID;
     
     End;;
  
/**********************************************************
15. Cancel button (Action in Resources Requested by Me)
**********************************************************/ 
Delimiter ;;

Drop procedure if exists btnCancelRequest;;

Create procedure btnCancelRequest (IN R_ID int,
                                   IN I_ID int)
                                   
Begin
   delete from Requests
           where IncidentID = I_ID
           and ResourceID = R_ID
           and RequestStatus = 0;

End;;


/**********************************************************
16. Deploy button (Action in Resources Received by Me)
**********************************************************/
Delimiter ;;

Drop procedure if exists btnDeployForOthers;;

create procedure btnDeployForOthers (IN R_ID int,
									 IN I_ID int)
Begin
   insert into Deployment (ResourceID, IncidentID, StartDt, Returnby, DeployStatus)
               Values (R_ID,
                       I_ID,
                       Curdate(),
                       date_add(Curdate(),interval 10 day),
                       1);
	
    update Requests a
    set a.RequestStatus = 1
       where a.ResourceID = R_ID
         and a.INcidentID = I_ID;
                       
	Update Resource a
	Set a.Status = 'In Use'
        where a.ResourceID = R_ID;
End;;

/**********************************************************
17. Reject button (Action in Resources Received by Me)
**********************************************************/
Delimiter ;;

Drop procedure if exists btnReject;;

create procedure btnReject (IN R_ID int,
							IN I_ID int)
                            
Begin
  Update Requests a
  set a.RequestStatus = -1
  where a.ResourceID = R_ID
  and a.IncidentID = I_ID
  and a.RequestStatus = 0;
  
End;;

/**********************************************************
18. Cancel button (Action in Repairs Scheduled/In-progress)
**********************************************************/
Delimiter ;;

Drop procedure if exists btnCancelRepair;;

Create procedure btnCancelRepair (IN R_ID int)

delete 
    from Repairs
    where ResourceID = R_ID
    and RepairStatus = 0;
    

