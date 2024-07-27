public class ListClass {
    public static void listMethod(){
        // list Constructor 
        // List<T>()
        List<Integer> intList = new List<Integer>{1,2,3};
            System.debug(intList);
        // List<T>(listToCopy)
        List<Integer> ls1 = new List<Integer>();
		ls1.add(1);
		ls1.add(2);
        // Create a list based on an existing one
        List<Integer> ls2 = new List<Integer>(ls1);
        // ls2 elements are copied from ls1
        System.debug(ls2);// DEBUG|(1, 2)
        // List<T>(SetToCopy)
        Set<Integer> s1 = new Set<Integer>();
		s1.add(1);
		s1.add(2);
		// Create a list based on a set
		List<Integer> ls = new List<Integer>(s1);
        system.debug(ls);
        
        // method 
        // public Void add(Object listElement)
        List<Integer> myList = new List<Integer>();
		myList.add(47);
		Integer myNumber = myList.get(0);
		system.assertEquals(47, myNumber);
        // public Void add(Integer index, Object listElement)
        List<Integer> intList2 = new Integer[5];
        intList2.add(0,45);
        intList2.add(1,47);
        system.debug(intList2.get(0));
        
        // public Void addAll(List fromList)
        List<String> mylstString =  New List<String>{'a','b','c'};
            List<String> addlist = new List<String>{'d','f'};
             mylstString.addall(addlist); 
        system.debug(mylstString); // {a b c d f}
        
        // -------public Void addAll(Set fromSet)
        Set<Integer> intset00 = new Set<Integer>{1,2,3,4};
            List<Integer> intList00 = new List<Integer>{5,6};
            intList00.addAll(intset00); 
        system.debug(intset00);  // {1,2,3,4,5,6}
        // public Void clear()
        intset00.clear(); //Removes all elements from a list, consequently setting the list's length to zero.
            System.debug(intset00 + 'size =>' + intset00.size()); // empty list and size zero 
        
        // -----public List<Object> clone()
        List<Account> originalList = [Select id, name from account limit 2];
        // now clone it 
        List<Account> cloneData = originalList.clone();
        // Modifying an sObject record in the original list
        originalList[0].name = 'Updated Name clone method';
        
        System.debug('Original List: ' + originalList);
		System.debug('cloneData: ' + cloneData);  // both(originalList, cloneData) will be same result bcz they are pointing to same sobejct
       
        List<Account> originalList00 = [SELECT Id, Name FROM Account LIMIT 5];

        // Creating a deep copy using deepClone
        List<Account> deepCopyList = originalList00.deepClone(true);
        
        // Modifying an sObject record in the original list
        originalList00[0].Name = 'Updated Name deepclone';
        
        System.debug('Original List: ' + originalList00);
        System.debug('Deep Copy List: ' + deepCopyList);
        //----public Boolean contains(Object listElement)
        List<String> myStrings = new List<String>{'a', 'b'};
		Boolean result = myStrings.contains('z');
		System.assertEquals(false, result);
        
        // public boolean equals()
        List<String> strListEq = New List<String>{'A','b','c'};
        List<String> strListEqs = new List<String>{'a','b','c'};
        Boolean resultEq = strListEq.equals(strListEqs);
        system.debug(resultEq); // false bcz case sensitive 
        
        // public Object get(Integer index)
        List<Integer> myList0099 = new List<Integer>{1,2};
        Integer myNumber0099 = myList0099.get(0);
        system.debug(myNumber0099);
        List<String> colors0099 = new String[3];
        colors0099[0] = 'Red';
        colors0099[1] = 'Blue';
        colors0099[2] = 'Green';
        // public Integer hashCode()
        Integer intHashCode =myList0099.hashCode();
        system.debug(intHashCode);
               // public Integer indexOf(Object listElement)
        List<String> stringList = new List<String>{'apple', 'banana', 'orange', 'grape', 'kiwi'};
        // Using indexOf to find the index of an element in the list
        Integer indexBanana = stringList.indexOf('banana');
        Integer indexWatermelon = stringList.indexOf('watermelon');
        
        // Outputting the results
        System.debug('Index of "banana": ' + indexBanana); // Output: Index of "banana": 1
        System.debug('Index of "watermelon": ' + indexWatermelon); // Output: Index of "watermelon": -1
        // public Object remove(Integer index)
        List<String> colors = new String[3];
        colors[0] = 'Red';
        colors[1] = 'Blue';
        colors[2] = 'Green';
        String s11 = colors.remove(2);
        system.debug(s11); // green
        
        // Public void set(Integer index, Object listElement)
        List<Integer> setint = new Integer[6];
        setint.set(0,35);
        System.debug(setint); 
        
        setint[1] = 34;
        system.debug(setint);
        
        // public Integer size()
        Integer resultsize = setint.size();
        system.debug('size'+resultsize); // 6
        
                
    }

}