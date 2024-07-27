import { LightningElement,api } from 'lwc';

export default class ChildComp extends LightningElement {
    //parent to child communication
    @api childCom;
    @api isMorning;
    showMessage(){
        console.log(this.isMorning);
        console.log(typeof(this.isMorning));
        console.log(`Type of IsMorning ${typeof(this.isMorning)}`)
    }
    @api showCustomMessage(){
        alert('child component not parameterized method fired');
    }
    @api showCustomerDetails(customerName){
        console.log(customerName);
        let customerD = {...customerName}
        alert('customer name is '+ customerD.firstName +' ' + customerD.lastName );
    }
    // child to parent communication using custom event

    sendMessage(){
        const customEvent = new CustomEvent('eventname', {     // event Name alwasy in lower case because when you use 
            detail : {message : "hey there what's up " , greeting : "good morning"}
        });
        this.dispatchEvent(customEvent);
    }
}