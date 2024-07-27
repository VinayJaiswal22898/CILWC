public class Collection {
        public static void listCollection(){  
        List<Object> lstObj = new List<Object>{'ram', 'shyam', 'Pandey', 4, 2, 3};
        system.debug('lstobj=>'+lstObj.get(0));
        // Remove the first element from the list
        lstObj.remove(0);
        
        // Separate the list into lists of integers and strings
        List<Integer> intList = new List<Integer>();
        List<String> strList = new List<String>();
        
        for (Object obj : lstObj) {
            if (obj instanceof Integer) {
                intList.add((Integer)obj);
            } else if (obj instanceof String) {
                strList.add((String)obj);
            }
        }
        intList.sort();
        strList.sort();
        System.debug(intList);
        System.debug(strList);
        lstObj.set(3,'Rakul');
        system.debug(lstObj);
        List<Object> backup= lstObj.clone();
        system.debug(backup);
        if(lstObj.equals(backup)){
            System.debug('both are same');
        }
        lstobj.clear();
        system.debug(lstobj);
            // List for SObject 
            
            }
        public static void setCollection(){
            
            Set<string> objSet = new Set<string>{'Ram', 'Rebuka', 'Rekha'};
           
              
            // -----------add(elementName)
            objSet.add('Rekha') ; 
            system.debug(objSet);
            // ----------addAll(<Collection/Arrary>)
             List<String> strList = new List<String>{'Ravi','Ram'}; // collection
             String[] str = new String[2]; // 
            str[0]= 'str raghav';  // Array
            str[1] = 'Renu';
              objSet.addAll(strList); 
            //objSet.addAll(str);
            System.debug('after addAll Method'+objSet);
           // Integer Size()
            system.debug(objSet.size());
           
            // IsEmpty() O/P TRUE/FALSE
            system.debug(objset.isEmpty());
            
            // remove(<Element Name>)
            objSet.Remove('Ram');
            system.debug(objSet);
            
            // contains(elementName)
            
            System.debug('Contains Method:' +objSet.Contains('Ravi'));
           
            // colone() method
            Set<String> backupData = objSet.clone();
            system.debug('Backup data'+backupData);
            
            // containsAll(listToCampre) or containsAll(setToCampre)
            
            System.debug('ContainsAll method for Set collection:'+objSet.containsAll(backupData));
            List<String> lstString = new List<String>(backupData);
            System.debug('ContainsAll method for list collection:'+objSet.containsAll(lstString));
            // boolean Equals()
            System.debug('Equals: '+objSet.Equals(backupData));
            
            // clear()
            backupData.clear();
            System.debug('Clear'+backupData);
            
           /*---------------------set for Sobject 
            Uniqueness of sObjects is determined by comparing the objects’ fields. For example, if you
             try to add two accounts with the same name to a set, with no other fields set, only one sObject is added to the set.*/
            // Create two accounts, a1 and a2
            Account a1 = new Account(Name='MyAccount');
              Account a2 = new Account(Name='MyAccount');
            
            // both add into set
            Set<Account> acc = new Set<Account>{a1,a2};
                /*
				assertEquals. public static void assertEquals(Object expected, Object actual)
					Asserts that two objects are equal. If they are not, an AssertionError without a message is thrown*/

                System.assertEquals(acc.size(), 1);
            System.debug(acc);
            //If you add a description to one of the accounts, it is considered unique and both accounts are added to the set.
            Account a3 = new Account(Name= 'MyAccount');
            Account a4 = new Account(Name= 'MyAccount', Description = 'My Test Account');
            
            // adding both account into set
            Set<Account> setAccount = new Set<Account>{a3,a4};
                System.debug(setAccount);
            
            
            
                }
   		public static void mapCollection(){
        Map<Integer, String> intToStrMap = new Map<Integer, String>();
        // put<Key, value>
        intToStrMap.put(1,'Banana');
        intToStrMap.put(2,'apple');
        intToStrMap.put(3,'Apple');
        system.debug(intToStrMap);
        // putAll(MapColletion)
        Map<Integer,String> intToStrMap1 = new Map<Integer, String>();
        intToStrMap1.put(3,'Orange');
        intToStrMap.putAll(intToStrMap1);
        System.debug(intToStrMap);
        
        // Integer size();
        System.debug(intToStrMap.size());
        
        // Boolean isEmpty() true/False
        System.debug(intToStrMap.isEmpty());
        
        // Boolean containsKey(KeyName); it will search the key inside the colleation 
        System.debug(intToStrMap.containsKey(1));
        
        // Get(KeyName)  it will give the value of given key
        System.debug('Map Get method : '+ intToStrMap.get(3));
        
        // remove(keyname)
        intToStrMap.remove(3);
        System.debug('after remove'+intToStrMap);
        
        // Set<DataType> keySet()
        Set<Integer> keySet = intToStrMap.KeySet();
        System.debug(keySet);
        
        // List<DataType>  Values() it will return all 
        List<String> listStr = intToStrMap.Values();
        for(String str : listStr){
        System.debug(str);
            }
         System.debug(listStr);
        
        // Clone();
        Map<Integer, String> backupData = new Map<Integer, String>();
        BackupData = intToStrMap.Clone();
        System.debug('Backupdata:'+ backupData);
        
        // Boolean Equals(MapCollection)
        Boolean br = intToStrMap.equals(backupData);
        System.debug('Equals Method : '+br);
        
        // Clear();
        backupData.clear();
        system.debug(backupData);
        
        
    }
}