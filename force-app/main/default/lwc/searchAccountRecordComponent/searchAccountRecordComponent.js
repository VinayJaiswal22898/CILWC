import { LightningElement,api,wire } from 'lwc';
import searchAccount from '@salesforce/apex/AccountManager.searchAccounts';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import fieldName from '@salesforce/schema/AccountHistory.Field';

export default class SearchAccountRecordComponent extends LightningElement {
    searchKey = ' ';
   
    @api allAccountRecords; 
    columns =[ {label : 'Name', fieldName : 'Name'},
        {label : 'Rating', fieldName: 'Rating'},
        {label: 'Phone', fieldName : 'Phone'},
        {label: 'AnnualRevenue', fieldName: 'AnnualReveune'},
        {label: 'Fax', fieldName : 'Fax'},
        {label: 'type', fieldName: "Type"},
        {label:'Industry', fieldName : 'Industry'}];

        handleAccountnameOnChange(event){
            this.searchKey = event.target.value;
           }

       @wire (searchAccount, {accountName : '$searchKey'})
       getAccountRecords({data, error}){
        if(data){
            this.allAccountRecords = data;
        }
        else{
            console.log(error);
        }
       }
}

/* const showSuccessMessage = new ShowToastEvent({
                title: 'Success',
                variant: 'success',
                mode: 'dismissable',
                message : 'Record Loaded Successfully'
            });
            this.dispatchEvent(showSuccessMessage);*/