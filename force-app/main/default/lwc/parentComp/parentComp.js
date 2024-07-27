import { LightningElement } from 'lwc';

export default class ParentComp extends LightningElement {
        // parent to child communication
    parentComp;
    isMorning = true;
    handleOnClick(){
        this.parentComp = 'Value has been assigned from parent comp';
    }

    callCustomMessage(){
        var invokeCustomMessage = this.template.querySelector('c-child-comp');
        invokeCustomMessage.showCustomMessage();
    }
    callCustomerDetails(){
        const invokeCustomerMessage = this.template.querySelector('c-child-comp');
        const params = {'firstName': 'ram', 'lastName': 'kumar'};
        invokeCustomerMessage.showCustomerDetails(params);
    }
    // chidl to parent communication using custom event
    childEventMessage;
    childEventGreeting;
    childEventHandle(event){
this.childEventMessage = event.detail.message;
this.childEventGreeting = event.detail.greeting;
    }
}