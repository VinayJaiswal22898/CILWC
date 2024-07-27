public class QueuueableNewPosition implements system.queueable {
    Hiring_Manager__c hrRecord;
    public QueuueableNewPosition(Hiring_Manager__c hr){
        hrRecord=hr;
    }
    public void Execute(System.QueueableContext qContext){
        if(hrRecord.Id !=null){
            // create new position record
            New_Position__c npRecord = new New_Position__c();
            npRecord.Name = 'Mainframe Developer';
            npRecord.HR_Contact_Number__c = hrRecord.Contact__c;
            npRecord.HR_Email_Address__c = hrRecord.Email__c;
            npRecord.Location__c = hrRecord.Location__c;
            npRecord.Number_Of_Vacancies__c = 4;
            npRecord.Maximum_Budget__c = 120000;
            npRecord.Minimum_Pay__c = 10000;
            npRecord.Open_Date__c = system.today();
            npRecord.MileStone_Date__c = system.today().addMonths(1);
            npRecord.Hiring_Manager__c = hrRecord.Id;
            
            Insert npRecord;
            
        }
        
    }

}