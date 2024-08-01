package proxypatternexample;

public class TestProxyPattern {
    public static void main(String[] args) {
        Image image1 = new ProxyImage("photo1.jpg");
        Image image2 = new ProxyImage("photo2.jpg");

        // Image will be loaded from remote server only when display is called
        System.out.println("Displaying first image:");
        image1.display();

        System.out.println("\nDisplaying first image again:");
        image1.display();  // Should not reload the image

        System.out.println("\nDisplaying second image:");
        image2.display();
    }
}
