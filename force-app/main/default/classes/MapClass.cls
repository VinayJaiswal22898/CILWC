public class MapClass {
    public static void NewMapCollection(){
        
        Account acc1 = new Account();
        acc1.Name= 'Radha Ltd';
        acc1.Rating = 'Hot';
        acc1.Industry = 'Finance';
        acc1.Phone = '7766778899';
        // map constructor 
        // Map<T1,T2>() t1 is key data types and t2 is data type of values
        Map<Integer, Account> map1 = new map<Integer, account>();
        map1.put(1,acc1);
        system.debug('map1'+map1.values());
        
        // Map<T1,T2>(mapToCopy) t1 is key data types and t2 is data type of values and inialization 
        Map<Integer, Account> map2 = new map<Integer, Account>();
        map2.put(1,acc1);
        
        Map<Integer, Account> map3 = new Map<Integer, Account>(map2); // inialization 
        system.debug('Inialization type map  '+ map3);
        
        // map<Id, sObject>(listRecord) or ([Select id, name from account])
        List<Account> ls = [Select id, name from account limit 2];
        Map<Id, Account> map4 = new Map<Id, Account>(ls);
        system.debug(map4);
        
        // clear()
        //map4.clear();
       system.debug('clear method '+ map4);
        
        // clone() method
        Map<Integer, Account> backupData = map1.clone();
        system.debug('backup'+backupData.values());   
       // -------------------shallow copy 
       Map<Id, Account> originalMap = new Map<Id, Account>([Select id, name from account limit 2]);
       Map<Id, Account> duplicateMap = new Map<Id, Account>(originalMap);
        
        // Modifying an sObject in the original map
       originalMap.get(originalMap.keyset().iterator().next()).Name = 'New Name'; // .iterator() creates an iterator for the set.
        // allowing you to traverse the elements of the collection one by one
          //.next() retrieves the first element (key/Id) from the set.
         // The change is reflected in the duplicate map
			System.debug(duplicateMap.values()[0].Name);  // Outputs: New Name
           
        // Boolean comntainsKey(keyName);
        Map<String, String> colorCodes = new Map<String, String>();

			colorCodes.put('Red', 'FF0000');
		colorCodes.put('Blue', '0000A0');

		Boolean contains = colorCodes.containsKey('Blue');
		System.assertEquals(true, contains);
        
       // equales(map2)
        //Boolean eqls = originalMap1.equals(duplicateMap1);
        //system.debug(eqls); // outPut false 
        // get(key) Returns the value to which the specified key is mapped, or null if the map contains no value for this key
        Map<String, String> colorsCodes = new Map<String, String>();

            colorsCodes.put('Red', 'FF0000');
            colorsCodes.put('Blue', '0000A0');
            
            String code = colorsCodes.get('Blue');
            
            System.assertEquals('0000A0', code);
            
            // The following is not a color in the map 
            String code2 = colorsCodes.get('Magenta');
            System.assertEquals(null, code2);
		   system.debug(colorsCodes.hashcode());
           // isEmpty() it will return true  or false if map has zero key value pairs true otherwise false 
           System.debug(colorsCodes.isEmpty()); 
            
            
            // put() method 
            Map<String, String> putMap = new Map<String, String>();
            putMap.put('Red', 'FF00');
            putMap.put('Red', 'FF88');
            system.debug(putMap.Values());
            
            // putAll(Array/List)
            List<Account> accts = new list<Account>();
            accts.add(new Account(Name='Account5'));
            accts.add(new Account(Name='Account6'));
            insert accts;  // to generate id
            Map<Id, Account> m = new Map<Id, Account>();
            m.putAll(accts);
            System.assertEquals(2, m.size());
            system.debug(m);
            
            // remove()
          String myColor =  putMap.remove('Red');
            String mycolor2 = putMap.get('Red');
            system.debug(mycolor2); // null
            //size()
            Integer siz =putMap.size();
            system.debug(siz); // O
            // values() same order vales based n index 
            Map<Id, Account> idacc = new Map<Id, Account>([Select id, name from account limit 2]);
            list<Account> accvalues =idacc.values();
             system.debug(accvalues);
                }    
            

}