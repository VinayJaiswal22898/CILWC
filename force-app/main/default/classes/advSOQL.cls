public class advSOQL {
    public static void advSOQL(){
        AggregateResult agrs = [SELECT Count_Distinct(Amount)  from opportunity];
        Object i = agrs.get('m');
        System.debug('agrs'+ agrs);
        System.debug(i);
    }
}