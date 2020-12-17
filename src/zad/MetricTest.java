package zad;

public class MetricTest {
    public static void main(String[] args) {
        MetricConverter converter = new MetricConverter();
        double m = 2.5;
        double mToCm = converter.metersToCm(m);
        double mToMm = converter.metersToMm(m);
        System.out.println(m + "m to " + mToCm + "cm i " + mToMm + "mm");
    }
}