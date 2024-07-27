public class ContactTrigger2Handler {
   public static void makingMandatoryFields(List<Contact> conRecords){
        for(Contact conRecord : conRecords){
            if(conRecord.Phone==null || conRecord.Phone == ' '){
                conRecord.Phone.addError('Please Enter your Phone number');
            }
            else if(conRecord.Email == null || conRecord.Email == ' '){
                conRecord.Email.addError('Please Enter Your Email Address');
            }
        }
    }

}