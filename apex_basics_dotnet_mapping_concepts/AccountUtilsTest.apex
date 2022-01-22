@isTest
public class AccountUtilsTest {
    
    @testSetup
    static void setup(){
        List<Account> accounts = new List<Account>();
         for (Integer i = 0; i < 50; i++) {
             if (i < 50) {
            	accounts.add(new Account(
                	name='Test Account'+i,billingstate='UtilTest'
            	));     
             }          
        }
        Insert accounts;    
    }
    
    @isTest static void test(){
        Test.startTest();
        List<Account> acclist = AccountUtils.accountsByState('UtilTest');
        System.assertEquals(50, acclist.size());
    }
}