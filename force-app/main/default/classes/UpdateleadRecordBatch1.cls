global class UpdateleadRecordBatch1 Implements Database.Batchable<Sobject> {
    global Database.QueryLocator start(Database.BatchableContext bContext){
        String leadQuery = 'Select id, status, leadsource,annualrevenue,rating from lead';
        return Database.GetQueryLocator(leadQuery);
    }
    global void execute(Database.BatchableContext bContext, List<Sobject> recordToProcess){
      List<Lead> ldToUpdate = new List<Lead>();
        for(Sobject objRecord : recordToProcess){
            // explicit type caste
            Lead ld = (Lead)objRecord;
            ld.State = 'Working-Contacted';
            ld.LeadSource = 'Phone';
            ld.AnnualRevenue = 20000;
            ld.Rating = 'Hot';
            ldToUpdate.add(ld);
        }
        if(!ldToUpdate.isEmpty()){
            update ldToUpdate;
        }
    }
    global void finish(Database.BatchableContext bContext){
        system.debug('Updated SuccessFully:' + bContext.getJobId());
        
        // get the bach job status
        AsyncApexJob jobStatus = [Select id, JobType, status,TotalJobItems from AsyncApexJob
                                 where id =: bContext.getJobId()];
        
        // Get the batch job status 
        System.debug('Batch Job Id:' + jobStatus.Id);
        System.debug('Batch Job Status:' + jobStatus.Status);
        System.debug('Total Job Items' + jobStatus.TotalJobItems);
        System.debug('Job Type' + jobStatus.JobType);
    }

}