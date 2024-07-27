public class QueueableHiringManager Implements system.Queueable {
    public void execute(System.QueueableContext qContext){
        //write the code to insert the HR Record
        Hiring_Manager__c hrRecord = new Hiring_Manager__c();
        hrRecord.Name = 'Hanuman Kumar final';
        hrRecord.Email__c = 'hanuman2@gmail.com';
        hrRecord.Contact__c = '9987654343';
        hrRecord.Location__c = 'Delhi';
        Insert hrRecord;   
        if(hrRecord.id !=null){
            // invoke the position queueable (chaning process) and pass Sobject parameter
            system.enqueueJob(new QueuueableNewPosition(hrRecord));
        }   
    }
}