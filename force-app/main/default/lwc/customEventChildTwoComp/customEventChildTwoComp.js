import { LightningElement } from 'lwc';

export default class CustomEventChildTwoComp extends LightningElement {
    connectedCallback() {
        let childEvent = new CustomEvent('childevnt',{
            detail: 'This is child event',
            bubbles: true,
            composed:true
        });
        this.dispatchEvent(childEvent);
    }
}