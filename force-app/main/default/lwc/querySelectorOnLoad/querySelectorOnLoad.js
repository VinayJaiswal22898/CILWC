import { LightningElement } from 'lwc';

export default class QuerySelectorOnLoad extends LightningElement {
    firstRenderingDone =false;
    renderedCallback(){
        if(this.firstRenderingDone === false){
            let valueChild = this.template.querySelector('c-query-selector-on-load-child').value;
            console.log('Value of Child : '+ valueChild);
            this.firstRenderingDone = true;
        }
       
    }
    connectedCallback() {
          try{
            let valueChild = this.template.querySelector('c-query-selector-on-load-child').value;
            console.log('Value of Child : '+ valueChild);
          }
          catch(ex){
             console.log(ex);
          }
        }
}