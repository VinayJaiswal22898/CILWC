public class ContactTriggerHandler {
    public static void checkDuplicateContacts(List<Contact> contactList, Map<Id,Contact> oldMap){
    
  
        Map<String, Contact> mapPhone = new Map<String, Contact>();
        Map<String, Contact> mapEmail = new Map<String, Contact>();
       
          // Collect existing phone and email values 
        for(Contact con : [Select id, email, phone from contact 
                                        where email !=null OR phone !=null]){
            mapPhone.put(con.Phone, con);
            mapEmail.put(con.Email, con); 
        }
        // checking duplicate of phone 
        for(Contact con : contactList ){
            if((con.Phone !=null && mapPhone.ContainsKey(con.Phone)) ||
               (con.Phone !=null && mapPhone.ContainsKey(con.Phone) && con.Phone != oldMap.get(con.id).Phone)){
                   con.Phone.addError('Duplicate Phone number');
               }
            // checking duplicate of email
            else if((con.Email != null && mapEmail.ContainsKey(con.Email)) ||
                   (con.email != null && mapEmail.ContainsKey(con.Email) && con.email != oldMap.get(con.id).Email)){
                       con.Email.addError('Duplicate Email Address');
                
            }
        }
        
    }

}