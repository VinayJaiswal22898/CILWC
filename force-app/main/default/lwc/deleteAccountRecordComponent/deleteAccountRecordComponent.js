import { LightningElement,api } from 'lwc';
import{ deleteRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from "lightning/platformShowToastEvent";

import{NavigationMixin} from 'lightning/navigation';

export default class DeleteAccountRecordComponent extends NavigationMixin( LightningElement)  {
    @api recordId;
    @api objectApiName;
    handleDeleteOnClick(){
        deleteRecord(this.recordId)
        .then(()=>{
            this.disPatchEvent(new ShowToastEvent({
                title : 'Success',
                message : ' Delete Successfully',
                variant: 'success'
            }));   
        })
        .catch(()=>{
           this.disPatchEvent(new ShowToastEvent({
            title : 'Error',
            message : 'error occurred',
            variant: 'error'
           }));
        })
    }
}