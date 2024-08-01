public class FinancialForecastM {

    // Iterative method to calculate the future value
    public static double predictFutureValueIterative(double initialValue, double growthRate, int periods) {
        double futureValue = initialValue;

        for (int i = 0; i < periods; i++) {
            futureValue *= (1 + growthRate);
        }

        return futureValue;
    }

    public static void main(String[] args) {
        double initialValue = 1000.0; // Initial value
        double growthRate = 0.05;     // Growth rate (e.g., 5%)
        int periods = 10;             // Number of periods (e.g., 10 years)

        double futureValue = predictFutureValueIterative(initialValue, growthRate, periods);
        System.out.println("Predicted Future Value: " + futureValue);
    }
}
