@isTest()
public class AutoLeadConvertTriggerTest {
   
    public testmethod static void testLeadConversion(){
        Lead ld = new Lead();
        ld.FirstName ='Shyam';
        ld.LastName = 'Kumar';
        ld.Company = 'Infosys';
        ld.MobilePhone = '7766554433';
        insert ld;
        if(ld.Id != null){
            ld.Status = 'Closed - Converted';
            update ld;
        }
    }

}