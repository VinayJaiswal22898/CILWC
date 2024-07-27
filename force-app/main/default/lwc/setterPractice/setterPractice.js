import { LightningElement } from 'lwc';

export default class SetterPractice extends LightningElement 
{
    options = 
    [
        {label : 'Male' , value : 'Mr.' }, 
        { label : 'Female', value : 'Mrs.'}
    ];
    showFirstName ;
    showLastName;
    _gender;
    get gender(){
        return this._gender;
    }
    set gender(value)
    {
         this._gender = value;
         if(value){
            this.showFirstName = true;
            this.showLastName = true;
         }
         else{
            this.showFirstName = false;
            this.showLastName=false;
         }
    } 
    handleGender(event){
        this.gender = event.target.value;
    }
    firstName
    handleFirstName(event){
        this.firstName = event.target.value;
    }
    lastName
    handleLastName(event){
        this.lastName = event.target.value;
    }
    get formattedFirsNameLatName(){
        if(this.gender && this.firstName || this.lastName){
            return `${this.gender}  ${this.firstName} ${this.lastName}`;
        }
        return ' ';
    }
}