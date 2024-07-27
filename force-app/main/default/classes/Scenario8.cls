public class Scenario8 {
    public static void emailValidation(List<Contact> conNew){
        if(conNew !=null && !conNew.isEmpty()){
            for(Contact con : conNew){
                if(con.Email !=null && con.Email != ''){
                    List<Contact> lstContact = [Select id, lastName ,email
                                            from contact
                                           where email =:con.Email] ;
                    if(lstContact.size()>0){
                    con.addError('email already exist');
                }
                }
                
            }
        }
    }
}