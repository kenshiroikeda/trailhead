public class AccountProcessor {
	@future
    public static void countContacts(List<Id> recordIds) {
        System.debug('called');
        for (Id id : recordIds){
         	Integer count = [Select COUNT() from Contact Where AccountId = :id];   
            Account ac = [Select name from Account Where id = :id];   
            ac.Number_Of_Contacts__c = count;
		    update ac;
            System.debug('debug' + count);
        }
        System.debug('fin');
    }
}