public class LeadProcessor implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Name,LeadSource,OwnerId FROM Lead '
        );
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> records){
        List<Lead> newLeads = new List<Lead>();
        for (Lead lead : records) {
                lead.LeadSource = 'Dreamforce';
            	newLeads.add(lead);
        }
        update newLeads;
    }
    
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
}