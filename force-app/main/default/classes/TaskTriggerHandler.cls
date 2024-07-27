public class TaskTriggerHandler {
    public static void checkDeleteTask(List<Task> oldRecord){
        // get the current user id
        Id profileId = UserInfo.getProfileId();
        
        // query the profile name using the profile id
        Profile profileName= [Select id, name from Profile
                             where id =: profileId];
        
        // iterate through the old task records
        for(Task taskRecord : oldRecord){
            // check if the user's profile is not 'System Administrator'
            if(profileName.Name != 'System Administrator'){
                taskRecord.addError('No Access To delete Task Record'); 
            }
        }
    }

}