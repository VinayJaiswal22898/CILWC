public with sharing class CaseManager {

    @AuraEnabled(cacheable=true)
    public static List<Map<String, String>> CaseStatusNoClose() {
        List<Map<String, String>> options = new List<Map<String, String>>();
        for (Schema.PicklistEntry pickListEntry : Case.Status.getDescribe().getPicklistValues()) {
            if (pickListEntry.getValue() != 'Closed') {
                Map<String, String> option = new Map<String, String>();
                option.put('label', pickListEntry.getLabel());
                option.put('value', pickListEntry.getValue());
                options.add(option);
            }
        }
        return options;
    }
}
