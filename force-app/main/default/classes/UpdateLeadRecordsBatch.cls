Global class UpdateLeadRecordsBatch Implements Database.Batchable<Sobject> {
    Global Database.QueryLOcator start(Database.BatchableContext bContext){
        
        String leadQueryRecord = 'Select id, firstName, lastName, rating, annualRevenue, leadSource, status from lead'; 	
        return database.GetQueryLocator(leadQueryRecord); 
    }
    Global void Execute(Database.BatchableContext bContext,  List<SObject> RecordsToProcess){
        if(!RecordsToProcess.isEmpty()){
            List<Lead> leadRecordToUpdate = new List<Lead>();
            for(SObject objRecord : RecordsToProcess){
                // explicit type casting 
                Lead ld=  (Lead) objRecord;
                
                // assgin the value
                ld.State = 'Working- Contacted';
                ld.AnnualRevenue = 8000000;
                ld.LeadSource = 'Web';
                ld.Rating = 'Cold';
                // add the lead record to list
                leadRecordToUpdate.add(ld);
            }
            if (!leadRecordToUpdate.isEmpty()){
                update leadRecordToUpdate;
            }
            
        }
        
    }
    Global void Finish(Database.BatchableContext bContext){
        System.debug('Batch Job Id' + bContext.getJobId());
        
        // get the batch job status 
        AsyncApexJob jobDetails = [Select id, status, totalJobItems, jobItemsProcessed, numberOfErrors, createdBy.Email
                                   from AsyncApexJob
                                   where id =: bContext.getJobId()];
        
        // write the code send email to user
        Messaging.singleEmailMessage email = new  Messaging.singleEmailMessage();
        
        String[] toAddress = new String[] {jobDetails.createdBy.Email, 'vinayjaiswal22898@gmail.com'};
        email.setToAddresses(toAddress);
        email.setReplyTo('support@gmail.com');
        email.setSenderDisplayName('tata customer support team');
        
        String strSubject =  'Weekly Lead Record Status Updated Job Notification :UpdateLeadRecordsBatch ('+ bContext.getJobId()+ ')';
        email.setSubject(strSubject);
        
        String emailContent = 'Dear Sales team, <br> <br/>  '+
            'We are pleased to infor you that we have processed the weekly lead Record status updated successfully<br/><br/> '+
            'please find the batch job status details as below .. : <br/> <br/>' + 
            'Batch Job Id .... '+ jobDetails.id + 
            '<br/> <br/> 	Batch job name : UpdateLeadRecordBatch'+
            '<br/> Total Number of Batch available.. ' + jobDetails.TotalJobItems+
            '<br/> Number of Batch Processed... : ' + jobDetails.JobItemsProcessed + 
            '<br/> Number of Batch Failed...: ' +  jobDetails.NumberOfErrors+
            '<br/> Batch Job Owner Email id.. : ' + jobDetails.CreatedBy.email+
            '<br/> job details status ... : ' + jobDetails.Status+
            '<br/> Please contact ob below address, if any queries . <br><br/>'+ 
            '***<i>This is System Generated Email. So don not reply</i>' + 
            '<br/>Thanks and regards, <br/> Support Team, <br/> Tata Inc.';
        email.setHtmlBody(emailContent);
        Messaging.SendEmailResult[] result	 =  Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
    }
}