import { LightningElement ,track} from 'lwc';
import getContact from '@salesforce/apex/ContactManager.getContact';
//import conName from '@salesforce/schema/Contact.Name';
const columns = [
    { label: 'Name', fieldName: 'Name', type: 'Text' },
    { label: 'Email', fieldName: 'Email', type: 'Text' },
];

export default class RenderedCallBack extends LightningElement {
@track contacts;
   @track error;
     /* 
   @ track columns = columns;

    renderedCallback(){
        getContact( )
        .then (result => {
            console.log('result :' + JSON.stringify(result));
            this.contacts = result;
            this.error = undefined;
        })
        .catch(error => {
            console.log('error: ' +error);
            this.contacts = undefined;
            this.error = error;
        });
    }
   */
}