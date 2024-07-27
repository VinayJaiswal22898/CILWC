import { LightningElement ,api} from 'lwc';
import { FlowNavigationNextEvent} from 'lightning/flowSupport';

export default class FlowCalculatorComp extends LightningElement {
    @api firstNumber;
    @api secondNumber;
    @api result;
    additionHandle(){
        this.result = this.firstNumber + this.secondNumber;
        this.dispatchEvent(new FlowNavigationNextEvent);
    }

}