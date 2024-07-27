import { LightningElement ,api} from 'lwc';
import{ShowToastEvent} from 'lightning/platformShowToastEvent';
import Name_Field from '@salesforce/schema/account.name';
import Phone_Field from '@salesforce/schema/account.phone'; // if don mention filed name then it will get all field
export default class RecordFormComponent extends LightningElement {
 fileds  = [Name_Field , Phone_Field];
    @api recordId;
    @api objectApiName;

    handleONSuccess(){
        const notification = new ShowToastEvent({
            title: 'Success',
            variant:'success',
            message : 'Record Updated Successfully',
            mode : 'dismissable'
        });
        this.dispatchEvent(notification);

    }
}