public class EqualOperator {
    public static void equalMethod(){
        
        
        // string comparision is case Insenstive 
        String s= 'VINAY';
        String k='vinay';
       System.debug(s==k);
      /*  
        ID i1='a082w00000niCLwAAM ';
        ID i2= 'a082w00000niCLwaam';
        System.debug(i1==i2);
    */
        
        
        // arrya [] comparision with equal operator 
        List<Integer> a= new Integer [5];
        List<Integer> b= new  Integer [5];
        List<Integer> c= new Integer[] {1,2,3,4,5};
            
            for(integer i=0;i<5; i++){
                a[i]=i+1;
            }
        system.debug('a' + a);
        system.debug(a==b);
        system.debug(a==c);
        
        MyClass2 m1 = new MyClass2();
        MyClass2 m2 = new MyClass2();
        
        MyClass2 m3=m2;
        System.debug(m3==m2);
        
        // relational operator
        Integer  i1;
        integer i2 =3;
        system.debug(i2>i2);  //false
        
        // A non-null string and ID alwasy greater than a null value
        // 
      string s1 = 'Vinay';
        String s2;
        //System.debug('String Null Check');
        System.debug('String Null Check' + s1<s2);
        
        ID id1 = 'a082w00000niCM9AAM';
        Id id2 = 'a082w00000niCLwAAM';
        System.debug(id1>=id2);
        
       
        
        
    }
}