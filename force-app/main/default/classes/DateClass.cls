public class DateClass {
    public static void dateMethod(){
       // public static Date newInstance(Integer year, Integer month, Integer day)
       Integer numberDays = date.daysInMonth(2024, 2);
       system.debug(numberDays);
        // public static Boolean isLeapYear(Integer year)
       
        system.assertEquals(true, date.isLeapYear(2004));
        
        // public static Date parse(String stringDate)
        Date MyDate = Date.parse('13/2/2024');
        system.debug(mydate);
        // public static Date today()
        Date mydateToday = Date.today();
        system.debug(mydateToday);
        // public static Date valueOf(String stringDate)
        String year = '2024';
        String month = '12';
        String day = '3';
        String Hour = '20';
        String minute = '30';
        String second = '20';
        String mystrDate = year+ '-' + month + '-' + Day + ' ' +Hour + ':'+  minute + ':' + second; 
        Date myValueOfDate = date.valueOf(mystrDate);
        system.debug('myValueOfDate'+myValueOfDate);
       // public date addDays(Integer addistionalDays)
       Date mydateNostatic = date.newInstance(2024,10,14);
        Date  newDate = mydateNostatic.addDays(6);
        system.debug('Newdate'+newDate);
        
        // public Date addMonths(Integer additionalMonths)
        Date newMonthadd = mydateNostatic.addMonths(3);
        system.debug(newMonthadd);
        
        // public Date addYears(Integer additionalYears)
        date myDate2 = date.newInstance(1983, 7, 15);
		date newDate2 = myDate2.addYears(2);
		date expectedDate = date.newInstance(1985, 7, 15);
		system.assertEquals(expectedDate, newDate2);
        
        // public Integer dayOfYear()
        date myDate3 = date.newInstance(2019, 7, 15);
        Integer dy = myDate3.dayOfYear();
        system.debug(dy);
        // public Integer daysBetween(Date secondDate)
        Date startDate = date.newInstance(2024,02,21);
        Date dueDate = Date.newInstance(2024,02,30);
        Integer numberDaysDue =startDate.daysBetween(dueDate);
        system.debug('numberDaysDue'+numberDaysDue);
        // public String format()
        Date startDatestr = date.newInstance(2024,02,21);
        String strDate = startDatestr.format();
        system.debug('string date' +strDate);
        system.assertEquals('21/02/2024',strDate);
        
        // public Boolean isSameDay(Date dateToCompare)
        Date myDate4= date.today();
        Date dueDate4= date.newInstance(2024,02,21);
        Boolean dueNow = myDate4.isSameDay(dueDate4);
        system.debug('dueNow:'+dueNow);
        // public Integer month()
        Integer intmon = myDate4.month();
        system.debug(intmon);// 02
        
        //public Integer monthsBetween(Date secondDate)
        Date firstDate = Date.newInstance(2024,04,12);
        Date secondDate =  Date.newInstance(2024,05,12);
        Integer intbet = firstDate.monthsBetween(secondDate);
        system.debug('monthsBetween'+intbet);
        
        // public date toStartOfWeek();
        Date todayD =date.today();
        Date weekStart = todayD.toStartOfWeek();
        system.debug('weekStart'+ weekStart);
        
        // public date toStartOfMonth
        Date startofMonth = Date.Today();
        System.debug('startofMonth'+startofMonth);
        
        // Public Integer Year()
        Integer dd = Date.Today().year();
        system.debug(dd);
    }

}