//Generated for Decodeforce programming test
public class bdayOpportunityController{

    public static List<Opportunity> createOpportunities( List<Contact> contactList, Integer month){

        List<Opportunity> opportunityList = new List<Opportunity>();

        /* Write your logic below */
        for(Contact con : contactList){
            if(con.Birthdate !=null && con.Birthdate.month()==month){
                Opportunity opp = new Opportunity();
                opp.name = con.lastname + ' - birthday sale';
                opp.stagename = 'proposal';
                opp.closedate = con.Birthdate;
                opportunityList.add(opp);
            }
        }
        return opportunityList;
    }
}