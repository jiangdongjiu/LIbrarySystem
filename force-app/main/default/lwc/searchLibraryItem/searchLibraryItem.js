import { LightningElement, wire, track } from 'lwc';
import getItems from '@salesforce/apex/LibraryItemsApexController.getItems';

const columns = [
  { label: 'Name', fieldName: 'Name' },
  { label: 'Type', fieldName: 'Type_Name__c' },
  { label: 'Status', fieldName: 'Status__c' },
  { label: 'Barcode', fieldName: 'Barcode_Characters__c' },
];

export default class SearchLibraryItem extends LightningElement {
  @track searchKey;
  @wire (getItems, {strSearch: '$searchKey'}) items;
  columns = columns;

  handleKeyChange(event){
    this.searchKey = event.target.value;
  }
}