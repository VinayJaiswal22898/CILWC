import { LightningElement } from 'lwc';

export default class ParentToChildPracticeComponent extends LightningElement {
    writeText;
    result;
    handleOnChnage(event){
        this.result = 'Text Result -';
        this.writeText = event.target.value;
    }
}