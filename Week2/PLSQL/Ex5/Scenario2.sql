CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    -- Insert a record into the AuditLog table
    INSERT INTO AuditLog (transaction_id, account_id, transaction_type, amount, transaction_date)
    VALUES (:NEW.transaction_id, :NEW.account_id, :NEW.transaction_type, :NEW.amount, :NEW.transaction_date);
END LogTransaction;
/
