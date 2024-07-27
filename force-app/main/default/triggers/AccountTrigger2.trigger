trigger AccountTrigger2 on Account (before delete) {
    // asdkjda
    //local
      //dahjfsjh
    if(trigger.isBefore && trigger.isDelete){
        AccountTriggerHandler3.preventToDeleteActiveAccount(trigger.old);
    }
}