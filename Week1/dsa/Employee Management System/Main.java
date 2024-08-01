public class Main {
    public static void main(String[] args) {
        EmployeeManager manager = new EmployeeManager(10);
        
        // Adding employees
        manager.addEmployee(new Employee("E001", "John Doe", "Developer", 70000));
        manager.addEmployee(new Employee("E002", "Jane Smith", "Manager", 80000));
        manager.addEmployee(new Employee("E003", "Emily Johnson", "Designer", 65000));
        
        // Traversing employees
        System.out.println("Employee List:");
        manager.traverseEmployees();
        
        // Searching for an employee
        Employee emp = manager.searchEmployee("E002");
        System.out.println("\nSearch Result:");
        System.out.println(emp != null ? emp : "Employee not found");
        
        // Deleting an employee
        manager.deleteEmployee("E001");
        System.out.println("\nEmployee List after Deletion:");
        manager.traverseEmployees();
    }
}
