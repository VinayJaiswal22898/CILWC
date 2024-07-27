import { LightningElement } from 'lwc';

export default class CustomEventParentOneComp extends LightningElement {
    handleChildEvent(event){
        console.log('In parent : ' + event.detail);
       event.stopPropagation();
       //event.preventDefault();

    }
}