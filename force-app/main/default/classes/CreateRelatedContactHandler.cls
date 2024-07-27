public class CreateRelatedContactHandler {
    public static void createContactRecord(List<Account> accRecords){
        List<Contact> conList = new List<Contact>(); // store contact for bulkification   
        if(accRecords !=null && !accRecords.isEmpty()){ 
                for(Account acc: accRecords){
                    if(acc.createRelatedContact__c == true){
                        Contact con = new Contact();
                        con.FirstName ='Test checkbox';
                        con.LastName = acc.Name;
                        con.Phone = acc.Phone;
                        con.AccountId = acc.id;
                        conList.add(con);
                    }
                } 
            }
        if(!conList.isEmpty()){
            insert conList;
        }
        }
    }