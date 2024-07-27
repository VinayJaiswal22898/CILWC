public class HiringManagerQueueable Implements System.Queueable {
    public void execute(System.QueueableContext  qContext){
       
        // Write code to insert hiring manager recrod
        Hiring_Manager__c hrRecord = new Hiring_Manager__c();
        hrRecord.Name = 'Shivam Jaiswal';
        hrRecord.Contact__c = '5641235698';
        hrRecord.Designation__c = 'HR Manager';
        hrRecord.Email__c = 'Shivam@gmail.com';
        hrRecord.Location__c = 'Chennai';
        hrRecord.Current_CTV__c = 1000000;
        
        insert hrRecord;
        if(hrRecord != null){
            /* invoke the position queueable (Chaining process + Pass SObject parameter)
            Id jobId = System.enqueueJob(new NewPositionQueueable( ));
            AsyncApexJob jobDetails = [Select id, status, totalJobItems, jobItemsProcessed, numberOfErrors, createdBy.Email
                                      from AsyncApexJob
                                      where id =: jobId];*/
        }        
    }

}