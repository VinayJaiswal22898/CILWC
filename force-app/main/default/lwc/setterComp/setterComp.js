import { LightningElement } from 'lwc';

export default class SetterComp extends LightningElement {
    options = [
        {label : 'India', value : '+91'},
        {label : 'Pakistan', value : '+92'},
        {label : 'USA', value : '+1'},
        {label : 'UAE', value : '+971'}
    ];
formatedPhoneNumber = "  Test Data ";
    get countryCode(){
        return this._CountryCode; // it become read only so for that reason we have to first make shadow
        //variable then assing the set valuye to that variable to make consistent
    }
    set countryCode(value){
        this._CountryCode = value;
      this.formatedPhoneNumber = value + '-' + this.phone;
    }
    _CountryCode;  // shadow variable 

    handleOnCountryChnage(event){
      this.countryCode = event.target.value;
    }

    handlePhoneNumber(event){
     this.phone = event.target.value;
    }
}