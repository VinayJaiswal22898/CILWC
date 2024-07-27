//Generated for Decodeforce programming test
public class OpportunityCloseDateController{

	public static void setCloseDate(Id opportunityId){

		/* Write your logic below */
        //SOQL
        List<Opportunity> oppList = [Select id , Account.rating, closeDate from Opportunity where Id =: opportunityId ];
        List<Opportunity> oppToUpdate = New List<Opportunity>();
        for (Opportunity opp :oppList ){
            if(opp.Account.rating == 'Hot'){
                opp.closeDate = date.today().addDays(3);
                oppToUpdate.add(opp);
            }
            else if (opp.Account.rating == 'Warm'){
                opp.closeDate = date.today().addDays(7);
                oppToUpdate.add(opp);
            }
           else if (opp.Account.rating == 'Cold'){
                opp.closeDate = date.today().addDays(14);
                oppToUpdate.add(opp);
            } 
        }
        if(!oppToUpdate.isEmpty()){
            update oppToUpdate ;
        }
	}
}