import { LightningElement } from 'lwc';

export default class ObjectComponent extends LightningElement 
{
    //object
    connectedCallback(){
        console.log('Hello LWC');
        var obj = {
            'Name' : 'Tejasvi',
            'Age' : 23,
            'Phone' : [9810985421, 886655443], // array
            'Address' : '105, Gonda, Up, India',
            22: 'age',
            'FamilyDetails' : {  // object
                  ' BrotherName' : 'Ram',
                  'Sisters' : 2
            },
            'Degree' : 'MCA',
            'isMale' : true,
            'BloodGroup' : null
        };
        console.log('object value-- '+ obj); // op - object
        console.log('object value-- '+ JSON.stringify(obj));  // op - print all the value in string
        console.log('object value --'+ obj.Address); // for single value 
        console.log('object value --'+ obj.FamilyDetails.Sisters); // only print sister name, nested object
        console.log('object value --'+ obj.Phone[1]);
        console.log('object value-- '+ obj[22]); // if an object's key is number then use [] bracess
    } 
}