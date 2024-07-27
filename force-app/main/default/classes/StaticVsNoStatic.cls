public class StaticVsNoStatic {
     static integer  a =10;
    Integer b = 20;
    public static void method1(integer a){
        a = a+a;
        system.debug(a);
        //method2();
    }
    public void method2(integer b){
        b = b+b + a;
        system.debug(b);
      // StaticVsNoStatic.method1();
        
    }
    

}