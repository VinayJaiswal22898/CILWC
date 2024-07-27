public class CheckOppClosedDateController {
    public static Boolean isOppClosedDateThisYearOrNot(List<Opportunity> oppRecords){
        for(Opportunity opp :oppRecords){
            if(opp.CloseDate !=null ){
                Integer currentYear = Date.Today().year();
                Integer closeYear = opp.CloseDate.year();
                if(currentYear == closeYear){
                    return true;
                }  
            }
        }
        return false;
    }

}