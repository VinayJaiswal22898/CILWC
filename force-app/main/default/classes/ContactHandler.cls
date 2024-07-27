public with sharing class ContactHandler {
    @AuraEnabled
    public static List<Contact> contactCreation( String firstName, String lastName, String phone, String emailId) {
        List<Contact> conToInsert = new List<Contact>();
        Contact con = new Contact();
        con.FirstName = firstName;
        con.lastname =lastName;
        con.phone = phone;
        con.Email =emailId;
        conToInsert.add(con);
        if(conToInsert.isEmpty()){
            insert conToInsert;
        }
        return conToInsert ;
    }
    @AuraEnabled(cacheable =true)
    public static List<Contact >searchContact(String name){
        String  searchkey= '%' + name + '%';
        return [select id , Name, Phone from contact where name like :searchkey];
    }
    @AuraEnabled
    public static void deleteContact(String Email, String Phone){
        List<Contact> conToDelete = [Select Id, Name from contact where Email =: Email AND  Phone =: Phone ];
        if(!conToDelete.isEmpty()){
            delete conToDelete;
        }
    }
}