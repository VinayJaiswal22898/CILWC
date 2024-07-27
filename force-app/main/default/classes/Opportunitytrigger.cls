public  class Opportunitytrigger {
    public static void Opptrigger(List<Opportunity> oppNewRecords, Map<Id, Opportunity> oppOldMapRecords) {
        if(oppNewRecords!=null && !oppNewRecords.isEmpty()){
            for(Opportunity opp: oppNewRecords){
                if((opp.opportunityType__c == 'High Value' && opp.stagename != 'Closed Won') || 
               ( oppOldMapRecords != null && opp.opportunityType__c != oppOldMapRecords.get(opp.id).opportunityType__c && opp.stagename !=oppOldMapRecords.get(opp.id).stagename) )
               {
                  opp.adderror('cont aditable');
                }
                if((opp.opportunityType__c == 'Special Value' && opp.stagename != 'Closed Won') || 
               ( oppOldMapRecords != null && opp.opportunityType__c != oppOldMapRecords.get(opp.id).opportunityType__c && opp.stagename !=oppOldMapRecords.get(opp.id).stagename) )
               {
                  opp.adderror('cont aditable');
                }
            }
        }
        }
    }