CREATE OR REPLACE PROCEDURE TransferFunds (
    p_from_account_id IN accounts.account_id%TYPE,
    p_to_account_id IN accounts.account_id%TYPE,
    p_amount IN NUMBER
) IS
    v_from_account_balance accounts.balance%TYPE;
    v_to_account_balance accounts.balance%TYPE;
    
    insufficient_funds EXCEPTION;
BEGIN
    -- Fetch the balance of the from_account
    SELECT balance INTO v_from_account_balance
    FROM accounts
    WHERE account_id = p_from_account_id
    FOR UPDATE;

    -- Check if sufficient funds are available
    IF v_from_account_balance < p_amount THEN
        RAISE insufficient_funds;
    END IF;

    -- Deduct the amount from the from_account
    UPDATE accounts
    SET balance = balance - p_amount
    WHERE account_id = p_from_account_id;

    -- Add the amount to the to_account
    UPDATE accounts
    SET balance = balance + p_amount
    WHERE account_id = p_to_account_id;

    -- Commit the transaction to save changes
    COMMIT;

EXCEPTION
    WHEN insufficient_funds THEN
        -- Handle insufficient funds error
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: Insufficient funds in account ' || p_from_account_id);

    WHEN OTHERS THEN
        -- Handle any other unexpected errors
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: An unexpected error occurred during fund transfer.');
END TransferFunds;
/
