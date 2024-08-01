package observerpatternexample;

public class TestObserverPattern {
    public static void main(String[] args) {
        StockMarket stockMarket = new StockMarket();

        Observer mobileApp = new MobileApp("Mobile App");
        Observer webApp = new WebApp("Web App");

        stockMarket.registerObserver(mobileApp);
        stockMarket.registerObserver(webApp);

        stockMarket.setStockPrice(100.50);
        System.out.println();

        stockMarket.setStockPrice(105.75);
        System.out.println();

        stockMarket.deregisterObserver(mobileApp);
        stockMarket.setStockPrice(110.00);
    }
}
