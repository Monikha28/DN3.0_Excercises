CREATE OR REPLACE PACKAGE BODY AccountOperations IS

    PROCEDURE OpenAccount(
        p_account_id IN accounts.account_id%TYPE,
        p_customer_id IN accounts.customer_id%TYPE,
        p_account_type IN accounts.account_type%TYPE,
        p_initial_balance IN accounts.balance%TYPE
    ) IS
    BEGIN
        INSERT INTO accounts (account_id, customer_id, account_type, balance)
        VALUES (p_account_id, p_customer_id, p_account_type, p_initial_balance);
        COMMIT;
    END OpenAccount;

    PROCEDURE CloseAccount(
        p_account_id IN accounts.account_id%TYPE
    ) IS
    BEGIN
        DELETE FROM accounts
        WHERE account_id = p_account_id;
        COMMIT;
    END CloseAccount;

    FUNCTION GetTotalBalance(
        p_customer_id IN accounts.customer_id%TYPE
    ) RETURN NUMBER IS
        v_total_balance NUMBER;
    BEGIN
        SELECT SUM(balance) INTO v_total_balance
        FROM accounts
        WHERE customer_id = p_customer_id;

        RETURN v_total_balance;
    END GetTotalBalance;

END AccountOperations;
/
