package dependencyinjectionexample;

public class Main {
    public static void main(String[] args) {
        // Create a repository instance
        CustomerRepository repository = new CustomerRepositoryImpl();

        // Inject the repository into the service
        CustomerService service = new CustomerService(repository);

        // Use the service to find a customer
        Customer customer = service.getCustomerById("1");

        // Print out the customer details
        System.out.println(customer);
    }
}
