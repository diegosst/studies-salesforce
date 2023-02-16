@isTest
private class ParkLocatorTest {
    @isTest
    static void validateParkLocatorByCountry() {

        Test.setMock(WebServiceMock.class, new ParkServiceMock());

        String[] parks = ParkLocator.country('India');

        System.assertEquals(new String[]{'Anamudi Shola National Park', 'Anshi National Park', 'Bandipur National Park'}, parks, 'Should return expected parks.');
    } 
}