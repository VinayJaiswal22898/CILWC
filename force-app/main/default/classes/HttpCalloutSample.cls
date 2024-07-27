public class HttpCalloutSample {
     // Pass in the endpoint to be used using the string url
    public static string getCalloutResponseContents(String url){
        // initiate a http object 
        Http http = new Http();
        
        // inittiate a Http Request and set endpoint and specify get method 
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        
        // send the request and return the response
        HttpResponse response = http.send(request);
        return response.getBody();
        
    }

}