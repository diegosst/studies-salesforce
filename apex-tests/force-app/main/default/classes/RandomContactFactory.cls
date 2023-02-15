public with sharing class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer quantity, String lastName) {
        
        List<Contact> contacts = new List<Contact>();

        for (Integer i = 0; i < quantity; i++) {
            contacts.add(new Contact(FirstName = 'Test ' + i, LastName = lastName));
        }

        return contacts;
    }

}