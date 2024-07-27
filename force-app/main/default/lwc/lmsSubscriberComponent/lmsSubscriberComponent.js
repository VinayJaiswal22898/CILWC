import { LightningElement,wire } from 'lwc';

// Import message service features required for subscribing and the message channel
import {
    subscribe,
    unsubscribe,
    APPLICATION_SCOPE,
    MessageContext,
} from 'lightning/messageService';
import myChannel from '@salesforce/messageChannel/MyMessageChannel__c';

export default class LmsSubscriberComponent extends LightningElement {
    @wire(MessageContext) messageContext;

    subscription = null;

    firstName;
    lastName;
    email;
    phone;
    connectedCallback(){
        if(!this.subscription){
            this.subscription = subscribe(
                this.messageContext,
                myChannel,
                (message) => this.handleMessage(message),
                { scope: APPLICATION_SCOPE }  
            );
           
        }
    }
    disconnectedCallback(){
        unsubscribe(this.subscription);
        this.subscription = null;
    }
    handleMessage(message){
        this.firstName = message.firstName;
        this.lastName = message.lastName;
        this.phone=message.phone;
        this.email = message.email;
    }

}