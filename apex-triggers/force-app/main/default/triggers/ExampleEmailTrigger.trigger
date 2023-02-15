trigger ExampleEmailTrigger on Contact (before insert) {
    if (Trigger.isInsert) {
        Integer recordCount = Trigger.new.size();
        
        EmailManager.sendMail('test@email.com.br', 'Trailhead Trigger Tutorial', recordCount + ' contact(s) were inserted.');
    }
    else if (Trigger.isDelete) {
        System.debug('Contact will be deleted.');
    }
}