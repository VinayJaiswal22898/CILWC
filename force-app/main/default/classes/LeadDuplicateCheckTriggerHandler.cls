public class LeadDuplicateCheckTriggerHandler {
    public static void leadDuplicateCheck(List<Lead> newLeads) {
        Set<String> existingPhoneEamil = new Set<String>();
        for (Lead newlead : newLeads) {
            if(newlead.Phone !=null){
               existingPhoneEamil.add(newlead.Phone); 
            }
            
            if(newlead.email !=null){
                existingPhoneEamil.add(newlead.Email);
            }
        }
        List <Lead> countlead = [Select phone, email from lead where Phone In : existingPhoneEamil Or Email In : existingPhoneEamil];
        if(countLead.size()>0){
            newLeads[0].addError('eamil or phone is aleeady exist');
        }
    }
}

/*
  for (Lead exsitingLead : [Select phone, email from lead where phone IN : existingPhoneNumbers OR  Email In : existingEmails ] ) {
            if (existingPhoneNumbers.contains(exsitingLead.Phone)) {
               newLeads[0].Phone.addError('Phone Already Exist');
            }
            if(existingEmails.contains(exsitingLead.Email)){
                newLeads[0].Email.addError('Email Already Exist');
            }
        }
*/