@isTest
public with sharing class TestVerifyDate {
    
    @isTest static void checkDatesWithin30Days() {

        Date date1 = Date.newInstance(2023, 1, 20);
        Date date2 = Date.newInstance(2023, 1, 25);

        Date result = VerifyDate.CheckDates(date1, date2);

        System.assertEquals(result, date2, 'This should return the same result as date2.');
    }

    @isTest static void checkDatesNotWithin30Days() {

        Date date1 = Date.newInstance(2023, 1, 20);
        Date date2 = Date.newInstance(2023, 3, 25);

        Date endOfMonth = Date.newInstance(date1.year(), date1.month(), Date.daysInMonth(date1.year(), date1.month()));

        Date result = VerifyDate.CheckDates(date1, date2);

        System.assertEquals(result, endOfMonth, 'This should return the end of the month of date1.');
    }

    @isTest static void checkDate2LowerThanDate1() {

        Date date1 = Date.newInstance(2023, 3, 25);
        Date date2 = Date.newInstance(2023, 1, 20);

        Date endOfMonth = Date.newInstance(date1.year(), date1.month(), Date.daysInMonth(date1.year(), date1.month()));

        Date result = VerifyDate.CheckDates(date1, date2);

        System.assertEquals(result, endOfMonth, 'This should return the end of the month of date1.');
    }

}