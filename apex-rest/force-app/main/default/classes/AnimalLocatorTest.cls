@isTest
private class AnimalLocatorTest {

    private static final Integer ANIMAL_ID = 1;

    @isTest
    static void shouldGetAnimalById() {

        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

        String response = AnimalLocator.getAnimalNameById(ANIMAL_ID);

        System.debug(response);

        String expectedValue = 'chicken';
        
        System.assertEquals(expectedValue, response, 'Response body should be the same as the mocked.');
    }
}