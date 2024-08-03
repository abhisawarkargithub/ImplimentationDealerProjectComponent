public with sharing class SearchAccountclass {
    @AuraEnabled(cacheable=True)
    
    public static List<Account> searchAccountclass(string searchkey) {
        string searchText = '%'+ searchkey+'%';
return[select id,name,phone,Rating from Account where Name Like :seachText];
    }
}