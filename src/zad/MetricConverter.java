package zad;

public class MetricConverter {
    public double metersToCm(double meters) {
        return meters * 100;
    }
    
    public double metersToMm(double meters) {
        return meters * 1000;
    }
    
    public double cmToMeters(double cm) {
        return cm / 100;
    }
    
    public double mmToMeters(double mm) {
        return mm / 1000;
    }
}