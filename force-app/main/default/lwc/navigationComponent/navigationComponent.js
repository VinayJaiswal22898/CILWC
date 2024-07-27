import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
 
export default class NavigationComponent extends NavigationMixin(LightningElement) {
 
    createContactOnClick() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'new'
            },
        });
    }
    // Navigation to record page
    viewContactOnClick(){
        this[NavigationMixin.Navigate]({
            type : "standard__recordPage",
            attributes : {
                objectApiName : 'Contact',
                actionName : 'view',
                recordId : "003Ig000001iuWEIAY"
            }
        });
    }
    editContactOnClick(){
        this[NavigationMixin.Navigate]({
            type: "standard__objectPage",
            attributes: {
                objectApiName : 'Contact',
                actionName : 'edit',
                recordId : "003Ig000001iuWEIAY"
            }
        });
    }
    listViewContacts(){
        this[NavigationMixin.Navigate]({
            type : "standard__objectPage",
            attributes : {
                objectApiName : "Contact",
                actionName : 'list'
            },
            state : {
                filterName : 'AllContacts'   // if dont mention any filter then by default recent
            }
        });
    }

    viewRelatedContactOfAccount(){
        this[NavigationMixin.Navigate]({
            type: "standard__recordRelationshipPage",
            attributes : {
                objectApiName : 'Account',
                recordId : "001Ig000004gWxZIAU",
                relationshipApiName : 'Contacts',
                actionName : 'view'
            }
        });
    }

}