public class AccountTrigger5Handler {
    public static void autoPopulateRecords(List<Account> accRecords){
        for(Account accRecord : accRecords)
        {
            if(accRecord.Industry == 'Banking'){
                accRecord.annualRevenue = 4500000;
            }
            else if(accRecord.Industry == 'Finance'){
                 accRecord.annualRevenue = 3500000;
            }
            else if(accRecord.Industry == 'Insurance'){
                 accRecord.annualRevenue = 2500000;
            }
            else if(accRecord.Industry == 'Manufacturing'){
                 accRecord.annualRevenue = 6500000;
            }
            else if(accRecord.Industry == 'Technology'){ 
                accRecord.annualRevenue = 8500000;
            }
            else if(accRecord.Industry == 'Energy'){
                  accRecord.annualRevenue = 5500000;
            }
        }
        
    }

}