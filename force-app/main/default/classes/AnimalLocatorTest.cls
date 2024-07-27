@IsTest
private class AnimalLocatorTest {
    @IsTest static void AnimalLocatorMock1(){
       test.setMock(HttpCallOutMock.Class, new AnimalLocator()); 
        string result = AnimalLocator.getAnimalNameById(0);
        string expectedResult ='majestic badger'; 
        system.assertEquals(result, expectedResult);
    }
}