@isTest()
private class UpdateLeadRecordsBatchTest {
    private testmethod static void testLeadBatch(){
        createBulkRecords();
        Test.StartTest();
        UpdateLeadRecordsBatch leadBatch = new UpdateLeadRecordsBatch();
        Database.executeBatch(leadBatch);
        Test.stopTest();
        
    }
    // write the code insert lead the record for test
    private static void createBulkRecords(){
        List<Lead> lstLead = new List<Lead>();
        for(Integer counter = 1; counter<=10; counter++){
        Lead ld = new Lead();
        ld.FirstName = 'Shyam' ;
            ld.LastName = 'Kumar'+counter;
            ld.Company = 'tcs';
            ld.MobilePhone = '5566778899';
            
            // add to list
            lstLead.add(ld);
            }
        if(!lstLead.isEmpty()){
            Insert lstLead;
        }
    
    }

}