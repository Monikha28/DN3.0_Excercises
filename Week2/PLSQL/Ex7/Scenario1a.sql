CREATE OR REPLACE PACKAGE CustomerManagement IS
    PROCEDURE AddCustomer(
        p_customer_id IN customers.customer_id%TYPE,
        p_name IN customers.name%TYPE,
        p_dob IN customers.dob%TYPE,
        p_address IN customers.address%TYPE
    );

    PROCEDURE UpdateCustomerDetails(
        p_customer_id IN customers.customer_id%TYPE,
        p_name IN customers.name%TYPE,
        p_address IN customers.address%TYPE
    );

    FUNCTION GetCustomerBalance(
        p_customer_id IN customers.customer_id%TYPE
    ) RETURN NUMBER;
END CustomerManagement;
/
