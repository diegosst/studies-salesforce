@isTest
private class DailyLeadProcessorTest {
    
    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2050';

    @TestSetup
    static void setup(){
        
        List<Lead> leads = new List<Lead>();

        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(FirstName = 'Testing', LastName = 'Lead ' + i, Company = 'Test'));
        }

        insert leads;
    }

    @isTest
    static void validateDailyLeadProcessor() {
        System.Test.startTest();

        DailyLeadProcessor processor = new DailyLeadProcessor();

        System.schedule('SCHEDULED APEX TEST JOB', CRON_EXP, processor);

        List<Lead> result = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];

        System.assertEquals(0, result.size(), 'Should not fire until stop test is called.');

        System.Test.stopTest();

        result = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];

        System.assertEquals(200, result.size(), 'Should find 200 results for lead with lead source "Dreamforce".');
    }

}