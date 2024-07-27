public class SharingClass {
    public static void getHrRecords(List<Hiring_Manager__c> hr){
        try{
            
List<Hiring_Manager__c> hrlst = [SELECT Id  ,Location__c, Designation__c, Contact__c, Email__c, Current_CTV__c, Hiring_Manager__c, Name
                                   FROM Hiring_Manager__c
                                        WITH SECURITY_ENFORCED];
            system.debug(hrlst);
        }
        catch (system.QueryException ec) {
            system.debug(ec);  
        }
    }

}