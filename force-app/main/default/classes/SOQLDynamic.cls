public class SOQLDynamic {
    public static void soqlMethod(string objName){
        if(objName !=null && objName != '')
        {
        String leadObj = 'Select id From ' + objName;
         List<Lead> lstLead = Database.Query(leadObj);
            if(!lstLead.isEmpty()){
                for(Lead l : lstLead){
                    system.debug(l);
                }
            }
        }  
    }
}