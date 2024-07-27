@isTest()
public class CheckOppClosedDateControllerTest {
@isTest()
    private static void OppClosedDateThisYear(){
       // create account and related opportunity with current year
        Account acc1= New Account();
        acc1.Name = 'Test Account1';
        Opportunity opp1 = new opportunity();
        opp1.Name= 'Test opportunity1';
        opp1.closeDate = Date.newInstance(Date.Today().year(),2,15);
        opp1.AccountId = acc1.Id; 
        List<Opportunity> oppList1 = new list<Opportunity>{opp1};
            // test the method 
        System.assertEquals(True,CheckOppClosedDateController.isOppClosedDateThisYearOrNot(oppList1)); 
        // public static date today()
        system.debug('Today'+date.Today());
        }
   }