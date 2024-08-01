package adapterpatternexample;

public class TestAdapterPattern {
    public static void main(String[] args) {
        // Using PayPal through the adapter
        PaymentProcessor paypalProcessor = new PayPalAdapter(new PayPal());
        paypalProcessor.processPayment(100.00);

        // Using Stripe through the adapter
        PaymentProcessor stripeProcessor = new StripeAdapter(new Stripe());
        stripeProcessor.processPayment(200.00);
    }
}
