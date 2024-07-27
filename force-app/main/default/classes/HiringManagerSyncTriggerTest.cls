@isTest()
public class HiringManagerSyncTriggerTest {
    public testmethod static void TestHRRecord(){
        Hiring_Manager__c hrRecord = new Hiring_Manager__c();
        hrRecord.name= 'Test hr';
        hrRecord.Contact__c = '8877665544';
        hrRecord.Designation__c = 'HR Executive';
        hrRecord.Email__c = 'Test@gmail.com';
        hrRecord.Location__c = 'Chennai'; 
        Insert hrRecord;
        
        if(hrRecord.Id != null){
            hrRecord.Contact__c = '6655443344';
            hrRecord.Email__c = 'testupdate@gmail.com';
            update hrRecord;
        }
    }

}