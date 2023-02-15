trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    List<Opportunity> opportunities = [SELECT Id FROM Opportunity WHERE StageName = 'Closed Won' AND Id IN :Trigger.new];

    List<Task> tasks = new List<Task>();

    for (Opportunity o : opportunities) {
        tasks.add(new Task(Subject = 'Follow Up Test Task', WhatId = o.Id));
    }

    if (tasks.size() > 0) {
        insert tasks;
    }
}