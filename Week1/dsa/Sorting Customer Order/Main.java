public class Main {
    public static void main(String[] args) {
        Order[] orders = {
            new Order("O003", "Alice", 299.99),
            new Order("O001", "Bob", 150.00),
            new Order("O002", "Charlie", 450.75)
        };

        // Bubble Sort
        Order[] bubbleSortedOrders = Arrays.copyOf(orders, orders.length);
        SortUtils.bubbleSort(bubbleSortedOrders);
        System.out.println("Bubble Sorted Orders:");
        for (Order order : bubbleSortedOrders) {
            System.out.println(order);
        }

        // Quick Sort
        Order[] quickSortedOrders = Arrays.copyOf(orders, orders.length);
        SortUtils.quickSort(quickSortedOrders, 0, quickSortedOrders.length - 1);
        System.out.println("\nQuick Sorted Orders:");
        for (Order order : quickSortedOrders) {
            System.out.println(order);
        }
    }
}
