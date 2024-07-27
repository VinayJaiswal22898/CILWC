public class HiringManagerHelper {
    
    
    Public static void insertingHMRecords(){
        Hiring_Manager__c hrRecord = new Hiring_Manager__c();
        	
        hrRecord.Name = 'Rajesh kUMAR';
        hrRecord.Designation__c = 'Hr Executive';
        hrRecord.Contact__c = '5566889977';
        hrRecord.Email__c = 'Rajesh@gmail.com';
        hrRecord.Location__c = 'Chennai';
        
        Insert hrRecord;
        
        If(hrRecord.id!=null){
            System.debug('HR record created successfully. ID is .. '+ hrRecord.Id);
            
            //creating position record 
            New_Position__c npRecord = new New_Position__c();
            
            //Assigning the value
            npRecord.Description__c = '4+ Year Exp';
            npRecord.Name = 'IT Support';
            npRecord.HR_Contact_Number__c =  '5566889977';
            npRecord.HR_Email_Address__c =  'Rajesh@gmail.com';
            npRecord.Number_Of_Vacancies__c = 6;
            npRecord.Minimum_Pay__c = 150000;
            npRecord.Maximum_Budget__c = 2500000;
            npRecord.Open_Date__c = System.Today();
            npRecord.Location__c = hrRecord.Location__c;
            npRecord.MileStone_Date__c = Date.newInstance(2023,12,28);
            // map the reference to Hiring Manager
            
            npRecord.Hiring_Manager__c = hrRecord.Id;
           // iNSERT rECORD
           Insert npRecord;
            if(npRecord!=null){
                System.debug('New Position Record crated successfully. ID is ..'+npRecord.Id);
            }
            
        }
    }
    Public void CreatingHiringManagerRecord(){
        Hiring_Manager__c hrRecord = new Hiring_Manager__c();
        	
        hrRecord.Name = 'Rajesh kUMAR';
        hrRecord.Designation__c = 'Hr Executive';
        hrRecord.Contact__c = '5566889977';
        hrRecord.Email__c = 'Rajesh@gmail.com';
        hrRecord.Location__c = 'Lucknow';
        
        Insert hrRecord;
        
        If(hrRecord.id!=null){
            System.debug('HR record created successfully. ID is .. '+ hrRecord.Id);
        }
    }
}