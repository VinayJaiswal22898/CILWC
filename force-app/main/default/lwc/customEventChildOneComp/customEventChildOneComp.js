import { LightningElement } from 'lwc';

export default class CustomEventChildOneComp extends LightningElement {
    connectedCallback(){
        let childEvent = new CustomEvent('childevent', {
            detail: 'value from child', 
            bubbles : true, 
            composed : true, 
            cancelable:true
        });
        this.dispatchEvent(childEvent);
    }
}