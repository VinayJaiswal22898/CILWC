global class NewPositionScheduleBatch Implements System.Schedulable {
    global void execute(System.schedulableContext scContext){
        // invoke any batch or apex class
        NewPositionUpdateBatch newPositionBatch = new NewPositionUpdateBatch();
        Database.executeBatch(newPositionBatch, 5);
    }

}