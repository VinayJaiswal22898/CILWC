import { LightningElement, track, api } from 'lwc';
import searchAccounts from '@salesforce/apex/AccountManager.searchAccounts';

export default class PromissComp extends LightningElement {

    @track searchkey;
    @track acounts = [];
    error;
    resultFound = false;
    // this is using async function 
    seachAccountNameAsync;

    handleSearchOnChangeAsync(event) {
        this.seachAccountNameAsync = event.target.value;
    }
    async handleSearchAsync() {
        try {
            console.log('Hi I am before await keyword');
            this.acounts = searchAccounts({accountName:this.seachAccountNameAsync});
            console.log(JSON.stringify(this.acounts));
            console.log('hi I will only print when resutl has been fetched');
            this.resultFound = this.acounts.length > 0;
        }
        catch (error) {
            this.error = error;
            this.acounts = undefined;
        }
    }

    // this is using promiss 
    seachAccountNamePromise;
    handleSearchOnChangePromise(event) {
        this.seachAccountNamePromise = event.target.value;
    }
    handleSearchPromise() {
        searchAccounts({ accountName: this.seachAccountNamePromise })
            .then((data) => {
                console.log('Hi i am inside promise');
                this.acounts = data;
                console.log(JSON.stringify( this.acounts ));
                this.resultFound = this.acounts.length > 0;
                this.error = undefined;
            })
            .catch((error) => {
                this.error = error;
                this.acounts = undefined;
            });

        console.log('hi this will run immedaite without waiting for the promse ');
    }

}