public class AccountUpdateHandler {
    public static void createContact(List<Account> newAccounts){
        
        List<Contact> newContacts = new List<Contact>();
        
        for (Account acc : newAccounts) {
            Contact newContact = new Contact();
            newContact.AccountId = acc.Id;
            newContact.LastName = acc.Name;
            newContact.Phone = acc.Phone;
            newContacts.add(newContact);
        }
        
        if (!newContacts.isEmpty()) {
            insert newContacts;
        }
    }
}