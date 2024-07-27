global class ClearUnconvertedLeads implements Database.Batchable<sObject>, Database.stateful   {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([
            SELECT Id FROM Lead WHERE status = 'Closed-Not Converted'
        ]);
    }
    
    global void execute(Database.BatchableContext BC, List<Lead> scope) {
        List<Lead> leadsToDelete = new List<Lead>();
        for (Lead lead : scope) {
            leadsToDelete.add(lead);
        }
        if(!leadsToDelete.isEmpty()){
            delete leadsToDelete;
}
        
    }
    
    global void finish(Database.BatchableContext BC) {
        System.debug('Batch job completed successfully.');
    }
}