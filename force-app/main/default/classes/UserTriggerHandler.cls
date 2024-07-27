public class UserTriggerHandler {
    public static void userChangeLocation(List<User> userNewList , Map<Id, User> useroldMap) {
        Map<Id, user>  userMap = new Map<Id,user>();
        if(userNewList!=null && !userNewList.isEmpty()){
            for(user ur : userNewList){
                if(ur.Country!=null &&
                useroldMap !=null &&  
                (ur.Country !=useroldMap.get(ur.Id).Country)){
                    userMap.put(ur.Id, ur);
                }
            }
        }
        List<Opportunity> oppToUpdate = new List<opportunity>();
        if(!userMap.isEmpty()){
            List<Opportunity> oppList = [Select id ,ownerid, Location__c from opportunity where OwnerId IN : userMap.keySet() ];
            for(Opportunity opp : oppList){
                String str = userMap.get(opp.OwnerId).Country;
                opp.location__c = str ; 
                oppToUpdate.add(opp);
            }
    }
        if(!oppToUpdate.isEmpty()){
            Update oppToUpdate;
        }
}
}