import { LightningElement } from 'lwc';

export default class ArrayComponent extends LightningElement 
{
    connectedCallback(){
        console.log('Hello ARRAY');
        // similar data type like list in apex 
        let arr = [8,2,1,4,5,6];
        // index 0, 1, 2,3, 4,5 
        console.log("Before push  Arrya 's Value- " +arr);

        // push funtion 
        arr.push(7); // add value to array at the last of index
        console.log(' After Push  Lenght of Array - ' + arr.length + ' after push value '+ arr );

       var arr2 = [];

       for(let i =0; i<arr.length; i++){
        if(arr[i] == 1){
            arr2.push(arr[i]);
            console.log('value of arr2 - '+arr2);
        }
       }

       // we can do with array.indexOf(item, start)
       var  postion = arr.lastIndexOf(8,2);
       console.log(postion);  // OP 
    }
}