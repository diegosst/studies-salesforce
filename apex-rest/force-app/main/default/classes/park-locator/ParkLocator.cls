public with sharing class ParkLocator {
    
    public static String[] country(String country) {
        return new ParkService.ParksImplPort().byCountry(country);
    }

}