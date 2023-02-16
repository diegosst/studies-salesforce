public with sharing class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> accountIDs) {

        List<Account> accounts = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id IN :accountIDs];

        for (Account account : accounts) {

            System.debug('Contacts for account: ' + account.Contacts.size());

            Integer numberOfContacts = account.Contacts.size();

            account.Number_Of_Contacts__c = numberOfContacts;
        }

        update accounts;
    }
}