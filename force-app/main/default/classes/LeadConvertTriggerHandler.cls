public class LeadConvertTriggerHandler {
    public static void createFollowUpTask(List<Lead> leadRecords){
       List<Task> tkListinsert = new list<Task>(); 
        if(leadRecords !=null && !leadRecords.isEmpty()){
            for(Lead leadRecord : leadRecords){
                if(leadRecord.status == 'Closed Converted'){
                    Task tk = new Task();
                    tk.subject = 'new follow Task';
                    tk.Status = 'In Progress';
                    tk.WhatId = leadRecord.id;
                    tkListinsert.add(tk); 
                }
            }
        }
        if(!tkListinsert.isEmpty()){
            insert tkListinsert;
        }
    }

}