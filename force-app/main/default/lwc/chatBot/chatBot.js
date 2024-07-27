import { LightningElement,api } from 'lwc';
//import getmessage from '@salesfroce/MessageManager.getMessage';

export default class ChatBot extends LightningElement {

    // inboundmessages = [
    //     {message : 'Hello', inbound : true}, 
    //     {message : 'Hi', inbound : false}, 
    //     {message : 'How are you?', inbound : true}, 
    //     {message : "I'm good", inbound : false}, 
    //     {message : 'What about you?', inbound : true}
    // ];
    inboundmessages =  [ {Boss: "Hi, Alex. Do you have a moment to discuss the progress on the new project?", inbound : true},
    
    {Employee: "Hi, Mr. Johnson. Yes, I do. What would you like to know?" ,inbound : false},
    
    {Boss: "I wanted to check in on the status of the Salesforce implementation for the new client. Are we on track to meet our deadlines?", inbound : true},
    
    {Employee: "We're making good progress. We've completed the initial setup and customization. We're currently working on the integration of the REST APIs, including the @HttpDelete method for handling data deletions",inbound : false },
    
    {Boss: "That's good to hear. Are there any challenges or roadblocks you're facing?", inbound : true},
    
    {Employee: "One challenge we're encountering is ensuring the seamless integration of the API with the Lead object. We're also testing the system rigorously to ensure there are no bugs or issues once it's live.",inbound : false},
    
    {Boss: "I see. Do you need any additional resources or support to overcome these challenges?", inbound : true},
    
    {Employee: "Some additional documentation on best practices for integrating REST APIs in Salesforce would be helpful. Also, having another developer to assist with the testing phase could speed up the process.",inbound : false},
    
    {Boss: "That sounds reasonable. I'll arrange for additional documentation and see if we can allocate another developer to your team. Anything else you need?", inbound : true},
    
    {Employee: "That should cover it for now. I'll keep you updated on our progress and let you know if any other issues arise.",inbound : false},
    
    {Boss: "Great. Thank you, Alex. Keep up the good work. Let’s aim to have a more detailed review of the project by the end of the week.", inbound : true},
    
    {Employee: "Will do, Mr. Johnson. Thank you for your support.",inbound : false}
    
    ];
}