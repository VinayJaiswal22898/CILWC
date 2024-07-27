public class testAcc {
    public static void updateOwner(){
      List<Lead> leadList = new List<Lead>();
        for(integer count = 1; count <=5; count++){
            Lead l = new Lead();
            l.FirstName = 'ram' ;
            l.LastName = 'Rahul' + count;
            l.Industry = 'banking';
            if(count != 4){
                l.Company = 'An Ad Prof';
            }
            l.Phone = '8877665544';
            leadList.add(l);    
        }
        if(!leadList.isEmpty()){
            Database.SaveResult[] results = Database.insert(leadList, false);
            for(Database.SaveResult result : results){
                if(result.isSuccess()){
                    system.debug('Record is inserted successfully : ' +result.Getid());
                }
                else {// faild 
                  Database.error[] errorRecords = result.getErrors(); 
                for(Database.error error : errorRecords ){
                    system.debug('Error Message : ' + error.getmessage());
                     system.debug('Error Message : ' + error.getStatusCode());
                    system.debug('Attached field :' + error.getFields());
                }
            }
                system.debug('-----------');
            }
            
        }
        }
}