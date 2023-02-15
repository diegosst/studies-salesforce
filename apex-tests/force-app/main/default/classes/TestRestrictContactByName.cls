@isTest
private class TestRestrictContactByName {

    @isTest static void validateRestrictInsertContactByName() {
        Contact contact = new Contact(LastName='INVALIDNAME');
        
        // Perform test
        System.Test.startTest();
        Database.SaveResult result = Database.insert(contact, false);
        System.Test.stopTest();

        // Verify 
        // In this case the deletion should have been stopped by the trigger,
        // so verify that we got back an error.
        System.assert(!result.isSuccess(), 'Should result in error.');
        System.assert(result.getErrors().size() > 0, 'Should have errors.');
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', result.getErrors()[0].getMessage(), 'Should show error.');
    }

}