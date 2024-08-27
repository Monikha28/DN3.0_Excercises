CREATE OR REPLACE PACKAGE AccountOperations IS
    PROCEDURE OpenAccount(
        p_account_id IN accounts.account_id%TYPE,
        p_customer_id IN accounts.customer_id%TYPE,
        p_account_type IN accounts.account_type%TYPE,
        p_initial_balance IN accounts.balance%TYPE
    );

    PROCEDURE CloseAccount(
        p_account_id IN accounts.account_id%TYPE
    );

    FUNCTION GetTotalBalance(
        p_customer_id IN accounts.customer_id%TYPE
    ) RETURN NUMBER;
END AccountOperations;
/
