import { LightningElement } from 'lwc';

export default class HtmlComponent extends LightningElement {
    options = ['Male', 'female'];

    handleGender(event){
        this.options = event.target.values;
    }
}