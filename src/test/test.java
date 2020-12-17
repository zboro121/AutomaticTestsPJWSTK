package test;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import zad.MetricConverter;

public class test {
    private MetricConverter lenght;
    @Before
    public void setUp(){
    	lenght = new MetricConverter();
    }
    @Test
    public void metersToCmShouldCalculate(){
    	double expected = 1000;
    	lenght.metersToCm(10);
        Assert.assertEquals(lenght.metersToCm(10), expected,0);
    }
}