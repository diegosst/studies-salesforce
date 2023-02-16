@RestResource(urlMapping = '/Account/*')
global with sharing class AccountManager {
    
    @HttpGet
    global static Account getAccount() {
        return [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account LIMIT 1];
    } 
}