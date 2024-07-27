public class SOSLQuery {
    public static void SOSLQuery(){
        List<List<sObject>> sobjList = [Find 'okk' RETURNING Account(Name, NumberOfEmployees), Contact(Name, Phone) ]; 
        
        List<Account> accList = sobjList[0];
        List<Contact> conList = sobjList[1];
        
        System.debug(accList);
        System.debug(conList);
        
        for(Account acc: accList){
            System.debug(acc); 
            //System.debug(acc.NumberOfEmployees); 
            
            
            
            // the basic difference between SOQL AND SOSL 
            // IN SOSL we dont know in which object or field information is stored in that case use SOSL
            // iF WE Know in which object information has stored then use SOQL
            
            
            // SOSL Syntax 
            //    Find 'What' [ we can specify what type of filed for example if you
            //           searching for Vinay then Vinay could be in any filed like name or addres] returning [where]
            //In Query Editor
            //  Find { What } [ we can specify what type of filed for example if you
            //
            //                  searching for Vinay then Vinay could be in any filed name or addres] returning [where]
            //                  
            //[Find 'ok' ];
            //where
            //[Find 'Ok' RETURNING  Account];
            //Find 'Ok' in name field
            
            //wildcard in sosl
            // 1 * Asterisk
            List<List<sObject>> sList= [FIND 'Unvi*' IN Name FIELDS Returning Account, Contact];
            // We can put * Any amywhere like *Unvi Unvi* *Unvi* 
            
            // 2 ? Question mark
            List<List<sObject>> sList2 = [FIND 'Jo?n' Returning Account, Contact];  
            // in the place of ? it could be anything  (? single character)
            
            //******** where clause ******
            // atleast one field must include 
            List<List<sObject>> sList1 = [Find 'Opp*' IN Name Fields Returning Account(Name, BillingCountry Where CreatedDate < Today)];
            
            System.debug(sList1);
            
            // Order By 
            List<List<sObject>> sList4 = [Find 'Opp*' IN Name Fields Returning Account(Name, BillingCountry Order By Name DESC)];
            System.debug(sList4);
            
            // Limit 
            List<List<sObject>> sList5 = [Find 'Opp*' IN Name Fields Returning Account(Name, BillingCountry LIMIT 50)];
            System.debug(sList5);
            
            /*

******* Search group SOSL Query 
Search in specified field 
1. All Field (By default)
2. name filed 
3. email field 
4. phone field 
5. sidebar field 
*/
            // All Field 
            List<List<sObject>> allList = [Find 'opp' IN All Fields Returning Account, Contact] ;
            List<Account> accList1 = allList[0];
            List<Contact> conList1 = allList[1];
            
            for(Account acc1 : accList1){
                system.debug(acc1);
            }
            
            for(Contact con1 : conList1){
                system.debug(con1);
            }
            
            // 2. Name Field 
            List<List<sObject>> nameFiledList = [Find 'opp' IN Name Fields Returning Account(Name, BillingCountry), Contact(FirstName, LastName)];
            
            List<Account> accNameList = nameFiledList[0];
            System.debug(accNameList[0].Name);
            
            //3. Email Field 
            
            List<List<sObject>> emailFiledList = [Find '*com' IN Email Fields Returning Contact(FirstName, LastName, Email)];
            System.debug(emailFiledList);
            
            // 4. Phone Field 
            
            List<List<sObject>> phoneFiledList = [Find '555' IN Phone Fields Returning Contact(FirstName, LastName, Phone)];
            System.debug(phoneFiledList);
            
            //5. Sidebar Field / indexed fields    
            
            List<List<sObject>> sidebarFiledList = [Find '555' IN SIDEBAR Fields Returning Contact(FirstName, LastName, Phone)];
            System.debug(sidebarFiledList);
            
            // note both phone field and sidebar field will return same result bcz n Contact phone field has specified as a sidebar field
            // 
            
            //*****************Dynamic SOSL ***********
            //
            //you can create a search based on input from an end user, or update records with varying field names.
            
            // Syntax - List<List <sObject>> myQuery = search.query(SOSL_search_string);
            
            String s = 'Find \'t*ting\' RETURNING Account(Name), Contact(Name)'; // if you are specify quote inside string then we have to use back slas
            List<List<sObject>> dList = Search.query(s);
            System.debug(dList);
            
            //Dynamic SOSL to Return Snippets
            /* 
Search snippets and highlights are generated from the following field types.
Email
Text
Text Area
Text Area (Long)
Text Area (Rich)
*/
            
            String str= 'FIND \'test\' IN ALL FIELDS RETURNING KnowledgeArticleVersion(id, title WHERE PublishStatus = \'Online\' AND Language = \'en_US\') WITH SNIPPET (target_length=120)';
            
            Search.SearchResults searchResults = Search.find(str);
                                                             
             List<Search.SearchResult> articlelist = searchResults.get('KnowledgeArticleVersion');
            system.debug(articlelist);
                                                             
                                                             
                                                             /*
SOSL Injection

SOSL injection is a technique by which a user causes your application to execute database methods 
you did not intend by passing SOSL statements into your code. A SOSL injection can occur in 
Apex code whenever your application relies on end-user input to construct a dynamic SOSL statement and you do not handle the input properly.

To prevent SOSL injection, use the escapeSingleQuotes method. 
This method adds the escape character (\) to all single quotation marks in a string that is passed in from a user.
The method ensures that all single quotation marks are treated as enclosing strings, instead of database commands.
*/
                                                             
                                                             }
                                                             }
                                                             }