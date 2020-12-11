package zad;

class CalculatorTest {
		public static void main(String[] args) {
		Calculator calc = new Calculator();
		double a = 15;
		double b = 2.5;
		System.out.println("A = " + a + ", B = " + b);
		System.out.println("A+B = " + calc.add(a, b));
		System.out.println("A-B = " + calc.subtract(a, b));
		System.out.println("A*B = " + calc.multiply(a, b));
		System.out.println("A/B = " + calc.divide(a, b));
	}
}
