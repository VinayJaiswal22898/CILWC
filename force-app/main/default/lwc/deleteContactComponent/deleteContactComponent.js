import { LightningElement,wire } from 'lwc';
import deleteContact from '@salesforce/apex/ContactHandler.deleteContact';
import LightningAlert from 'lightning/alert';
export default class DeleteContactComponent extends LightningElement {
 email;
 phone;
//@wire(deleteContact, {Email : '$email',  Phone :'$email' }) deleteContact;

handleEmailOnChange(event){
        this.email = event.target.value;
    }
    handlePhoneOnChange(event){
        this.phone = event.target.value;
    }
    handleDeleteContactOnClick() {
        deleteContact({ Email: this.email, Phone: this.phone })
            .then(() => {
                // Handle success
                console.log('Contact deleted successfully');
                this.showAlert('Seccess' , 'success', 'Contact Deleted');

            })
            .catch(error => {
                // Handle error
                console.error('Error deleting contact: ', error);
                this.showAlert('Error!', 'error', 'cont delete record');
            });
    }
    async showAlert(alertmessage, alertTheme, alertLabel){
        await LightningAlert.open({
            messgae : alertmessage,
            theme : alertTheme,
            label : alertLabel,
        });
    }
}