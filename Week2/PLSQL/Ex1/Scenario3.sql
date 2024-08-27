DECLARE
    CURSOR loan_cursor IS
        SELECT customer_id, loan_id, due_date
        FROM loans
        WHERE due_date BETWEEN SYSDATE AND SYSDATE + 30;

    v_customer_id loans.customer_id%TYPE;
    v_due_date loans.due_date%TYPE;
BEGIN
    FOR loan_record IN loan_cursor LOOP
        -- Fetch the customer ID and due date
        v_customer_id := loan_record.customer_id;
        v_due_date := loan_record.due_date;

        -- Print a reminder message
        DBMS_OUTPUT.PUT_LINE('Reminder: Loan ' || loan_record.loan_id || 
                             ' for customer ' || v_customer_id || 
                             ' is due on ' || v_due_date);
    END LOOP;
END;
/
