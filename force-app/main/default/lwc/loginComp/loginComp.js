import { LightningElement,api } from 'lwc';

export default class LoginComp extends LightningElement {
    @api userName;
    @api password
    handleUserNameOnChange(event){
        this.userName = event.target.value;
   
    }
    handlePasswordOnChange(event){
        this.password = event.target.value;
    }
    handleForgetPasswordOnClick(){
        
    }
    handleLogInOnClick(){

    }
}