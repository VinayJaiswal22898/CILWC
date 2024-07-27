import { LightningElement,api } from 'lwc';

export default class ShowRecordDetailsComponent extends LightningElement {
    @api recordId;
    @api objectApiName;
}