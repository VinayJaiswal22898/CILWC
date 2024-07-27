public class SetClass {
    public static void setMethods(){
       // SET<T>();
       Set<String> setStr = new Set<String>();
        setStr.add('Vinay');
        setStr.add('vinay');  // case sensitive 
        system.debug(setStr);
         // set<T>(setToCOpy)
         Set<String> setBackUpData = new Set<String>(setStr); // The set elements in s2 are copied from setBackUpData
        system.debug(setBackUpData);
        // set<T>(ListToCopy)
        List<String> lstStr = new List<String>{'Ramu', 'Ramu'};
            Set<String> setStrLst = New Set<String>(lstStr);  // Elements are copied from the list to this set
        system.debug(setStrLst);
        
        // add(setElement)
        Set<String> mystr = new Set<String>{'a','b','c'};
            Boolean myResult = mystr.add('d');
        system.assertEquals(true,myResult);
        System.debug(myResult);
        
        //addAll(fromList) union of list and set
        List<Integer> intList = new List<Integer>{1,2,3};
            Set<Integer> intSet = new Set<Integer>{1,4,5};
               Boolean str= intset.addAll(intList);
        system.debug(intSet);
        system.debug(str);
        // addAll (fromSet) union of sets
        Set<String> setSrt = new set<String>{'Rakesh','Ramesh'};
            set<String> setStr2 = new set<String>{'Rakesh','ruby'};
            Boolean brResult = setStr2.addAll(setSrt);
        system.debug(setStr2);
        system.debug(brResult);
        
        // clear()
        Account acClr =new Account(Name='Test', Rating= 'Hot');
        Set<Account> accSet = new Set<Account>();
        accSet.add(acClr);
        System.debug(accSet);
       // accSet.clear();
        System.debug('Clear Method call' +accSet);
        
        // clone()
        Set<Account> backUpdata = accSet.clone();
        system.debug('backUpdata'+backUpdata);
        // contains()
        // Creating a Set<Account> and adding an Account object
        Set<Account> strset= new Set<Account>{new account(Name= 'test', Rating = 'hot')};  // first intialization 
        Set<Account> intialization = new set<Account> (strset);  // second way intialization 
        // Creating an Account object with the values you want to check
        Account accnew = New Account (Name= 'test', Rating = 'hot');  
            Boolean br = intialization.contains(accnew);
            System.debug(br);// true
        // containsAll(listToCompare)
        List<Account> accList = new List<Account>{New Account(Name='Xyz Test', Rating ='Hot')};
        Set<Account> accSet3 = new Set<Account>(accList); // or {New Account(Name='Xyz Test', Rating ='Hot')}
         Boolean brcon = accSet3.containsAll(accList);
        System.debug(brcon);
        
        // containsAll(SetToCompare)
        Set<Contact> myconSet = new Set<Contact>{New Contact(LastName = 'Ramu', FirstName='Kumar',Phone = '9988776655')}; // set
        //Set<Contact> sContact = new Set<Contact> {New Contact (Phone = '9988776655')}; // subset
        Set<Contact> ccContact = new Set<Contact>{New Contact(LastName = 'Ramu', FirstName='Kumar',Phone ='9988776655')}; // superset
            Boolean result1, result2;
           // result1 =myconSet.addAll(sContact);
        system.debug('result1'+result1); // true
        result2= myconSet.containsAll(ccContact);
        System.debug('result2'+result2); // true 
        
        // or Contains All
        Set<String> myString = new set<String> {'a','b'};
        Set<String> sMyString = new set<String> {'c'};
        Set<String> ssMyString = new set<String> {'a','b','c'};
        Boolean result3, result4;
        result3 =myString.addAll(sMyString);
        System.debug('result3'+result3);
        result4 = myString.containsAll(ssMyString);
        System.debug('result4'+result4);
        
        
        // equals(set2)
        Set<String> eqmyString = new set<String> {'a','b','c'};
        Set<String> eqsMyString = new set<String> {'a','B','C'};  
       Boolean brEq= eqmyString.equals(eqsMyString);  
        system.debug(brEq);  // false string is case sensitive 
        // or 
        system.debug(eqmyString == eqsMyString);  //equals()method is same as equal operator == 
         // hashCode()
        Integer inth =  eqmyString.hashCode(); 
        system.debug(inth);
        
      // Public Boolean isEmpty()
     Boolean brEm = eqmyString.isEmpty();
        system.debug(brEm);// false
        //Public Boolean  remove ()//. true or false
       Boolean reResult=  eqmyString.remove('a');
        system.debug(reResult);
        
        // Public Boolean removeAll(ListOfElementsToRemove) 
        Set<String> revSet = new set<String>{'apple','banana', 'orange'};
            List<String> revList = new List<String>{'apple','banana'};
             Boolean revB= revSet.removeAll(revList);    // Using removeAll method to find the relative complement of setA and listB
        system.debug(revB);// true
        // Now setA contains elements that are in setA but not in listB
        System.debug(revSet); // {'orange'}
        
        // Public boolean removeAll(SetOfElementToRemove)
        Set<String> setStr00 = new Set<String>{'apple','banana', 'orange'};
       Set<String> setStr001 = new Set<String>{'apple','banana'};   
           Boolean revBr00 = setStr00.removeAll(setStr001);
        system.debug(setStr00);
        
        // public boolean retainAll(ListOfElementsToRetain)
        Set<integer> mySet11 = new Set<integer>{1, 2, 3,4};
		List<integer> myList22 = new List<integer>{1, 3};
		Boolean result = mySet11.retainAll(myList22);
		System.assertEquals(true, result);
        //Public Integer size()
        Integer intsize1 = mySet11.size();
        system.debug(intsize1);
        
        
    }

}