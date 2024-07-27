public class MathOperationHelper {
    public void Addition(Integer x , Integer y){
        System.debug('Addition result is -- '+ (x+y));
    }
    public void Multiply(Integer x , Integer y, Integer z){
        System.debug('Addition result is -- '+ (x*y*z));
    }
    public void Division(Integer x , Integer y){
        if(y>0){
            System.debug('Divition result is '+ (x/y));
        }
        else
        System.debug('Invalid number -- ');
    }
}