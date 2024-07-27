public class MessagingUtility {
    public static void sendMassEmailsToContacts(){
        // get the contact email id to send the notification
        Map<Id, Contact> mapContacts = new Map<Id, Contact> ([Select id, phone, email
                                                             from contact
                                                             where email != null and phone = null]);
        System.debug('Number of Contact record Found' + mapContacts.size());
         
        if(!mapContacts.isEmpty()){
            List<ID> lstContactIds = new List<ID>();
            lstContactIds.addAll(mapContacts.KeySet());
            if(!lstContactIds.isEmpty()){
                EmailTemplate template = [Select id, name, templateType, isActive
                                         from EmailTemplate
                             where name = 'Update Contact Number In Database Template'];
                if(template.id != null){
                    // write the code to send the mail
                    Messaging.MassEmailMessage massEmail =  new Messaging.MassEmailMessage();
                    massEmail.setTargetObjectIds(lstContactIds);
                    massEmail.setTemplateID(template.id);
                    
                    Messaging.MassEmailMessage[] arrayMassEmail = new Messaging.MassEmailMessage[]{massEmail};
                    
                    Messaging.sendEmailResult[] results = Messaging.sendEmail(arrayMassEmail);
                }
            }
            
        }
    }
    public static void createLeadRecord(){
        Lead leadRecord = new Lead();
        leadRecord.FirstName = 'Ruka';
        leadRecord.lastName = 'Gupta';
        leadRecord.Title = 'HR manager';
        leadRecord.Industry = 'Banking';
        leadRecord.Rating = 'Warm';
        leadRecord.AnnualRevenue= 2500000;
        leadRecord.Phone = '25654789';
        leadRecord.Fax = '4455668899';
        leadRecord.Email = 'Vinayjaiswal22898@gmail.com';
        leadRecord.Company = 'Bita';
        leadRecord.Status = 'Working - Contacted';
        leadRecord.LeadSource = 'web';
        leadRecord.Street = '104 classc height';
        leadRecord.City = 'Bengaluru';
        leadRecord.State  = 'Karnatak';
        leadRecord.Country = 'India';
        // insert the lead record
        Insert leadRecord;
        
        if(leadRecord !=null){
            System.debug('Lead Record Created Successfully. Lead Id is ..'+ leadRecord.id);
           
            // invoke the method to send email alert 
        
             SendNotificationEmailToLead(leadRecord);
        }
        
    }
    public static void SendNotificationEmailToLead(Lead leadRecord){
        if(leadRecord != null){
            // write the code to send email alert
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage ();
            
            String [] toAddress = new String[]{leadRecord.Email, 'Vinayjaiswal22898@gmail.com'};
                                            email.setToAddresses(toAddress);
                // cc email address
                String [] ccToAddress = new String[]{'Vinayjaiswaldc@gmail.com'};
                    email.setCcAddresses(ccToAddress);
            // bcc
            List<String> bccToAddresses = new List<String> { 'vinayjaiswal22898@gmail.com'};
                email.setBccAddresses(bccToAddresses);	
            
            email.setReplyTo('vinaykumar@gmail.com');
            email.setSenderDisplayName('ICICI BANK CREDIT DEPARTMENT');
            
            String emailSubject = 'Congratulation ' + leadRecord.FirstName + ' '+ leadRecord.LastName + '!!! your credit card form has been submitted' ;
             email.setSubject(emailSubject);
            String emailContent = 'Dear'+ leadRecord.FirstName +' ' + leadRecord.LastName + ', <br/><br/>'+
                					'Thank you for showing your interest in our Banking Services. <br/><br>' +
                    'We are pleased to inofrom you that your application has been registered successfully. <br/> <br/> '+
                'Here are your lead record details ..... <br/> <br/>' + 
                'Credit card application number ..' +leadRecord.Id +
                '<br/> Applicant Name ... : ' +leadRecord.FirstName + ' ' + leadRecord.LastName +
                '<br/> Current Employeer Name ..' + leadRecord.Company + 
                '<br/> Designation/Role ... ' +leadRecord.Title + 
               '<br/> Lead Person Credit rating ..' + leadRecord.Rating+ 
                '<br/> Lead  Industry Name...: ' + leadRecord.Industry + 
                '<br/> AnnualRevenue ..:' + leadRecord.AnnualRevenue+
                '<br/><br/>Thanks and Regards<br/> ,  Credit Crad Department';
                email.setHTMLBody(emailContent);
            
            // prepare a list collction 
            List<Messaging.EmailFileAttachment> lstAttachments = new List<Messaging.EmailFileAttachment>();
            
                    // prepare the attachment
        Messaging.EmailFileAttachment attachmnet = new Messaging.EmailFileAttachment();
        attachmnet.setFileName(leadRecord.FirstName +' '+ leadRecord.LastName +'.pdf');
        attachmnet.setContentType('Application/pdf');
        attachmnet.Body = BLOB.toPdf(emailContent);  // body is property not method BLOB Convert data into binary file 
       // add the attachment to the list
        lstAttachments.add(attachmnet);
            
            // add the attachment to eamil
            email.setFileAttachments(lstAttachments);
                
            //send eamil to lead
            Messaging.SendEmailResult[]  results = Messaging.SendEmail(new messaging.singleEmailMessage[] {email});
                }        
    }
}