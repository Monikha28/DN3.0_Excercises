package decoratorpatternexample;

public class TestDecoratorPattern {
    public static void main(String[] args) {
        // Basic email notification
        Notifier emailNotifier = new EmailNotifier();
        emailNotifier.send("Hello!");

        System.out.println("\nAdding SMS notification...");
        // Email + SMS notification
        Notifier smsNotifier = new SMSNotifierDecorator(new EmailNotifier());
        smsNotifier.send("Hello!");

        System.out.println("\nAdding Slack notification...");
        // Email + SMS + Slack notification
        Notifier slackNotifier = new SlackNotifierDecorator(
                                    new SMSNotifierDecorator(new EmailNotifier()));
        slackNotifier.send("Hello!");
    }
}
