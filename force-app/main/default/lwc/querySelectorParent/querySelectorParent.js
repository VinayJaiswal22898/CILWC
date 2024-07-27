import { LightningElement } from 'lwc';

export default class QuerySelectorParent extends LightningElement {
    fetchValueOnClick(){
   this.template.querySelector('c-query-selector-child').handleOnClick();

}
}