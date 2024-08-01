package dependencyinjectionexample;

public class CustomerRepositoryImpl implements CustomerRepository {
    @Override
    public Customer findCustomerById(String id) {
        // In a real-world application, this would interact with a database.
        // Here, we are simulating with a simple example.
        return new Customer(id, "John Doe");
    }
}
