CREATE OR REPLACE PACKAGE EmployeeManagement IS
    PROCEDURE HireEmployee(
        p_employee_id IN employees.employee_id%TYPE,
        p_name IN employees.name%TYPE,
        p_position IN employees.position%TYPE,
        p_department_id IN employees.department_id%TYPE,
        p_salary IN employees.salary%TYPE
    );

    PROCEDURE UpdateEmployeeDetails(
        p_employee_id IN employees.employee_id%TYPE,
        p_name IN employees.name%TYPE,
        p_position IN employees.position%TYPE
    );

    FUNCTION CalculateAnnualSalary(
        p_employee_id IN employees.employee_id%TYPE
    ) RETURN NUMBER;
END EmployeeManagement;
/
