global class CalculateAccountTotalRevenueBatch Implements Database.Batchable<SObject>, Database.Stateful {
    global decimal totalAnnualRevenue = 0.0; 
    global Database.QueryLocator start(Database.BatchableContext bContext){
        string  accountRecordQuery = 'Select id, name, rating, industry, annualRevenue from account where annualRevenue != null';
        return Database.getQueryLocator(accountRecordQuery);
        
    }
    global void Execute(Database.BatchableContext bContext, List<SObject> accountRecords){
        if(!accountRecords.isEmpty()){
            for(SObject record : accountRecords){
                Account accRecord = (account) record;
               totalAnnualRevenue += accRecord.AnnualRevenue;
            }
        }    
    }
    global void Finish(Database.BatchableContext bContext){
        System.debug('Batch Job Id is ..'+ bContext.getJobId());
        // get the job details
        AsyncApexJob jobDetails = [Select id, status, totalJobItems, jobItemsProcessed, numberOfErrors, createdBy.Email
                                  from AsyncApexJob
                                  where id =:bContext.getJobId()]; 
         // invoke the method to send notification
        //MessagingHandler.sendBatchJobStatusNotificationEmail(jobDetails, 'CalculateAccountTotalRevenueBatch',totalAnnualRevenue);   
    }  
}