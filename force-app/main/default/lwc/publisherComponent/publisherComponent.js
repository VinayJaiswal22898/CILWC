import { LightningElement ,wire} from 'lwc';
import { CurrentPageReference } from 'lightning/navigation'; 
import { fireEvent } from 'c/pubSub';
export default class PublisherComponent extends LightningElement {
    @wire(CurrentPageReference) pageRef;
    inputText = ' ';
    handleData(event){
        this.inputText = event.target.value;
    }
    handleOnClick(){
        fireEvent(this.pageRef, 'pulisheddata', this.inputText);
    }

}