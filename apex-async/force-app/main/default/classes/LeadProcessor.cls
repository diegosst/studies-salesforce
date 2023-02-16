public with sharing class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {

    Integer recordsProcessed = 0;

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }

    public void execute(Database.BatchableContext bc, List<Lead> leads){
        for (Lead lead : leads) {
            lead.LeadSource = 'Dreamforce';
            recordsProcessed++;
        }
        update leads;
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Finished executing Lead Processor! Records processed: ' + recordsProcessed + ' !');
    }

}