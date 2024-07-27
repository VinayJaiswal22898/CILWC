@isTest( )
public class HiringManagerQueueableTest {
    public testmethod static void testHRQueueable(){
        HiringManagerQueueable hrqueue = new HiringManagerQueueable();
       ID jobId= System.enqueueJob(hrqueue);
    }

}