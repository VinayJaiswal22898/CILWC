//Generated for Decodeforce programming test 

public class OpportunitySumController{

	public static decimal calculateSum(Set<Id> accountIds){

		Decimal sum = 0; 

		/* Write your logic below */
        List<Opportunity> oppList = [Select id, accountId, amount
        from Opportunity where accountId In : accountIds];
        //List<Opportunity> oppListBulk = new List<Opportunity>();
        for(Opportunity opp : oppList){
            sum += opp.amount;
        }
		return sum;
	}
}