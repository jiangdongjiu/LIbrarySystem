trigger OverdueTrigger on Library_Record__c (after insert, after update) {
  for (Library_Record__c record : Trigger.New){
    // condition => item not returned and due date is today
    Library_Record__c libraryRecordRecObj = [SELECT Is_Returned__c, Borrowing_Due_Date__c,
                                                    Customer_Email__c, Customer_Name__c,
                                                    Item_Name__c
                                                    FROM Library_Record__c
                                                    WHERE Id = :record.Id];
    if (!libraryRecordRecObj.Is_Returned__c && libraryRecordRecObj.Borrowing_Due_Date__c == date.today()){
      // send email to customer with overdue item, Call a utility method - sendMail from EmailManager class
      String emailAddress = libraryRecordRecObj.Customer_Email__c;
      String emailSubject = 'Library Item Overdue Reminder';
      String emailContent = 'Dear ' + libraryRecordRecObj.Customer_Name__c + ', \n\nLibrary item ' +
                            libraryRecordRecObj.Item_Name__c + ' is overdue.';
      EmailManager.sendMail(emailAddress, emailSubject, emailContent);

    }
  }
}