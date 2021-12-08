@IsTest
public class AccountProcessorTest {
	@IsTest
    public static void testAccountProcesser(){
       Test.startTest();
       List<id> idList = new List<id>();
       Account testAccount1 = new Account(Name='TestAccount1');
       Account testAccount2 = new Account(Name='TestAccount2');
       upsert testAccount1;
	   upsert testAccount2;
       idList.add(testAccount1.id);
       idList.add(testAccount2.id);
       	AccountProcessor.countContacts(idList);
       Test.stopTest();
    }
}