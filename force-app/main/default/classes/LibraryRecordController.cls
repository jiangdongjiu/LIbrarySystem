public with sharing class LibraryRecordController {
    // save library record
    @AuraEnabled
    public static Library_Record__c createLibraryRecord(Library_Record__c libraryRecordRecObj){
        try {
            insert libraryRecordRecObj;
            return libraryRecordRecObj;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    // get a list of all library records
    @AuraEnabled(cacheable=true)
    public static List<Library_Record__c> getItemsBorrowingHistory(){
        List<Library_Record__c> itemHistoryList = [SELECT Customer_Name__c,Item_Name__c,Return_Date__c,CreatedDate FROM Library_Record__c];
        return itemHistoryList;
    }

    // get a list of library records base on Customer Name, Email or Phone number, the customer have items checkedout
    @AuraEnabled(cacheable=true)
    public static List<Library_Record__c> getRecordsBaseOnCustomers(String strSearch){
        String strKey = '%' + strSearch + '%';
        List<Library_Record__c> recordsBasedOnCustomerInfo = [SELECT Customer_Name__c,Customer_Email__c,Customer_Phone__c,Item_Name__c,CreatedDate FROM Library_Record__c
            WHERE (Customer_Name__c like :strKey OR Customer_Email__c like :strKey OR Customer_Phone__c like :strKey) AND Is_Returned__c = False];
        return recordsBasedOnCustomerInfo;
    }
}
