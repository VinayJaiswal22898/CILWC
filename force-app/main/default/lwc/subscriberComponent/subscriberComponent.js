import { LightningElement,wire } from 'lwc';
import {registerListener , unregisterAllListeners} from 'c/pubSub';
import {CurrentPageReference} from 'lightning/navigation';
export default class SubscriberComponent extends LightningElement {
    recievedData;
    @wire(CurrentPageReference) pageRef;
    connectedCallback(){
        registerListener('pulisheddata', this.handlePublishData, this);
    }
    disconnectedCallback(){
        unregisterAllListeners(this);
    }
    handlePublishData(data){
        this.recievedData = data;
    }

}