public with sharing class AddPrimaryContact implements Queueable {
    
    private Contact contact;
    private String state;
    
    public AddPrimaryContact(Contact contact, String state) {
        this.contact = contact;
        this.state = state;
    }

    public void execute(QueueableContext context) {
        
        List<Account> accounts = [SELECT Id FROM Account WHERE BillingState = :state];
        
        List<Contact> contacts = new List<Contact>();

        for (Account account : accounts) {
            
            Contact clone = contact.clone();
            
            clone.AccountId = account.Id;

            contacts.add(clone);
        }

        System.debug('Inserting ' + contacts.size() + ' contact(s)!');

        insert contacts;
    }
}