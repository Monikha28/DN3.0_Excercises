CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
    CURSOR savings_accounts_cursor IS
        SELECT account_id, balance
        FROM accounts
        WHERE account_type = 'SAVINGS';

    v_account_id accounts.account_id%TYPE;
    v_balance accounts.balance%TYPE;
    v_interest_rate CONSTANT NUMBER := 0.01; -- 1% interest rate
BEGIN
    FOR account_record IN savings_accounts_cursor LOOP
        -- Fetch the account details
        v_account_id := account_record.account_id;
        v_balance := account_record.balance;

        -- Calculate the interest and update the balance
        v_balance := v_balance + (v_balance * v_interest_rate);

        -- Update the account balance
        UPDATE accounts
        SET balance = v_balance
        WHERE account_id = v_account_id;
    END LOOP;

    -- Commit the transaction to save changes
    COMMIT;
END ProcessMonthlyInterest;
/
