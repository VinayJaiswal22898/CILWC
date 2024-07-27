import { LightningElement ,api} from 'lwc';

export default class QuerySelectorChild extends LightningElement {
    fname;
    lName;
    email;
    address;
    handleFirstName(event){
        this.fname = event.target.value;
    }
    handleLastName(event){
        this.lName = event.target.value;
    }
    handleEmail(event){
        this.email = event.target.value;
    }
    handleAddress(event){
        this.address = event.target.value;
    }
    handleOnClick(){

    }
}