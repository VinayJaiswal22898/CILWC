import { LightningElement ,api} from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import{ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class CreateAccountRecordComponent extends LightningElement {
    
    @api accName;
    @api accPhone;
    @api accRating;
    handleNameOnChange(event){
        this.accName = event.target.value;

    }
    handlePhoneOnChange(event){
        this.accPhone = event.target.value;
    }
    handleRatingOnChange(event){
        this.accRating = event.target.value;
       
    }
    handleOnClick(){
      const fields = {
        'Name' : this.accName,
        'Phone' : this.accPhone,
        'Rating': this.accRating
      };
      const recordInput = {
        apiName : 'Account', fields
      };
      createRecord(recordInput).then(result=>{
        this.dispatchEvent(new ShowToastEvent({
            title: 'Success',
            variant : 'success',
            message : 'Created Successfully'
        }));
        console.log('Account Record Id is ' + result.id);

    }).catch(error=>{
        this.dispatchEvent(new ShowToastEvent({
            title : 'error',
            variant: 'error',
            mode:'dismissable',
            message: 'error occured while inserting record'

        }));
     console.log('err'+ error);
    })
    }
 

}