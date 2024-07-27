public with sharing class OpportunityManager {
    @AuraEnabled()
    public static List<Opportunity> searchOpportunity() {
         //String searchKey = '%' + oppName + '%'; 
        return [select id , Name, Amount, StageName, CloseDate
        from Opportunity];
    }
}