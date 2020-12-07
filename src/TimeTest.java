
class TimeTest {
    public static void main(String[] args) {
        TimeConverter converter = new TimeConverter();
        int hours = 14;
        int minutes = converter.hoursToMinutes(hours);
        int seconds = converter.minutesToSeconds(minutes);
        int millis = converter.secondsToMiliseconds(seconds);
        System.out.println(hours + " godzin to " + millis + " milisekund");
    }
}