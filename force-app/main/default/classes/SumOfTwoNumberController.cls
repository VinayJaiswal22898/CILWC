public class SumOfTwoNumberController {
    public static Boolean sumOFTwoNumber(Integer num1, Integer num2){
        Integer sum = num1+num2;
        if(sum>100){
            return true;
        }
        else{
            return false;
        }
        
    }

}