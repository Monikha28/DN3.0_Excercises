package mvcpatternexample;

public class MVCTest {
    public static void main(String[] args) {
        // Create a Student model
        Student student = new Student("1", "John Doe", "A");

        // Create a View to display Student details
        StudentView view = new StudentView();

        // Create a Controller to handle communication between model and view
        StudentController controller = new StudentController(student, view);

        // Display initial details
        controller.updateView();

        // Update Student details
        controller.setStudentName("Jane Doe");
        controller.setStudentGrade("A+");

        // Display updated details
        controller.updateView();
    }
}
