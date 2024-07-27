public class MessagingHandler {
    public static void sendBatchJobStatusNotificationEmail(AsyncApexJob jobDetails, String jobName, decimal totalAnnualRevenue){
        // write the code send email to user
        Messaging.singleEmailMessage email = new  Messaging.singleEmailMessage();
        
        String[] toAddress = new String[] {jobDetails.createdBy.Email, 'vinayjaiswal22898@gmail.com'};
        email.setToAddresses(toAddress);
        email.setReplyTo('support@gmail.com');
        email.setSenderDisplayName('tata customer support team');
        
        String strSubject =  'Weekly Total Account AnnualRevenue Calculation Job Notification :' + jobName + ' ('+ jobDetails.Id + ')';
        email.setSubject(strSubject);
        
        String emailContent = 'Dear Sales team, <br> <br/>  '+
            			 		'We are pleased to infor you that we have processed the weekly Account AnnualRevenue Calculation status updated successfully<br/><br/> '+
            'please find the batch job status details as below .. : <br/> <br/>' + 
            'Batch Job Id .... '+ jobDetails.id + 
            '<br//> <br/> 	Batch job name : ' + jobName +
            '<br/> Total Number of Batch available.. ' + jobDetails.TotalJobItems+
            '<br/> Number of Batch Processed... : ' + jobDetails.JobItemsProcessed + 
            '<br/> Number of Batch Failed...: ' +  jobDetails.NumberOfErrors+
            '<br/> bBatch Job Owner Email id.. : ' + jobDetails.CreatedBy.email+
            '<br/> job details status ... : ' + jobDetails.Status+
            '<br/> Total Account Record Revenue is . :' + totalAnnualRevenue+
            '<br/> Please contact ob below address, if any queries . <br><br/>'+ 
            '***<i>This is System Generated Email. So don not reply</i>' + 
            '<br/>Thanks and regards, <br/> Support Team, <br/> Tata Inc.';
        email.setHtmlBody(emailContent);
       Messaging.SendEmailResult[] result	 =  Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
        
        
        
        
    }

}