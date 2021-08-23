import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import LIBRARY_RECORD_OBJECT from '@salesforce/schema/Library_Record__c';
import RECORD_CUSTOMER_FIELD from '@salesforce/schema/Library_Record__c.Library_Customer__c';
import RECORD_ITEM_FIELD from '@salesforce/schema/Library_Record__c.Library_Item__c';

export default class AccountCreator extends LightningElement {
    objectApiName = LIBRARY_RECORD_OBJECT;
    fields = [RECORD_CUSTOMER_FIELD, RECORD_ITEM_FIELD];
    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "Library Borrowing Record created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
}