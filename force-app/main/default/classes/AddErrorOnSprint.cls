public class AddErrorOnSprint {
    Public static void CreateSprint(List<Sprint__c> SP)
    {  
        //System.debug('sp'+ sp);
        List<Sprint__c> SprintList=[Select Name, Start_Date__c, End_Date__c From Sprint__c];
        Map<String, Boolean> isRecordExist = new map<String, Boolean>();
        for(Sprint__c SL: SprintList)
            {
                String key = string.valueOf(SL.Start_Date__c) + string.valueOf(SL.End_Date__c);
                isRecordExist.put(key, True);   
            }
        for(Sprint__c SNL :SP)
        {
            String key = string.valueOf(SNL.Start_Date__c) + string.valueOf(SNL.End_Date__c);
            if(isRecordExist.containsKey(key)){
            SNL.adderror('record already exist');  
            }
        }
     
    }
}