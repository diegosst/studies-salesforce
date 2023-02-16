@isTest
private class AddPrimaryContactTest {
    
    @TestSetup
    static void setup(){
        
        List<Account> accounts = new List<Account>();
        
        for (Integer i = 0; i < 100; i++) {
            accounts.add(new Account(Name='Testing ' + i, BillingState = i >= 50 ? 'CA' : 'NY'));
        }

        insert accounts;
    }

    @isTest
    static void validateAddPrimaryContact() {

        System.Test.startTest();

        AddPrimaryContact contact = new AddPrimaryContact(new Contact(FirstName = 'Testing', LastName = 'Contact'), 'CA');

        System.enqueueJob(contact);

        System.Test.stopTest();

        List<Contact> contactsNY = [SELECT Id, FirstName, LastName FROM Contact WHERE FirstName = 'Testing' AND AccountId IN (SELECT Id FROM Account WHERE BillingState = 'NY')];
        List<Contact> contactsCA = [SELECT Id, FirstName, LastName FROM Contact WHERE FirstName = 'Testing' AND AccountId IN (SELECT Id FROM Account WHERE BillingState = 'CA')];

        System.assertEquals(0, contactsNY.size(), 'No contacts should be found for Billing State "NY".');
        System.assertEquals(50, contactsCA.size(), '50 contacts should be found for Billing State "CA".');
    }
}