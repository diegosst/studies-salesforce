class Functions {

    public void createAccount() {
        Account account = new Account(Name = 'Test Account 3');
        
        insert account;

        System.debug('Account created.');
    }

    public void removeAccount() {
        
        Account account = [SELECT Id FROM Account WHERE Name = 'Test Account 2'];
    
        try {
            delete account;
            System.debug('Account deleted.');
        } catch (System.DmlException e) {
            System.debug('Error deleting account. ' + e.getMessage());
        }
    }

}