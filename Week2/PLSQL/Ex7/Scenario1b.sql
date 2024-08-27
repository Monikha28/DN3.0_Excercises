CREATE OR REPLACE PACKAGE BODY CustomerManagement IS

    PROCEDURE AddCustomer(
        p_customer_id IN customers.customer_id%TYPE,
        p_name IN customers.name%TYPE,
        p_dob IN customers.dob%TYPE,
        p_address IN customers.address%TYPE
    ) IS
    BEGIN
        INSERT INTO customers (customer_id, name, dob, address)
        VALUES (p_customer_id, p_name, p_dob, p_address);
        COMMIT;
    END AddCustomer;

    PROCEDURE UpdateCustomerDetails(
        p_customer_id IN customers.customer_id%TYPE,
        p_name IN customers.name%TYPE,
        p_address IN customers.address%TYPE
    ) IS
    BEGIN
        UPDATE customers
        SET name = p_name,
            address = p_address
        WHERE customer_id = p_customer_id;
        COMMIT;
    END UpdateCustomerDetails;

    FUNCTION GetCustomerBalance(
        p_customer_id IN customers.customer_id%TYPE
    ) RETURN NUMBER IS
        v_total_balance NUMBER;
    BEGIN
        SELECT SUM(balance) INTO v_total_balance
        FROM accounts
        WHERE customer_id = p_customer_id;

        RETURN v_total_balance;
    END GetCustomerBalance;

END CustomerManagement;
/
