import { LightningElement , api,wire} from 'lwc';
import Description from '@salesforce/schema/Case.Description';
import CaseOrigin from '@salesforce/schema/Case.Origin';
import CaseStatusNoClose from '@salesforce/apex/CaseManager.CaseStatusNoClose';


export default class CaseDetail extends LightningElement {
    @api statusArray =[ ];
    @api selectedCaseOrigin;
    @api selectedCaseStatus;
    @api selectedDescription;

    @wire(Description) description;
    @wire (CaseOrigin) caseorigin; 
    @wire(CaseStatusNoClose)
    wiredStatusOptions({ error, data }) {
        if (data) {
            this.statusArray = data.filter(option => option.value !== 'Closed');
        } else if (error) {
            this.error = error;
        }
    }

}