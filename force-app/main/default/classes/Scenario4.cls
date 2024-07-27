public class Scenario4 {
    public static void sendEmail(List<Contact> conNew){
        if(conNew !=null && !conNew.isEmpty())
        for(contact con : conNew){
            if(con.Department=='CSE'){
                con.Email = 'vinayjaiswal@gmail.com';
            }
        }
    }

}