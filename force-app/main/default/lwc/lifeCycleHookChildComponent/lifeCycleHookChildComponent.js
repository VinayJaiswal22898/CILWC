import { LightningElement } from 'lwc';

export default class LifeCycleHookChildComponent extends LightningElement {

    constructor(){
    super();
    console.log('call from child constructor');
   }
    connectedCallback(){
       // let abc;
        console.log('this is child connectedCallback');
       // console.log(abc.a);
    }
    renderedCallback(){
        console.log('this is child renderedCallback');
    }
    disconnectedCallback(){
        console.log('this is child disconnectedCallback');
        
    }
  
}