import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
    receivedValue = ' ';
    handleOnInputEvent(event){
        this.receivedValue =event.detail;
    }
}