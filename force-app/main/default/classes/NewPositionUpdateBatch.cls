global class NewPositionUpdateBatch Implements Database.Batchable<SObject> {
    global Database.QueryLocator start(Database.BatchableContext bContext){
       
        String newPositionRecords = ' SELECT Id, Name, Location__c, Number_Of_Vacancies__c, Position_Status__c, Open_Date__c, MileStone_Date__c FROM New_Position__c where Position_Status__c = \'Closed\' ';
        return Database.getQueryLocator(newPositionRecords);
        
    }
    global void execute(Database.BatchableContext bContext, List<SObject> lstRecords){
       
        if(!lstRecords.isEmpty()){
            List<New_Position__c> lstNP = new List<New_Position__c>();
            for(SObject record : lstRecords){
                New_Position__c np =(New_Position__c ) record;
                lstNP.add(np);
            }
            // delete operation
            if(!lstNP.isEmpty()){
                Delete lstNP;
            }
        }
    }
    global void finish(Database.BatchableContext bContext){
        System.debug('Batch Job Id is ..'+ bContext.getJobId());
        
        // get the batch job status 
        AsyncApexJob jobDetails = [Select id, status, totalJobItems, jobItemsProcessed,numberOfErrors, createdby.Email
                                  from AsyncApexJob
                                  where id =: bContext.getJobId()];
        // write the code send email to user
        Messaging.SingleEmailMessage email = new Messaging.singleEmailMessage();
        String[] toAddress= new String[]{jobDetails.CreatedBy.Email,'vinayjaiswal22898@gmail.com'};
        email.setToAddresses(toAddress);
        email.setReplyTo('support@gmail.com');
        email.setSenderDisplayName('Status Updated');
        
        String strSubject = 'Weekly Position updated records';
        email.setSubject(strSubject);
        
        String emailContent = 'Dear Hiring Team <br> <br/>'+ 
            'We are please to infor you that we have updated postion status field New <br><br/>' + 
            ' Please find the Job Status details below ....: <br><br/>' + 
            'Batch Job Id ..' + jobDetails.id+ 
            '<br/><br/> Batch Job Name :  NewPositionUpdateBatch' +
            '<br/> Total Number of Available :' + jobDetails.TotalJobItems + 
            '<br> Number of Batch Processed : ' + jobDetails.JobItemsProcessed+ 
            '<br> Number of Batch Failed : ' + jobdetails.NumberOfErrors+ 
            '<Br> Batch Job Owner Email id : '+ jobDetails.CreatedBy.Email+
            '<br> Job Deatils Status :' + jobdetails.Status+ 
            '<br> please Contact on below address. if any quries <br/><br/>' +
            '*** <i>this is system generated mail so please do not reply<i/>' + 
            '<br><br/> Thanks & Regards <br/> Millenials Work ldt';
            
        email.setHtmlBody(emailContent);
        Messaging.sendEmailResult[] result =Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
        
    }

}