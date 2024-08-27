CREATE OR REPLACE PROCEDURE SafeTransferFunds (
    p_from_account_id IN accounts.account_id%TYPE,
    p_to_account_id IN accounts.account_id%TYPE,
    p_amount IN NUMBER
) IS
    -- Variables to hold account balances
    v_from_account_balance accounts.balance%TYPE;
    v_to_account_balance accounts.balance%TYPE;
    
    -- Exception to handle insufficient funds
    insufficient_funds EXCEPTION;
    
BEGIN
    -- Retrieve the balance of the from_account
    SELECT balance INTO v_from_account_balance
    FROM accounts
    WHERE account_id = p_from_account_id
    FOR UPDATE;

    -- Check if sufficient funds are available
    IF v_from_account_balance < p_amount THEN
        RAISE insufficient_funds;
    END IF;

    -- Retrieve the balance of the to_account
    SELECT balance INTO v_to_account_balance
    FROM accounts
    WHERE account_id = p_to_account_id
    FOR UPDATE;

    -- Deduct the amount from the from_account
    UPDATE accounts
    SET balance = balance - p_amount
    WHERE account_id = p_from_account_id;

    -- Add the amount to the to_account
    UPDATE accounts
    SET balance = balance + p_amount
    WHERE account_id = p_to_account_id;

    -- Commit the transaction
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
END SafeTransferFunds;
/
