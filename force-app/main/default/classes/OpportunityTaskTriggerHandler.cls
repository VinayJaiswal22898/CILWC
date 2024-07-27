public class OpportunityTaskTriggerHandler {
    public static void CraeteTask(List<Opportunity> newOPPrECORDS , Map<Id, Opportunity> oldMapRecord){
        List<Task> taskToInsert = new List<Task>();
        if(newOPPrECORDS!=null && !newOPPrECORDS.isEmpty()){
            for(Opportunity opp : newOPPrECORDS){
                // Check if the opportunity's stage has changed
                if(opp.stagename != oldMapRecord.get(opp.id).stagename){
                    Task followUpTask  = new Task();
                    followUpTask.Subject = 'fOllow up task';
                    followUpTask.ActivityDate = date.today() + 7;  // due date
                    followUpTask.Description = 'fOllow up task';
                    followUpTask.WhatId = opp.id;
                    followUpTask.OwnerId = opp.OwnerId;
                    taskToInsert.add(followUpTask);
                }
            }
        }
        if(!taskToInsert.isEmpty()){
            insert taskToInsert;
        }
    }
}