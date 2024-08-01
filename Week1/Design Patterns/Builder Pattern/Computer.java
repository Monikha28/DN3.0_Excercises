package builderpatternexample;

public class Computer {
    // Required parameters
    private String CPU;
    private String RAM;
    private String storage;

    // Optional parameters
    private String graphicsCard;
    private String soundCard;
    private String coolingSystem;

    // Private constructor
    private Computer(Builder builder) {
        this.CPU = builder.CPU;
        this.RAM = builder.RAM;
        this.storage = builder.storage;
        this.graphicsCard = builder.graphicsCard;
        this.soundCard = builder.soundCard;
        this.coolingSystem = builder.coolingSystem;
    }

    @Override
    public String toString() {
        return "Computer [CPU=" + CPU + ", RAM=" + RAM + ", Storage=" + storage +
               ", Graphics Card=" + graphicsCard + ", Sound Card=" + soundCard + 
               ", Cooling System=" + coolingSystem + "]";
    }

    // Static nested Builder class
    public static class Builder {
        // Required parameters
        private String CPU;
        private String RAM;
        private String storage;

        // Optional parameters
        private String graphicsCard;
        private String soundCard;
        private String coolingSystem;

        // Constructor for Builder with required parameters
        public Builder(String CPU, String RAM, String storage) {
            this.CPU = CPU;
            this.RAM = RAM;
            this.storage = storage;
        }

        // Methods for setting optional parameters
        public Builder setGraphicsCard(String graphicsCard) {
            this.graphicsCard = graphicsCard;
            return this;
        }

        public Builder setSoundCard(String soundCard) {
            this.soundCard = soundCard;
            return this;
        }

        public Builder setCoolingSystem(String coolingSystem) {
            this.coolingSystem = coolingSystem;
            return this;
        }

        // Build method to create Computer instance
        public Computer build() {
            return new Computer(this);
        }
    }
}
