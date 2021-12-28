@isTest
public class DailyLeadProcessorTest {
	public static String CRON_EXP = '0 33 10 28 12 ? 2021';
    
    static testmethod void testScheduledJob(){
        List<Lead> leadList = new List<Lead>();
        for (Integer i=0;i<200;i++){
            Lead lead = new Lead(LastName='Test'+i, LeadSource='',Company='Company'+i);
            leadList.add(lead);
        }
        insert leadList;
        Map<Id, Lead> leadMap = new Map<Id, Lead>(leadList);
        List<Id> leadIds = new List<Id>(leadMap.keySet());
        Test.startTest();
        String jobId = System.schedule('Daily Lead Processor',
            CRON_EXP,
            new DailyLeadProcessor());
        List<Task> lt = [SELECT Id
            FROM Task
            WHERE WhatId IN :leadIds];
        System.assertEquals(0, lt.size(), 'Tasks exist before job has run');
        // Stopping the test will run the job synchronously
        Test.stopTest();
        lt = [SELECT Id
            FROM Task
            WHERE WhatId IN :leadIds];
        System.assertNotEquals(leadIds.size(),
            lt.size(),
            'Tasks were not created'); 
    }
}