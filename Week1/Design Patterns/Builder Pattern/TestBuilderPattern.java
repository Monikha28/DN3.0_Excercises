package builderpatternexample;

public class TestBuilderPattern {
    public static void main(String[] args) {
        // Create a basic Computer with only required parameters
        Computer basicComputer = new Computer.Builder("Intel i5", "8GB", "256GB SSD")
                                   .build();

        System.out.println("Basic Computer: " + basicComputer);

        // Create a high-end Computer with optional parameters
        Computer gamingComputer = new Computer.Builder("Intel i9", "32GB", "1TB SSD")
                                    .setGraphicsCard("NVIDIA RTX 3080")
                                    .setSoundCard("Creative Sound Blaster")
                                    .setCoolingSystem("Liquid Cooling")
                                    .build();

        System.out.println("Gaming Computer: " + gamingComputer);
    }
}
