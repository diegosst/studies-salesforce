public with sharing class ExampleCallout {
    @future(callout=true)
    public static void makeCallout() {
        HttpRequest request = new HttpRequest();
        // Set the endpoint URL.
        String endpoint = 'https://pokeapi.co/api/v2/pokemon/charmander';
        request.setEndPoint(endpoint);
        // Set the HTTP verb to GET.
        request.setMethod('GET');
        // Send the HTTP request and get the response.
        HttpResponse response = new HTTP().send(request);

        System.debug('Callout response: ' + response.getBody());
    }
}