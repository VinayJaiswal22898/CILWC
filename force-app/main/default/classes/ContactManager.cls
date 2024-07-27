public with sharing class ContactManager {
   @AuraEnabled(cacheable = true)
    public static List<Contact> getContact( ){
      //String conP = '%' + conPhone + '%';
      //String conE = '%' + conEmail + '%';
           return [Select Name,  FirstName, LastName, Phone, Email From Contact ];
   }
   @AuraEnabled
   public static List<Contact> getContactByFlow(String conLastName){
      return [Select LastName From Contact Where LastName =: conLastName];
}
@AuraEnabled
public static void createContact(String lastName, String firstName){
   //String response = ' ';
      Contact con = new Contact() ;
      con.LastName = lastName;
      con.FirstName = firstName;
      insert con;
     // response = 'Created!';
   }
}
