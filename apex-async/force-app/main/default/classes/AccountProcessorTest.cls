@isTest
private class AccountProcessorTest {

    @isTest static void validateAccountsInserted() {
        
        Account account = new Account(Name = 'Testing Account');

        Database.SaveResult inserted = Database.insert(account);

        List<Contact> contacts = new List<Contact>();

        contacts.add(new Contact(FirstName = 'Testing', LastName = 'Account', AccountId = inserted.id));
        contacts.add(new Contact(FirstName = 'Testing', LastName = 'Account 2', AccountId = inserted.id));

        insert contacts;

        List<Id> ids = new List<Id>();

        ids.add(inserted.id);

        System.Test.startTest();

        AccountProcessor.countContacts(ids);

        System.Test.stopTest();

        Account result = [SELECT Id, Number_Of_Contacts__c FROM Account WHERE Name = 'Testing Account'];

        System.assertEquals(2, result.Number_Of_Contacts__c, 'Number of contacts must be 2.');
    } 

}