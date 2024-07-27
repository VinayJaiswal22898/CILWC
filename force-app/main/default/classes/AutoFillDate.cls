public class AutoFillDate {
    
    public static void fillDateMethod(List<Sprint__c> SP){
        List<Sprint__c>  spUpdate= new List<Sprint__c>();
        List<Sprint__c> sprintlist= [SELECT Id, CreatedDate, Start_Date__c, End_Date__c FROM Sprint__c order by CreatedDate DESC limit 1];
        
        //if there is no srpint then it will assigne today date as a start date
        
        if(sprintlist.isEmpty()){
            for(Sprint__c s : SP){
                if(s.Start_Date__c ==null|| s.End_Date__c ==null){
                    s.Start_Date__c = System.today();
                    s.End_Date__c = s.Start_Date__c.addDays(30);
                    spUpdate.add(s);
                }
            }
            
        }
        else{
            for(Sprint__c s : SP){
                if(s.Start_Date__c==null || s.End_Date__c ==null)
                {
                    s.Start_Date__c = sprintlist[0].End_Date__c.addDays(1);
                    s.End_Date__c = sprintlist[0].End_Date__c.addDays(30);
                    spUpdate.add(s);
                }
                
            }
        }
        
        
    }
}