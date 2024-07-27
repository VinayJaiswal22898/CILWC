public class LoopExample {
    public static void loopEx(){
         //Sum of number 10 while loop
        integer i = 1;
        integer sum =0;
        while(i<=10){
            sum =sum + i;
            i++;
        }
        system.debug(sum);
        
        
         // do while loop
        integer k1 =1;
        integer sum2=0;
        do{
            sum = sum2+k1;
            k1++;
        }while(k1<=10); 
        integer sum9 =0;
       
        
        // for loop 
        for(integer l =1; l<=10;l++){
            sum9 = sum9+l;
            l++;
        }
        system.debug(sum9);
      
        // for each loop
       integer sum8 = 0; 
        List<Integer> Listint = new Integer[]{1,2,3,4,5,6,7,8,9,10};
            for(Integer ik :Listint ){
                sum8 = sum8+ ik;
            }
        system.debug(sum8); 
    }
}