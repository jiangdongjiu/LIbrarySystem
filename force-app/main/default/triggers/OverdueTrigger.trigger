trigger OverdueTrigger on Library_Record__c (after insert, after update) {
  for (Library_Record__c record : Trigger.New){
    // condition => item not returned and due date is today
    if (!record.Is_Returned__c && record.Borrowing_Due_Date__c.format() == Date.today().format()){
      // send email to customer with overdue item, Call a utility method - sendMail from EmailManager class
      String emailAddress = record.Customer_Email__c;
      String emailSubject = 'Library Item Overdue Reminder';
      String emailContent = 'Dear ' + record.Customer_Name__c + ', \n\nLibrary item ' +
                            record.Item_Name__c + ' is overdue.';
      EmailManager.sendMail(emailAddress, emailSubject, emailContent);
    }
  }
}