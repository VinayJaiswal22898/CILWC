@restresource(urlMapping = '/OpportunityPost/*')
global class OpportunityIntegration {
    @HttpPost
    global static string postOpportunityRecord(){
        String jsonOpportunity = RestContext.request.RequestBody.ToString();
        List<Opportunity> deserializedOpp = (List<Opportunity>) System.JSON.deserialize(jsonOpportunity, List<Opportunity>.class) ;
        if(!deserializedOpp.isEmpty()){
            Insert deserializedOpp;
                return 'success';
        }
        else 
            return 'fail';
    }
}