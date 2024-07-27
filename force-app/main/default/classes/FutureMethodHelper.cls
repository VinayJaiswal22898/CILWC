public class FutureMethodHelper {
    public static void doDMLOperations(){
        //  Avtivate the user based on username (Setup object)
        User UserToActivate = [Select id, firstName, lastName, userName, isActive
                              from User
                              where username = 'usermanager22898@gmail.com' and isActive = True];
        if(userToActivate != null){
            userToActivate.isActive = false;
            update userToActivate;
            
            insertLeadRecord();
        }
        
    }
    @future()
    public static void insertLeadRecord(){
        //  Insert a lead record in the object (Non-Setup Object)
        Lead ldRecord = new Lead();
        ldRecord.FirstName= 'Test';
        ldRecord.LastName = 'Sample Lead';
        ldRecord.State = 'Working-Contacted';
        ldRecord.Industry = 'Banking';
        ldRecord.AnnualRevenue = 3600000;
        ldRecord.Phone = '98456213';
        ldRecord.Fax = '54679932';
        ldRecord.Email = 'test@gmail.com';
        ldRecord.Website = 'Test.com';
        ldRecord.Street = '102/12 road';
        ldRecord.City = 'Pune';
        ldRecord.State = 'UP';
        ldRecord.Country = 'India';
        ldRecord.Company = 'TCS';
        Insert ldRecord;
    }

}