CREATE OR REPLACE FUNCTION HasSufficientBalance (
    p_account_id IN accounts.account_id%TYPE,
    p_amount IN NUMBER
) RETURN BOOLEAN IS
    v_balance accounts.balance%TYPE;
BEGIN
    -- Retrieve the current balance of the account
    SELECT balance INTO v_balance
    FROM accounts
    WHERE account_id = p_account_id;

    -- Check if the balance is greater than or equal to the required amount
    IF v_balance >= p_amount THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END HasSufficientBalance;
/
