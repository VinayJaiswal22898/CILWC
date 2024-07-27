import { LightningElement } from 'lwc';

export default class CustomEventParentTwoComp extends LightningElement {
 
    connectedCallback() {
        this.template.addEventListener('childevnt', (event)=>{
         console.log('In Parnet : ' + event.detail);
         event.stopPropagation();
        }, false);
        }
   /*
        connectedCallback() {
            this.template.addEventListener('childevnt',this.this.handleButtonClick.bind(this) , false);
            }

        // or 
        handleButtonClick(event){
            console.log('IN Parent :' + event.detail);
        }

        */
}