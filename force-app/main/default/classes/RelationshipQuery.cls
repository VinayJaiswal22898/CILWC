public class RelationshipQuery {
    // two type of query 
    // 1 Child to parent 
    // 2 Parent to child 
    // 
    
    //********child to parent
    //standard object
    List<Contact> contacstList = [SELECT FirstName, LastName, Account.Name, Account.Phone FROM Contact]; 
    // Note - Account.name Where account is relatioship field name from contact to account
    
    // cutom object 
    // List<Rating>  ratingList =  [SELECT Name , Rating__C, Student__r.Name, Studnet__r.Phone from Rating];
    // 
    
    // Parent to child 
    
    List<Account> accList = [SELECT Name, Phone, 
                             ( SELECT FirstName, LastName from contacts) 
                             from Account];
    
    // ***** Multi level 
    // Child to parent 
    // We can go up to five level 
    List<OpportunityLineItem> oltList = [SELECT Name, Quantity , 
                                         Opportunity.Name, Opportunity.Amount, 
                                         Opportunity.Account.Name, Opportunity.Account.Phone
                                         FROM OpportunityLineItem];
// parent to child is not possible in multi level 
// we cant write subquery into subquery
}