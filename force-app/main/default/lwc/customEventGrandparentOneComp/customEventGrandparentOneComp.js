import { LightningElement } from 'lwc';

export default class CustomEventGrandparentOneComp extends LightningElement {
    hadleChildEvent(event){
        console.log('In Grand parent :' + event.detail);
    }
}