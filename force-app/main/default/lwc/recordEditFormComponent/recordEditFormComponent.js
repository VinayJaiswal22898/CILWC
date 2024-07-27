import { LightningElement,api } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import{ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class RecordEditFormComponent extends LightningElement {
    nameFiled = NAME_FIELD;
    phoneField = PHONE_FIELD;

    @api recordId;
    @api objectApiName;
    handleOnSuccess(){
        const successNot = new ShowToastEvent({
            title : 'Success',
            message : 'Successfully Update',
            //mode:'dismissable',
            variant : 'success'
        });
        this.dispatchEvent(successNot);

    }
}