/**5. Whenever we modify input out object doctor name automatically update dropoff object text field no
relationship?
Ans:
**/
public class Scenario5 {
    public static void updateDoctorName(List<InputOut__c> ioNew , Map<Id,InputOut__c> ioOldMap){
        List<Dorpoff__C> lstDropoff = [Select id, name, text__c
                                          from Dorpoff__C
                                          where text__c = 'VinaySFDC'];
        String name;
        if(ioNew !=null && !ioNew.isEmpty()){
            
            for(InputOut__c io : ioNew){
                if(io.Doctor_Name__c != ioOldMap.get(io.id).Doctor_Name__c){
                  name = io.Doctor_Name__c;  
                }
                            }   
        }
        for(Dorpoff__C dr : lstDropoff){
            dr.text__c = name;
        }
        update lstDropoff;   
    }
}