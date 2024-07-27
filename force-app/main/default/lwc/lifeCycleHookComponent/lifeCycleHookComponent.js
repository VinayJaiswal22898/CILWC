import { LightningElement } from 'lwc';

export default class LifeCycleHookComponent extends LightningElement {
    isVisible =true;
    constructor(){
        super();  // initialize many things 
        console.log('call recieved from  Parent constructor');
    }
    connectedCallback(){
        
        console.log('This is Parent connectedCallback');
      /*
        try{
        console.log(abc.a);
       }
       catch (err){
        console.log(err);
       }*/
    
    }
    renderedCallback(){
        console.log('This is Parent renderedCallback');
    }
    disconnectedCallback(){
        console.log('This is Parent disconnectedCallback');
    }
    errorCallback({error, stack}){
        console.log('This is Parent errorCallback error: ' + error);
        console.log('This is Parent errorCallback stack: ' + stack);
    }
    handleClick(){
        if(this.isVisible ==true){
            this.isVisible = false;
        }
        else {
            this.isVisible = true;
        }
    }

}