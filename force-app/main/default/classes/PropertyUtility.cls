public class PropertyUtility {
    public static void newListedProperties(){
        List<Property__c> newPropList = [SELECT ID, Name, Broker__r.Email__c, Days_On_Market__c
                                         FROM Property__c 
                                         WHERE Days_On_Market__c <=30];
        for(Property__c p: newPropList ){
            String propEmail = ' Poperty Name: ' + p.Name + 'Broker’s Email: ' + p.Broker__r.Email__c;
            System.debug(propEmail);
        }
        
    }

}