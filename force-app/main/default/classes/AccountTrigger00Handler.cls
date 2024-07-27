public class AccountTrigger00Handler {
    public static void checkIndustryValue(List<Account> accNewRecords){
        if(accNewRecords !=null && !accNewRecords.isEmpty()){
            for(Account accRecord : accNewRecords){
                if(accRecord.Industry !=null && accRecord.Industry == 'Insurance'){
                    accRecord.Rating = 'Hot';
                }
            }
        }
    }

}