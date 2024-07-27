import { LightningElement } from 'lwc';

export default class CustomValidityComp extends LightningElement {
    phone;
    handlePhoneOnChnage(event){
    this.phone = event.target.value;
    }
    email;
    handleEmailOnChnage(event){
        this.email = event.target.value;
    }
    validate(){
        let cmps = this.template.querySelectorAll('lightning-input');
          if(cmps && cmps.length){
            for(let i=0; i<cmps.length; i++){
                let cmp = cmps[i];
                if(cmp.name === 'phone'){
                    if(!cmp.value){
                        cmp.setCustomValidity('Phone number should not be blank');
                    }
                    else {
                        if(!cmp.value.startsWith('+91')){
                            cmp.setCustomValidity('Phone number should contain county code');
                        }
                        else{
                            cmp.setCustomValidity('');
                        }
                    }
                    cmp.reportValidity();
                }
                if(cmp.name === 'email'){
                    if(!cmp.value){
                        cmp.setCustomValidity('Email should not be black ');
                    }
                    else{
                        if(!cmp.value.endsWith('@gmail.com')){
                            cmp.setCustomValidity('@ gamil should contain at the end');
                        }
                        else{
                            cmp.setCustomValidity('');
                        }
                    }
                    cmp.reportValidity();

                }
                
            }
          }
        }

    }