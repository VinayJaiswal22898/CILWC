public class Scenario13Handler {
    public static void createAccOppCon(List<Lead> ldNew)
    {
        system.debug(ldNew);
        List<Account> acclst = new List<Account>();
        List<Contact> conlst = new List<Contact>();
        List<Opportunity> opplst = new List<Opportunity>();
        if(ldNew !=null && !ldNew.isEmpty()){
            for(Lead ld : ldNew){
                Account acc = new Account();
                acc.Name = ld.lastname;
                acc.Phone = ld.Phone;
                acclst.add(acc);
                
                // create new contact
                Contact con = new Contact();
                con.Lastname = ld.lastname;
                con.Phone = ld.Phone;
                conlst.add(con);
                
                // create opportunity
                Opportunity opp = new opportunity();
                opp.Name = ld.lastname;
                opp.Amount = ld.AnnualRevenue;
                opp.StageName = 'closed won';
                opp.Type = 'New Customer';
                opp.CloseDate = system.today();
                opplst.add(opp);
            }
        }
        system.debug(acclst + '' + conlst + ''+ opplst);
        insert acclst;
        Insert conlst;
        Insert opplst;
    }

}