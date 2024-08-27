CREATE OR REPLACE PROCEDURE AddNewCustomer (
    p_customer_id IN customers.customer_id%TYPE,
    p_name IN customers.name%TYPE,
    p_age IN customers.age%TYPE,
    p_balance IN customers.balance%TYPE
) IS
    -- Exception to handle duplicate customer ID
    duplicate_customer_id EXCEPTION;

BEGIN
    -- Attempt to insert the new customer
    INSERT INTO customers (customer_id, name, age, balance)
    VALUES (p_customer_id, p_name, p_age, p_balance);

    -- Commit the transaction
    COMMIT;

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        -- Handle duplicate customer ID error
        RAISE duplicate_customer_id;
        
    WHEN duplicate_customer_id THEN
        -- Log the error and prevent insertion
        DBMS_OUTPUT.PUT_LINE('Error: A customer with ID ' || p_customer_id || ' already exists.');
        
    WHEN OTHERS THEN
        -- Handle any other unexpected errors
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: An unexpected error occurred while adding the customer.');
END AddNewCustomer;
/
