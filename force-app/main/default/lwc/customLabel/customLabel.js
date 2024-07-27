import { LightningElement } from 'lwc';
import greeting from '@salesforce/label/c.LWC_Greeting';
export default class CustomLabel extends LightningElement {
    greeting = greeting;
}