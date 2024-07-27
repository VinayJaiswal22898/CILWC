public class JSONGeneratorHelper {
    public static void AccountRecordsJSONGenerator(){
        // get the record from object
        List<Account> lstAccounts = [Select id, name, rating, Industry, annualRevenue, type, phone,fax , active__c 
                                    from account
                                    order by name
                                    limit 5];
        
        // create JSONGenerator class object 
        System.JSONGenerator accGen = System.JSON.createGenerator(True);
        accGen.writeStartObject();
        accGen.writeFieldName('accountRecords');
        accGen.writeStartArray();
        if(!lstAccounts.isEmpty()){
            for(Account acc : lstAccounts){
                // represnt each record in the form of Object
                accGen.writeStartObject();
                accGen.writeIDField('ID', acc.Id);
                if(acc.Name == null || acc.name == '')
                    accGen.writeNullField('Name');
                else
                    accGen.writeStringField('Name',acc.Name);
                if(acc.Rating == null || acc.Rating == ''){
                    accGen.writeNullField('Rating');
                }
                else 
                    accGen.writeStringField('Rating',acc.Rating);
                if(acc.Industry == null || acc.Industry == ''){
                    accGen.writeNullField('Industry');
                }
                else 
                 accGen.writeStringField('Industry', acc.Industry);  
                if(acc.AnnualRevenue == null)
                    accGen.writeNullField('Industry');
                 else  
                    accGen.writeNumberField('AnnualRevenue',acc.AnnualRevenue);
                if(acc.Type == null || acc.Type == '')
                    accGen.writeNullField('Type');
                else
                    accGen.writeStringField('Type',acc.Type);
                if(acc.Phone == null || acc.Phone == '')
                    accGen.writeNullField('Phone');
                else
                    accGen.writeStringField('Phone',acc.Phone);
                if(acc.fax == null || acc.fax == '')
                    accGen.writeNullField('Fax');
                else
                   accGen.writeStringField('Fax',acc.Fax);
                if(acc.Active__c == null || acc.Type == '')
                    accGen.writeNullField('Type');
                else
                   accGen.writeStringField('Active__c',acc.Active__c);
                accGen.writeEndObject();
                
            }
        }
        accGen.writeEndArray();
        accGen.writeEndObject();
        system.debug('JSON Content .. '+accGen.getAsString());
    }
    public static void createJSONContent(){
        System.JSONGenerator leadGen = System.JSON.createGenerator(True);
        leadGen.WriteStartObject();  // {
        //leadGen.WriteFieldName('FirstName'); // key
        //leadGen.WriteString('Ram kumar'); // value
        leadGen.WriteStringField('FirstName', 'Ramu');
        leadGen.WriteStringField('LastName', 'Jaiswal');
        leadGen.WriteStringField('Company','IBM');
        leadGen.WriteStringField('Title' , 'Lead Manager');
        leadGen.WriteNumberField('AnnualRevenue', 2000000);
        leadGen.WriteEndObject(); // } 
        
        system.debug('JSON Content is. .. ' + leadGen.getAsString());
    }

}