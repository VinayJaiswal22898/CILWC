public class JSONParserUtility {
    public static void ParsePostalDetailsResponse(){
        String branchDetailsJSON = '[{"Name":"Gandhi Bhawan (Hyderabad)","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Non-Delivery","Circle":"Andhra Pradesh","District":"Hyderabad","Division":"Hyderabad City","Region":"Hyderabad City","Block":"Nampally","State":"Telangana","Country":"India","Pincode":"500001"},{"Name":"Hyderabad ","Description":null,"BranchType":"Head Post Office","DeliveryStatus":"Delivery","Circle":"Andhra Pradesh","District":"Hyderabad","Division":"Hyderabad GPO","Region":"Hyderabad City","Block":"Hyderabad","State":"Telangana","Country":"India","Pincode":"500001"},{"Name":"Moazzampura","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Non-Delivery","Circle":"Andhra Pradesh","District":"Hyderabad","Division":"Hyderabad City","Region":"Hyderabad City","Block":"Nampally","State":"Telangana","Country":"India","Pincode":"500001"},{"Name":"Seetharampet","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Non-Delivery","Circle":"Andhra Pradesh","District":"Hyderabad","Division":"Hyderabad City","Region":"Hyderabad City","Block":"Nampally","State":"Telangana","Country":"India","Pincode":"500001"},{"Name":"State Bank Of Hyderabad","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Non-Delivery","Circle":"Andhra Pradesh","District":"Hyderabad","Division":"Hyderabad City","Region":"Hyderabad City","Block":"Nampally","State":"Telangana","Country":"India","Pincode":"500001"}]'; 
        List<PostalBranchDetails>  LstPostal=(List<PostalBranchDetails>)System.JSON.Deserialize(branchDetailsJSON, List<PostalBranchDetails>.Class);
        System.debug('Postal Branch Details are .. ' +LstPostal );
            }
    public static void ParserBulkOpportunityJSON(){
        String opportunityJSON = '[{"Name": "JSONOpportunity1", "Amount": 400000,"StageName":"Prospecting","CloseDate": "2024-04-02", "LeadSorce": "Web"},{"Name": "JSONOpportunity2", "Amount": 500000,"StageName":"Prospecting","CloseDate": "2024-04-05", "LeadSorce": "Web"},{"Name": "JSONOpportunity3", "Amount": 600000,"StageName":"Prospecting","CloseDate": "2024-04-09", "LeadSorce": "Web"}]';
        List<Opportunity> lstOpp = (List<Opportunity>)System.JSON.deserialize(opportunityJSON, List<Opportunity>.Class);
            insert lstOpp;
       /*while(opParser.nextToken() !=null){
            if(opParser.getCurrentToken() == JSONToken.START_ARRAY){
                opParser.nextToken();
                if(opParser.nextToken() == JSONToken.START_OBJECT){
                    while(opParser.nextToken() != Null){
                      Opportunity opty = (Opportunity)system.JSON.Deserialize(opportunityJSON ,Opportunity.Class);
                        system.debug('Opportunity Record .. '+ opty);
                    } 
                }
            }
        }*/
        
    }
    public static void ParserAccountJSON(){
        // create JSON
        String accJSON = '{"Name": "Rahul jain", "Rating": "Hot","Industry": "Banking","Type":"Porspect","OwnerShip": "Public", "AnnualRevenue":4000000,"Phone":"887776666","Fax":"6677443322", "Active__c":"Yes" }';
        // using Deserialize method or shortcut method
        Account acc = (Account)System.Json.Deserialize(accJSON, Account.Class);  //deserialize(jsonString, apexType)
        insert acc;
        if(acc.Id !=null){
            System.debug('Account Id is ..'+ acc.Id);
        }
        
        /*
        // General Process (JSONParser Class) or manual process or lenthy process
        System.JSONParser accParser = System.JSON.createParser(accJSON);
        Account acc = new Account();
        while(accParser.nextToken() !=null){
            if(accParser.getCurrentToken() == JSONToken.FIELD_NAME && accParser.getText() == 'Name'){
                accParser.nextToken();
                acc.Name = accParser.getText();
            }
            if(accParser.getCurrentToken()== JSONToken.FIELD_NAME && accParser.getText()=='Rating'){
                accParser.nextToken();
                acc.Rating = accParser.getText();
            }
            if(accParser.getCurrentToken() == JSONToken.FIELD_NAME && accParser.getText()=='Industry'){
                accParser.nextToken();
                acc.Industry = accParser.getText();
            }
            if(accParser.getCurrentToken()== JSONToken.FIELD_NAME && accParser.getText()=='Type'){
                accParser.nextToken();
                acc.Type= accParser.getText();
            }
            if(accParser.getCurrentToken()== JSONToken.FIELD_NAME && accParser.getText()== 'OwnerShip'){
                accParser.nextToken();
                acc.Ownership = accParser.getText();
            }
            if(accParser.getCurrentToken() == JSONToken.FIELD_NAME && accParser.getText()=='AnnualRevenue'){
                accParser.nextToken();
                acc.AnnualRevenue = accParser.getDecimalValue();
            }
            if(accParser.getCurrentToken() == JSONToken.FIELD_NAME && accParser.getText()=='Phone'){
                accParser.nextToken();
                acc.Phone = accParser.getText();
            }
            if(accParser.getCurrentToken() == JSONToken.FIELD_NAME && accParser.getText()=='fax'){
                accParser.nextToken();
                acc.fax = accParser.getText();
            }
            if(accParser.getCurrentToken() == JSONToken.FIELD_NAME && accParser.getText()=='Active__c'){
                accParser.nextToken();
                acc.Active__c = accParser.getText();
            }
        }
        insert acc;
        if(acc.Id !=null){
            System.debug('Account Id is ..'+ acc.Id);
        }
*/
    }
    public static void JSONParserContent(){
        // take a JSON String
        String productJSON = '{"ProductCode" : 1001, "ProductName": "Laptop", "Manufacturer": "Dell", "UnitPrice": 3000, "Location":"Korea"}' ;
        // create JSONParser class object
        System.JSONParser pParser = System.JSON.createParser(productJSON); // it will devide the whole content into token 
        while(pParser.nextToken() !=null){
            if(pParser.getCurrentToken() == JSONToken.FIELD_NAME && pParser.getText() == 'ProductCode'){
                pParser.nextToken();
                system.debug('Product code is .. ' + pParser.getIntegerValue());
            }
            if(pParser.getCurrentToken() == JSONToken.FIELD_NAME && pParser.getText() =='ProductName'){
                pParser.nextToken();
                System.debug('Product Name is .. ' + pParser.getText());
            }
            if(pParser.getCurrentToken()== JSONToken.FIELD_Name && pParser.getText() == 'Manufacturer'){
                pParser.nextToken();
                System.debug('Product manufacturer is ..' + pParser.getText());
            }
            if(pParser.getCurrentToken() == JSONToken.FIELD_NAME && pParser.getText() == 'UnitPrice'){
                pParser.nextToken();
                System.debug('Unit Price is ..'+ pParser.getDecimalValue());
            }
            if(pParser.getCurrentToken()==JSONToken.FIELD_Name && pParser.getText()=='Location'){
                pParser.nextToken();
                System.debug('Location. is ...' + pParser.getText());
            }
        }
    }
}