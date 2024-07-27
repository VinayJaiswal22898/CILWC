global class UpdateAccountOppAmount_02_Schedule implements system.schedulable {
    global void Execute(system.schedulableContext sContex){
       // Instantiate the batch class
     UpdateleadRecordBatch1 batch = new UpdateleadRecordBatch1();

       // Execute the batch job with the specified batch size
           Database.executeBatch(batch, 5);
    }

}