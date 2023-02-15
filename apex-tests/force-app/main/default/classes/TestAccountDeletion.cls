@isTest
private class TestAccountDeletion {
    @isTest static void TestDeleteAccountWithOneOpportunity() {
        // Test data setup
        // Create an account with an opportunity, and then try to delete it
        Account acct = new Account(Name='Test Account');
        insert acct;
        Opportunity opp = new Opportunity(Name=acct.Name + ' Opportunity',
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acct.Id);
        insert opp;
        // Perform test
        System.Test.startTest();
        Database.DeleteResult result = Database.delete(acct, false);
        System.Test.stopTest();
        // Verify 
        // In this case the deletion should have been stopped by the trigger,
        // so verify that we got back an error.
        System.assert(!result.isSuccess(), 'Should result in error.');
        System.assert(result.getErrors().size() > 0, 'Should have errors.');
        System.assertEquals('Cannot delete account with related opportunities.', result.getErrors()[0].getMessage(), 'Should show error.');
    }
}