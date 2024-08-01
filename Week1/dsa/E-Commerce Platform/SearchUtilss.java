import java.util.Arrays;

public class SearchUtilss {

    public static Product binarySearch(Product[] products, String targetId) {
        int left = 0;
        int right = products.length - 1;
        
        while (left <= right) {
            int mid = left + (right - left) / 2;
            if (products[mid].getProductId().equals(targetId)) {
                return products[mid];
            }
            if (targetId.compareTo(products[mid].getProductId()) < 0) {
                right = mid - 1;
            } else {
                left = mid + 1;
            }
        }
        return null; // Product not found
    }
}
