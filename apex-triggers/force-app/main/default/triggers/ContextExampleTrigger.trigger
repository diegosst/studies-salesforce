trigger ContextExampleTrigger on Account (before insert, after insert, after delete) {
    if (Trigger.isInsert) {
        if (Trigger.isBefore) {
            System.debug('Is before');
        } else if (Trigger.isAfter) {
            System.debug('Is after');
        }        
    }
    else if (Trigger.isDelete) {
        System.debug('Is delete');
    }
}