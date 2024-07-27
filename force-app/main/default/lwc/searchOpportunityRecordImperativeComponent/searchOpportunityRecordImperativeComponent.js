import { LightningElement,track } from 'lwc';
import searchOpportunity from '@salesforce/apex/OpportunityManager.searchOpportunity';

const tableColumns = [{label : 'Opportunity Name' , fieldName : 'Name'},
    {label: 'Stage Name', fieldName : 'StageName'},
    {label : 'Amount', fieldName : 'Amount'},
    {label: 'Close Date', fieldName : 'CloseDate'}
];
export default class SearchOpportunityRecordImperativeComponent extends LightningElement {
    @ track showAllOppRecord;
    @track cols = tableColumns;
    handleOpportunityOnClick(){
        searchOpportunity().then(result =>{
            this.showAllOppRecord = result;
        }).catch(error =>{
            this.showAllOppRecord= error;
        })

    }
}