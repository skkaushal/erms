Use ERMS;

/**********************************************************
1. Produce per user report
**********************************************************/

Drop Procedure if exists getReport;

Delimiter //

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

  End //
  
/**********************************************************
2. getDistance and getSearchResult
**********************************************************/  
 
 #Create getDistance function
Drop FUNCTION if exists getDistance;    
 
  DELIMITER //

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

	END; //
 
/**********************************************************
3. On Menu Form show Population, Jurisdiction, Headquarters
**********************************************************/  
drop function if exists ERMSMenu;

DELIMITER //

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

END; //


