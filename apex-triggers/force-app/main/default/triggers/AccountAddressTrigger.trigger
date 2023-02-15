trigger AccountAddressTrigger on Account (before insert, before update) {
    for (Account a : Trigger.new) {
        if (a.Match_Billing_Address__c) {
            System.debug('Updating billing postal code to match shipping postal code.');
            a.BillingPostalCode = a.ShippingPostalCode;
        }
    }
}