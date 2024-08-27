DECLARE
    CURSOR transaction_cursor IS
        SELECT customer_id, transaction_id, transaction_date, amount, transaction_type
        FROM transactions
        WHERE EXTRACT(MONTH FROM transaction_date) = EXTRACT(MONTH FROM SYSDATE)
          AND EXTRACT(YEAR FROM transaction_date) = EXTRACT(YEAR FROM SYSDATE);

    v_customer_id transactions.customer_id%TYPE;
    v_transaction_id transactions.transaction_id%TYPE;
    v_transaction_date transactions.transaction_date%TYPE;
    v_amount transactions.amount%TYPE;
    v_transaction_type transactions.transaction_type%TYPE;
BEGIN
    OPEN transaction_cursor;

    LOOP
        FETCH transaction_cursor INTO v_customer_id, v_transaction_id, v_transaction_date, v_amount, v_transaction_type;
        EXIT WHEN transaction_cursor%NOTFOUND;

        -- Print statement for each transaction
        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id);
        DBMS_OUTPUT.PUT_LINE('Transaction ID: ' || v_transaction_id);
        DBMS_OUTPUT.PUT_LINE('Transaction Date: ' || v_transaction_date);
        DBMS_OUTPUT.PUT_LINE('Transaction Type: ' || v_transaction_type);
        DBMS_OUTPUT.PUT_LINE('Amount: ' || v_amount);
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;

    CLOSE transaction_cursor;
END;
/
