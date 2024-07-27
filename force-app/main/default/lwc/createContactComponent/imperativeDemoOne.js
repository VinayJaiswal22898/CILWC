import { LightningElement } from 'lwc';
import contactCreation from  '@salesforce/apex/ContactHandler.contactCreation';
import  LightningAlert from 'lightning/alert';
export default class ImperativeDemoOne extends LightningElement {
    firstName;
    lastName;
    phone;
    email;
    handleFirstName(event){
        this.firstName=event.target.value;
    }
    handleLastName(event){
        this.lastName = event.target.value;

    }
    handlePhoneNumber(event){
        this.phone = event.target.value;
    }
    handleEmailId(event){
        this.email = event.target.value;
    }
    handleOnClick(){
        contactCreation({
            firstName: this.firstName,
            lastName :this.lastName,
            phone : this.phone,
            emailId : this.email
        })
        .then(response => {
            this.showAlert('Contact Created', 'success' , 'Success',);

            console.log('Contact reacted Successfully-' + JSON.stringify(response));

        })
        .catch(error =>{
            this.showAlert('Error!  ' , 'error' , 'Error' );
            console.log('Error while creating Contact-' + JSON.stringify(error));
        });
    }
    async showAlert(alertMessage, alertTheme ,alertLabel  ){
        await LightningAlert.open({
            message : alertMessage,
            theme: alertTheme,
            label : alertLabel,
        });

    }
}