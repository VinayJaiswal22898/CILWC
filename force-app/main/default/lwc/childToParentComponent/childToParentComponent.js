import { LightningElement } from 'lwc';

export default class ChildToParentComponent extends LightningElement {
    inputValue = ' '
    handlOnChnage(event){
       this.inputValue = event.target.value;
       const inputEvent = new CustomEvent( 'inputchange', {detail : this.inputValue } );  
       //console.log(inputEvent.details);
       // inputchange is event name and this is data this.inputValue in the form of object 
       this.dispatchEvent(inputEvent);
    }
}