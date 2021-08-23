public with sharing class LibraryItemsApexController {
    // Get Items base on SearchKey
    @AuraEnabled(cacheable=true)
    public static List<Library_Item__c> getItems(String strSearch){
        String strKey = '%' + strSearch + '%';
        List<Library_Item__c> itemList = [SELECT Name,Type_Name__c,Status__c,Barcode_Characters__c FROM Library_Item__c
            WHERE Name like :strKey OR Type_Name__c like :strKey OR Status__c like :strKey];
        return itemList;
    }
}
