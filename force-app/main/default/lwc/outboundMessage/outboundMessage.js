import { LightningElement,api } from 'lwc';

export default class OutboundMessage extends LightningElement {
   @api outmessage = 'hello from OutboundMessage';

   inputKey;
    handleOnChange(event){
    this.inputKey = event.target.value; 
    }
    
}