import { LightningElement, track, wire } from 'lwc';
import getAccount from '@salesforce/apex/WrapperClassLWC.getAccount';
export default class PassingObjectOfAnArrayToApexClass extends LightningElement {
    @track AccountList = [];
    AccountName;
    error;
    handleOnChnage(event) {
        this.AccountList = event.target.value;
    }
    handleOnClick() {
        user = {
            personOne: ['Gaurav', 'Bhatia', 'sfdc'],
            personTwo: ['Tejasvi', 'Jai', 'MERN']
        };

    }
    @wire(getAccount, { w: '$user' })
    accountRecords({ error, data }) {
        if (data) {
            this.AccountList = data;
            this.error = undefined;
            console.log('Account Data : ' + JSON.stringify(data));
            console.log(this.AccountList);
        }
        else if (error) {
            this.error = error.body.message;
            this.data = undefined;
        }
    }
}