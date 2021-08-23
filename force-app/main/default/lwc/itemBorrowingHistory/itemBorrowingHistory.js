import { LightningElement, wire, track } from 'lwc';
import getItemsBorrowingHistory from '@salesforce/apex/LibraryRecordController.getItemsBorrowingHistory';

const columns = [
  { label: 'Item', fieldName: 'Item_Name__c' },
  { label: 'Customer', fieldName: 'Customer_Name__c' },
  { label: 'Return Date', fieldName: 'Return_Date__c' },
  { label: 'Created Date', fieldName: 'CreatedDate', type: 'date' },
];

export default class SearchLibraryItem extends LightningElement {
  @wire (getItemsBorrowingHistory) itemsHistory;
  columns = columns;
}