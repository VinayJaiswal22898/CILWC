import { LightningElement, track } from 'lwc';

export default class MatchCalc extends LightningElement {
    @track firstValue; // scope with js and html 
    @track secondValue;
    message;
    handleFirstNumber(event){
        console.log('ON Change');
        let fNumber  = event.target.value;
        this.firstValue = event.target.value;
        console.log('fNumber Value - ' + fNumber);
        console.log('fNumber type -' + event.target.type);
        console.log('fNumber label-' + event.target.label);
    }
      /*
    handleOnBlur(event){
        console.log('On Blur');
        let fNumber  = event.target.value;
        console.log('fNumber Value - ' + fNumber);
        console.log('fNumber type -' + event.target.type);
        console.log('fNumber label-' + event.target.label);
    }
  
    handleOnFocus(event){
        console.log('Focus');
        let fNumber  = event.target.value;
        console.log('fNumber Value - ' + fNumber);
        console.log('fNumber type -' + event.target.type);
        console.log('fNumber label-' + event.target.label);
    }
        */
    handleSecondNumber(event){
        let sNumber = event.target.value;
        this.secondValue = event.target.value;
        console.log(sNumber);
    }
    @track result;  // to store add result and print it
    handleAddOnClick(){
        //console.log('Addition --' + this.firstValue+this.secondValue);
       this.message = 'Addition of Tow Number is -'
        this.result = this.firstValue + this.secondValue;
    }
    handleSubClick(){
       this.message = 'Subtraction of Tow Number is -'
        this.result = this.firstValue - this.secondValue;
    }
    handleMulClick(){
        this.message = 'Multiplication of Tow Number is -'
        this.result = this.firstValue * this.secondValue;
    }
    handleDivClick(){
        this.message = 'Division of Tow Number is -'
        this.result = this.firstValue / this.secondValue;
    }
    
}