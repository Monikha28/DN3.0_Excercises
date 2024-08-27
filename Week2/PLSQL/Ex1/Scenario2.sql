DECLARE
    CURSOR customer_cursor IS
        SELECT customer_id, balance
        FROM customers
        WHERE balance > 10000;

    v_customer_id customers.customer_id%TYPE;
BEGIN
    FOR customer_record IN customer_cursor LOOP
        -- Fetch the customer ID
        v_customer_id := customer_record.customer_id;

        -- Set the IsVIP flag to TRUE
        UPDATE customers
        SET IsVIP = TRUE
        WHERE customer_id = v_customer_id;
    END LOOP;

    -- Commit the transaction to save changes
    COMMIT;
END;
/