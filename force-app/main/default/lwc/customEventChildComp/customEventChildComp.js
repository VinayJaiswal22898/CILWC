import { LightningElement } from 'lwc';

export default class CustomEventChildComp extends LightningElement {
    handleFireEventOnClick(){
        const custEvent = new CustomEvent('passevent',{
            detail : {Name: 'Tejasvi'}
        });
        this.dispatchEvent(custEvent);

        /*
         this.dispatchEvent(new CustomEvent('passEvent',{
            detail : {Name: 'Tejasvi'}
        }));
        */

    }
}