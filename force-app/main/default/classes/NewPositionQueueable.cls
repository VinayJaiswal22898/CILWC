public class NewPositionQueueable Implements System.Queueable {
    Hiring_Manager__c hrRecord;
    
    // prepare a conatructor 
    public NewPositionQueueable(Hiring_Manager__c hr){
        hrRecord = hr;
    }
    public  void execute(System.QueueableContext qContxt){
        if(hrRecord != null){
        New_Position__c  npRecord = new New_Position__c();
          npRecord.Name = 'MainFrame Developer';
          npRecord.Location__c = hrRecord.Location__c;
          npRecord.HR_Email_Address__c = hrRecord.Email__c;
          npRecord.HR_Contact_Number__c = hrRecord.Contact__c;
          npRecord.Number_Of_Vacancies__c = 2;
          npRecord.Position_Status__c = 'Open Approved';
           npRecord.Minimum_Pay__c = 900000;
            npRecord.Maximum_Budget__c = 1400000;
            npRecord.Open_Date__c = System.today();
            npRecord.MileStone_Date__c = System.today().addMonths(1);
            npRecord.Travel_Required__c = false;
            npRecord.Hiring_Manager__c = hrRecord.Id;
            insert npRecord;
        }
        
    }
}