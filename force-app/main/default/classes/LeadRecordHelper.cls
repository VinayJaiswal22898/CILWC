public class LeadRecordHelper {
    // Assignment 1 
    //  Insert a lead record and a realted task record and related event record for lead
    public static void InsertLeadRecords(){
        Lead objLead = new Lead(); // creating an instance 
            // assign value 
        objLead.FirstName = 'Rukh';
        objLead.LastName = 'Kumari';
        objLead.Rating = 'Warn';
        objLead.Industry = 'Finance';
        objLead.AnnualRevenue = 2800000;
        objLead.Company = 'TCS Inc';
        objLead.Phone = '2255889956';
        objLead.Fax = '4477884455';
        objLead.Website = 'Rukh@gmail.com';
        objLead.Status = 'Working - Contacted';
        objLead.Street = '45/5 kk road';
        objLead.City = 'xyz';
        objLead.State = 'Khali City';
        objLead.Country = 'Saudi Arab';
        objLead.PostalCode = '0000120';	
        insert objLead;
        if(objLead!=null){
            System.debug('Lead Record Inserted Successfully. Lead Id is ..'+ objLead.id);
            
            // creating Related Task Record
            Task objTask = new Task();
            // Assigning the value 
            objTask.WhoId = objLead.id;
            objTask.Subject = 'Marketing Event';
            objTask.Status =  'In Progress';
            objTask.Priority = 'Medium';
            objTask.Description = 'Marketing even for new product launch';
            objTask.ActivityDate = Date.newInstance(2023,12,28);
            
            Insert objTask;
            if(objTask!=null){
                System.debug('Task Record Created Successfulluy. Task Id is ..'+ objTask.id);
            }
            
            // Creating Related Event Record
            Event objEvent = new Event();
            
            // Assigning value 
            objEvent.Subject = 'Meeting';
            objEvent.StartDateTime = DateTime.newInstance(2024,08,2,10,15,20);
            ObjEvent.EndDateTime = DateTime.newInstance(2024,08,5,10,15,20);
            objEvent.ActivityDate = System.Today();
            objEvent.Location = 'Lucknow';
            //objEvent.DurationInMinutes = 25;
            objEvent.ActivityDateTime = DateTime.newInstance(2024,08,2,10,15,20);
            objEvent.WhoId = objLead.Id;
            
            //insert event record
            Insert objEvent;
            if(objEvent!=null){
                System.debug('Event Record Inserted Successfully. Event id is ..'+objEvent.Id);
            }
            
        }
    }
    Public void CreateLeadRecord(){
        Lead ldRecord = new Lead();
        ldRecord.FirstName = 'Shiv';
        ldRecord.LastName = 'Kumar';
        ldRecord.Rating = 'Hot';
        ldRecord.Industry = 'Technology';
        ldRecord.AnnualRevenue = 2700000;
        ldRecord.Company = 'TCS';
        ldRecord.Phone = '2255889966';
        ldRecord.Fax = '4477886655';
        ldRecord.Website = 'Shiv@gmail.com';
        ldRecord.Status = 'Working - Contacted';
        ldRecord.Street = '45/5 Shiva road';
        ldRecord.City = 'Khalifa City';
        ldRecord.State = 'Abu Dhabi';
        ldRecord.Country = 'UAE';
        ldRecord.PostalCode = '000000';	
        
        Insert ldRecord;
        If(ldRecord!=null){
            System.debug('Lead Record Inserted Successfully.  Lead Id Is ----'+ldRecord.id);
        }
          }
}