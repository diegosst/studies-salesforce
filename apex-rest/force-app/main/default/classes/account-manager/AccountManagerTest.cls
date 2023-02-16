@isTest
private class AccountManagerTest {
    
    @TestSetup
    static void setup(){

        Account account = new Account(Name = 'Test Account');

        Database.SaveResult result = Database.insert(account);
    
        List<Contact> contacts = new List<Contact>();

        contacts.add(new Contact(FirstName = 'Test', LastName = 'Contact', AccountId = result.Id));
        contacts.add(new Contact(FirstName = 'Test', LastName = 'Contact 2', AccountId = result.Id));

        insert contacts;
    }
    
    @isTest
    static void validateGetAccount() {
        
        RestRequest request = new RestRequest();
        
        request.requestUri = 'https://yourInstance.my.salesforce.com/services/apexrest/Account/';
        request.httpMethod = 'GET';

        RestContext.request = request;

        Account account = AccountManager.getAccount();

        System.assert(account != null, 'Account should not be null.');
        System.assert(account.Contacts.size() > 0, 'Account should have contacats.');
        System.assertEquals('Test Account', account.Name, 'Account should be retrieved.');
    }
}