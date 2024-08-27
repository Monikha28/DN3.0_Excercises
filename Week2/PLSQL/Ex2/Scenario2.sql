CREATE OR REPLACE PROCEDURE UpdateSalary (
    p_employee_id IN employees.employee_id%TYPE,
    p_percentage IN NUMBER
) IS
    -- Variable to hold current salary
    v_current_salary employees.salary%TYPE;
    
    -- Exception to handle employee not found
    employee_not_found EXCEPTION;
    
BEGIN
    -- Retrieve the current salary of the employee
    SELECT salary INTO v_current_salary
    FROM employees
    WHERE employee_id = p_employee_id;
    
    -- Update the employee's salary
    UPDATE employees
    SET salary = salary + (salary * p_percentage / 100)
    WHERE employee_id = p_employee_id;
    
    -- Commit the transaction
    COMMIT;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Handle employee not found error
        RAISE employee_not_found;
        
    WHEN employee_not_found THEN
        -- Log the error and handle the exception
        DBMS_OUTPUT.PUT_LINE('Error: Employee with ID ' || p_employee_id || ' not found.');
        
    WHEN OTHERS THEN
        -- Handle any other unexpected errors
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: An unexpected error occurred during salary update.');
END UpdateSalary;
/
