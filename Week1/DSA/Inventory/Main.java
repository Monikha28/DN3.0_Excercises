package ProductInventory;

public class Main {
    public static void main(String[] args) {
        Inventory inventory = new Inventory();

        // Adding products
        Product product1 = new Product("P001", "Laptop", 10, 999.99);
        Product product2 = new Product("P002", "Smartphone", 20, 499.99);
        inventory.addProduct(product1);
        inventory.addProduct(product2);

        // Displaying inventory
        System.out.println("Current Inventory:");
        inventory.displayInventory();

        // Updating a product
        Product updatedProduct = new Product("P001", "Laptop", 15, 999.99);
        inventory.updateProduct(updatedProduct);

        // Displaying inventory after update
        System.out.println("\nInventory after update:");
        inventory.displayInventory();

        // Deleting a product
        inventory.deleteProduct("P002");

        // Displaying inventory after deletion
        System.out.println("\nInventory after deletion:");
        inventory.displayInventory();
    }
}
