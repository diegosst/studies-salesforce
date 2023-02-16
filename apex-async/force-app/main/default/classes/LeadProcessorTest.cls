@isTest
private class LeadProcessorTest {
    @TestSetup
    static void testSetup(){
        
        List<Lead> leads = new List<Lead>();

        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(FirstName = 'Testing', LastName = 'Lead ' + i, Company = 'Test'));
        }

        insert leads;
    }

    @isTest
    static void validateLeadProcessor() {
        
        System.Test.startTest();
        
        LeadProcessor processor = new LeadProcessor();

        Database.executeBatch(processor);

        System.Test.stopTest();

        List<Lead> leads = [SELECT Id, Name, LeadSource FROM Lead WHERE Company = 'Test' AND LeadSource = 'Dreamforce']; 

        System.assert(leads.size() > 0, 'Leads should not be empty.');
        System.assertEquals(200, leads.size(), 'Should find 200 leads with lead source as Dreamforce and name containing Lead.');
    }
}