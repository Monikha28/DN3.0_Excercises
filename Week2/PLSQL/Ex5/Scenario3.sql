CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON transactions
FOR EACH ROW
DECLARE
    v_balance accounts.balance%TYPE;
BEGIN
    -- Fetch the current balance of the account
    SELECT balance INTO v_balance
    FROM accounts
    WHERE account_id = :NEW.account_id
    FOR UPDATE;

    -- Check if the transaction is a withdrawal
    IF :NEW.transaction_type = 'WITHDRAWAL' THEN
        -- Ensure the withdrawal amount does not exceed the current balance
        IF :NEW.amount > v_balance THEN
            RAISE_APPLICATION_ERROR(-20001, 'Error: Withdrawal amount exceeds current balance.');
        END IF;
    END IF;

    -- Check if the transaction is a deposit
    IF :NEW.transaction_type = 'DEPOSIT' THEN
        -- Ensure the deposit amount is positive
        IF :NEW.amount <= 0 THEN
            RAISE_APPLICATION_ERROR(-20002, 'Error: Deposit amount must be positive.');
        END IF;
    END IF;
END CheckTransactionRules;
/
