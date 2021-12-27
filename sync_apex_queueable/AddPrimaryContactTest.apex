@isTest
public class AddPrimaryContactTest {

    @testSetup
    static void setup(){
        List<Account> accounts = new List<Account>();
         for (Integer i = 0; i < 100; i++) {
             if (i < 50) {
            	accounts.add(new Account(
                	name='Test Account'+i,billingstate='NY'
            	));     
             } else {
            	accounts.add(new Account(
                	name='Test Account'+i,billingstate='CA'
            	));     
                 
             }          
        }
        Insert accounts;
        
        Contact c = new Contact(LastName='test');
        Insert c;
    } 
    static testmethod void testQueueable() {
        Contact c = [SELECT Id From Contact];
        String s ='CA';
        AddPrimaryContact apc = new AddPrimaryContact(c,s);
            
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();
        
        System.assertEquals(50, [SELECT count() From account WHERE BillingState= :s]);
    }
}