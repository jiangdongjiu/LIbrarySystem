trigger ReturnDateAndIsReturnTrigger on Library_Record__c (before insert, before update) {
  if(Trigger.isInsert && Trigger.isBefore){
      for(Library_Record__c record : Trigger.new){
          record.Return_Date__c = null;
          record.Is_Returned__c = False;
      }
  }


  if(Trigger.isUpdate && Trigger.isBefore){
      for(Library_Record__c record : Trigger.new){
          if(record.Is_Returned__c = True){
             record.Return_Date__c = date.today();
         }
      }
  }
}