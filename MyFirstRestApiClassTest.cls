@isTest
private with sharing class MyFirstRestApiClassTest {

    static testMethod void testGetMethod() {
        Account acc = new Account();
        acc.Name= 'Test';
        acc.AccountNumber = '1234';
        insert acc;

        RestRequest request = new RestRequest();
        request.requestURI = '/services/apexrest/api/Account/1234';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account acct = MyFirstRestApiClass.doGet();
        System.assert(acct != null);
        System.assertEquals('Test', acct.Name);
    }
    static testMethod void testDeleteMethod(){
        Account accDel = new Account();
        accDel.Name = 'Test';
        accDel.AccountNumber = '1234';
        insert accDel;

        RestRequest request = new RestRequest();
        request.requestURI ='/services/apexrest/api/Account/1234';
        
    }     
    
}