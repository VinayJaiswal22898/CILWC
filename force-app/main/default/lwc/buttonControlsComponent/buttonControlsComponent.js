import { LightningElement } from 'lwc';

export default class ButtonControlsComponent extends LightningElement {
    showButtonName;
    handleOnClick(event){
     this.showButtonName = event.target.label;
    }
}