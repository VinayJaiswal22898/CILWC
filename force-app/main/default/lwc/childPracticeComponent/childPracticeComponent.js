import { LightningElement ,api} from 'lwc';

export default class ChildPracticeComponent extends LightningElement {
    @api childResult;
    @api childText;
}