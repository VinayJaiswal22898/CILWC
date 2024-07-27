import { LightningElement } from 'lwc';

export default class Basic extends LightningElement {
    connectedCallback(){
            var  k ='Welcom aaaa';
            var b =10;
            console.log(k.length);
            console.log(k.substring(2,4))
            console.log(`welcom to ${k} ${b}`);

            // array 
            var arr = new Array(5);
            arr =[2,3,4,5 , 'a', 'Ram'];
            arr[4] = 43;
            console.log(arr);
            console.log(Array.isArray(arr));

            const arry1= [{productCode : 101,
                productName : 'Mac book Pro',
                Manufacturing : "China"
            },{productCode : 102,
                productName : 'Mac book Pro 2',
                Manufacturing : "China"},{
                    productCode : 103,
                productName : 'Mac book Pro 3',
                Manufacturing : "China"
                }];
                arry1
        }
    }
