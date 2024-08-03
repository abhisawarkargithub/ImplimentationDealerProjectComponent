public with sharing class DealerSearch {
    @AuraEnabled(cacheable=true)
    public static list<Dealer_Network__c> getAllDealerType(){
        try {
            return [select Id,Name from Dealer_Network__c];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}