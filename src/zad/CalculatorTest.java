package zad;

public class CalculatorTest {
	public static void main(String[] args) {
		Calculator calc = new Calculator();
		float a = 20;
		float b = 5;
		float resultOfTheAdd = (float) calc.add(a, b);
		float resultOfTheSub = (float) calc.subtract(a, b);
		float resultOfTheMult = (float) calc.multiply(a, b);
		float resultOfTheDiv = (float) calc.divide(a, b);
	}
}
