import { LightningElement } from 'lwc';

export default class CustomEventGrandparentTwo extends LightningElement {
   connectedCallback() {
   this.template.addEventListener('childevnt', (event)=>{
    console.log('In GrandParnet : ' + event.detail);
   }, true);
   }
}