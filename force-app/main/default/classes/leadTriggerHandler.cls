//Generated for Decodeforce programming test
public class leadTriggerHandler{

	public static void beforeInsert(){

		List<Lead> newLeads = Trigger.new;
		for(Lead newLead : newleads){
            if(newLead.company == null){
                newLead.company = 'TBA';
            }
        }
	
	}
}