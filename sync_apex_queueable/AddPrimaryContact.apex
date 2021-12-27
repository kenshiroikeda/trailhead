public class AddPrimaryContact implements Queueable {

    Contact con;
    String state;
    
    public AddPrimaryContact(Contact contact, String state){
        this.con = contact;
        this.state = state;        
    }
    
    public void execute(QueueableContext qc){
        List<Account> accList = [SELECT Id FROM Account WHERE BillingState = :state LIMIT 200];
        List<Contact> conList = new List<Contact>();
        for(Account acc: accList){
            Contact c = con.clone(false,false,false,false);
            c.AccountId = acc.Id;
            c.LastName = 'test';
            conList.add(c);
        }
        insert conList;        
    }
}