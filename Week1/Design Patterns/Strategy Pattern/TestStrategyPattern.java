package strategypatternexample;

public class TestStrategyPattern {
    public static void main(String[] args) {
        PaymentContext context = new PaymentContext();

        // Pay using Credit Card
        context.setPaymentStrategy(new CreditCardPayment("1234-5678-9012-3456", "John Doe"));
        context.executePayment(250.00);

        System.out.println();

        // Pay using PayPal
        context.setPaymentStrategy(new PayPalPayment("johndoe@example.com"));
        context.executePayment(150.00);
    }
}
