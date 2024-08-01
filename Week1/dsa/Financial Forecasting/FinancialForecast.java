public class FinancialForecast {

    // Recursive method to calculate the future value
    public static double predictFutureValue(double initialValue, double growthRate, int periods) {
        // Base case: if no more periods, return the initial value
        if (periods == 0) {
            return initialValue;
        }

        // Recursive case: apply the growth rate and reduce the period count
        return predictFutureValue(initialValue * (1 + growthRate), growthRate, periods - 1);
    }

    public static void main(String[] args) {
        double initialValue = 1000.0; // Initial value
        double growthRate = 0.05;     // Growth rate (e.g., 5%)
        int periods = 10;             // Number of periods (e.g., 10 years)

        double futureValue = predictFutureValue(initialValue, growthRate, periods);
        System.out.println("Predicted Future Value: " + futureValue);
    }
}
