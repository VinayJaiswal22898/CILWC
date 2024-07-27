public class LinkCaseToContactTriggerHandler {
    public static void linkedCaseAndContact(List<Case> newCases){
        Set<String> caseEmail = new Set<String>();
        Map<String, Contact> conEmail = new Map<String, Contact>();
        if(newCases !=null && !newCases.isEmpty()){
        for(Case newCase : newCases){
            if(newCase.suppliedEmail !=null){
                caseEmail.add(newCase.suppliedEmail);
            }
        }
        }
        if(!caseEmail.isEmpty()){
            system.debug('Case email while insert'+caseEmail);
            List<Contact> lstContact = [Select id, email, lastname from contact
                                       where email In :caseEmail];
            system.debug('lstContact'+lstContact);
            Map<String, Id> mapOfEamilToLinked = new Map<String, Id>();
            for(Contact con : lstContact){
                if(caseEmail.contains(con.Email)){
                    mapOfEamilToLinked.put(con.Email,con.id);
                }
            }
            system.debug('mapOfEamilToLinked'+mapOfEamilToLinked);
            List<Contact> conToInsert = new List<Contact>();
            for(Case newCase: newCases){
                if(mapOfEamilToLinked.containsKey(newCase.suppliedEmail)){
                    system.debug(newCase);
                    newCase.ContactId = mapOfEamilToLinked.get(newCase.suppliedEmail);
                }
                else{
                    Contact con = new Contact();
                    con.Email =newCase.SuppliedEmail ;
                    con.LastName = 'NewCon';
                    conToInsert.add(con);
                    newCase.ContactId = con.id;
                    system.debug('con'+ con);
                    conEmail.put(con.Email,con);
                    
                }
            }
            if(!conToInsert.isEmpty()){
                Insert conToInsert;
                system.debug(conToInsert);
            }
        }
        if(!conEmail.isEmpty()){
            for(Case c : newCases){
                if(c.suppliedEmail !=null && conEmail.ContainsKey(c.suppliedEmail)){
                    c.contactId = conEmail.get(c.suppliedEmail).id;
                }
            } 
        }
        
    }
}