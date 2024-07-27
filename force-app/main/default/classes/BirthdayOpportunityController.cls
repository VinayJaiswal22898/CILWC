public class BirthdayOpportunityController {

    public static List<Opportunity> createOpportunities(List<Contact> contactList, Integer targetMonth) {
        List<Opportunity> opportunityList = new List<Opportunity>();

        for (Contact con : contactList) {
            if (con.Birthdate != null && con.Birthdate.month() == targetMonth) {
                Opportunity opp = new Opportunity();
                opp.Name = con.Name + ' - Birthday Sale';
                opp.CloseDate = Date.newInstance(Date.today().year(), targetMonth, con.Birthdate.day());
                opp.StageName = 'Proposal';
                opportunityList.add(opp);
            }
        }

        return opportunityList;
    }
}