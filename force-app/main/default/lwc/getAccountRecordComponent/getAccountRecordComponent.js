import { LightningElement ,api,wire} from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import Name_Field from '@salesforce/schema/Account.Name';
import Phone_Field from '@salesforce/schema/Account.Phone';
 
const FIELDS = [Name_Field,Phone_Field];
export default class GetAccountRecordComponent extends LightningElement {

    @api recordId;
    @api accountRecord;
    @api fields;
    accName;
    accPhone;


    @wire(getRecord,{recordId : '$recordId', fields : FIELDS }) 
    wireRecord({ data,error }){
        if(data){
            this.accountRecord = data;
            this.accName  = this.accountRecord.fields.Name.value;
            this.accPhone = this.accountRecord.fields.Phone.value;
        }
        else if (error){
            console.log('error', error);
        }
    }

}