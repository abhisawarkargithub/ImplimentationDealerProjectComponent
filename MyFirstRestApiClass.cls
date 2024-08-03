@RestResource(urlMapping='/api/Account/*')
global with sharing class MyFirstRestApiClass {
    @httpGet
    global static Account doGet() {
        RestRequest req = RestContext.request;
        RestResponce res = RestContext.responce;
        String AccNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/'+1));
        Account result = [select id, Name, Phone, Website from Account where AccountNumber =: AccNumber];
        return result;
    }
    @httpDelete
    global static void doDelete(){
        RestRequest reqDel = RestContext.request;
        RestResponse resDel = RestContext.response;
        String AccNumber = reqDel.requestURI.substring(reqDel.requestURI.lastIndexOf('/')+1);
        Account result = [select Id, Name, Phone, Website from Account where AccountNumber =: AccNumber];
        Delete result;
    }
}