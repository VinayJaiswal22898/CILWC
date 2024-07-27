import { LightningElement ,api} from 'lwc';
import Status_Field from '@salesforce/schema/Case.Status';
import Origin_Field from '@salesforce/schema/Case.Origin';

export default class RecordViewFormComponent extends LightningElement {
    status =Status_Field;
    origin =Origin_Field;
    @api recordId;
    //@api objectApiName;
}