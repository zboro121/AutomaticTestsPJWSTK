package main.java;

import java.util.Scanner;

public class Calculator {
	public double add(double a, double b) {
		return a + b;
	}
	
	public double subtract(double a, double b) {
		return a - b;
	}
	
	public double multiply(double a, double b) {
		return a*b;
	}
	
	public double divide(double a, double b) {
		return a/b;
	}
	public static long silnia(long n) {
        if (n == 0) { return 1; }
        return silnia(n - 1) * n;
    }
public static void main(String[] args) {
	try (Scanner in = new Scanner(System.in)) {
		// Dodatkowa funkcjonalnosc
		//Pierwiastkowanie drugiego stopnia, to metoda Math.sqrt(d)
		System.out.println("Pierwiastek drugiego stopnia z liczby 16 wynosi:\n" + Math.sqrt(16));
		System.out.println("\nPodaj przykładową liczbę");
		double liczbaD = in.nextDouble();
		double sqrtLiczby = Math.sqrt(liczbaD);
		System.out.println("Pierwiastek drugiego stopnia z " + liczbaD + " wynosi " + sqrtLiczby);
		System.out.println();
		// Wartość bezwzględna, to metoda Math.abs(d)
		System.out.println("Podaj liczbę ujemną");
		int n = in.nextInt();
		int nDodatnia = Math.abs(n);
		System.out.println("Wartość bezwzględna z "+ n +" wynosi "+ nDodatnia);
	}
}
}
