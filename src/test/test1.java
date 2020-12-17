package test;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import zad.Calculator;

public class test1 {
    private Calculator digit;
    @Before
    public void setUp(){
    	digit = new Calculator();
    }
    @Test
    public void digitCalculate(){
    	double expected = 10;
    	double result = 10;
        Assert.assertEquals(digit.subtract(20, result), expected,0);
    }
}