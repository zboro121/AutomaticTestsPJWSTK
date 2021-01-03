package test.java;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import main.java.TimeConverter;

public class test3 {
    private TimeConverter time;
    @Before
    public void setUp(){
    	time = new TimeConverter();
    }
    @Test
    public void hoursToMinutesCalculate(){
    	double expected = 600;
    	time.hoursToMinutes(10);
        Assert.assertEquals(time.hoursToMinutes(10), expected,0);
    }
}