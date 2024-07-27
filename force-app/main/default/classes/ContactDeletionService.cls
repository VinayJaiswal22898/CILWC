@RestResource(URLMapping ='/ContactDeletionServcie/*')
global class ContactDeletionService {
    @HttpDelete
    Global static String deleteContactRecord(){
        Map<String, String> inputParams = RestContext.request.params;
    List<Contact> conList = [Select id , Account.Name , firstname, lastname
                             from contact
                            where Account.Name = : inputParams.get('Name')];
    Delete conList;
    Return 'contact deleted';
   
    }
    
}