import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        // Sample books
        List<Book> bookList = new ArrayList<>();
        bookList.add(new Book("B001", "The Catcher in the Rye", "J.D. Salinger"));
        bookList.add(new Book("B002", "To Kill a Mockingbird", "Harper Lee"));
        bookList.add(new Book("B003", "1984", "George Orwell"));

        // Linear Search
        Book foundBookLinear = SearchUtils.linearSearchByTitle(bookList, "1984");
        System.out.println("Linear Search Result:");
        System.out.println(foundBookLinear != null ? foundBookLinear : "Book not found");

        // Binary Search
        Book[] bookArray = bookList.toArray(new Book[0]);
        SearchUtils.sortBooksByTitle(bookArray); // Ensure the array is sorted for binary search

        Book foundBookBinary = SearchUtils.binarySearchByTitle(bookArray, "To Kill a Mockingbird");
        System.out.println("\nBinary Search Result:");
        System.out.println(foundBookBinary != null ? foundBookBinary : "Book not found");
    }
}
