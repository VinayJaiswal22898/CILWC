import { LightningElement,api ,wire} from 'lwc';
import fetchContactRecords from '@salesforce/apex/ContactHandler.searchContact';
export default class SearchContact extends LightningElement {
    columns = [
        {label : 'Name', fieldName : 'Name'},
       {label:'Phone', phone : 'Phone'}
    ];
    
    searchkey = ' ';
    HandleOnChange(event){
        this.searchkey = event.target.value;
    }
    @wire(fetchContactRecords, {name: '$searchkey'} ) contacts ;   // wire as a property contacts is property
    // contacts is varibale to store data , dyncamic value use '$searchkey'
    // here is pass object like this {name: this.searchkey}  then only get first time value
   // contacts have two things {error, data}   contacts .data, contacts.error

// Wire as a function 

 
 /*    
    @api recordId;
@wire(fetchContactRecords, {accId: '$recordId'})

contacts
if(data){
        console.log('data',  data);
    }
    if(error){
        console.log('Error', error);
    }
}*/
}