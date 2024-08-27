DECLARE
    CURSOR customer_cursor IS
        SELECT customer_id, age, loan_interest_rate
        FROM customers
        WHERE age > 60;

    v_customer_id customers.customer_id%TYPE;
    v_loan_interest_rate customers.loan_interest_rate%TYPE;
BEGIN
    FOR customer_record IN customer_cursor LOOP
        -- Fetch the current interest rate
        v_customer_id := customer_record.customer_id;
        v_loan_interest_rate := customer_record.loan_interest_rate;

        -- Apply a 1% discount
        v_loan_interest_rate := v_loan_interest_rate - 1;

        -- Update the customer's loan interest rate
        UPDATE customers
        SET loan_interest_rate = v_loan_interest_rate
        WHERE customer_id = v_customer_id;
    END LOOP;

    -- Commit the transaction to save changes
    COMMIT;
END;
/
