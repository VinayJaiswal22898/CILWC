public class SOQLQuery {
    public static void soqlMethod(){
        // keyword in SOQL
        
        // IN
        // 
        List<String> listStr = new List<String>{'contact1', 'Test, Contact'};
        List<Contact> listCon = [Select FirstName, LastName from Contact where Name IN : listStr ];
        
        System.debug(listCon);
        
        //NOT IN
         List<Contact> listCon2 = [Select FirstName, LastName from Contact where Name NOT IN : listStr ];
        for(Contact con : listCon2) {
        System.debug(con);
        }
        // **** Dynamic SOQL
        
         //first way
        list<sObject> sObjList = Database.query('SELECT ID, Name from account'); 
        system.debug(sObjList.size());
        
        // second way
        String whereClaus = 'manoj';
        List<sObject> objList = Database.query('SELECT ID, Name from account where Name !=:whereClaus');
         system.debug(objList.size());
       
        // third way write query in multiple part
        String fromAccount = ' From Account';
        String selectStr = 'Select Id, Name';
        String whereClaus1 = 'ok';
       String query1 = selectStr + fromAccount +  ' WHERE Name LIKE \' % ' + whereClaus1 + '%\' ';
       // String query1 = selectStr + fromAccount +  ' WHERE Name LIKE \'%' + whereClaus1 + '%\'';

       list<sObject> sObj = Database.query(query1);
        system.debug(sObj.size());
         
        
        /*
        string qr = 'SELECT Id ';
        String [] strList = new List<String>();
        
        strList.add('Name');
        strList.add('NumberOfEmployees');
        strList.add('Phone');
        
        String objName = 'Account';
        
        for(String S: strList){
            qr+= ',' + s;
            system.debug(qr);
        }
        qr = qr + ' from ' + objName;
        
        List<sObject> objList3 =Database.query(qr);
       system.debug(objList3.size());
        
       // query exception 
        try{
        String sr = 'SELECT Name PhoneNumber from Account';
        List<sObject> objList = Database.query(sr);
        }
        catch (Exception e) {
            System.debug('an error occurred' + e.getMessage());
        }
           //this will throw error bcz PhoneNumber field does not exist 
         */
    
}
}