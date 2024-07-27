public class ContactTriggerUpdate {
    public static void updateContactRecord(){
        List<Contact> lstContact = [Select id, lastName from contact 
                                   where Lastname = 'Singh'];
        for(Contact con : lstContact){
            con.lastName = 'Gupta';
        }
        if(!lstContact.isEmpty()){
            update lstContact;
            
        }
    }

}