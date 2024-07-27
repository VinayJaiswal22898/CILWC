public class AccountTrigger3Handler {
    public static void preventContactRecordsDeletetion(){
        List<Contact> conRecord = [Select id from Contact 
                                  where accountId IN : trigger.oldMap.keySet()];
    }

}