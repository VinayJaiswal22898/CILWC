import { LightningElement } from 'lwc';
import createContact from '@salesforce/apex/ContactManager.createContact';
//import last_Name from '@salesforce/apexContactManager.createContact.Lastname';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ImperativeComponent extends LightningElement {
   lastName;
   firstName;
   result ;
   error;
   handleLastNameOnChnage(event){
this.lastName = event.target.value;
    }
    handleFirstNameOnChnage(event){
this.firstName = event.target.value;
    }
    handleCreateContact(){
        createContact({lastName : this.lastName, firstName : this.firstName})
        .then(result=>{
            this.result =result;
            this.error = undefined;
            console.log('then executed');
            const showNot = new ShowToastEvent({
                 title : 'Success',
                 variant: 'success',
                 message : 'Contact Created Successfully'
            });
            this.dispatchEvent(showNot);

        }).catch(error=>{
            this.error = error;
            this.result = undefined;
            console.log('error executed');
            const showNot = new ShowToastEvent({
                title : 'Error',
                variant : 'error',
                message : 'Error Ocurred'
            });
            this.dispatchEvent(showNot);
        })
        console.log('After Imperative');
    }
}