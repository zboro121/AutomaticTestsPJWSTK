package test;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import zad.MetricConverter;

public class test {
    private MetricConverter time;
    @Before
    public void setUp() {
    	time = new MetricConverter();
    }
    @Test
    public void metersToCmShouldCalculate(){
    	double expected = 1000;
        time.metersToCm(10);
        Assert.assertEquals(time.metersToCm(10),expected,0);
    }
}