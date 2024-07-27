public with sharing class MessageManager {
    @AuraEnabled(cacheable=true)
    public static List<Message__c> getMessage(String message){
                String msg  = '%' + message +  '%';
              return  [select Name from Message__c where name like : msg ];
}
}