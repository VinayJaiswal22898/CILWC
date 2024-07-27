/**𝐖𝐡𝐞𝐧𝐞𝐯𝐞𝐫 𝐮𝐬𝐞𝐫 𝐢𝐬 𝐜𝐫𝐞𝐚𝐭𝐢𝐧𝐠 𝐧𝐞𝐰 𝐀𝐜𝐜𝐨𝐮𝐧𝐭 𝐑𝐞𝐜𝐨𝐫𝐝, 𝐜𝐡𝐞𝐜𝐤 𝐢𝐟 𝐭𝐡𝐞 𝐑𝐞𝐜𝐨𝐫𝐝 𝐢𝐬 𝐚𝐥𝐫𝐞𝐚𝐝𝐲 𝐚𝐯𝐚𝐢𝐥𝐚𝐛𝐥𝐞 𝐰𝐢𝐭𝐡 𝐭𝐡𝐞 𝐬𝐚𝐦𝐞 𝐧𝐚𝐦𝐞 𝐢𝐧 𝐭𝐡𝐞 𝐝𝐚𝐭𝐚𝐛𝐚𝐬𝐞,then show error"**/

public class AccountInterviewClass {
    public static void updateAccountRecord(List<Account> accNew){
        Set<String> accNameList = new Set<String>();
        if(accNew !=null && !accNew.isEmpty()){
            system.debug(accNew);
            for(Account acc : accNew){
                accNameList.add(acc.Name);
            }
        }
        system.debug(accNameList);
        if(!accNameList.isEmpty()){
            Map<String, Account> accToUpdate = new Map<String,Account>();
            for(Account acc : [Select id,name,rating from account
                               where Name IN : accNameList]){
                                   accToUpdate.put(acc.name,acc);         
                               }
            For(Account acc : accNew){
                if(accToUpdate.containsKey(acc.Name))
                {
                    // Add error to prevent new record insertion
                    acc.addError('Account with the same name already exists.');  
                }
            }
        }  
    }
}