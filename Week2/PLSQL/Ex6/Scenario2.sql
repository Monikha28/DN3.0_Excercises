DECLARE
    CURSOR account_cursor IS
        SELECT account_id, balance
        FROM accounts;

    v_account_id accounts.account_id%TYPE;
    v_balance accounts.balance%TYPE;
    v_annual_fee CONSTANT NUMBER := 50; -- Example annual fee
BEGIN
    OPEN account_cursor;

    LOOP
        FETCH account_cursor INTO v_account_id, v_balance;
        EXIT WHEN account_cursor%NOTFOUND;

        -- Deduct the annual fee from the account balance
        v_balance := v_balance - v_annual_fee;

        -- Update the account balance
        UPDATE accounts
        SET balance = v_balance
        WHERE account_id = v_account_id;
    END LOOP;

    -- Commit the transaction to save changes
    COMMIT;

    CLOSE account_cursor;
END;
/
