import { LightningElement } from 'lwc';

export default class GetterComp extends LightningElement {
    firstName = 'Ram';
    lastName = 'Jaiswal';
    message = "Hey what's up "
    greeting = 'Morning';
    //messageToBeShown; // good morning Ram Jaiswal , Hey what's up
    get messageToBeShown(){  // messageToBeShown this is variable as a function 
      return `<b><i> good ${this.greeting}  ${this.firstName} ${this.lastName}, ${this.message}</i> </b>`;
    }
    firstNameOnChnage(event){
        this.firstName = event.target.value;
    }
    lastNameOnChnage(event){
        this.lastName = event.target.value;
    }
}