CREATE OR REPLACE PACKAGE BODY EmployeeManagement IS

    PROCEDURE HireEmployee(
        p_employee_id IN employees.employee_id%TYPE,
        p_name IN employees.name%TYPE,
        p_position IN employees.position%TYPE,
        p_department_id IN employees.department_id%TYPE,
        p_salary IN employees.salary%TYPE
    ) IS
    BEGIN
        INSERT INTO employees (employee_id, name, position, department_id, salary)
        VALUES (p_employee_id, p_name, p_position, p_department_id, p_salary);
        COMMIT;
    END HireEmployee;

    PROCEDURE UpdateEmployeeDetails(
        p_employee_id IN employees.employee_id%TYPE,
        p_name IN employees.name%TYPE,
        p_position IN employees.position%TYPE
    ) IS
    BEGIN
        UPDATE employees
        SET name = p_name,
            position = p_position
        WHERE employee_id = p_employee_id;
        COMMIT;
    END UpdateEmployeeDetails;

    FUNCTION CalculateAnnualSalary(
        p_employee_id IN employees.employee_id%TYPE
    ) RETURN NUMBER IS
        v_annual_salary NUMBER;
    BEGIN
        SELECT salary * 12 INTO v_annual_salary
        FROM employees
        WHERE employee_id = p_employee_id;

        RETURN v_annual_salary;
    END CalculateAnnualSalary;

END EmployeeManagement;
/
