public class DailyLeadProcessor implements Schedulable{
	
    public void execute(SchedulableContext sc){
        List<Lead> leadList = [SELECT LastName, LeadSource FROM Lead WHERE LeadSource = '' LIMIT 200];
        List<Lead> updLeadList = new List<Lead>();
        for (Lead lead : leadList){
            lead.LeadSource = 'Dreamforce';
            updLeadList.add(lead);
        }
        update updLeadList;
    }
}