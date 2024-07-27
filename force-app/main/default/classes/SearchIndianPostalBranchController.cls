public class SearchIndianPostalBranchController {
      public string postalPinCode{get;set;}
      public List<PostalBranchDetails> lstBranches{get;set;}
      public string postalResponseJSON{get;set;}
      public void PostalBranches(){
            lstBranches = new List<PostalBranchDetails>();
            if(postalPinCode !=null && postalPinCode != ''){
               String endPointUrl = 'https://api.postalpincode.in/pincode/' + postalPinCode;
               Http postalHttp = new Http();
               HttpRequest postalRequest = new HttpRequest();
                 postalRequest.setEndPoint(endPointUrl);
                 postalRequest.setMethod('GET');
                 postalRequest.setTimeOut(10000);
              HttpResponse postalResponse = postalHttp.send(postalRequest);  
                 postalResponseJSON = postalResponse.getBody();
                 
                 // parse the content and represent in the tabular format...     
                 System.JSONParser pParser = system.JSON.createParser(postalResponse.getBody()) ; 
                 while(pParser.nextToken() !=null){
                    if(pParser.getCurrentToken() == JSONToken.Field_Name && pParser.getText() == 'Message'){
                       pParser.nextToken();
                       System.debug('JSON Response message is ..' + pParser.getText());
                    }
                    if(pParser.getCurrentToken() == JSONToken.Field_Name  && pParser.getText()== 'Status'){
                      
                      System.debug('Response status is ...'+ pParser.getText());
                    }
                    if(pParser.getCurrentToken() == JSONToken.Field_Name && pParser.getText() == 'PostOffice'){
                      pParser.nextToken();
                      if(pParser.getCurrentToken()== JSONToken.Start_Array){
                         pParser.nextToken();
                         While(pParser.getCurrentToken() == JSONToken.Start_Object){
                              PostalBranchDetails branch = (PostalBranchDetails)pParser.readValueAs(PostalBranchDetails.Class); // readValueAs - it will give only one object value 
                              lstBranches.add(branch);
                              pParser.nextToken();
                         }
                      }
                    }
                 }       
            }
      }
}