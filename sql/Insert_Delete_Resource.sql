Use ERMS;

#3.Insert New Resource and show the New Resource after hit Save button
 #Assume $ResourceName, $Model, $LatR, $LongR, $OwnerName, $Cost, $CostUnit, $Capability, $Add_PESF,$Add_AESF are fed from the Application  
 #We may consider using Last_INSERT_ID() in place of (select max(ResourceID) from Resource where OwnerName = $OwnerName),
 #for single user it's correct, but multi users, multi instances needed to be test first to determine if Last_INSERT_ID() 
 #returns the correct ResourceID. 
 
   #insert a resource to Resource table
   insert into Resource (ResourceName, Status, Model, LatR, LongR, OwnerName,Cost, CostUnit)
	           Values ($RecourceName, 'Available', $Model, $LatR, $LongR, $OwnerName,$Cost, $CostUnit)
   ;
 
      
   #insert Primary ESF   
   insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values ((select max(ResourceID) from Resource where OwnerName = $OwnerName), $Add_PESF, 'Primary')
   ;
   
   #insert Additionary ESF
   For each $AddESF
   insert into ResourceESF (ResourceID, ESFName, ESFType)
               Values ((select max(ResourceID) from Resource where OwnerName = $OwnerName), $Add_AESF, 'Additional')
   ;
   End For
   ;
   
   #insert Capacity info
   For each $Capability
   insert into Capability(ResourceID,CapabilityName)
			   Values ((select max(ResourceID) from Resource where OwnerName = $OwnerName), $CapacityName)
   ;
   End For
   ;
   
   #Show Resource ID
    #In theory, all Resource related attributes should appear in a select clause, since we do not to "refresh" them except 
    #the ResourceID to the Application Users, we just include ResourceID in the Select clause
   Select max(ResourceID) as ResourceID
   from Resource
   where OwnerName = $OwnerName
   ;

#4. When hit Cancel to delete the record just entered
#suppose $ResourceID is caught from the frontend;
   
   Delete 
        from Capability
        where ResourceID = $ResourceID;

   Delete
        from ResourceESF
        where ResourceID = $ResourceID;

   Delete
        from Resource
        where ResourceID = $ResourceID;
   
   