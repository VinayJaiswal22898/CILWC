@Restresource(urlMapping = '/AccountClosedWon/*')
global class ERPIntegration {
    global static void createSalesOrder(){
        // Query opportunity details
        List<Opportunity> oppOrder = [Select id, name, stagename from opportunity
                                      where stagename = 'closed won'];
        // convert data into json
        String jsonData = JSON.serialize(oppOrder);
        // Make HTTP request to ERP system API 
        HttpRequest request = new HttpRequest();
        request.setEndPoint('');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(jsonData);
        Http http =new Http();
        HttpResponse response = http.send(request);  
        // Process API response
        if (response.getStatusCode() == 200) {
            // Handle success response
            System.debug('Sales order created successfully in ERP system.');
        } else {
            // Handle error response
            System.debug('Error creating sales order in ERP system: ' + response.getBody());
        }
    }
}