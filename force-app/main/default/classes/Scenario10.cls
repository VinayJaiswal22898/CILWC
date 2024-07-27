public class Scenario10 {
    public static void updateAccount(List<Opportunity> oppNew){
        Set<Id> accIds = new Set<Id>();
        if(oppNew !=null && !oppNew.isEmpty()){
            for(Opportunity opp : oppNew){
                if(opp.StageName =='Closed Won'){
                    accIds.add(opp.AccountId);
                }
            }
        }
        if(!accIds.isEmpty()){
            List<Account> accToUpdate = new List<Account>();
            for(Account acc :[select id, name 
                              from account where id In : accIds]){
                                acc.Rating = 'Hot'; 
                                  accToUpdate.add(acc);
                              }
            if(!accToUpdate.isEmpty()){
                update accToUpdate;
            }
        }
    }

}