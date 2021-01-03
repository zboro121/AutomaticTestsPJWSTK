package test.java;
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.mockito.BDDMockito.*;

import org.junit.Assert;
import org.junit.Test;


import main.java.Calculator;


public class Tests {
    private double resultsAdd, resultsSubtract, resultsMultiply, resultsDivide;

    @Test
    public void addCalculate(){
    	Calculator digit = new Calculator();
    	resultsAdd = digit.add(5, 10);    	 	
    	double expected = 15;
        Assert.assertEquals(digit.add(5, 10), expected,0);
        System.out.println(resultsAdd);  
    }
    @Test
    public void addCalculate2(){
    	Calculator digit = mock(Calculator.class);
    	resultsAdd = digit.add(5, 10);    	 	
    	double expected = 15;
        Assert.assertEquals(digit.add(5, 10), expected,0);
        System.out.println(resultsAdd);  
    }
    @Test
    public void addCalculate3(){
    	Calculator digit = mock(Calculator.class);
    	resultsAdd = digit.add(5, 10);    	 	
    	double expected = 0;
        Assert.assertEquals(digit.add(5, 10), expected,0);
        System.out.println(resultsAdd);  
    }
    @Test
    public void addCalculate4(){
    	Calculator digit = mock(Calculator.class);
    	when(digit.add(5, 10)).thenReturn((double) 15);
    	resultsAdd = digit.add(5, 10);    	 	
    	double expected = 15;
        Assert.assertEquals(digit.add(5, 10), expected,0);
        System.out.println(resultsAdd);  
    }
    @Test
    public void addCalculate5(){
    	Calculator digit = mock(Calculator.class);
    	given(digit.add(5, 10)).willReturn((double) 15);
    	resultsAdd = digit.add(5, 10);    	 	
    	double expected = 15;
        Assert.assertEquals(digit.add(5, 10), expected,0);
        System.out.println(resultsAdd);  
    }
    @Test
    public void subtractCalculate(){
    	Calculator orion = new Calculator();
    	resultsSubtract = orion.subtract(10, 5);    	 	
    	double expected = 5;
        Assert.assertEquals(orion.subtract(10, 5), expected,0);
        System.out.println(resultsSubtract);  
    }
    @Test
    public void subtractCalculate2(){
    	Calculator orion = mock(Calculator.class);
    	resultsAdd = orion.subtract(10, 5);    	 	
    	double expected = 5;
    	Assert.assertEquals(orion.subtract(10, 5), expected,0);
        System.out.println(resultsAdd);  
    }
    @Test
    public void subtractCalculate3(){
    	Calculator orion = mock(Calculator.class);
    	resultsAdd = orion.subtract(10, 5);    	 	
    	double expected = 0;
    	Assert.assertEquals(orion.subtract(10, 5), expected,0);
        System.out.println(resultsAdd);  
    }
    @Test
    public void subtractCalculate4(){
    	Calculator orion = mock(Calculator.class);
    	when(orion.subtract(10, 5)).thenReturn((double) 5);
    	resultsAdd = orion.subtract(10, 5);    	 	
    	double expected = 5;
    	Assert.assertEquals(orion.subtract(10, 5), expected,0);
        System.out.println(resultsAdd);  
    }
    @Test
    public void subtractCalculate5(){
    	Calculator orion = mock(Calculator.class);
    	given(orion.subtract(10, 5)).willReturn((double) 5);
    	resultsAdd = orion.subtract(10, 5);    	 	
    	double expected = 5;
    	Assert.assertEquals(orion.subtract(10, 5), expected,0);
        System.out.println(resultsAdd);  
    }    

}