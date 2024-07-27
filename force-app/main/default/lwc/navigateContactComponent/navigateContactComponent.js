import { LightningElement,track } from 'lwc';
import getContact from '@salesforce/apex/ContactManager.getContact';  // get method retrun a promiss
import { NavigationMixin }  from 'lightning/navigation';
export default class NavigateContactComponent extends NavigationMixin(LightningElement) {
    @track phoneSearch;
    @track emailSearch;
    handlePhoneOnChange(event){
       this.phoneSearch = event.target.value;
    }
    handleEmailOnChange(event){
        this.emailSearch = event.target.value;
    }
    navigateToContact(){
        getContact({conPhone : this.phoneSearch, conEmail : this.emailSearch })
        .then((result => {
            console.log(JSON.stringify(result[0].Id));
            //[{"Id":"003Ig000001iuWEIAY","Phone":"9810987541","Email":"vinayjaiswal22898@gmail.com"}]
            this[NavigationMixin.Navigate]({
                type : "standard__recordPage",
                attributes : {
                    objectApiName : 'Contact',
                    actionName : 'view',
                    recordId :result[0].Id
                }
            });
		}))
        .catch((error => {
			console.log(error);
		}))
    }
    }