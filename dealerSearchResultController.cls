public with sharing class dealerSearchResultController {
    public dealerSearchResultController() {

    }
    @AuraEnabled(cacheable = true)
    public static List<Account> getDealer(String dealerTypeId){
        if(String.isEmpty(dealerTypeId)){
            return [select id, Name, Dealer_type__c,  Dealer_type__r.Name, Dealer_Budget__c, Dealer_Total_Sales_Revenue__c,
             Dealer_Active_Pipeline_Value__c, Dealer_Primary_POC__c, Dealer_Primary_POC__r.Name, Dealer_Contract_Start_Date__c,
             Dealer_Status__c, Number_of_trained_Dealer_contacts__c, Delaer_WebSite__c, Dealer_Geo_Location__c, Dealer_Contract_End_Date__c,
             (select Id,lastName,FirstName,title,Salutation from Contacts) from Account where Dealer_Status__c IN ('Active','Inactive','Pending')];
        } else{
            return [select id, Name, Dealer_type__c,  Dealer_type__r.Name, Dealer_Budget__c, Dealer_Total_Sales_Revenue__c, 
            Dealer_Active_Pipeline_Value__c, Dealer_Primary_POC__c, Dealer_Primary_POC__r.Name, Dealer_Contract_Start_Date__c,
            Dealer_Status__c, Number_of_trained_Dealer_contacts__c, Delaer_WebSite__c, Dealer_Geo_Location__c, Dealer_Contract_End_Date__c,
            (select Id,lastName,FirstName,title,Salutation from Contacts) from Account where Dealer_Status__c IN ('Active','Inactive','Pending') AND Dealer_type__c =: dealerTypeId];
        }
    }
}