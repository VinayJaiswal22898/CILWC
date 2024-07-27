public class AccountUpdateTriggerHandler {
    public static void updateContactBillingAddress(List<Account> accNewRecords, Map<Id, Account> accOldMapRecords){
        Map<Id, Account> accMap = new Map<Id, Account>();
        if(accNewRecords !=null && !accNewRecords.isEmpty()){
            for(Account accNewRecord : accNewRecords){
                if(accOldMapRecords !=null && 
                   (accNewRecord.billingstreet != accOldMapRecords.get(accNewRecord.id).billingstreet ||
                    accNewRecord.billingcity != accOldMapRecords.get(accNewRecord.id).billingcity ||
                    accNewRecord.billingstate != accOldMapRecords.get(accNewRecord.id).billingstate ||
                    accNewRecord.billingPostalcode != accOldMapRecords.get(accNewRecord.id).billingPostalcode || 
                    accNewRecord.billingcountry != accOldMapRecords.get(accNewRecord.id).billingcountry)){
                       accMap.put(accNewRecord.Id, accNewRecord);
                   }
            }
        }
        if(!accMap.isEmpty()){
            List<Contact> conToUpdate = New List<Contact>();
            for(Contact con : [Select id, accountId, mailingStreet,mailingCity, mailingState, mailingPostalcode, mailingCountry
                              from contact 
                              where accountId IN : accMap.keyset()]){
                                   if(accMap.ContainsKey(con.AccountId)){
                                       con.mailingStreet = accMap.get(con.AccountId).billingstreet;
                                       con.mailingCity = accMap.get(con.AccountId).billingCity;
                                       con.mailingState = accMap.get(con.AccountId).billingState;
                                       con.mailingPostalCode = accMap.get(con.AccountId).billingPostalCode;
                                       con.mailingCountry = accMap.get(con.AccountId).billingCountry;
                                       conToUpdate.add(con);  
                                   }
                               }
            if(!conToUpdate.isEmpty()){
                update conToUpdate;
            }
        }
    }

}