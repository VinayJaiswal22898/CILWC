import { LightningElement } from 'lwc';

export default class SetterDemo extends LightningElement 
{
    options = [
        { label: 'India', value: '+91' },
        { label: 'Pakistan', value: '+92' },
        { label: 'None', value: null }
    ];    
showPhoneNumberSection;
get countryCode() {
 return this._countryCode;
}
set countryCode(value){
 this._countryCode = value;
this.showPhoneNumberSection = value? true : false;
}
_countryCode;

handleCountry(event){
 this.countryCode =event.target.value;
}
phone;
handlePhone(event){
       this.phone = event.target.value;
}
get formattedPhoneNumber(){
    if(this.countryCode && this.phone){
        return `${this.countryCode} - ${this.phone}`;
    }
    return ' ';
}
}