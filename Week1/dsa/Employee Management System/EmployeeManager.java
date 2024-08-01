public class EmployeeManager {
    private Employee[] employees;
    private int size;
    
    public EmployeeManager(int capacity) {
        employees = new Employee[capacity];
        size = 0;
    }

    // Add an employee
    public void addEmployee(Employee employee) {
        if (size < employees.length) {
            employees[size++] = employee;
        } else {
            System.out.println("Employee array is full.");
        }
    }

    // Search for an employee by ID
    public Employee searchEmployee(String employeeId) {
        for (int i = 0; i < size; i++) {
            if (employees[i].getEmployeeId().equals(employeeId)) {
                return employees[i];
            }
        }
        return null; // Employee not found
    }

    // Traverse and print all employees
    public void traverseEmployees() {
        if (size == 0) {
            System.out.println("No employees to display.");
        } else {
            for (int i = 0; i < size; i++) {
                System.out.println(employees[i]);
            }
        }
    }

    // Delete an employee by ID
    public void deleteEmployee(String employeeId) {
        int index = -1;
        for (int i = 0; i < size; i++) {
            if (employees[i].getEmployeeId().equals(employeeId)) {
                index = i;
                break;
            }
        }
        if (index == -1) {
            System.out.println("Employee with ID " + employeeId + " does not exist.");
            return;
        }
        for (int i = index; i < size - 1; i++) {
            employees[i] = employees[i + 1];
        }
        employees[--size] = null; // Remove reference to the last employee
    }
}
