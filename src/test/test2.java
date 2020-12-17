package test;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import zad.TimeConverter;

public class test2 {
    private TimeConverter time;
    @Before
    public void setUp(){
    	time = new TimeConverter();
    }
    @Test
    public void metersToCmShouldCalculate(){
    	double expected = 600;
    	time.hoursToMinutes(10);
        Assert.assertEquals(time.hoursToMinutes(10), expected,0);
    }
}