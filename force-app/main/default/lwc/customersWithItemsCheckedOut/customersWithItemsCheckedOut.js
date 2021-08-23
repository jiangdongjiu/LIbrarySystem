import { LightningElement, wire, track } from 'lwc';
import getRecordsBaseOnCustomers from '@salesforce/apex/LibraryRecordController.getRecordsBaseOnCustomers';

const columns = [
  { label: 'Customer', fieldName: 'Customer_Name__c' },
  { label: 'Email', fieldName: 'Customer_Email__c' },
  { label: 'Phone', fieldName: 'Customer_Phone__c' },
  { label: 'Item', fieldName: 'Item_Name__c' },
  { label: 'Created Date', fieldName: 'CreatedDate', type: 'date' },
];

export default class CustomersWithItemsCheckedOut extends LightningElement {
  @track searchKey;
  @wire (getRecordsBaseOnCustomers, {strSearch: '$searchKey'}) records;
  columns = columns;

  handleKeyChange(event){
    this.searchKey = event.target.value;
  }
}