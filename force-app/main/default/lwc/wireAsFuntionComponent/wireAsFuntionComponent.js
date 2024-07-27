import { LightningElement,track,wire} from 'lwc';
import getContacts from '@salesforce/apex/ContactManager.getContact';

export default class WireAsFuntionComponent extends LightningElement {
 @track columns  = [ {label : 'Last Name' , fieldName : 'LastName'},
    {label: 'First Name', fieldName : 'FirstName'},
    {label: 'Phone', fieldName : 'Phone'}, {label:'Email',fieldName: 'Email'}];
  searchPhoneKey = ' ';
  searchEmailKey = ' ';
  @track contacts =[ ];
  @track error;
  handlePhoneOnChnage(event){
    this.searchPhoneKey = event.target.value;
    }
    handleEmailOnChnage(event){
this.searchEmailKey = event.target.value;
    }
    @wire(getContacts, {conPhone : '$searchPhoneKey', conEmail : '$searchEmailKey'  }) 
    wiredContact({data, error}){
        if(data){
            this.contacts =data;
            console.log(data);
        }
        if(error){
            console.log(error);
            this.error = error;
        }
    }

}