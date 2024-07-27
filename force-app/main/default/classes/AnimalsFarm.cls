public class AnimalsFarm {
    public static HttpResponse animals(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        System.debug(response.getStatusCode());
        
        if(response.getStatusCode()==200){
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            system.debug(results); 
            List<Object> animals = (List<Object>) results.get('animals');
            for(Object result:animals){
                system.debug(result);
            }
        }
        return response;
    }

}