import { LightningElement, api} from 'lwc';
import Name_Field from '@salesforce/schema/contact.Name';
import Phone_Field from '@salesforce/schema/contact.Phone';

export default class LdsContactViewFrom extends LightningElement {
    @api recordId= '003Ig000001iMdwIAE';

    fields = [Name_Field,Phone_Field];
   nameField = Name_Field;
   phoneField =Phone_Field;

}