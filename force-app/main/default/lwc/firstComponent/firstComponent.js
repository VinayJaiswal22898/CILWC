import { LightningElement } from 'lwc';

export default class FirstComponent extends LightningElement {
    // var t = 443;  cont do 
    connectedCallback(){
        //console.log(t); does not print
    console.log('hello Connected call back ');
    var a;
    var a;  // var can be re declare 
    // let a; cont de declare again in the case of let 
    const  abc =2314; 
    console.log('String value a - ' + a);  // undefined 
    console.log('String value a -' + typeof a); //undefined
    a = 2;
    console.log('number value a -' + a);   // op 2334
    console.log('number value a-' +typeof a);  // op string
    a =true;
    console.log('Bollean value a-' + a);
    console.log('Boolean value a-' +typeof a);
    a= 2;
   var  c = '2';
  if(a===c){
    console.log('if apart ');
  }else{
    console.log('else part ');
  }
}
}