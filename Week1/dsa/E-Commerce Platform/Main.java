public class Main {
    public static void main(String[] args) {
        Product[] products = {
            new Product("P003", "Smartwatch", "Electronics"),
            new Product("P001", "Laptop", "Computers"),
            new Product("P002", "Smartphone", "Electronics")
        };

        // Sorting products by productId for binary search
        Arrays.sort(products, (p1, p2) -> p1.getProductId().compareTo(p2.getProductId()));

        // Linear Search
        Product resultLinear = SearchUtils.linearSearch(products, "P002");
        System.out.println("Linear Search Result: " + (resultLinear != null ? resultLinear : "Not Found"));

        // Binary Search
        Product resultBinary = SearchUtils.binarySearch(products, "P002");
        System.out.println("Binary Search Result: " + (resultBinary != null ? resultBinary : "Not Found"));
    }
}
