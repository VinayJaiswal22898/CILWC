import { LightningElement } from 'lwc';

export default class CustomEventParentComp extends LightningElement {
    receivedData ='';
    handlePassEvent(event){
    this.receivedData = event.detail;
    console.log('Data' +JSON.stringify(this.receivedData ));

    }
}