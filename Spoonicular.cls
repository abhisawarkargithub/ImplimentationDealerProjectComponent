public with sharing class Spoonicular {
   public static final String spoonicular_Api = 'https://api.spoonacular.com';
   public static final String Api_key = 'fc4ecba3ad4941b8bb4410b240c1f5d1';
    @AuraEnabled(cacheable=true)
    public static string getRendomRecepie(){
       Http http = new Http();
       HttpRequest request = New HttpRequest();
       request.setEndpoint(spoonicular_Api+'/recipes/random?apiKey='+Api_key);
       request.setMethod('GET');

       HttpResponse response = http.send(request);
       system.debug('response'+response.getBody());
       if(response.getStatusCode() == 200){
        return response.getBody();
       }
       return '';
    }
    @AuraEnabled(cacheable=true)
    public static string getRecipe(String recipeId){
        Http hp = New Http();
        HttpRequest req = New HttpRequest();
        req.setEndpoint(spoonicular_Api+'/recipes/'+recipeId+'/information?apiKey='+Api_key);
        req.setMethod('GET');

        HttpResponse res = hp.send(req);
        System.debug('responce'+res.getBody());
        if(res.getStatusCode() ==200){
            return res.getBody();
        }
        return '';
    }
    @AuraEnabled
    public static string getRecipeIngredient(String ingredient){
        
        Http htp = New Http();
        HttpRequest reqs = New HttpRequest();
        reqs.setEndpoint(spoonicular_Api+'/recipes/findByIngredients?apiKey='+Api_key+'&ingredients='+ingredient);
        reqs.setMethod('GET');

        HttpResponse resp = htp.send(reqs);
        System.debug('responce'+resp.getBody());
        if(resp.getStatusCode() ==200){
            return resp.getBody();
        }
        return '';
    }










    // Setup
   /* 
String clientId = "59287bec-0740-458e-9798-edd3e9055acf";
String clientSecret = "e4466b2b-c2f2-4de5-b375-18fa25ff2946";
String redirectUri = "https://api.spoonacular.com/recipes/complexSearch";
String[] scope = {};
String mode = "test";

// Initialize a new AuthClient with your credentials.
AuthClient authClient = new AuthClient.Builder
    .clientId(clientId)
    .clientSecret(clientSecret)
    .redirectUri(redirectUri)
    .mode(mode);

// Retrieve the auth URL to start the OAuth flow.
String authUrl = authClient.authUrlBuilder(scope)
        .setApprovalPrompt(true)
        .setState("some state")
        .build();*/
}