import { LightningElement , track,wire} from 'lwc';
import { getListUi } from "lightning/uiListApi";
import Account from "@salesforce/schema/Account";
export default class UiListApiComponent extends LightningElement {
      columns  = [{label: "Name", fieldName : 'Name'},{label: "Rating", fieldName: "Rating"}, {label : 'AnnualRevenue', fieldName : 'AnnualRevenue'},
    {label : "Rating", fieldName: "Rating"}, {label: "Active", fieldName : "Active__c"}];
      @track accounts = [ ];
     @wire(getListUi, {objectApiName : Account, listViewApiName : "AllAccounts"})
     wiredAccount({data, error}){
        if(data){
            console.log(JSON.stringify(data));
            console.log(JSON.stringify(data.records.records[0].fields.Name.value));
           
           for(let i =0; i<data.records.records.length; i++){
            let recordValue =data.records.records[i].fields;
            //let record = recordValue.Name.value;
            let record = {Name :recordValue.Name.value, Rating : recordValue.Rating.value, 
                AnnualRevenue : recordValue.AnnualRevenue.value,
            Rating : recordValue.Rating.value, Active__c : recordValue.Active__c.value };
            this.accounts.push(record);
           }
            this.accounts = [...this.accounts];
        }
        if(error){
            console.log(error);
        }
     }
}