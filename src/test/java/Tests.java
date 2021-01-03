package test.java;
import org.junit.Assert;
import org.junit.Test;

import main.java.Calculator;
import main.java.MetricConverter;
import main.java.TimeConverter;

public class Tests {
    private Calculator digit, wynik, pierwiastek, bezwzgledna;
    private MetricConverter lenght;
    private TimeConverter time;
    private double resultsMultiply, resultsDivide;


    @Test
    public void digitCalculate(){
    	digit = new Calculator();
    	double expected = 10;
    	double result = 10;
        Assert.assertEquals(digit.subtract(20, result), expected,0);
    }
    @Test
    public void metersToCmCalculate(){
    	lenght = new MetricConverter();
    	double expected = 1000;
    	lenght.metersToCm(10);
        Assert.assertEquals(lenght.metersToCm(10), expected,0);
    }
    @Test
    public void hoursToMinutesCalculate(){
    	time = new TimeConverter();
    	double expected = 600;
    	time.hoursToMinutes(10);
        Assert.assertEquals(time.hoursToMinutes(10), expected,0);
    }
    @Test
    public void multiplyCalculate(){
    	Calculator sun = new Calculator();
    	resultsMultiply = sun.multiply(5, 10);    	 	
    	double expected = 50;
        Assert.assertEquals(sun.multiply(5, 10), expected,0);
        System.out.println(resultsMultiply);  
    }
    @Test
    public void divideCalculate(){
    	Calculator jupiter = new Calculator();
    	resultsDivide = jupiter.divide(10, 5);    	 	
    	double expected = 2;
        Assert.assertEquals(jupiter.divide(10, 5), expected,0);
        System.out.println(resultsDivide);  
    }
    @Test
    public void silniaCalculate() {
    	wynik = new Calculator();
    	double expected = 6;
    	Calculator.silnia(3);
        Assert.assertEquals(Calculator.silnia(3), expected,0);
    }
    @Test
    public void pierwiastekCalculate() {
    	pierwiastek = new Calculator();
    	double expected = 4;
    	Math.sqrt(16);
    	System.out.println("Pierwiastek drugiego stopnia z liczby 16 wynosi:\n" + Math.sqrt(16));
    }
    @Test
    public void wartBezwzglednaCalculate() {
    	bezwzgledna = new Calculator();
    	double expected = 4;
    	int nDodatnia = Math.abs(-4);
    	System.out.println("Wartość bezwzględna z liczby -4 wynosi "+ nDodatnia);
    }
}
