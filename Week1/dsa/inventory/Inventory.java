package ProductInventory;

import java.util.HashMap;
import java.util.Map;

public class Inventory {
    private Map<String, Product> productMap;

    public Inventory() {
        productMap = new HashMap<>();
    }

    // Add a product to the inventory
    public void addProduct(Product product) {
        productMap.put(product.getProductId(), product);
    }

    // Update an existing product in the inventory
    public void updateProduct(Product product) {
        if (productMap.containsKey(product.getProductId())) {
            productMap.put(product.getProductId(), product);
        } else {
            System.out.println("Product with ID " + product.getProductId() + " does not exist.");
        }
    }

    // Delete a product from the inventory
    public void deleteProduct(String productId) {
        if (productMap.containsKey(productId)) {
            productMap.remove(productId);
        } else {
            System.out.println("Product with ID " + productId + " does not exist.");
        }
    }

    // Retrieve a product from the inventory
    public Product getProduct(String productId) {
        return productMap.get(productId);
    }

    // Display all products in the inventory
    public void displayInventory() {
        if (productMap.isEmpty()) {
            System.out.println("Inventory is empty.");
        } else {
            productMap.values().forEach(System.out::println);
        }
    }
}
