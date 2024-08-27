DECLARE
    CURSOR loan_cursor IS
        SELECT loan_id, interest_rate
        FROM loans;

    v_loan_id loans.loan_id%TYPE;
    v_interest_rate loans.interest_rate%TYPE;
    v_new_interest_rate CONSTANT NUMBER := 5.5; -- Example new interest rate based on policy
BEGIN
    OPEN loan_cursor;

    LOOP
        FETCH loan_cursor INTO v_loan_id, v_interest_rate;
        EXIT WHEN loan_cursor%NOTFOUND;

        -- Update the interest rate based on the new policy
        v_interest_rate := v_new_interest_rate;

        -- Update the loan interest rate
        UPDATE loans
        SET interest_rate = v_interest_rate
        WHERE loan_id = v_loan_id;
    END LOOP;

    -- Commit the transaction to save changes
    COMMIT;

    CLOSE loan_cursor;
END;
/
