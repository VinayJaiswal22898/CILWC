import { LightningElement ,wire} from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import myChannel from '@salesforce/messageChannel/MyMessageChannel__c';

export default class LmsPublisher extends LightningElement {
    firstName;
    lastName;
    email;
    phone;
    @wire(MessageContext) messageContext;

    handleFirstName(event){
        this.firstname = event.target.value;
    }
    handleLastName(event){
        this.lastName = event.target.value;
    }
    handlePhone(event){
        this.phone = event.target.value;
    }
    handleEmail(event){
        this.email = event.target.value;
    }
    publishData(){
        let message ={
            firstName : this.firstName,
            lastName : this.lastName,
            phone : this.phone,
            email : this.email
        }
        publish(this.messageContext, myChannel, message);
    }
}