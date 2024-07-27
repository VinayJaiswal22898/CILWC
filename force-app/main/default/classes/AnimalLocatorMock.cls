@IsTest
global class AnimalLocatorMock implements HttpCalloutMock {
    //implement this interface httpCalloutMock
    global HttpResponse respond(HttpRequest request) {
        //create a fake response 
     HttpResponse response = new HttpResponse();
     response.setHeader('Content-Type', 'application/json');
      response.setBody('{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}');
        response.setStatusCode(200);
        return response;
    }
}