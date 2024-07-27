//Generated for Decodeforce programming test 

public class apexListController{

	public static List<Account> removeDuplicates(List<Account> accountList){

		Set<Account> uniqueAccountSet = new Set<Account>();
        for(Account acc : accountList){
         uniqueAccountSet.add(acc);
        }
        List<Account> uniqueAccountList = new List<Account>(uniqueAccountSet);
        return uniqueAccountList;

	}
}