CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    p_department_id IN employees.department_id%TYPE,
    p_bonus_percentage IN NUMBER
) IS
BEGIN
    -- Update the salary of employees in the specified department
    UPDATE employees
    SET salary = salary + (salary * p_bonus_percentage / 100)
    WHERE department_id = p_department_id;

    -- Commit the transaction to save changes
    COMMIT;
END UpdateEmployeeBonus;
/
