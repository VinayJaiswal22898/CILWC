@isTest()
public class SumOfTwoNumberControllerTest {
@isTest()
    private static void sumTest(){
        system.assertEquals (true , SumOfTwoNumberController.sumOFTwoNumber(60,50));
        system.assertEquals (false , SumOfTwoNumberController.sumOFTwoNumber(50,50));
        system.assertEquals ( false, SumOfTwoNumberController.sumOFTwoNumber(40,50));
        
    }
}