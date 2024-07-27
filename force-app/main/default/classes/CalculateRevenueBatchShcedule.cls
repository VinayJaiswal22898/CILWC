global class CalculateRevenueBatchShcedule Implements System.Schedulable{
    global void execute(System.SchedulableContext sContext){
        // invoke any batch or apex class
        CalculateAccountTotalRevenueBatch accountRevenueBatch = new CalculateAccountTotalRevenueBatch();
        Database.executeBatch(accountRevenueBatch , 10);
        
    }
}