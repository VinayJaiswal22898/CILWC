import { LightningElement } from 'lwc';
import{NavigationMixin} from 'lightning/navigation';
export default class NavigationURLComponent extends NavigationMixin(LightningElement) {

    HandleViewContact(){
        this[NavigationMixin.GenerateUrl]({
            type : 'standard__recordRelationshipPage',
            attributes : {
                objectApiName : 'Account',
                recordId : '0012w00001OCUGpAAP',
                relationshipApiName : 'Contacts',
                actionName : 'view'
            }
        }).then(url =>{
            window.open(url);
        })
    }

}